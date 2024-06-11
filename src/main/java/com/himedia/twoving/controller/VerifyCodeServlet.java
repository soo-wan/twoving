package com.himedia.twoving.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class VerifyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public VerifyCodeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("아이디 불러옴2? : " + request.getParameter("userid"));
		String userid = request.getParameter("userid");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	
		// 사용자가 입력한 인증 코드와 세션에 저장된 인증 코드를 가져옴
        String code = request.getParameter("code");
        //System.out.println("code가 머야 : "+code);
        String authCode = (String) request.getSession().getAttribute("authCode");
        //System.out.println("authCode가 머야 : "+authCode);
        
        // 인증 코드 검증
        if (authCode.equals(code)) {
            // 인증 성공 메시지 반환
            //response.getWriter().write("인증 성공! 비밀번호를 재설정 하세요.");
        	//한글이 안나옴
        	//response.getWriter().println("<script>alert('인증 성공! 비밀번호를 재설정 하세요.')</script>");
            //비밀번호 재설정 하는 폼을 가게해서 변경하기.
            request.setAttribute("userid", userid);
        	request.getRequestDispatcher("mypage/resetPassword.jsp").forward(request, response);
        } else {
            // 인증 실패 메시지 반환
            //response.getWriter().write("인증 실패! 올바른 인증 코드를 입력하세요.");
            response.getWriter().println("<script>alert('Fail !!!')</script>");
            response.getWriter().println("<script>history.back();</script>");
        }
	}
}
