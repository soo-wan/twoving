<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.himedia.twoving.vo.PaymentVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<script src="script/payment.js"></script>
<script src="script/payment.js"></script>
<title>Insert title here</title>
</head>
<body>
 
 <section>
	<article>
		<div class="box">
   			<div class="box1">
  			   <input type="button" class="logo" onclick="location.href='twoving.do?command=tMain'" style="cursor: pointer; color:red;"value="TWOVING" />
               <div class="box1-2"><a href="twoving.do?command=kind&kind=0" style="white;">시리즈</a></div>
               <div class="box1-3"><a href="twoving.do?command=kind&kind=1" style="white;">영화</a></div>
      		</div>
		
			<div class="box2">
	         	<div class="box2-2"><img src="member/돋보기.png" width="40px" height="40px"  />&nbsp;&nbsp;</div>
	        	 <div class="box2-1"><img src="member/logo.png" width="40px" height="40px"  />&nbsp;&nbsp;</div>
	        </div>
		</div>
		
		 <div class="box22">
	         	<div class="box22-1"><img src="member/logo.png" width="120px" height="120px"  /></div>
	         	<div class="box22-2">
	         		<p style="font-size: 160%; font-weight: bold;">이름 ${loginUser.name}</p>
	         	<img src="member/구름.png" width="30px" height="30px" />&nbsp;나의 이용권 
	         		<c:choose>
	         			<c:when test="${passTicketVO.ptseq == 1}">
	         				&nbsp; 광고형 스탠다드
	         			</c:when>
	         			<c:when test="${passTicketVO.ptseq == 2}">
	         				&nbsp; 베이직
	         			</c:when>
	         			<c:when test="${passTicketVO.ptseq == 3}">
							&nbsp; 스탠다드		
	         			</c:when>
	         			<c:when test="${passTicketVO.ptseq == 4}">
	         				&nbsp; 프리미엄
	         			</c:when>
	         		</c:choose>
	         	&nbsp;&nbsp;
	         	<input type="button" onClick="updateDefuseCheck('${paymentVO.productname}')" value="이용권 구독"   style="background-color: #191919; border-radius: 3px; border:1px solid gray; color: white; cursor: pointer;"/></p></div>
	         
	         	<div class="box22-3" onClick="location.href='twoving.do?command=updateMemberForm'">
	         		<a><img src="member/톱니바퀴.png" width="30px" height="30px" /></a>회원정보 수정
	         	</div>
         </div>
         
         <div class="box44">
      		<div class="box44-2">찜 &nbsp;</div>
      		<div class="box44-3">이용권 내역 &nbsp;</div>
      		<div class="box44-4">문의 내역 &nbsp;</div>
		</div>
		
		
		<div class="passTicketandcash" style="margin-left: -940px;">
			<div class="left">
				<a href=""><span style="color:gray; margin-left: 15px;">이용권</span></a> &nbsp;&nbsp;
			</div>
		</div>
		
		<div class="paymentTable" style="position:absolute; border: 1px solid white; width:100%;">
			<table style="display:flex; flex-direction: column; width: 100%;">
				<tr style="background-color:gray; opacity: 0.3; padding: 15px; width: 100%; color: white;">
					<th style="width: 100%; color:white; font-weight: bold;">상태</th>
					<th style="color:white; font-weight: bold;">상품명</th>
					<th style="color:white; font-weight: bold;">결제금액</th>
					<th style="color:white; font-weight: bold;">결제수단</th>
					<th style="color:white; font-weight: bold;">결제일</th>
					<th style="color:white; font-weight: bold;">이용기간</th>
				</tr>
					<c:forEach items="${passTicket2}" var="payment">
					<tr>
						<td>
							<c:choose>
								<c:when test="${payment.subscribeyn == 'N'}">
									<span style="color:gray; font-weight:bold;">만료</span>
								</c:when>
								<c:otherwise>
									<span style="color:red; font-weight:bold;">구독중</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${payment.subscribeyn == 'Y'}">
									${payment.productname}<br>
									<input type="button" value="변경/해지"  onClick="updateDefuseCheck('${payment.productname}');" style="background-color:black; border: 1px solid gray; color: gray; margin-top: 3px; cursor:pointer;">
								</c:when>
								<c:otherwise>
									${payment.productname}
								</c:otherwise>
							</c:choose>
						</td>
						<td>${payment.paymentprice}</td>
						<td>${payment.paymentmeans}</td>
						<td><fmt:formatDate value="${payment.paymentday}"/></td>
						<td style="color:white;"><fmt:formatDate value="${payment.runperiod1}"/> ~ 
						<c:set var="runPeriod2" value="${payment.runperiod2}" />
							<%
								java.util.Date runPeriod2 = (java.util.Date) pageContext.findAttribute("runPeriod2");
								String nextMonthDate = "N/A";
			                	if (runPeriod2 != null) {
			                    Calendar cal = Calendar.getInstance();
			                    cal.setTime(runPeriod2);
			                    cal.add(Calendar.MONTH, 1);
			                    nextMonthDate = new java.text.SimpleDateFormat("yyyy.M.d").format(cal.getTime());
		             		%>
							<%= nextMonthDate %>
							<% } %>
						</td>
					</tr>
					</c:forEach>
			</table>
			
			<jsp:include page="paging/passTicketPaging2.jsp">
				<jsp:param value="twoving.do?command=passTicketList" name="address"/>
			</jsp:include>
		</div>
         
		</article>
</section>