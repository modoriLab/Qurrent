<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

						
						<c:forEach items="${comment}" var="comment">
						<c:choose>
						<c:when test="${comment.comment_group eq 0}">
						<div class="row noticeView_Comments_1 noticeContent comment_number" id="${comment.comment_num}">
							<div class="col-sm-3">
								<strong id="${comment.comment_num}">${comment.member_name} [${comment.member_id}]</strong><br> ${comment.comment_date}
							</div>
							<div class="col-sm-6 content">${comment.comment_content}</div>
							<div class="col-sm-3">&nbsp;&nbsp;
								<a class="reply"><i class="fa fa-reply"></i>댓글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
								<c:when test="${name eq comment.member_id}">
								<a class="update"><i class="fa fa-pencil" id="${comment.comment_num}"></i>수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="delete" data-toggle="modal" data-target="#DeleteCommentModal" id="${comment.comment_num}"><i class="fa fa-trash-o" id="${comment.comment_num}"></i>삭제</a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
								
							</div>
							
						</div>
						</c:when>
						</c:choose>
						
						<c:forEach items="${commentGroup}" var="commentGroup">
						<c:choose>
						<c:when test="${commentGroup.comment_group eq comment.comment_num}">
						<div class="row noticeView_Comments_2 noticeContent" id="${commentGroup.comment_group}">
							<div class="col-sm-3">
								<strong id="${commentGroup.comment_num}">ㄴ ${commentGroup.member_name} [${commentGroup.member_id}]</strong><br>${commentGroup.comment_date}
							</div>
							<div class="col-sm-6 content">${commentGroup.comment_content}</div>
							<div class="col-sm-3">
								<a class="replyReply"><i class="fa fa-reply"></i>댓글</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<c:choose>
								<c:when test="${name eq commentGroup.member_id}">
								<a class="update"><i class="fa fa-pencil" id="${commentGroup.comment_num}"></i>수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="delete" data-toggle="modal" data-target="#DeleteCommentModal" id="${commentGroup.comment_num}"><i class="fa fa-trash-o" id="${commentGroup.comment_num}"></i>삭제</a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
								</c:choose>
							</div>
						</div>
						</c:when>
						</c:choose>
						</c:forEach>
						</c:forEach>
						

						