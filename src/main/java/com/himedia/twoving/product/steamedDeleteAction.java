package com.himedia.twoving.product;

import java.io.IOException;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.steamedDao;
import com.himedia.twoving.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class steamedDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pseq = Integer.parseInt(request.getParameter("pseq"));
		String result = request.getParameter("result");

		
		HttpSession session = request.getSession(); 
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		  
		 
		  
		  if(mvo ==null) { 
			  response.sendRedirect("twoving.do?command=loginForm"); 
		  }else{ 

			
			  steamedDao sdao = steamedDao.getInstance(); 
			  sdao.deletsteamed(pseq);

			

		  
		  response.sendRedirect("twoving.do?command=Tdetail&pseq=" + pseq + "&result=" + result);		  
		  }

	}

}
