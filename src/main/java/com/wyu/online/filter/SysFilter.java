package com.wyu.online.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 权限 Filter
 * Created by Administrator on  2018/7/19
 */
@WebFilter(urlPatterns = "/*", filterName = "SystemFilter")
public class SysFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession(false);

		String loginURI = request.getContextPath() + "/login";

		boolean loggedIn = session != null && session.getAttribute("username") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);

        /**
         * 1. 判断是否已经登录，没登录，就进入登录页面
         * 2. 没登录，但此页面是登录页面，就放行。
         */
        if(loggedIn || loginRequest){
            filterChain.doFilter(servletRequest,servletResponse);
        }else {
            ((HttpServletResponse) servletResponse).sendRedirect(request.getContextPath() + "/login");
        }
	}

	@Override
	public void destroy() {

	}
}
