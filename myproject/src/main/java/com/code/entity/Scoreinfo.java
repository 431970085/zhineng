package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;

/**
* ClassName:Scoreinfo
* Description: 评分信息实体类
*/
@TableName("Scoreinfo")
public class Scoreinfo {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * 评分编号
    */
        private Integer id;
    /**
    * 用户编号
    */
        private String uid;
    /**
    * 数据编号
    */
        private String tid;
    /**
    * 数据评分
    */
        private String score;


        public Integer getId() {
        return id;
        }

        public void setId(Integer id) {
        this.id = id;
        }

        public String getUid() {
        return uid;
        }

        public void setUid(String uid) {
        this.uid = uid;
        }

        public String getTid() {
        return tid;
        }

        public void setTid(String tid) {
        this.tid = tid;
        }

        public String getScore() {
        return score;
        }

        public void setScore(String score) {
        this.score = score;
        }


}
