<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %><!-- 사용자 라이브러리 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바에서 자바스크립트 사용 -->
<% request.setCharacterEncoding("utf-8"); %><!-- 넘어온 한글자료 깨지지 않도록 -->


<!-- class를 자바빈즈 사용함, 이름 id설정한 이름 -->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<!-- 로그인 페이지에서 받아온 userID User.userID에 저장 -->
<jsp:setProperty name="bbs" property="bbsTitle" />
<!-- 로그인 페이지에서 받아온 userPassword User.userPassword에 저장 -->
<jsp:setProperty name="bbs" property="bbsContent" />

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		
		//로그인상태 확인
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID=(String)session.getAttribute("userID");
		}
		
		
		//로그인중이 아닐때
		if(userID == null){
			script.println("<script>");
			script.println("alert('회원만 사용가능합니다')");
			script.println("location.href='./main.jsp'");
			script.println("</script>");
		}
	
		
		
		
		
	%>
</body>
</html>








