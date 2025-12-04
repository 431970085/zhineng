package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;
        import java.lang.Integer;
        import java.lang.Integer;

/**
* ClassName:Studyinfo
* Description: 学习记录实体类
*/
@TableName("Studyinfo")
public class Studyinfo {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * 记录编号
    */
        private Integer dsid;
    /**
    * 用户编号
    */
        private Integer uid;
    /**
    * 课程编号
    */
        private Integer tid;
    /**
    * 创建时间
    */
        private String addtime;
    /**
    * 学习备注
    */
        private String info;


        public Integer getDsid() {
        return dsid;
        }

        public void setDsid(Integer dsid) {
        this.dsid = dsid;
        }

        public Integer getUid() {
        return uid;
        }

        public void setUid(Integer uid) {
        this.uid = uid;
        }

        public Integer getTid() {
        return tid;
        }

        public void setTid(Integer tid) {
        this.tid = tid;
        }

        public String getAddtime() {
        return addtime;
        }

        public void setAddtime(String addtime) {
        this.addtime = addtime;
        }

        public String getInfo() {
        return info;
        }

        public void setInfo(String info) {
        this.info = info;
        }


}
