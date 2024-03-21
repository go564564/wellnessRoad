<%@page import="com.smhrd.model.MembersDAO"%>
<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 테스트</h1>


<form action="JoinService" method="post">
<ul>
<li><input type="text" name=mem_id placeholder="아이디 입력"></li>
<li><input type="password" name=mem_pw placeholder="비밀번호 입력"></li>
<li><input type="text" name=mem_nick placeholder="닉네임 입력"></li>
<li><input type="text" name=mem_email placeholder="이메일 입력"></li>
<li><input type="submit"></li>
</ul>


	<% String mem_email = (String)request.getAttribute("mem_email"); %>
	
</form>
	
	





</body>
</html>