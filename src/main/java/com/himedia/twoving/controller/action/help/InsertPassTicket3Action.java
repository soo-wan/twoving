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

public class InsertPassTicket3Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			String subscribeyn = request.getParameter("subscribeyn");
			String productname = request.getParameter("productname");
			String paymentprice = request.getParameter("paymentprice");
			int ptseq = Integer.parseInt(request.getParameter("ptseq"));
			
			PaymentVO paymentVO = new PaymentVO();
			
			paymentVO.setUserid(memberVO.getUserid());
			paymentVO.setSubscribeyn(subscribeyn);
			paymentVO.setProductname(productname);
			paymentVO.setPaymentprice(paymentprice);
			
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			paymentDAO.insertPayment(paymentVO);
			
			response.sendRedirect("twoving.do?command=updateMemberPassTicket&ptseq=" + ptseq);
		}
	}

}
