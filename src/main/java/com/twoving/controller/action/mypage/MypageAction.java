package com.twoving.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PassTicketDAO;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.dao.ProductDao;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.PassTicketVO;
import com.himedia.twoving.vo.PaymentVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MypageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			/*
			 * RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			 * rd.forward(request, response);
			 */
			response.sendRedirect("twoving.do?command=loginForm");
		}else {
			ProductDao pdao = ProductDao.getInstance();
			PassTicketDAO passTicketDAO = PassTicketDAO.getInstance();
			
			PassTicketVO passTicketVO = passTicketDAO.selectOnePassTicket(memberVO.getUserid());
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			
			PaymentVO paymentVO = paymentDAO.getSelectList();
			 ArrayList<Integer> kindList = pdao.getKindList();
		      
		     request.setAttribute("kindList", kindList);
		     request.setAttribute("paymentVO", paymentVO);
		     request.setAttribute("passTicketVO", passTicketVO);
		     request.setAttribute("memberVO", memberVO);
			
			request.getRequestDispatcher("mypage/mypage.jsp").forward(request, response);
		}

	}

}
