package com.himedia.twoving.controller.action.help;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PassTicketDAO;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.PaymentVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateDefuseCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			String productname = request.getParameter("productname");
			
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			PassTicketDAO passTicketDAO = PassTicketDAO.getInstance();
			
			PaymentVO paymentVO = paymentDAO.getPayment(productname);
			
			MemberVO memberVO1 = passTicketDAO.selectMemberPassTicket(memberVO.getUserid());
			
			request.setAttribute("paymentVO", paymentVO);
			request.setAttribute("memberVO", memberVO1);
			
			RequestDispatcher rd = request.getRequestDispatcher("updateDefuseCheck.jsp");
			rd.forward(request, response);
		}
		
	}

}
