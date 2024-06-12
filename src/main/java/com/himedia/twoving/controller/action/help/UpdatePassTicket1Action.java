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

public class UpdatePassTicket1Action implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			String subscribeyn = request.getParameter("subscribeyn");
			int pmseq = Integer.parseInt(request.getParameter("pmseq"));
			int ptseq = Integer.parseInt(request.getParameter("ptseq"));

			String productname = request.getParameter("productname");
			String paymentprice = request.getParameter("paymentprice");
			
			PaymentDAO paymentDAO = PaymentDAO.getInstance();

			if(subscribeyn.equals("Y")) {
				System.out.println("현재 subscribeyn : " + subscribeyn);
				System.out.println("현재 pmseq : " + pmseq);
				paymentDAO.updatePayment(pmseq);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("twoving.do?command=insertPassTicket3&subscribeyn=" + subscribeyn + "&productname=" + productname + "&paymentprice=" + paymentprice + "&ptseq=" + ptseq);
			rd.forward(request, response);
		}
	}

}
