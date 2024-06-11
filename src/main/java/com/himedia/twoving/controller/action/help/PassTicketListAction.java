package com.himedia.twoving.controller.action.help;

import java.io.IOException;
import java.util.ArrayList;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PassTicketDAO;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.util.Paging;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.PassTicketVO;
import com.himedia.twoving.vo.PaymentVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PassTicketListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("loginUser");
		
		if(memberVO == null) {
			RequestDispatcher rd = request.getRequestDispatcher("member/loginForm.jsp");
			rd.forward(request, response);
		}else {
			int page = 1;
			  
			if(request.getParameter("page") != null) {
				 
			page =  Integer.parseInt(request.getParameter("page"));
			  
			session.setAttribute("page", page);
			  
			} else if(session.getAttribute("page") != null) { 
				 
			page = (Integer)session.getAttribute("page"); 
			  
			} else {
			   session.removeAttribute("page"); 
			 }
			 
			 String key = "";
				
			if(request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key", key);
			}else if(session.getAttribute("key") != null){
				key = (String)session.getAttribute("key");
			}else {
				session.removeAttribute("key");
			}
			  
			  Paging paging = new Paging(); 
			  
			  paging.setPage(page);
			 
			  PaymentDAO paymentDAO = PaymentDAO.getInstance();
			  PassTicketDAO passTicketDAO = PassTicketDAO.getInstance();
			  
			  PassTicketVO passTicketVO = passTicketDAO.selectOnePassTicket(memberVO.getUserid());
				
			  int count = paymentDAO.getAllCount();
				 
			  System.out.println("count : " + count);
				 
			 paging.setTotalCount(count);
			  
			 PaymentVO paymentVO = paymentDAO.getSelectList();
			
			 ArrayList<PaymentVO> passTicket2List = paymentDAO.getAllList(paging, memberVO.getUserid());
			
			request.setAttribute("paymentVO", paymentVO);
			request.setAttribute("passTicketVO", passTicketVO);
			request.setAttribute("passTicket2", passTicket2List);
			request.setAttribute("paging", paging);
			
			RequestDispatcher rd = request.getRequestDispatcher("passTicket.jsp");
			rd.forward(request, response);
		}
		
	}

}
