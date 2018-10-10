package com.wyu.online.servlet;

import com.wyu.online.service.PaperService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 *  选择试卷 Servlet
 * Created by Administrator on  2018/7/13
 */
@WebServlet(urlPatterns = "/paper")
public class PaperServlet extends HttpServlet {

    private PaperService paperService = new PaperService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("username",req.getSession().getAttribute("username"));

        String subjectid = req.getParameter("subjectid");
        List<Map<String,String>> papers = paperService.getPapersById(subjectid);

        req.setAttribute("papers",papers);
        req.getRequestDispatcher("/WEB-INF/view/paper.jsp").forward(req,resp);
    }
}
