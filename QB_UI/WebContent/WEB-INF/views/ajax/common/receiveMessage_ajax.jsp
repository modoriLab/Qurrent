<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<se:authorize access="hasRole('ROLE_ADMIN')">
<c:forEach items="${receiveMessage}" var="receiveMessage">
	<c:choose>
		<c:when test="${receiveMessage.message_check == 0}">
			<li>
			<a href='${pageContext.request.contextPath}/admin/myMessage.do'>
			<span class='photo'><img src="${pageContext.request.contextPath}/img/friends/teacher2.jpeg"></span>
			<span class='subject'>
			<span class='from'>${receiveMessage.member_name}</span>
			<span class='time'>${receiveMessage.message_date}</span>
			<span class='message' id='headermessagecontent'>${receiveMessage.message_content}</span>
			</span>
			</a>
			</li>
		</c:when>
	</c:choose>
</c:forEach>
		<li>
		 <a href="${pageContext.request.contextPath}/admin/myMessage.do">모든 쪽지 보기</a>
		 </li>		
</se:authorize>				

<se:authorize access="hasRole('ROLE_TEACHER')">
<c:forEach items="${receiveMessage}" var="receiveMessage">
	<c:choose>
		<c:when test="${receiveMessage.message_check == 0}">
			<li>
			<a href='${pageContext.request.contextPath}/teacher/myMessage.do'>
			<span class='photo'><img src="${pageContext.request.contextPath}/img/friends/student.png"></span>
			<span class='subject'>
			<span class='from'>${receiveMessage.member_name}</span>
			<span class='time'>${receiveMessage.message_date}</span>
			<span class='message' id='headermessagecontent'>${receiveMessage.message_content}</span>
			</span>
			</a>
			</li>
		</c:when>
	</c:choose>
</c:forEach>
		<li>
		 <a href="${pageContext.request.contextPath}/teacher/myMessage.do">모든 쪽지 보기</a>
		 </li>		
</se:authorize>

<se:authorize access="hasRole('ROLE_STUDENT')">
<c:forEach items="${receiveMessage}" var="receiveMessage">
	<c:choose>
		<c:when test="${receiveMessage.message_check == 0}">
			<li>
			<a href='${pageContext.request.contextPath}/student/myMessage.do'>
			<span class='photo'><img src="${pageContext.request.contextPath}/img/friends/teacher2.jpeg"></span>
			<span class='subject'>
			<span class='from'>${receiveMessage.member_name}</span>
			<span class='time'>${receiveMessage.message_date}</span>
			<span class='message' id='headermessagecontent'>${receiveMessage.message_content}</span>
			</span>
			</a>
			</li>
		</c:when>
	</c:choose>
</c:forEach>
		<li>
		 <a href="${pageContext.request.contextPath}/student/myMessage.do">모든 쪽지 보기</a>
		 </li>		
</se:authorize>					

				

				
			