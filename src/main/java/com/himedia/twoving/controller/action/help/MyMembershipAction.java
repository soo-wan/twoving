package com.himedia.twoving.controller.action.help;

import java.io.IOException;
import java.util.ArrayList;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.PaymentVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MyMembershipAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			
			PaymentVO paymentVO = paymentDAO.getSelectList();
			
			request.setAttribute("paymentVO", paymentVO);
			
			RequestDispatcher rd = request.getRequestDispatcher("myMembership.jsp");
			rd.forward(request, response);
		}
		
	}

}
