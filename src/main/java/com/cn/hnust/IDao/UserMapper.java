package com.cn.hnust.IDao;

import com.cn.hnust.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;
//@Repository(value="UserMapper")
public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> selectAll();
}