package com.wyu.online.service;

import com.wyu.online.dao.ExamDao;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on  2018/7/17
 */
public class ExamService {

    private ExamDao examDao = new ExamDao();

    public List<Map<String,String>> getPaperContentsById(String paperid) {
        return examDao.getPaperContentsById(paperid);
    }
}
