package com.himedia.twoving.product;

import java.io.IOException;

import java.util.ArrayList;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.ProductDao;
import com.himedia.twoving.dao.steamedDao;
import com.himedia.twoving.vo.MemberVO;
import com.himedia.twoving.vo.ProductVO;
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
			response.sendRedirect("shop.do?command=loginForm");
		} else {
			steamedDao sdao = steamedDao.getInstance();
			ProductDao pdao = ProductDao.getInstance();
			
			ArrayList<Integer> kindList = pdao.getKindList();
			ArrayList<steamedVO> list = sdao.steamedview2(mvo.getUserid());
			ArrayList<steamedVO> Alist = sdao.selectKindProduct(kind);
			
			

		request.setAttribute("kind", kindList);
		request.setAttribute("steamedList", list);		
		request.setAttribute("steamedList1", Alist);
		
		request.getRequestDispatcher("steamedlist.jsp").forward(request, response);
		}

	}

	
	}

