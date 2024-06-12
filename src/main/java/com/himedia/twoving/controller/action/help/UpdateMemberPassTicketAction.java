package com.himedia.twoving.controller.action.help;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PassTicketDAO;
import com.himedia.twoving.vo.MemberVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateMemberPassTicketAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			int ptseq = Integer.parseInt(request.getParameter("ptseq"));
			PassTicketDAO passTicketDAO = PassTicketDAO.getInstance();
			
			passTicketDAO.updateMemberPassTicket(memberVO.getUserid(), ptseq);
			
			RequestDispatcher rd = request.getRequestDispatcher("insertPassTicketSuccess.jsp");
			rd.forward(request, response);
			
		}
	}

}
