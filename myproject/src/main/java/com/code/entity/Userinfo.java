package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;
        import java.lang.Integer;

/**
* ClassName:Userinfo
* Description: 用户信息实体类
*/
@TableName("Userinfo")
public class Userinfo {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * 编号
    */
        private Integer id;
    /**
    * 姓名
    */
        private String name;
    /**
    * 电话
    */
        private String phone;
    /**
    * 头像
    */
        private String picurl;
    /**
    * 邮箱
    */
        private String email;
    /**
    * 角色
    */
        private String role;
    /**
    * 年龄
    */
        private Integer age;
    /**
    * 性别
    */
        private String sex;
    /**
    * 密码
    */
        private String password;
    /**
    * 备注
    */
        private String intro;


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

        public String getPhone() {
        return phone;
        }

        public void setPhone(String phone) {
        this.phone = phone;
        }

        public String getPicurl() {
        return picurl;
        }

        public void setPicurl(String picurl) {
        this.picurl = picurl;
        }

        public String getEmail() {
        return email;
        }

        public void setEmail(String email) {
        this.email = email;
        }

        public String getRole() {
        return role;
        }

        public void setRole(String role) {
        this.role = role;
        }

        public Integer getAge() {
        return age;
        }

        public void setAge(Integer age) {
        this.age = age;
        }

        public String getSex() {
        return sex;
        }

        public void setSex(String sex) {
        this.sex = sex;
        }

        public String getPassword() {
        return password;
        }

        public void setPassword(String password) {
        this.password = password;
        }

        public String getIntro() {
        return intro;
        }

        public void setIntro(String intro) {
        this.intro = intro;
        }


}
