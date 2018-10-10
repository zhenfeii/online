package com.wyu.online.service;

import com.wyu.online.dao.UserDao;

import java.util.Map;

/**
 * Created by Administrator on  2018/7/19
 */
public class LoginService {

    private UserDao userDao = new UserDao();

    public Map<String,String> getUserInfoByName(String username) {
        return userDao.getUserInfoByName(username);
    }
}
