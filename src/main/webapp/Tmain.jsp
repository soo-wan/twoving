<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Theader.jsp" %>
<br>
<br>
<br>
<div class="center">
	<div class="left" style="cursor: pointer;" onClick="moveLeft()"><img src="images/화살표2왼.jpg" ></div>
	<div id="img">
			<div class="mainmain" id="mainmain">
				<c:forEach items="${mainList}" var="productVO">
					<a href="twoving.do?command=Tdetail&pseq=${productVO.pseq}"><img src="image2main/${productVO.image}"></a>
				</c:forEach>	
			</div>					
	</div>
	<div class="right" style="cursor: pointer;" onclick="moveRight()"><img src="images/화살표2오.jpg" ></div>	
</div>


<div id="remote">
	<ul>
        <li  id="btn1" ></li>
        <li  id="btn2" ></li>
        <li  id="btn3" ></li>
        <li  id="btn4" ></li>
        <li  id="btn5" ></li>
        <li  id="btn6" ></li>
    </ul>                             
 </div>

<br>
<br>
<br>
<br>

<h2 style="color:white; margin-left:55px;">인기있는 컨텐츠</h2>   


<div class="Bestlist">				
      <c:forEach items="${bestList}"  var="productVO"  varStatus="status"> 
                  <div id="item1">                        
                 	 <a href="twoving.do?command=Tdetail&pseq=${productVO.pseq}">
                     	${status.index+1}<img src="image2/${productVO.savefilename}"/>
                  	 </a>                                          
                  </div>
       </c:forEach>     
</div>


<br>
<br>
<br>
<br>

<h2 style="color:white; margin-left:55px;">새로운 컨텐츠</h2>   
<div class="Newlist">				
      <c:forEach items="${newList}"  var="productVO">
                  <div id="item2">                        
                  	<a href="twoving.do?command=Tdetail&pseq=${productVO.pseq}">
                   		<img src="image2/${productVO.savefilename}" />
                    </a>                                          
                  </div>                 
      </c:forEach>
</div>


<%@ include file="Tfooter.jsp" %>