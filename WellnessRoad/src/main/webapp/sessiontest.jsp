<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%int trip_idx = (int)session.getAttribute("trip_idx"); %>

<div><%=trip_idx %></div>

</body>
</html>