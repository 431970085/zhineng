package com.code.controller.code;

import com.code.entity.Datainfo;
import com.code.entity.Userinfo;
import com.code.mapper.CommonMapper;
import com.code.mapper.DatainfoMapper;
import com.code.mapper.UserinfoMapper;
import com.code.util.GlobalResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;


// K - Modes 聚类算法类
@Controller
public class KModesClustering {
    @Autowired   //注入对象
    public UserinfoMapper userinfoMapper;
    @Autowired   //注入对象
    public DatainfoMapper datainfoMapper;
    @Autowired   //注入对象
    public CommonMapper commonMapper;


    @RequestMapping("/KModesList")
    @ResponseBody
    public GlobalResult KModesList(String userid, Model model) throws Exception {
        Userinfo loginUserinfo = userinfoMapper.selectById(userid);
        List<Datainfo> datainfoList = datainfoMapper.selectByMap(null);
        List<Userinfo> userinfoList = userinfoMapper.selectByMap(null);

        String sql = "  select * from studyinfo_view order by uid,tid  ";
        List<Map> mapList = commonMapper.selectAction(sql);
        List<DataPoint> dataPointList = new ArrayList<>();
        for (Userinfo userinfo : userinfoList) {
            int[] modelScore = new int[datainfoList.size()];
            int data_index = 0; //下标
            for (Datainfo datainfo : datainfoList) {
                for (Map map : mapList) {
                    int uid = 0;
                    if (map.get("uid") != null) {
                        uid = Integer.parseInt(map.get("uid").toString());
                    }
                    int tid = Integer.parseInt(map.get("tid").toString());
                    int exists_in_right_table = Integer.parseInt(map.get("exists_in_right_table").toString());
                    if (userinfo.getId().equals(uid) && datainfo.getId().equals(tid)) {
                        modelScore[data_index] = exists_in_right_table;
                        data_index++;
                    }
                }
            }
            dataPointList.add(new DataPoint(userinfo.getId(), modelScore));
        }
        for (DataPoint dataPoint : dataPointList) {
            System.out.println("dataPoint = " + dataPoint);
        }
        //显示矩阵
        System.out.println("*******************聚类数据模型 开始******************* ");
        int k = 2;
        int maxIterations = 100;

        KModesClustering kModes = new KModesClustering(k, maxIterations, dataPointList);
        List<List<DataPoint>> clusters = kModes.cluster();
        List<DataPoint> resultUser=new ArrayList<>();
        // 输出聚类结果
        for (int i = 0; i < clusters.size(); i++) {
            System.out.println("Cluster " + (i + 1) + ":");
            for (DataPoint point : clusters.get(i)) {
                System.out.println("  UID: " + point.uid);
                if (loginUserinfo.getId().equals(point.uid)) {
                    resultUser =  clusters.get(i);
                }
            }
        }
        System.out.println("*******************聚类数据模型 结束******************* ");
        List<Datainfo> datainfoListResult = new ArrayList<Datainfo>();
        //当前用户用户聚类结果
        System.out.println("\n --------------------");
        System.out.print("当前用户用户聚类结果 = ");
        Set<Integer> rsList = new HashSet<Integer>();
        Set<Integer> myList = new HashSet<Integer>();
        for (DataPoint user : resultUser) {
            System.out.print(user.uid + "、");
            if (user.uid != loginUserinfo.getId()) {
                String sqlA = "  select * from studyinfo_view where uid=" + user.uid + "  and  exists_in_right_table=1 ";
                List<Map> mapListA = commonMapper.selectAction(sqlA);
                for (Map map : mapListA) {
                    int tid = Integer.parseInt(map.get("tid").toString());
                    rsList.add(tid);
                }
            } else {
                String sqlB = "  select * from studyinfo_view where uid=" + user.uid + "  and  exists_in_right_table=1 ";
                List<Map> mapListB = commonMapper.selectAction(sqlB);
                for (Map map : mapListB) {
                    int tid = Integer.parseInt(map.get("tid").toString());
                    myList.add(tid);
                }
            }
        }
        System.out.println();
        System.out.println("rsList = " + rsList);
        System.out.println("myList = " + myList);
        rsList.removeAll(myList);
        for (Integer tid : rsList) {
            Datainfo datainfo = datainfoMapper.selectById(tid);
            datainfoListResult.add(datainfo);
        }

        System.out.println("\n --------------------");
        return GlobalResult.ok(datainfoListResult);
    }
    private int k;
    private int maxIterations;
    private List<DataPoint> data;

