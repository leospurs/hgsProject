<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <c:if test="${type == 1 }">
      <title>공지 게시글</title>
    </c:if>
    <c:if test="${type == 2 }">
      <title>이벤트 게시글</title>
    </c:if>
    <%@ include file="/WEB-INF/views/frame/pageSet.jsp"%>
    <style type="text/css">
      html,
      body {
        margin: 0;
        height: 100%;
        overflow: hidden;
      }
      #container {
        height: 100%;
      }
    </style>
  </head>
  <body>
    <div id="container" class="row">
      <%@ include file="/WEB-INF/views/frame/adminNav.jsp"%>
      <div class="col-md-8" style="margin-top: 50px">
        <c:if test="${type == 1 }">
          <h3>공지 게시글</h3>
        </c:if>
        <c:if test="${type == 2 }">
          <h3>이벤트 게시글</h3>
        </c:if>
        <table class="table">
          <thead>
            <tr>
              <th scope="col">게시글 번호</th>
              <th scope="col">제목</th>
              <th scope="col">작성일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${board.list}" var="b">
              <tr>
                <th scope="row">${b.adminBoardIdx}</th>
                <td>
                  <a
                    href="${pageContext.request.contextPath}/admin/board/detail/${b.adminBoardIdx}"
                    >${b.title}</a
                  >
                </td>
                <td><c:out value="${fn:substring(b.createDate, 0, 10)}" /></td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <!-- 페이징 넘버 영역 -->
        <div
          class="row justify-content-md-center mt-4 bottom"
          style="display: flex; align-items: center; justify-content: center"
        >
          <div class="btn-toolbar" role="toolbar">
            <div class="btn-group mr-2" role="group">
              <c:if test="${board.pagination.preNum>0}">
                <a
                  href="announcement?p=${board.pagination.preNum}"
                  class="btn btn-primary"
                  >이전</a
                >
              </c:if>
              <c:forEach
                begin="${board.pagination.startNum}"
                end="${board.pagination.endNum}"
                var="pnum"
              >
                <a
                  href="announcement?p=${pnum}"
                  class="btn ${board.pageNum eq pnum ? 'btn-dark': 'btn-white'}"
                  >${pnum}</a
                >
              </c:forEach>
              <c:if test="${board.pagination.nextNum>0}">
                <a
                  href="announcement?p=${board.pagination.nextNum}"
                  class="btn btn-primary"
                  >다음</a
                >
              </c:if>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>