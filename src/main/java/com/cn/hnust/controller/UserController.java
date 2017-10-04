package com.cn.hnust.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.hnust.domain.User;
import com.cn.hnust.service.IUserService;

import java.io.IOException;
import java.util.List;

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
    User GetUser(@RequestBody User user) {
        //	user = userService.getUserById(2);
//        userService.updateByPrimaryKey(user);
        userService.deleteByPrimaryKey(user.getId());
        return user;
    }

    @RequestMapping("/test")
    public void test(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.selectAll();
        for (int i = 0; i < userList.size(); i++) {
            try {
                response.getWriter().println(userList.get(i).getUserName());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
