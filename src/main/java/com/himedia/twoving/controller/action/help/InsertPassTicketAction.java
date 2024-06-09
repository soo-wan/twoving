package com.himedia.twoving.controller.action.help;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.PaymentVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class InsertPassTicketAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			// int pmseq = Integer.parseInt(request.getParameter("pmseq"));
			
			String subscribeyn = request.getParameter("subscribeyn");
			String productname = request.getParameter("productname");
			String paymentprice = request.getParameter("paymentprice");
			
			PaymentVO paymentVO = new PaymentVO();
			
			paymentVO.setProductname(productname);
			paymentVO.setPaymentprice(paymentprice);
			
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			
//			if(subscribeyn.equals("Y")) {
//				paymentDAO.updatePayment(pmseq, subscribeyn);
//			}
			
			paymentDAO.insertPayment(paymentVO);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("insertPassTicketSuccess.jsp");
			rd.forward(request, response);
		}
		
	}

}
