package com.wyu.online.servlet;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *  主页Serlet   main页面
 * Created by Administrator on  2018/7/12
 */
@WebServlet(urlPatterns = "/main",asyncSupported = false)
public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = (String) req.getSession().getAttribute("username");
        req.setAttribute("username",username);
        req.getRequestDispatcher("/WEB-INF/view/main.jsp").forward(req, resp);
    }
}
