package com.wyu.online.dao;

import com.wyu.online.utils.C3poUtils;
import org.junit.Test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on  2018/7/20
 */
public class GradeDao {

    public List<Map<String,String>> getGradesByName(String username) {
        List<Map<String,String>> grades = new ArrayList<>();
        String sql = "select g.id id,ks.subject subject, g.release_time release_time,g.score score " +
                "from grade g,kskm ks,sys_user u " +
                "where g.subject_id=ks.id and g.user_id=u.id and u.username=?";
        try {
            ResultSet rs = C3poUtils.getPreparedStatement(sql,new Object[]{username}).executeQuery();
            while (rs.next()){
                Map<String,String> map = new HashMap<>();
                map.put("id",rs.getString("id"));
                map.put("subject",rs.getString("subject"));
                map.put("release_time",rs.getString("release_time"));
                map.put("score",rs.getString("score"));
                grades.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return grades;
    }

}
