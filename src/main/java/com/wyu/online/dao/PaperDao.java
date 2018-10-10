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
 * Created by Administrator on  2018/7/13
 */
public class PaperDao {

	public List<Map<String, String>> getPapersById(String subjectid) {
		List<Map<String, String>> list = new ArrayList<>();
		try {
			ResultSet rs = C3poUtils
					.getPreparedStatement("select * from paper where subject_id=?", new Object[] { subjectid })
					.executeQuery();

			while (rs.next()) {
				Map map = new HashMap();
				map.put("id", rs.getString("id"));
				map.put("subject_id", rs.getString("subject_id"));
				map.put("name", rs.getString("name"));
				list.add(map);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
}
