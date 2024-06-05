package com.himedia.twoving.controller.action.help;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.vo.PaymentVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class InsertPassTicketAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// int pmseq = Integer.parseInt(request.getParameter("pmseq"));
		
		String productname = request.getParameter("productname");
		String paymentprice = request.getParameter("paymentprice");
		
		PaymentVO paymentVO = new PaymentVO();
		
		paymentVO.setProductname(productname);
		paymentVO.setPaymentprice(paymentprice);
		
		PaymentDAO paymentDAO = PaymentDAO.getInstance();
		paymentDAO.insertPayment(paymentVO);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("insertPassTicketSuccess.jsp");
		rd.forward(request, response);
		
	}

}
