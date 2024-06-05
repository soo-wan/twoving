package com.himedia.twoving.controller.action.admin;

import java.io.IOException;

import com.himedia.twoving.action.Action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminFaqWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("admin/faq/faqWrite.jsp").forward(request, response);
	}
}
