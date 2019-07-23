<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

		<div class="col-lg-2 trd_div">
		<!-- OMR 시작 div -->
		<table class="tg">
			<tr>
				<th class="tg-baqh qname" colspan="6">답안지</th>
			</tr>
			<c:forEach var="question" items="${questionList}">
				<tr>
					<td class="tg-baqh qnumber">
						<div class="wrap">
							<img class="oximg_s_answer"
								id="ans_s_img_ques_${question.exam_question_seq}"
								src="${pageContext.request.contextPath}/img/oximg_s.png">
							<img class="oximg_o_answer"
								id="ans_o_img_ques_${question.exam_question_seq}"
								src="${pageContext.request.contextPath}/img/oximg_o.png">
						</div> ${question.exam_question_seq}
					</td>
					<c:choose>
						<c:when test="${question.question_type eq '객관식'}">
							<c:set var="count" value="0" />
							<c:forEach var="questionChoice" items="${questionChoiceList}"
								varStatus="status">
								<c:if
									test="${questionChoice.question_num eq question.question_num}">
									<td class="tg-baqh answer_choice">
										<div class="wrap">
											<img
												class="answer_oximg_v oximg_v_ques_${question.exam_question_seq}"
												id="ans_img_ques_${question.exam_question_seq}_${questionChoice.question_choice_num}"
												src="${pageContext.request.contextPath}/img/oximg_v.png">
											<img class="answer_oximg_o"
												id="o_ans_img_ques_${question.exam_question_seq}_${questionChoice.question_choice_num}"
												src="${pageContext.request.contextPath}/img/oximg_o.png">
										</div> ${questionChoice.question_choice_num} 
										<c:set var="count" value="${count+1 }" />
									</td>
								</c:if>
							</c:forEach>
							<c:forEach begin="${count}" end="4">
								<td class="tg-baqh qname"></td>
							</c:forEach>
						</c:when>
						<c:when test="${question.question_type eq '단답형'}">
							<td class="tg-baqh answer_choice" colspan="5"><input
								type="text" id="ques_${question.exam_question_seq}_answer"
								readonly></td>
						</c:when>
					</c:choose>
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>
	<!-- omr 끝 -->