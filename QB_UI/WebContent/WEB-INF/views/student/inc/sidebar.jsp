<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--sidebar start  -->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <!-- 학생 -->

          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/student/studentMain.do">
              <i class="fa fa-calendar"></i>
              <span>공지사항 & 시험일정</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/student/gradeManage.do">
              <i class="fa fa-bar-chart-o"></i>
              <span>성적 관리</span>
             </a>
          </li>
          <li class="sub-menu">
		

            <a href="${pageContext.request.contextPath}/student/pastExam.do">
              <i class="fa fa-desktop"></i>
              <span>지난 시험 보기</span>
              </a>
          </li>
		  <li class="sub-menu">
            <a href="${pageContext.request.contextPath}/student/apiInfo.do">
              <i class="fa fa-calendar"></i>
              <span>자격증 시험 일정</span>
              </a>
          </li>
          <!-- 학생 end -->
         </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
<!--sidebar end-->