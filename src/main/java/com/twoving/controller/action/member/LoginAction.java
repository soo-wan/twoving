package com.twoving.controller.action.member;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.MemberDao;
import com.himedia.twoving.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String remember = request.getParameter("remember");
		
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = mdao.getMember(userid);
		
		Cookie cookie = new Cookie("userId", userid); //쿠키 생성
		if (remember != null) { 
			// 체크박스 체크 되었을 때 쿠키 저장
			response.addCookie(cookie);
		} else {
			// 체크박스 체크 해제되었을 때 쿠키 유효시간 0으로 해서 브라우저에서 삭제하게 한다.
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		String url = "member/loginForm.jsp";
		if(mvo == null)
			request.setAttribute("message", "아이디가 없습니다");
		else if( !mvo.getPwd().equals(pwd)) 
			request.setAttribute("message", "패스워드가 틀립니다.");
		else if(mvo.getUseyn().equals("N")) {
			request.setAttribute("message", "해당 계정은 휴면상태이거나 탈퇴상태입니다. 관리자에게 문의하세요.");
		}else if( mvo.getPwd().equals(pwd)) {
			url = "twoving.do?command=tMain";
			HttpSession session =request.getSession();
			session.setAttribute("loginUser", mvo);
		}else 
			request.setAttribute("message", "관리자에게 문의하세요");
			
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
