package com.himedia.twoving.controller.action.admin;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import com.himedia.twoving.action.Action;
import com.himedia.twoving.dao.AdminDao;
import com.himedia.twoving.vo.ProductVO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

public class AdminProductWriteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductVO pvo = new ProductVO();
		System.out.println("1" + request.getParameter("genre") + " 2"+request.getParameter("useyn")  + " 3" + request.getParameter("bestyn"));
		//System.out.println("kind 22 : " + Integer.parseInt(request.getParameter("kind")));
		pvo.setKind(Integer.parseInt(request.getParameter("kind")));
		pvo.setGenre(request.getParameter("genre"));
		pvo.setUseyn(request.getParameter("useyn"));
		pvo.setNewyn(request.getParameter("newyn"));
		pvo.setBestyn(request.getParameter("bestyn"));
		pvo.setAge(request.getParameter("age"));
		pvo.setYear(request.getParameter("year"));
		pvo.setTime(request.getParameter("time"));
		pvo.setTitle(request.getParameter("title"));
		pvo.setContent(request.getParameter("content"));
		
		HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		String uploadFilePath = context.getRealPath("image2");
		
		File uploadDir = new File(uploadFilePath);
		if(!uploadDir.exists()) uploadDir.mkdir();
		
		//image2 바꿔야함 디테일이 뒤에 들어가게
//		String fileName2 = "";
//		for(Part p : request.getParts()) {
//			fileName2="";
//			for(String content : p.getHeader("content-disposition").split(";")) {
//				if(content.trim().startsWith("filename")) 
//					fileName2 = content.substring(content.indexOf("=")+2, content.length()-1);
//			}
//			String saveFilename2 = "";
//			if(!fileName2.equals("")) {
//				Calendar today = Calendar.getInstance();
//				long dt = today.getTimeInMillis();
//				String fn1 = fileName2.substring(0,fileName2.indexOf("."));
//				String fn2 = fileName2.substring(fileName2.indexOf("."));
//				saveFilename2 = fn1 + dt + fn2;
//				p.write(uploadFilePath + File.separator + saveFilename2);  // 파일 저장
//				
//				//바꿔야함 디테일이 뒤에 들어가게
//				pvo.setImage2(fileName2);
//				pvo.setSavefilename2(saveFilename2);
//			}
//		}
				
		String fileName = "";
		for(Part p : request.getParts()) {
			fileName="";
			System.out.println(p.getHeader("content-disposition"));
			for(String content : p.getHeader("content-disposition").split(";")) {
				if(content.trim().startsWith("filename")) 
					fileName = content.substring(content.indexOf("=")+2, content.length()-1);
			}
			String saveFilename = "";
			if(!fileName.equals("")) {
				Calendar today = Calendar.getInstance();
				long dt = today.getTimeInMillis();
				String fn1 = fileName.substring(0,fileName.indexOf("."));
				String fn2 = fileName.substring(fileName.indexOf("."));
				saveFilename = fn1 + dt + fn2;
				p.write(uploadFilePath + File.separator + saveFilename); 
				if(p.getName().equals("image")) {
					pvo.setImage(fileName);
					pvo.setSavefilename(saveFilename);
				} else if(p.getName().equals("image2"))  {
					pvo.setImage2(fileName);
					pvo.setSavefilename2(saveFilename);
				}
				//break;
			}
		}
		
		AdminDao adao = AdminDao.getInstance();
		adao.insertAdminProduct(pvo);
		response.sendRedirect("twoving.do?command=adminProductList");
	}
}
