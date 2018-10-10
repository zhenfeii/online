package com.wyu.online.dao;

import com.wyu.online.utils.C3poUtils;
import com.wyu.online.utils.DaoConnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on  2018/7/17
 */
public class ExamDao {

	public List<Map<String, String>> getPaperContentsById(String paperid) {
		List<Map<String, String>> paperContents = new ArrayList<>();
		String sql = "select * from paper_content where paper_id=?";
		try {
			ResultSet rs = C3poUtils.getPreparedStatement(sql, new Object[] { paperid }).executeQuery();
			while (rs.next()) {
                Map<String,String> map = new HashMap<>();
                map.put("id",rs.getString("id"));
                map.put("paper_id",rs.getString("paper_id"));
                map.put("title",rs.getString("title"));
                map.put("option1",rs.getString("option1"));
                map.put("option2",rs.getString("option2"));
                map.put("option3",rs.getString("option3"));
                map.put("option4",rs.getString("option4"));
                paperContents.add(map);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return paperContents;
	}
}
