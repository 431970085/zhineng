package com.code.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.code.entity.Userinfo;
import org.springframework.stereotype.Component;


//userinfo表的用户信息数据库操作
@Component
public interface UserinfoMapper extends BaseMapper<Userinfo> {

}

