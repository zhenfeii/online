package com.wyu.online.service;

import com.wyu.online.dao.GradeDao;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on  2018/7/20
 */
public class GradeService {

    private GradeDao gradeDao = new GradeDao();

    public List<Map<String,String>> getGradesByName(String username) {
        return gradeDao.getGradesByName(username);
    }
}
