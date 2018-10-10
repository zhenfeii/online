package com.wyu.online.servlet;

import com.wyu.online.service.GradeService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 成绩 Servlet
 * Created by Administrator on  2018/7/18
 */
@WebServlet(value = "/grade")
public class GradeServlet extends HttpServlet {

    private GradeService gradeService = new GradeService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("username",req.getSession().getAttribute("username"));
        List<Map<String,String>> grades = gradeService.getGradesByName((String) req.getSession().getAttribute("username"));
        req.setAttribute("grades",grades);
        req.getRequestDispatcher("/WEB-INF/view/grade.jsp").forward(req, resp);
    }
}
