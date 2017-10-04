package com.cn.hnust.service;

import org.springframework.stereotype.Service;

import com.cn.hnust.domain.User;

import java.util.List;

public interface IUserService {
	public User getUserById(int userId);
	public int updateByPrimaryKey(User record);
	public int deleteByPrimaryKey(Integer id);
	public List<User> selectAll();
}