    public KModesClustering() {
    }

    public KModesClustering(int k, int maxIterations, List<DataPoint> data) {
        this.k = k;
        this.maxIterations = maxIterations;
        this.data = data;
    }

    // 计算两个数据点之间的汉明距离
    private int hammingDistance(DataPoint p1, DataPoint p2) {
        int distance = 0;
        for (int i = 0; i < p1.courses.length; i++) {
            if (p1.courses[i] != p2.courses[i]) {
                distance++;
            }
        }
        return distance;
    }

    // 找到每个簇的中心
    private DataPoint findMode(List<DataPoint> cluster) {
        int numAttributes = cluster.get(0).courses.length;
        int[] mode = new int[numAttributes];
        for (int i = 0; i < numAttributes; i++) {
            Map<Integer, Integer> countMap = new HashMap<>();
            for (DataPoint point : cluster) {
                int value = point.courses[i];
                countMap.put(value, countMap.getOrDefault(value, 0) + 1);
            }
            int maxCount = 0;
            int mostFrequent = 0;
            for (Map.Entry<Integer, Integer> entry : countMap.entrySet()) {
                if (entry.getValue() > maxCount) {
                    maxCount = entry.getValue();
                    mostFrequent = entry.getKey();
                }
            }
            mode[i] = mostFrequent;
        }
        return new DataPoint(-1, mode);
    }

    // 执行 K - Modes 聚类
    public List<List<DataPoint>> cluster() {
        // 初始化簇中心
        List<DataPoint> centroids = new ArrayList<>();
        Random random = new Random();
        for (int i = 0; i < k; i++) {
            centroids.add(data.get(random.nextInt(data.size())));
        }
        // 初始化簇
        List<List<DataPoint>> clusters = null;
        for (int iter = 0; iter < maxIterations; iter++) {
            clusters = new ArrayList<>();
            for (int i = 0; i < k; i++) {
                clusters.add(new ArrayList<>());
            }

            // 分配数据点到最近的簇
            for (DataPoint point : data) {
                int minDistance = Integer.MAX_VALUE;
                int closestCentroidIndex = 0;
                for (int i = 0; i < k; i++) {
                    int distance = hammingDistance(point, centroids.get(i));
                    if (distance < minDistance) {
                        minDistance = distance;
                        closestCentroidIndex = i;
                    }
                }
                clusters.get(closestCentroidIndex).add(point);
            }

            // 更新簇中心
            List<DataPoint> newCentroids = new ArrayList<>();
            for (List<DataPoint> cluster : clusters) {
                if (!cluster.isEmpty()) {
                    newCentroids.add(findMode(cluster));
                }
            }

            // 检查是否收敛
            boolean converged = true;
            for (int i = 0; i < k; i++) {
                if (!Arrays.equals(centroids.get(i).courses, newCentroids.get(i).courses)) {
                    converged = false;
                    break;
                }
            }

            if (converged) {
                break;
            }

            centroids = newCentroids;
        }

        return clusters;
    }

    public static void main(String[] args) {
        // 示例数据
        List<DataPoint> data = new ArrayList<>();
        data.add(new DataPoint(1, new int[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}));
        data.add(new DataPoint(2, new int[]{2, 3, 4, 5, 6, 7, 8, 9, 10, 1}));
        data.add(new DataPoint(3, new int[]{3, 4, 5, 6, 7, 8, 9, 10, 1, 2}));

        int k = 2;
        int maxIterations = 100;

        KModesClustering kModes = new KModesClustering(k, maxIterations, data);
        List<List<DataPoint>> clusters = kModes.cluster();

        // 输出聚类结果
        for (int i = 0; i < clusters.size(); i++) {
            System.out.println("Cluster " + (i + 1) + ":");
            for (DataPoint point : clusters.get(i)) {
                System.out.println("  UID: " + point.uid);
            }
        }
    }
}

// 表示一个数据点的类
class DataPoint {
    int uid;
    int[] courses;

    public DataPoint(int uid, int[] courses) {
        this.uid = uid;
        this.courses = courses;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int[] getCourses() {
        return courses;
    }

    public void setCourses(int[] courses) {
        this.courses = courses;
    }

    @Override
    public String toString() {
        return "DataPoint{" +
                "uid=" + uid +
                ", courses=" + Arrays.toString(courses) +
                '}';
    }
}
