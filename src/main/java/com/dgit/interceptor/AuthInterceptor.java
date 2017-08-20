package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("AUTH Interceptor PreHandle --------------");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("loginid");
		System.out.println("session userid : " + userid);
		if(userid == null){
			saveDest(request);
			String url = request.getContextPath() + "/user/login";
			response.sendRedirect(url);
			return false;
		}
		return true;
	}
	
	//이전 로그인 화면으로 이동전의 command의 query를 기억해 둔다.
	private void saveDest(HttpServletRequest request){
		String uri = request.getRequestURI();
		String query = request.getQueryString(); // ? key = value
		
		if(query == null || query.equals("null")){
			query ="";
		}else{
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")){
			System.out.println(uri + query);
			request.getSession().setAttribute("dest", uri + query);
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("AUTH Interceptor PostHandle --------------");
	}
}
