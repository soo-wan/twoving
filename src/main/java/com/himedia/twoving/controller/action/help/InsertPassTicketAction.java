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

public class InsertPassTicketAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			int pmseq = Integer.parseInt(request.getParameter("pmseq"));
			int ptseq = Integer.parseInt(request.getParameter("ptseq"));
			
			String subscribeyn = request.getParameter("subscribeyn");
			String productname = request.getParameter("productname");
			String paymentprice = request.getParameter("paymentprice");
			
			
			System.out.println("productname : " + productname);
			PaymentVO paymentVO = new PaymentVO();
			
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			PassTicketDAO passTicketDAO = PassTicketDAO.getInstance();
			
			passTicketDAO.updateMemberPassTicket(memberVO.getUserid(), ptseq);
			
			paymentVO.setSubscribeyn(subscribeyn);
			paymentVO.setProductname(productname);
			paymentVO.setPaymentprice(paymentprice);
			
			
			if(subscribeyn.equals("Y")) {
				System.out.println("현재 subscribeyn : " + subscribeyn);
				paymentDAO.updatePayment(pmseq);
			}
			
			paymentDAO.insertPayment(paymentVO);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("insertPassTicketSuccess.jsp");
			rd.forward(request, response);
		}
		
	}

}
