package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;

/**
* ClassName:Carousel
* Description: 轮播图实体类
*/
@TableName("Carousel")
public class Carousel {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * 编号
    */
        private Integer id;
    /**
    * 名称
    */
        private String name;
    /**
    * 图片
    */
        private String picurl;


        public Integer getId() {
        return id;
        }

        public void setId(Integer id) {
        this.id = id;
        }

        public String getName() {
        return name;
        }

        public void setName(String name) {
        this.name = name;
        }

        public String getPicurl() {
        return picurl;
        }

        public void setPicurl(String picurl) {
        this.picurl = picurl;
        }


}
