package com.code.controller.base;

import com.code.entity.Datainfo;
import com.code.entity.Scoreinfo;
import com.code.entity.Userinfo;
import com.code.mapper.CommonMapper;
import com.code.mapper.DatainfoMapper;
import com.code.mapper.ScoreinfoMapper;
import com.code.mapper.UserinfoMapper;
import com.code.util.GlobalResult;
import com.code.util.MyFilleUtil;
import org.apache.mahout.cf.taste.impl.common.LongPrimitiveIterator;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.EuclideanDistanceSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.apache.mahout.vectorizer.TFIDF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

/**
 * 数据集： data.csv
 * 第一列：userid；第二列：itemid；第三列评分：score。
 * 教程
 * https://blog.csdn.net/huanhuanxiaoxiao/article/details/72828560
 */
@Controller
public class AlgorithmController {

    public static int ALGORITHM_TYPE = 1;//算法类型选择
    final static int NEIGHBORHOOD_NUM = 2;//临近的用户个数
    final static int RECOMMENDER_NUM = 10;//推荐物品的最大个数

    @Autowired   //注入对象
    public ScoreinfoMapper scoreinfoMapper;
    @Autowired   //注入对象
    public DatainfoMapper datainfoMapper;
    @Autowired   //注入对象
    public CommonMapper commonMapper;
    @Autowired   //注入对象
    public UserinfoMapper userinfoMapper;
    private static final long serialVersionUID = -1944746523865028204L;
    // 存放所有词汇
    public static Set<String> vocab = new LinkedHashSet<String>();
    // 单词 -idf
    public Map<String, Double> word_idf = new HashMap<String, Double>();

    /**
     * 训练样本的tfidf值，也即训练tfidf模型
     *
     * @param token    单词之间分隔符
     * @return 训练数据对应的tfidf数据列表
     */
    public List<List<Double>> get_tfidf(List<String> raw_data, String token) {
        List<List<Double>> res = new ArrayList<List<Double>>();

        Map<String, Set<Integer>> word_docs = new HashMap<String, Set<Integer>>();
        Map<Integer, List<String>> doc_words = new HashMap<Integer, List<String>>();
        int doc_num = 0;

        for (String text : raw_data) {
            doc_num++;
            String[] words = text.split(token);
            doc_words.put(doc_num, Arrays.asList(words));
            for (String word : words) {
                vocab.add(word);
                if (word_docs.containsKey(word)) {
                    word_docs.get(word).add(doc_num);
                } else {
                    Set<Integer> docs = new HashSet<Integer>();
                    docs.add(doc_num);
                    word_docs.put(word, docs);
                }
            }
        }
        // 计算并存储每个word的idf值
        for (String word : vocab) {
            int doc_n = 0;
            if (word_docs.containsKey(word)) {
                doc_n = word_docs.get(word).size();
            }
            double idf = doc_words.size() * 1.0 / (doc_n + 1);
            word_idf.put(word, idf);
        }

        // 计算每篇doc中，vocab中每个word的tfidf值
        for (Map.Entry<Integer, List<String>> e : doc_words.entrySet()) {
            List<Double> tmp = new ArrayList<Double>();
            for (String word : vocab) {
                int word_n = Collections.frequency(e.getValue(), word);
                double tf = word_n * 1.0 / e.getValue().size();
                double idf = word_idf.get(word);
                double tfidf = tf * idf;
                tmp.add(tfidf);
            }
            res.add(tmp);
        }

        return res;
    }

    /**
     * 计算测试样本的tfidf值
     *
     * @param raw_data 测试数据
     * @param token    单词之间的分隔符
     * @return 测试数据的tfidf值
     */
    public List<List<Double>> get_tfidf4test(List<String> raw_data, String token) {
        List<List<Double>> text_tfidf = new ArrayList<List<Double>>();
        for (String text : raw_data) {
            String[] words = text.split(token);
            List<String> words_list = Arrays.asList(words);
            List<Double> tmp = new ArrayList<Double>();
            for (String word : vocab) {
                int word_n = Collections.frequency(words_list, word);
                double tf = word_n * 1.0 / words.length;
                double tfidf = tf * word_idf.get(word);
                tmp.add(tfidf);
            }
            text_tfidf.add(tmp);
        }
        return text_tfidf;
    }

