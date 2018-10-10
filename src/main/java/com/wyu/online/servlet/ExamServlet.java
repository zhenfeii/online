package com.wyu.online.servlet;

import com.wyu.online.service.ExamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 *  考试Servlet
 *  Created by Administrator on  2018/7/13
 */
@WebServlet("/exam")
public class ExamServlet extends HttpServlet {

    private ExamService examService = new ExamService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("username",req.getSession().getAttribute("username"));

        String paperid = req.getParameter("paper_id");
        List<Map<String,String>> paperContents = examService.getPaperContentsById(paperid);
        req.setAttribute("paperContents",paperContents);
        req.getRequestDispatcher("/WEB-INF/view/exam.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, String[]> paramsArray = req.getParameterMap();
//        String score = examService.dealPaper();
        resp.sendRedirect(req.getContextPath() + "/grade");
    }
}
