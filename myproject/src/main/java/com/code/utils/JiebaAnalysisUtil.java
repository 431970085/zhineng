package com.code.utils;

import com.huaban.analysis.jieba.JiebaSegmenter;
import com.huaban.analysis.jieba.SegToken;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

public class JiebaAnalysisUtil {
    private static final JiebaSegmenter SEGMENTER = new JiebaSegmenter();
    private static final Pattern PUNCTUATION_PATTERN = Pattern.compile("[\\p{Punct}\\u3000-\\u303F\\uFF00-\\uFFEF]");
    private static final Set<String> STOP_WORDS = new HashSet<>();

    static {
        // 初始化停用词集合，可按需添加更多无效词
        STOP_WORDS.add("的");
        STOP_WORDS.add("是");
        STOP_WORDS.add("和");
        STOP_WORDS.add("与");
    }

    public static Map<String, Integer> segmentAndCountFrequency(String text) {
        Map<String, Integer> frequencyMap = new HashMap<>();
        for (SegToken token : SEGMENTER.process(text, JiebaSegmenter.SegMode.INDEX)) {
            String word = token.word;
            if (!PUNCTUATION_PATTERN.matcher(word).matches() && !STOP_WORDS.contains(word)) {
                frequencyMap.put(word, frequencyMap.getOrDefault(word, 0) + 1);
            }
        }
        return frequencyMap;
    }

    public static void main(String[] args) {
        String text = "川隼汉服男成人古装班服交领齐腰襦裙内搭男女学生侠客书生套装表演,男女学生侠客书生套装表演";
        Map<String, Integer> frequencyMap = segmentAndCountFrequency(text);

        for (Map.Entry<String, Integer> entry : frequencyMap.entrySet()) {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }
}
