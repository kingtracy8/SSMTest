package com.cn.hnust.service;

import org.springframework.stereotype.Service;

import com.cn.hnust.domain.User;

public interface IUserService {
	public User getUserById(int userId);
}
