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

public class InsertPassTicket2Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
//			int pmseq = Integer.parseInt(request.getParameter("pmseq"));
//			System.out.println("pmseq : " + pmseq);
			int ptseq = Integer.parseInt(request.getParameter("ptseq"));
			System.out.println("ptseq : " + ptseq);
			
			String subscribeyn = request.getParameter("subscribeyn");
			String productname = request.getParameter("productname");
			String paymentprice = request.getParameter("paymentprice");
			
			PassTicketDAO passTicketDAO = PassTicketDAO.getInstance();
			
			
			System.out.println("productname : " + productname);
			
			PaymentVO paymentVO = new PaymentVO();
			
			paymentVO.setSubscribeyn(subscribeyn);
			paymentVO.setProductname(productname);
			paymentVO.setPaymentprice(paymentprice);
			paymentVO.setUserid(memberVO.getUserid());
			
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			paymentDAO.insertPayment(paymentVO);
			
			passTicketDAO.updateMemberPassTicket(memberVO.getUserid(), ptseq);
			
			RequestDispatcher rd = request.getRequestDispatcher("insertPassTicketSuccess.jsp");
			rd.forward(request, response);
		}
	}

}
