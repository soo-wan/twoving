package com.twoving.controller.action.member;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.MemberDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class FindIdAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이메일 입력시 가입된 아이디 찾아줌.
		String email = request.getParameter("email");
		
		MemberDao mdao = MemberDao.getInstance();
		String memberId = mdao.getMemberId(email);
		
		request.setAttribute("memberId", memberId);
		
		request.getRequestDispatcher("mypage/findIdResult.jsp").forward(request, response); 
	}
}
