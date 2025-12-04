package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;
        import java.lang.Integer;

/**
* ClassName:Datainfo
* Description: 课程信息实体类
*/
@TableName("Datainfo")
public class Datainfo {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * 编号
    */
        private Integer id;
    /**
    * 课程名称
    */
        private String title;
    /**
    * 课程详情
    */
        private String outline;
    /**
    * 课程主图
    */
        private String picurl;
    /**
    * 课程类型
    */
        private String type;
    /**
    * 课程内容
    */
        private String content;
    /**
    * 浏览量
    */
        private Integer hits;
    /**
    * 课程状态
    */
        private String state;
    /**
    * 课程备注
    */
        private String intro;
    /**
    * 创建时间
    */
        private String createtime;
    /**
    * 课程价格
    */
        private String nums;
    /**
    * 创建用户
    */
        private String adduser;


        public Integer getId() {
        return id;
        }

        public void setId(Integer id) {
        this.id = id;
        }

        public String getTitle() {
        return title;
        }

        public void setTitle(String title) {
        this.title = title;
        }

        public String getOutline() {
        return outline;
        }

        public void setOutline(String outline) {
        this.outline = outline;
        }

        public String getPicurl() {
        return picurl;
        }

        public void setPicurl(String picurl) {
        this.picurl = picurl;
        }

        public String getType() {
        return type;
        }

        public void setType(String type) {
        this.type = type;
        }

        public String getContent() {
        return content;
        }

        public void setContent(String content) {
        this.content = content;
        }

        public Integer getHits() {
        return hits;
        }

        public void setHits(Integer hits) {
        this.hits = hits;
        }

        public String getState() {
        return state;
        }

        public void setState(String state) {
        this.state = state;
        }

        public String getIntro() {
        return intro;
        }

        public void setIntro(String intro) {
        this.intro = intro;
        }

        public String getCreatetime() {
        return createtime;
        }

        public void setCreatetime(String createtime) {
        this.createtime = createtime;
        }

        public String getNums() {
        return nums;
        }

        public void setNums(String nums) {
        this.nums = nums;
        }

        public String getAdduser() {
        return adduser;
        }

        public void setAdduser(String adduser) {
        this.adduser = adduser;
        }


}
