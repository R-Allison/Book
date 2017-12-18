package com.yhc.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.yhc.bean.User;

public class AutoLoginFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		Cookie[] cookies = request.getCookies();
		String autologin = null;
		for(int i = 0; cookies != null && i< cookies.length;i++){
			if("autologin".equals(cookies[i].getName())){
				autologin = cookies[i].getValue();
				break;
			}
		}
		if(autologin != null){
			String[] parts = autologin.split("-");
			String name = parts[0];
			String password = parts[1];
			User user = new User();
			user.setName(name);
			user.setPassword(password);
			request.getSession().setAttribute("user", user);
		}
		arg2.doFilter(req, arg1);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
