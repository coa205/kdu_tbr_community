package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dgit.util.UploadFileUtils;

public class JoinInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		Integer creatResult = (Integer) modelAndView.getModel().get("creatResult");
		
		if(creatResult == 0){
			HttpSession session = request.getSession();
			session.setAttribute("isCreat", creatResult);
			response.sendRedirect("login");
		}else if(creatResult == 1){
			HttpSession session = request.getSession();
			session.setAttribute("isCreat", creatResult);
			response.sendRedirect("login");
		}
	}
}
