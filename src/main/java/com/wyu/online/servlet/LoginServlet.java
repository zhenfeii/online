package com.wyu.online.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;

import com.wyu.online.service.LoginService;

/**
 * Created by Administrator on  2018/7/19
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private LoginService loginService = new LoginService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*HttpSession session = req.getSession();
        if(session.getAttribute("userInfo") != null){
            req.getRequestDispatcher("/WEB-INF/view/main.jsp").forward(req, resp);
        }else {
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }*/

		//使用shiro
		req.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(req,resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*String username = req.getParameter("username");
		String password = req.getParameter("password");
		Map<String, String> userInfo = loginService.getUserInfoByName(username);
		if (userInfo.size() > 0) {
			if (userInfo.get("password").equals(password)) {
				//把用户信息存放在Session
				req.getSession().setAttribute("userInfo", userInfo);
				req.getSession().setAttribute("username",userInfo.get("username"));
				//转发视图
				req.getRequestDispatcher("/WEB-INF/view/main.jsp").forward(req, resp);
			} else {
				req.setAttribute("errMsg", "密码出错");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		} else {
			req.setAttribute("errMsg", "用户不存在");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}*/

		//使用shiro
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		UsernamePasswordToken token = new UsernamePasswordToken(username,password);

		Subject subject = SecurityUtils.getSubject();

		System.out.println();
		try {
			subject.login(token);
			resp.sendRedirect("/main");
		} catch (AuthenticationException e) {
			e.printStackTrace();
			req.setAttribute("errMsg","用户名或密码出错");
			req.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(req, resp);
		}

	}
}
