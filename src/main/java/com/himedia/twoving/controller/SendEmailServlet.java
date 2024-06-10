package com.himedia.twoving.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.himedia.twoving.dao.MemberDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SendEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendEmailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	
		String userId = request.getParameter("userId");
		
		MemberDao mdao = MemberDao.getInstance();
		String email = mdao.getMemberEmail(userId);
		System.out.println("이메일 : " + email);
		
	    // POST 요청을 처리하는 메소드
        // 사용자가 입력한 이메일 주소를 가져옴
        //String email = request.getParameter("email");
        // 네이버 SMTP 서버 주소
        String host = "smtp.naver.com";
        
        // 네이버 이메일 계정과 비밀번호
        final String user = "ohsoowan@naver.com"; // 네이버 이메일 계정
        final String password = "`dtd15321"; // 네이버 이메일 계정 비밀번호

        // 인증 코드를 생성하여 세션에 저장
        String authCode = generateAuthCode();
        request.getSession().setAttribute("authCode", authCode);
        request.getSession().setAttribute("email", email);

        // 이메일 전송에 필요한 속성 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // 세션 생성 및 SMTP 인증 설정
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
            	System.out.println("여기까진됨");
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            // 이메일 메시지 생성
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user)); // 발신자 설정
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 수신자 설정

            // 이메일 제목과 본문 설정
            message.setSubject("아이디 찾기 인증 코드");
            message.setText("인증 코드: " + authCode);

            // 이메일 전송
            Transport.send(message);
            System.out.println("Email sent successfully");

            // 인증 코드 입력 페이지로 리디렉션
			 response.sendRedirect("mypage/verify_code.jsp"); 
            //response.getWriter().println("<script>window.open('mypage/verify_code.jsp', '새창', 'width=600, height=400, top=100, left=100');</script>");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
	}
	
    // 인증 코드를 생성하는 메소드
    private String generateAuthCode() {
        int randomPin = (int) (Math.random() * 900000) + 100000; // 6자리 인증 코드 생성
        return String.valueOf(randomPin);
    }
}