    /**
     * 序列化保存tfidf模型
     *
     * @param path 模型路径
     */
    public void save_model(String path) {
        try {
            ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(path));
            oos.writeObject(this);
            oos.flush();
            oos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 导出tfidf模型
     *
     * @param path 模型路径
     * @return 训练好的TFIDF模型
     */
    public TFIDF load_model(String path) {
        try {
            ObjectInputStream in = new ObjectInputStream(new FileInputStream(path));
            TFIDF tfidf = (TFIDF) in.readObject();
            in.close();
            return tfidf;
        } catch (IOException ee) {
            ee.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 推荐算法原理
     *
     * @param userid
     * @param model
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/algorithm")
    public GlobalResult algorithm(String userid, Model model) throws Exception {
        String filePath = System.getProperty("user.dir") + File.separatorChar + "data.csv";
        System.out.println("filePath = " + filePath);
        System.out.println("--------------------算法推荐数据集处理 start-----------------------");
        Userinfo user = userinfoMapper.selectById(userid);
        int myid = user.getId();
        List<Scoreinfo> scoreinfoList = scoreinfoMapper.selectByMap(null);

        String content = "";
        for (Scoreinfo scoreinfo : scoreinfoList) {
            content = content + scoreinfo.getUid() + "," + scoreinfo.getTid() + "," + scoreinfo.getScore() + "\n";
        }
        MyFilleUtil.WriteFile(filePath, content);

        //List<Integer> arr = userCF(filePath,myid);// 基于用户的
        List<Integer> arr = new ArrayList<Integer>();
        if (ALGORITHM_TYPE == 1) {
            arr = itemCF(filePath, myid);// 基于物品的
        } else {
            arr = userCF(filePath, myid);// 基于用户的
        }


        List<Datainfo> datainfoList = new ArrayList<Datainfo>();
        for (Integer tid : arr) {
            Datainfo datainfo = datainfoMapper.selectById(tid);
            datainfoList.add(datainfo);
        }
        String formattedString = String.format("给用户: %s  推荐数据编号：%s", user.getName(), arr.toString());
        System.out.println("formattedString = " + formattedString);
        model.addAttribute("datainfoList", datainfoList);
        System.out.println("--------------------算法推荐数据集处理 end-----------------------");
        return GlobalResult.ok(datainfoList);
    }


    @ResponseBody
    @RequestMapping("/algorithmSave")
    public GlobalResult algorithmSave(HttpSession session, Scoreinfo scoreinfo, Model model) throws Exception {
        scoreinfoMapper.insert(scoreinfo);
        return GlobalResult.ok("操作成功");
    }

    //基于用户的 CF（User CF） 推荐算法
    public static List<Integer> userCF(String filePath, int myid) throws Exception {
        List<Integer> arrList = new ArrayList<Integer>();
        DataModel model = new FileDataModel(new File(filePath));//数据模型
        UserSimilarity user = new EuclideanDistanceSimilarity(model);//用户相识度算法
        NearestNUserNeighborhood neighbor = new NearestNUserNeighborhood(NEIGHBORHOOD_NUM, user, model);
        //用户近邻算法
        Recommender r = new GenericUserBasedRecommender(model, neighbor, user);//用户推荐算法
        LongPrimitiveIterator iter = model.getUserIDs();///得到用户ID
        System.out.println("推荐系数处理结果：");
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            List<RecommendedItem> list = r.recommend(uid, RECOMMENDER_NUM);
            System.out.printf("uid:%s", uid);
            for (RecommendedItem ritem : list) {
                System.out.printf("(%s,%f)", ritem.getItemID(), ritem.getValue());
                if (myid == uid) {
                    arrList.add((int) ritem.getItemID());
                }
            }
            System.out.println();

        }
        return arrList;
    }

    //基于物品的 CF 的基本原理 推荐算法
    public static List<Integer> itemCF(String filePath, int myid) throws Exception {
        List<Integer> arrList = new ArrayList<Integer>();
        DataModel model = new FileDataModel(new File(filePath));//数据模型
        ItemSimilarity item = new EuclideanDistanceSimilarity(model);//用户相识度算法
        Recommender r = new GenericItemBasedRecommender(model, item);//物品推荐算法
        LongPrimitiveIterator iter = model.getUserIDs();
        while (iter.hasNext()) {
            long uid = iter.nextLong();
            List<RecommendedItem> list = r.recommend(uid, RECOMMENDER_NUM);
            System.out.printf("uid:%s", uid);
            for (RecommendedItem ritem : list) {
                System.out.printf("(%s,%f)", ritem.getItemID(), ritem.getValue());
                if (myid == uid) {
                    arrList.add((int) ritem.getItemID());
                }
            }
            System.out.println();
        }
        return arrList;
    }


}
