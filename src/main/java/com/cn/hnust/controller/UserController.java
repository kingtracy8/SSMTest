package com.cn.hnust.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.hnust.domain.User;
import com.cn.hnust.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request, Model model) {
		// int userId = Integer.parseInt(request.getParameter("id"));
		// User user = this.userService.getUserById(userId);
		// model.addAttribute("user", user);
		return "showUser";
	}

	@RequestMapping(value = "/GetUser", method = RequestMethod.POST)
	public @ResponseBody
	void GetUser(@RequestBody User user) {// @RequestBody User user
		System.out.println(user.getUserName());
		user = new User();
		user.setUserName("Wei");
		//return user;
	}

}
