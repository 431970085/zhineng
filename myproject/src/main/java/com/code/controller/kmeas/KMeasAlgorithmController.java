package com.code.controller.kmeas;


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

/**
 * 用户k-meas聚类算法
 */

@Controller
public class KMeasAlgorithmController {
    @Autowired   //注入对象
    public UserinfoMapper userinfoMapper;
    @Autowired   //注入对象
    public DatainfoMapper datainfoMapper;
    @Autowired   //注入对象
    public CommonMapper commonMapper;

    //字符转为
    public double convertString(String input) {
        if (input == null) {
            return 0;
        }
        input = input.trim();
        StringBuilder result = new StringBuilder();
        char c = input.toUpperCase().toCharArray()[0];
        switch (c) {
            case 'A':
                result.append('1');
                break;
            case 'B':
                result.append('2');
                break;
            case 'C':
                result.append('3');
                break;
            case 'D':
                result.append('4');
                break;
            case 'E':
                result.append('5');
                break;
            case 'F':
                result.append('6');
                break;
            default:
                result.append(c);
        }
        return Double.parseDouble(result.toString());
    }


    @RequestMapping("/kmeansList")
    @ResponseBody
    public GlobalResult kmeansList(String userid, Model model) throws Exception {
        Userinfo loginUserinfo = userinfoMapper.selectById(userid);
        List<Datainfo> datainfoList = datainfoMapper.selectByMap(null);
        List<Userinfo> userinfoList = userinfoMapper.selectByMap(null);

        String sql = "  select * from studyinfo_view order by uid,tid  ";
        List<Map> mapList = commonMapper.selectAction(sql);
        // 模拟用户数据
        List<User> users = new ArrayList<>();
        /*
         users.add(new User(1, new double[]{1, 0, 1}));
        users.add(new User(2, new double[]{0, 1, 0}));
        users.add(new User(3, new double[]{1, 0, 1}));
        users.add(new User(4, new double[]{0, 1, 0}));
        users.add(new User(5, new double[]{1, 0, 1}));
        */
        for (Userinfo userinfo : userinfoList) {
            double[] modelScore = new double[datainfoList.size()];
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
            User modelUser = new User(userinfo.getId(), modelScore);
            users.add(modelUser);
        }
        //显示矩阵
        System.out.println("*******************聚类数据模型 开始******************* ");
        for (User user : users) {
            System.out.println("user = " + user);
        }
        System.out.println("*******************聚类数据模型 结束******************* ");
        int k = 6; // 聚类的数量
        int maxIterations = 200; // 最大迭代次数

        KMeansClustering kMeans = new KMeansClustering(k, maxIterations, users);
        List<List<User>> clusters = kMeans.cluster();

        List<User> resultUser = null;
        // 输出聚类结果
        for (int i = 0; i < clusters.size(); i++) {
            List<User> cluster = clusters.get(i);
            System.out.println("聚类 " + (i + 1) + ":");
            for (User user : cluster) {
                System.out.println("  用户 ID: " + user.getId());
                if (loginUserinfo.getId().equals(user.getId())) {
                    resultUser = cluster;
                }
            }
        }
        List<Datainfo> datainfoListResult = new ArrayList<Datainfo>();
        //当前用户用户聚类结果
        System.out.println("\n --------------------");
        System.out.print("当前用户用户聚类结果 = ");
        Set<Integer> rsList = new HashSet<Integer>();
        Set<Integer> myList = new HashSet<Integer>();
        for (User user : resultUser) {
            System.out.print(user.getId() + "、");
            if (user.getId() != loginUserinfo.getId()) {
                String sqlA = "  select * from studyinfo_view where uid=" + user.getId() + "  and  exists_in_right_table=1 ";
                List<Map> mapListA = commonMapper.selectAction(sqlA);
                for (Map map : mapListA) {
                    int tid = Integer.parseInt(map.get("tid").toString());
                    rsList.add(tid);
                }
            } else {
                String sqlB = "  select * from studyinfo_view where uid=" + user.getId() + "  and  exists_in_right_table=1 ";
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


}


// 用户类，包含用户 ID 和课程学习信息
class User {
    int id;
    double[] features;

    public User(int id, double[] features) {
        this.id = id;
        this.features = features;
    }

    public int getId() {
        return id;
    }

    public double[] getFeatures() {
        return features;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", features=" + Arrays.toString(features) +
                '}';
    }
}

// K-Means 聚类类
class KMeansClustering {
    private int k; // 聚类的数量
    private int maxIterations; // 最大迭代次数
    private List<User> users; // 用户列表
    private List<double[]> centroids; // 聚类中心列表

    public KMeansClustering(int k, int maxIterations, List<User> users) {
        this.k = k;
        this.maxIterations = maxIterations;
        this.users = users;
        this.centroids = new ArrayList<>();
    }

    // 初始化聚类中心
    private void initializeCentroids() {
        Random random = new Random();
        for (int i = 0; i < k; i++) {
            int randomIndex = random.nextInt(users.size());
            centroids.add(users.get(randomIndex).getFeatures());
        }
    }

    // 计算两个向量之间的欧几里得距离
    private double euclideanDistance(double[] a, double[] b) {
        double sum = 0;
        for (int i = 0; i < a.length; i++) {
            sum += Math.pow(a[i] - b[i], 2);
        }
        return Math.sqrt(sum);
    }

    // 分配用户到最近的聚类中心
    private List<List<User>> assignUsersToClusters() {
        List<List<User>> clusters = new ArrayList<>();
        for (int i = 0; i < k; i++) {
            clusters.add(new ArrayList<>());
        }

        for (User user : users) {
            int closestCentroidIndex = 0;
            double minDistance = euclideanDistance(user.getFeatures(), centroids.get(0));
            for (int i = 1; i < k; i++) {
                double distance = euclideanDistance(user.getFeatures(), centroids.get(i));
                if (distance < minDistance) {
                    minDistance = distance;
                    closestCentroidIndex = i;
                }
            }
            clusters.get(closestCentroidIndex).add(user);
        }
        return clusters;
    }

    // 更新聚类中心
    private void updateCentroids(List<List<User>> clusters) {
        for (int i = 0; i < k; i++) {
            List<User> cluster = clusters.get(i);
            if (cluster.isEmpty()) {
                continue;
            }
            int featureCount = cluster.get(0).getFeatures().length;
            double[] newCentroid = new double[featureCount];
            for (User user : cluster) {
                double[] features = user.getFeatures();
                for (int j = 0; j < featureCount; j++) {
                    newCentroid[j] += features[j];
                }
            }
            for (int j = 0; j < featureCount; j++) {
                newCentroid[j] /= cluster.size();
            }
            centroids.set(i, newCentroid);
        }
    }

    // 执行 K-Means 聚类
    public List<List<User>> cluster() {
        initializeCentroids();
        for (int iteration = 0; iteration < maxIterations; iteration++) {
            List<List<User>> clusters = assignUsersToClusters();
            updateCentroids(clusters);
        }
        return assignUsersToClusters();
    }
}

// 主类，用于测试 K-Means 聚类
class OnlineLearningCourseRecommendation测试类 {
    public static void main(String[] args) {
        // 模拟用户数据
        List<User> users = new ArrayList<>();
        users.add(new User(1, new double[]{1, 0, 1}));
        users.add(new User(2, new double[]{0, 1, 0}));
        users.add(new User(3, new double[]{1, 0, 1}));
        users.add(new User(4, new double[]{0, 1, 0}));
        users.add(new User(5, new double[]{1, 0, 1}));

        int k = 2; // 聚类的数量
        int maxIterations = 100; // 最大迭代次数

        KMeansClustering kMeans = new KMeansClustering(k, maxIterations, users);
        List<List<User>> clusters = kMeans.cluster();

        // 输出聚类结果
        for (int i = 0; i < clusters.size(); i++) {
            List<User> cluster = clusters.get(i);
            System.out.println("聚类 " + (i + 1) + ":");
            for (User user : cluster) {
                System.out.println("  用户 ID: " + user.getId());
            }
        }
    }
}
