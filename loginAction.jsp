<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %><!-- 사용자 라이브러리 -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바에서 자바스크립트 사용 -->
<% request.setCharacterEncoding("utf-8"); %><!-- 넘어온 한글자료 깨지지 않도록 -->


<!-- class를 자바빈즈 사용함, 이름 id설정한 이름 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- 로그인 페이지에서 받아온 userID User.userID에 저장 -->
<jsp:setProperty name="user" property="userID" />
<!-- 로그인 페이지에서 받아온 userPassword User.userPassword에 저장 -->
<jsp:setProperty name="user" property="userPassword" />

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		PrintWriter script = response.getWriter();
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(),user.getUserPassword());
		script.println("<script>");
		if(result == 1){
			script.println("alert('로그인성공')");
		}else if(result == -1) {
			script.println("alert('패스워드를 확인하세요')");
		}else if(result == -2){	
			script.println("alert('아이디를 확인하세요')");
		}else if(result == -3){	
			script.println("alert('데이터베이스 오류')");
		}
		script.println("</script>");
		
	%>
</body>
</html>








