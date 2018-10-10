package com.wyu.online.service;

import com.wyu.online.dao.PaperDao;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on  2018/7/13
 */
public class PaperService {

    private PaperDao paperDao = new PaperDao();

    public List<Map<String,String>> getPapersById(String subjectid) {
        return paperDao.getPapersById(subjectid);
    }
}
