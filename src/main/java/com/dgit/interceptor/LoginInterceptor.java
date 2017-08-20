package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dgit.domain.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGINID = "loginid";
	private static final String LOGINNICK = "loginnick";
	private static final String ISADMIN = "isAdmin";
	private static final String ISMEMBER = "isMember";
	private static final String USERPIC = "userpic";
	
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
		MemberVO loginVO = (MemberVO) modelAndView.getModel().get("loginVO");
		int isAdmin = (int) modelAndView.getModel().get("isAdmin");
		
		if(loginVO == null){
			HttpSession session = request.getSession();
			session.setAttribute(ISMEMBER, false);
			response.sendRedirect("login"); //회원가입 화면으로 유도해야 하나, 화면이 없어서 미리 처리함.
		}else{
			HttpSession session = request.getSession();
			session.setAttribute(LOGINID, loginVO.getUserid());
			session.setAttribute(LOGINNICK, loginVO.getNickname());
			session.setAttribute(USERPIC, loginVO.getMemberpic());
			if(isAdmin==1){
				session.setAttribute(ISADMIN, true);
			}
			
			//login이전에 이동할 uri가 있다면 dest에 저장을 해뒀음.
			//저장된 dest의 값을 얻어, 그곳으로 이동되도록 함.
			String path = (String) session.getAttribute("dest");
			if(path != null){
				response.sendRedirect(path);
			}
		}
	}
}
