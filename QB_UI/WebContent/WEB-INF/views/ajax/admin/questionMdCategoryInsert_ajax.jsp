<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach items="${list1}" var="lgCategoryList">
	<option>${lgCategoryList.lg_category_name}</option>
</c:forEach>