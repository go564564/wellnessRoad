<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Main.css" />
</head>
<body>
	<div id="container">
        
        <%
        MembersDTO mem_info = (MembersDTO)session.getAttribute("mem_info");
        %>
        
        <header>
            <div></div>
            <div id="menu">
                <div id="leftMenu">
                    <a href=""><img src="./img/logo.png" id="logoImg"></a>
                    <div>여행계획하기</div>
                    <div>게시판</div>
                </div>
                <div id="rightMenu">
                    <%
                    if(mem_info == null){
                    %>
                    <div onclick="location.href='Login.jsp';">로그인</div>
                    <div onclick="location.href='register.jsp'">회원가입</div>
                   <%}else{ %>
                   <div>마이페이지</div>
                   <div onclick="location.href='LogoutService';">로그아웃</div>
                    <%} %>
                </div>

            </div>
            <div id="logo">
                <h1>Wellness</h1>
                <h3>Trip Planner</h3>                
            </div>
        </header>
        <main>
            <div>
                <img src="./img/main_sample2.jpg">
            </div> 
        </main>
        <footer>
            <div>
                <h4>Wellness Road</h4>
                <h5>건강한 전남여행</h5>
                <h5>행복한 전남여행</h5>
                <h5>즐거운 전남여행</h5>
            </div>
        </footer>
    </div>
	


	



	
	
</body>
</html>