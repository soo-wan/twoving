package com.himedia.twoving.controller.action.help;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.vo.MemberVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InsertPassTicketPopup implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			/*
			 * PaymentVO paymentVO = new PaymentVO();
			 * 
			 * PaymentDAO paymentDAO = PaymentDAO.getInstance(); PassTicketDAO passTicketDAO
			 * = PassTicketDAO.getInstance(); ArrayList<PassTicket>
			 * 
			 * 
			 * paymentDAO.insertPayment(paymentVO);
			 */
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			// PaymentVO paymentVO = paymentDAO.getOneSelectList(memberVO.getUserid());
			
			
			// request.setAttribute("paymentVO", paymentVO);
			
			RequestDispatcher rd = request.getRequestDispatcher("updateDefuseCheck2.jsp");
			rd.forward(request, response);
		}
	}

}
