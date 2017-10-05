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

    /**
     * 检查用户名和密码
     */


    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    public @ResponseBody
    int
    test(HttpServletRequest request, HttpServletResponse response, @RequestBody User user) {
        int flag = 0;
        List<User> userList = userService.selectAll();

        for (int i = 0; i < userList.size(); i++) {

            String userName = userList.get(i).getUserName();
            String userPassword = userList.get(i).getPassword();


            if (user.getUserName().equals(userName) && user.getPassword().equals(userPassword)) {
//                    response.sendRedirect("../../html/success.html");
                flag = 1;
                return flag;
            } else {
//                    response.sendRedirect("../../html/error.html");
                flag = 0;
            }



        }
        return flag;

    }

    @RequestMapping(value = "/LoginTest")
    public String Logintest(HttpServletRequest request, HttpServletResponse response) {


        if (1 == 1) {
            try {
                response.sendRedirect("../../html/success.html");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.sendRedirect("../../html/error.html");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "sss";
    }


}
