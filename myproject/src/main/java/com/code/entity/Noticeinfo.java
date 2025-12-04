package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;

/**
* ClassName:Noticeinfo
* Description: 公告信息实体类
*/
@TableName("Noticeinfo")
public class Noticeinfo {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * 公告编号
    */
        private Integer noticeid;
    /**
    * 公告标题
    */
        private String noticetitle;
    /**
    * 公告内容
    */
        private String noticecontent;
    /**
    * 公告时间
    */
        private String noticeaddtime;
    /**
    * 公告备注
    */
        private String noticeremarker;


        public Integer getNoticeid() {
        return noticeid;
        }

        public void setNoticeid(Integer noticeid) {
        this.noticeid = noticeid;
        }

        public String getNoticetitle() {
        return noticetitle;
        }

        public void setNoticetitle(String noticetitle) {
        this.noticetitle = noticetitle;
        }

        public String getNoticecontent() {
        return noticecontent;
        }

        public void setNoticecontent(String noticecontent) {
        this.noticecontent = noticecontent;
        }

        public String getNoticeaddtime() {
        return noticeaddtime;
        }

        public void setNoticeaddtime(String noticeaddtime) {
        this.noticeaddtime = noticeaddtime;
        }

        public String getNoticeremarker() {
        return noticeremarker;
        }

        public void setNoticeremarker(String noticeremarker) {
        this.noticeremarker = noticeremarker;
        }


}
