package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;
        import java.lang.Integer;
        import java.lang.Integer;

/**
* ClassName:Shoucang
* Description: 收藏信息实体类
*/
@TableName("Shoucang")
public class Shoucang {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * 收藏编号
    */
        private Integer id;
    /**
    * 产品编号
    */
        private Integer tid;
    /**
    * 用户编号
    */
        private Integer uid;


        public Integer getId() {
        return id;
        }

        public void setId(Integer id) {
        this.id = id;
        }

        public Integer getTid() {
        return tid;
        }

        public void setTid(Integer tid) {
        this.tid = tid;
        }

        public Integer getUid() {
        return uid;
        }

        public void setUid(Integer uid) {
        this.uid = uid;
        }


}
