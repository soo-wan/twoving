package com.twoving.controller.action.mypage;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.MemberDao;
import com.himedia.twoving.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ResetPasswordAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("마지막 아이디 불러오냐? : " + request.getParameter("userid"));
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		MemberDao mdao = MemberDao.getInstance();
		mdao.updateMemberPwd(userid,pwd);
		response.sendRedirect("twoving.do?command=loginForm");
	}
}
