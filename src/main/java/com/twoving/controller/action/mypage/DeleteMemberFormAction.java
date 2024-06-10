package com.twoving.controller.action.mypage;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.vo.PaymentVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteMemberFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PaymentDAO paymentDAO = PaymentDAO.getInstance();
		//member에 where절로 세션id걸고 이용권이름을 불러옴 
		PaymentVO paymentVO = paymentDAO.getSelectList();
		
		request.setAttribute("paymentVO", paymentVO);
		request.getRequestDispatcher("mypage/deleteMember.jsp").forward(request, response);
	}
}
