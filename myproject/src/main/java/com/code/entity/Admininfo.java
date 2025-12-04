package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;

/**
* ClassName:Admininfo
* Description: 管理员信息实体类
*/
@TableName("Admininfo")
public class Admininfo {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * 用户编号
    */
        private Integer adminid;
    /**
    * 用户账号
    */
        private String adminname;
    /**
    * 登陆密码
    */
        private String adminpwd;
    /**
    * 所属角色
    */
        private String role;
    /**
    * 用户头像
    */
        private String headimg;
    /**
    * 创建时间
    */
        private String admincreatetime;
    /**
    * 用户状态
    */
        private String islock;


        public Integer getAdminid() {
        return adminid;
        }

        public void setAdminid(Integer adminid) {
        this.adminid = adminid;
        }

        public String getAdminname() {
        return adminname;
        }

        public void setAdminname(String adminname) {
        this.adminname = adminname;
        }

        public String getAdminpwd() {
        return adminpwd;
        }

        public void setAdminpwd(String adminpwd) {
        this.adminpwd = adminpwd;
        }

        public String getRole() {
        return role;
        }

        public void setRole(String role) {
        this.role = role;
        }

        public String getHeadimg() {
        return headimg;
        }

        public void setHeadimg(String headimg) {
        this.headimg = headimg;
        }

        public String getAdmincreatetime() {
        return admincreatetime;
        }

        public void setAdmincreatetime(String admincreatetime) {
        this.admincreatetime = admincreatetime;
        }

        public String getIslock() {
        return islock;
        }

        public void setIslock(String islock) {
        this.islock = islock;
        }


}
