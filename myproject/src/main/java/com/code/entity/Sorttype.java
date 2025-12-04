package com.code.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

        import java.lang.Integer;

/**
* ClassName:Sorttype
* Description: 分类信息实体类
*/
@TableName("Sorttype")
public class Sorttype {

 @TableId(type = IdType.AUTO) //主键自增
    /**
    * ID
    */
        private Integer id;
    /**
    * 分类名称
    */
        private String sortname;
    /**
    * 分类描述
    */
        private String intro;
    /**
    * 创建时间
    */
        private String createtime;


        public Integer getId() {
        return id;
        }

        public void setId(Integer id) {
        this.id = id;
        }

        public String getSortname() {
        return sortname;
        }

        public void setSortname(String sortname) {
        this.sortname = sortname;
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


}
