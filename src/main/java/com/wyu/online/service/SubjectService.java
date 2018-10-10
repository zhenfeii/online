package com.wyu.online.service;

import com.wyu.online.dao.SubjectDao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on  2018/7/13
 */
public class SubjectService {

    public List<Map<String,String>> getAllSubjects() {
        return new SubjectDao().getAllSubjects();
    }
}
