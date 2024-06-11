package com.twoving.controller.action.mypage;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PassTicketDAO;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.PassTicketVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteMemberFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			PassTicketDAO passTicketDAO  = PassTicketDAO.getInstance();
			//member에 where절로 세션id걸고 이용권이름을 불러옴
			
			PassTicketVO passTicketVO = passTicketDAO.selectOnePassTicket(memberVO.getUserid());
			
			request.setAttribute("passTicketVO", passTicketVO);
			request.getRequestDispatcher("mypage/deleteMember.jsp").forward(request, response);
		}
	}
}
