<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--sidebar start  -->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <!-- 강사  -->
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/teacher/teacherMain.do">
              <i class="fa fa-calendar"></i>
              <span>공지사항 & 시험일정</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/teacher/studentInfo.do">
              <i class="fa fa-book"></i>
              <span>학생 & 성적관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/teacher/questionManagement.do">
              <i class="fa fa-pencil"></i>
              <span>문제 관리</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/teacher/examManagement.do">
              <i class="fa fa-file-text-o"></i>
              <span>시험 관리</span>
              </a>
          </li>  
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/teacher/apiInfo.do">
              <i class="fa fa-calendar"></i>
              <span>자격증 시험 일정</span>
              </a>
          </li>
          <!-- 강사 end -->
         </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
<!--sidebar end-->