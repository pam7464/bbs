<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("utf-8"); %><!-- 넘어온 한글자료 깨지지 않도록 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 패스워드 변경</title>
</head>
<body>

	<%
	PrintWriter script = response.getWriter();
	
	//로그인상태 확인
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID=(String)session.getAttribute("userID");
	}
	
	// userPassword 초기화하고 request가 존재한다면 userPassword를 셋팅
	String userPassword1 = null;
	if(request.getParameter("userPassword1") != null){
		userPassword1 = request.getParameter("userPassword1");
	}
	String userPassword2 = null;
	if(request.getParameter("userPassword2") != null){
		userPassword2 = request.getParameter("userPassword2");
	}
	String userPassword3 = null;
	if(request.getParameter("userPassword3") != null){
		userPassword3 = request.getParameter("userPassword3");
	}
	
	
	if(userPassword2.equals(userPassword3)){
		//존재하지않는 또는 잘못된 접근처리
		if(userID == null ){
			script.println("<script>");
			script.println("alert('잘못된 접근입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		
		//로그인중일때 로그인방지
		if(userID == null){
			script.println("<script>");
			script.println("alert('회원전용 기능입니다.')");
			script.println("location.href='./main.jsp'");
			script.println("</script>");
		}else{	
			UserDAO userDAO = new UserDAO();
			int result = userDAO.updateUser(userID,userPassword1,userPassword2);
			//탈퇴성공
			if(result == 1){
				script.println("<script>");
				script.println("alert('패스워드 변경 완료')");
				script.println("location.href='./logoutAction.jsp'");
				script.println("</script>");
			}else if(result == -1){
				script.println("<script>");
				script.println("alert('현재 패스워드가 불일치 합니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				script.println("<script>");
				script.println("alert('데이터베이스 오류')");
				script.println("history.back()");
				script.println("</script>");
			}
			
		}
	}else{
		script.println("<script>");
		script.println("alert('패스워드를 확인하세요')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	
	
	
	
	%>

</body>
</html>






