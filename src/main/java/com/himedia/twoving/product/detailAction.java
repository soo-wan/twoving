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

public class detailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		
		String result = request.getParameter("result");
	 
		
		HttpSession session = request.getSession(); 
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		  
			
		if( mvo == null ) {
			response.sendRedirect("twoving.do?command=loginForm");
		} else {
	      
	   	ProductDao pdao = ProductDao.getInstance();
	    ProductVO pvo = pdao.getProduct(pseq);
	   
	    //int	count = pdao.Count(pseq);
	    
	    
	    
	      
	    steamedDao sdao = steamedDao.getInstance();	    	 
	    ArrayList<steamedVO> list = sdao.steamedview(mvo.getUserid(), pseq);
	    
		
		request.setAttribute("result", result);
		request.setAttribute("ccc", list);
		//request.setAttribute("count", count);
		request.setAttribute("productVO", pvo);

		request.getRequestDispatcher("Tdetail.jsp").forward(request, response);
		}
	}
}
