package org.zsl.testmybatis;  
  
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.cn.hnust.domain.User;
import com.cn.hnust.service.IUserService;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
  
public class TestMyBatis {  
    private static Logger logger = Logger.getLogger(TestMyBatis.class);
    @Resource  
    private IUserService userService = null;
  
    @Test  
    public void test1() {  
//        User user = userService.getUserById(1);
//        logger.info(JSON.toJSONString(user));
        List<User> userList = userService.selectAll();
        User user = userService.getUserById(1);
        if(userList.contains(user)){
            logger.info(JSON.toJSONString(user));
        }
    }  
}  