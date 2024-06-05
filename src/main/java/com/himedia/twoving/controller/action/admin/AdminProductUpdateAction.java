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

public class AdminProductUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductVO pvo = new ProductVO();
		pvo.setPseq(Integer.parseInt(request.getParameter("pseq")));
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
		String uploadFilePath = context.getRealPath("product_images");
		
		File uploadDir = new File(uploadFilePath);
		if(!uploadDir.exists()) uploadDir.mkdir();
				
		String fileName = "";
		String saveFilename = "";
		for(Part p : request.getParts()) {
			fileName="";
			for(String content : p.getHeader("content-disposition").split(";")) {
				if(content.trim().startsWith("filename")) 
					fileName = content.substring(content.indexOf("=")+2, content.length()-1);
					System.out.println(" fileName : " + fileName);
			}
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
			} 
			else { //filename null 이면
				if(p.getName().equals("image")) {
					pvo.setImage(request.getParameter("oldimage"));
					pvo.setSavefilename(request.getParameter("oldsavefilename"));
				} else if(p.getName().equals("image2"))  {
					pvo.setImage2(request.getParameter("oldimage2"));
					pvo.setSavefilename2(request.getParameter("oldsavefilename2"));
				}
			}
		}
		
		AdminDao adao = AdminDao.getInstance();
		adao.updateProduct(pvo);
		response.sendRedirect("twoving.do?command=adminProductDetail&pseq=" + pvo.getPseq());
	}
}
