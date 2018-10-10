package com.wyu.online.servlet;

import com.wyu.online.service.SubjectService;

import javax.security.auth.Subject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 考试科目servlet
 * Created by Administrator on  2018/7/13
 */
@WebServlet(urlPatterns = "/kskm")
public class KSKMServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SubjectService subjectService = new SubjectService();
        req.setAttribute("username",req.getSession().getAttribute("username"));

        List<Map<String,String>> subjects = subjectService.getAllSubjects();
        req.setAttribute("subjects",subjects);
        req.getRequestDispatcher("/WEB-INF/view/kskm.jsp").forward(req, resp);
    }
}
