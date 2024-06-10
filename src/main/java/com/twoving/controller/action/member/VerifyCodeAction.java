package com.twoving.controller.action.member;

import java.io.IOException;

import com.himedia.twoving.action.Action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class VerifyCodeAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//private static final long serialVersionUID = 1L;
		/*
		 * String code = request.getParameter("code"); String authCode = (String)
		 * request.getSession().getAttribute("authCode");
		 * 
		 * if (authCode.equals(code)) {
		 * response.getWriter().write("인증 성공! 아이디는 exampleUser입니다."); } else {
		 * response.getWriter().write("인증 실패! 올바른 인증 코드를 입력하세요."); }
		 */
	}
}
