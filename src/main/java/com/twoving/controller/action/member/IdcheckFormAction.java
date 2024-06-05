package com.twoving.controller.action.member;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.MemberDao;
import com.himedia.twoving.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IdcheckFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = mdao.getMember(userid);
		
		if(mvo == null)
			request.setAttribute("result", -1); //사용가능
		else request.setAttribute("result", 1); //사용 중
		
		request.setAttribute("userid", userid);
		
		request.getRequestDispatcher("member/idcheck.jsp").forward(request, response);

	}

}
