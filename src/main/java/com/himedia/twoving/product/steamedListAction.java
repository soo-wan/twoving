package com.himedia.twoving.product;

import java.io.IOException;
import java.util.ArrayList;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.PassTicketDAO;
import com.himedia.twoving.dao.PaymentDAO;
import com.himedia.twoving.dao.ProductDao;
import com.himedia.twoving.dao.steamedDao;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.PassTicketVO;
import com.himedia.twoving.vo.PaymentVO;
import com.himedia.twoving.vo.steamedVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class steamedListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int kind = Integer.parseInt(request.getParameter("kind"));
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		
		if( mvo == null ) {
			/* response.sendRedirect("shop.do?command=loginForm"); */
			response.sendRedirect("twoving.do?command=loginForm");
		} else {
			steamedDao sdao = steamedDao.getInstance();
			ProductDao pdao = ProductDao.getInstance();
			PassTicketDAO passTicketDAO = PassTicketDAO.getInstance();
			
			PassTicketVO passTicketVO = passTicketDAO.selectOnePassTicket(mvo.getUserid());
			PaymentDAO paymentDAO = PaymentDAO.getInstance();
			
			PaymentVO paymentVO = paymentDAO.getSelectList();
			
			ArrayList<Integer> kindList = pdao.getKindList();
			ArrayList<steamedVO> list = sdao.steamedview2(mvo.getUserid());
			ArrayList<steamedVO> Alist = sdao.selectKindProduct(kind);
			
	    request.setAttribute("memberVO", mvo);
		request.setAttribute("passTicketVO", passTicketVO);	
		request.setAttribute("paymentVO", paymentVO);
		request.setAttribute("kind", kindList);
		request.setAttribute("steamedList", list);		
		request.setAttribute("steamedList1", Alist);
		
		request.getRequestDispatcher("steamedlist.jsp").forward(request, response);
		}

	}

	
	}

