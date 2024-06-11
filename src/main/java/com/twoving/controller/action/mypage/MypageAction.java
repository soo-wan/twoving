package com.twoving.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.ProductDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MypageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao pdao = ProductDao.getInstance();
	      
	      ArrayList<Integer> kindList = pdao.getKindList();
	      
	      request.setAttribute("kindList", kindList);
		
		request.getRequestDispatcher("mypage/mypage.jsp").forward(request, response);

	}

}
