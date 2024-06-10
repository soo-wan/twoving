<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Theader.jsp" %>
<br>
<br>
<br>
<section>
	<div class="sub_page">		
		<article>
			<form method="post" name="form" id="form">
				<div id="background" 
				style="background-image: url('image2/${productVO.savefilename}');"></div>
				<div id="container">
					<div id="containerA">
						<div id="title" style="-webkit-text-stroke: 1px black;">${productVO.title}</div>
						<div id="tagtag">
							<div id="tag" style="-webkit-text-stroke: 1px black;">${productVO.age}세 &nbsp; ${productVO.year} &nbsp;${productVO.genre} &nbsp;${productVO.time}</div>
							<div class="share">
								<div class="shareclick"><img src="images/snsicons.png" ></div>
							</div>					
						</div>
							
						<div id="linkicon">
							<div class="a" id="b"><a href="">시청하기</a></div>
							<c:choose>
							<c:when test="${ccc.isEmpty()}">
							<div class="a" id="c"><a href="twoving.do?command=steamedInsert&pseq=${productVO.pseq}&result=Y"><img src = images/emptyheart.png style="width:55px; height:55px;" id="heart"></a><br>찜</div>				
							</c:when>
							<c:otherwise>
							<div class="a" id="c"><a href="twoving.do?command=steamedDelete&pseq=${productVO.pseq}&result=N"><img src = images/redheart.png style="width:55px; height:55px;" id="heart"></a><br>찜</div>
							</c:otherwise>
							</c:choose>
							<%-- <input type="hidden" name="pseq" value="${productVO.pseq}"/> --%>
							
							<div class="a" id="d"><a href="#" ><img src = images/공유.png style="width:55px; height:55px;"></a><br>공유</div>
						</div>
						
						
								
						<div id="content" style="-webkit-text-stroke: 1px black;">${productVO.content}</div>
					</div>
						
					<div id="containerB">							
						<div ><img src="image2/${productVO.savefilename}"></div>		
					</div>								
				</div>														
			</form>	
		</article>
	</div>	
</section>
<%@ include file="Tfooter.jsp" %>