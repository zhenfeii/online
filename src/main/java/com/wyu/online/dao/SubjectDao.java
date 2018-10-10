package com.wyu.online.dao;

import com.wyu.online.utils.C3poUtils;
import com.wyu.online.utils.DaoConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on  2018/7/13
 */
public class SubjectDao {

    public List<Map<String,String>> getAllSubjects() {
        List<Map<String,String>> subjects = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = C3poUtils.getPreparedStatement("select * from kskm");
            ResultSet rs =  preparedStatement.executeQuery();
            while (rs.next()){
                String id = rs.getString("id");
                String subejct = rs.getString("subject");
                String teacher = rs.getString("teacher");
                Map<String,String> map = new HashMap<>();
                map.put("id",id);
                map.put("subject",subejct);
                map.put("teacher",teacher);
                subjects.add(map);
            }
            return subjects;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        List<Map<String,String>> list = new SubjectDao().getAllSubjects();
        System.out.println();
    }
}
