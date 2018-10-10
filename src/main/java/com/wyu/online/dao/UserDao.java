package com.wyu.online.dao;

import com.wyu.online.utils.C3poUtils;
import com.wyu.online.utils.DaoConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on  2018/7/19
 */
public class UserDao {

    public Map<String,String> getUserInfoByName(String username) {
        Map<String,String> userInfo = new HashMap<>();
        try {
            ResultSet rs = C3poUtils.getPreparedStatement("select * from sys_user where username=?",new Object[]{username}).executeQuery();
            while (rs.next()){
                userInfo.put("id",rs.getString("id"));
                userInfo.put("username",rs.getString("username"));
                userInfo.put("password",rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userInfo;
    }
}
