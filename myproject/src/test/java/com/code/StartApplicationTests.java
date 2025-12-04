package com.code;

import com.alibaba.fastjson.JSON;
import com.code.mapper.CommonMapper;
import org.apdplat.word.WordSegmenter;
import org.apdplat.word.segmentation.Word;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.*;

@SpringBootTest
class StartApplicationTests {

    @Autowired   //注入对象
    public CommonMapper commonMapper;

    @Test
    void 词云图数据处理() {
        String sql = " TRUNCATE TABLE taginfo; "; //清空原有数据并重置id=0
        String select_sql = " select concat(id,title) as name from datainfo ";
        String sql_delete = "delete from taginfo";
        commonMapper.updateAction(sql_delete);
        List<Map> datainfoList = commonMapper.selectAction(select_sql);
        String content = "";
        for (Map datainfo : datainfoList) {
            content = content + datainfo.get("name");
        }
        List<Word> list = WordSegmenter.seg(content);
        //保留停用词
        List<Word> lists = WordSegmenter.segWithStopWords(content);
        System.out.println(JSON.toJSONString(lists));
        //使用TreeMap，它会自动将结果按照字典的顺序排序
        TreeMap<String, Integer> tlist = new TreeMap<String, Integer>();
        for (Word w : lists) {
            String word = w.toString().trim();
            if (tlist.containsKey(word)) {
                tlist.put(word, tlist.get(word) + 1);
            } else {
                tlist.put(word, 1);
            }
        }
        System.out.println("tlist = " + tlist);
        Iterator titer = tlist.entrySet().iterator();
        while (titer.hasNext()) {
            Map.Entry ent = (Map.Entry) titer.next();
            String keyt = ent.getKey().toString();
            String valuet = ent.getValue().toString();
            Map map = new HashMap();
            map.put("name", keyt);
            map.put("val", valuet);
            int tid=0;
            String sql_insert_tag = "INSERT INTO taginfo(id, name, val,tid) VALUES (0, '" + keyt + "', '" + valuet + "','"+tid+"');";
            commonMapper.updateAction(sql_insert_tag);
        }


    }



    @Test
    void contextLoads() {

    }

}
