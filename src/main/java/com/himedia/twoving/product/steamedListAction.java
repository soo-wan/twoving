package com.himedia.twoving.product;

import java.io.IOException;

import java.util.ArrayList;

import com.himedia.twoving.action.Action;
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
		
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		int kind = Integer.parseInt(request.getParameter("kind"));
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		
		if( mvo == null ) {
			response.sendRedirect("shop.do?command=loginForm");
		} else {
			steamedDao sdao = steamedDao.getInstance();
			ArrayList<steamedVO> list = sdao.steamedview(mvo.getUserid(), pseq);
			ArrayList<steamedVO> Alist = sdao.selectKindProduct(kind);			
			String kindList[] = {"시리즈","영화"};

		request.setAttribute("kind", kindList[kind]);
		request.setAttribute("steamedList", list);
		request.setAttribute("steamedList1", Alist);
		request.getRequestDispatcher("mypage.jsp").forward(request, response);
		}

	}

	
	}

