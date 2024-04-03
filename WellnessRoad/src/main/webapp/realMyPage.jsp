<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지</title>

    <style>
     #wrap{
        width: 400px;
        margin: auto;
        text-align: center;
     }   

     .inputBox{
        width: 400px;
        height:50px;
        border-radius: 25px;
        border-color: #8b8511;
    }

    img{
        width: 100px;
        height: 100px;
    }

    .img{
        border-radius:15%;
        border-color: #50727B;
        border-style: solid;
        border-width: 2px;
       
    }
    .button{
        width: 200px;
        height: 50px;
        border-radius: 25px;
        background-color: #78A083;
        line-height: 50px;
        text-align: center;
        margin: auto;
        border-style: none;
        cursor: pointer;
        font-size: 16px;
    }

    .button:hover{
        background-color: #35374B;
    }

    </style>

    <script src="assets/js/jquery.min.js"></script>

</head>
<body>
	<%
		MembersDTO mem_info = (MembersDTO)session.getAttribute("mem_info");
	%>
    

<form action="UpdateService">
    <div id="wrap">

        <h2>회원 정보 수정</h2>
        <div><img src="./profile.png" class="img"></div><br>
        <h4><div id="profile"><%=mem_info.getMem_id() %>님 환영합니다.</div></h4>
        <hr>
        <h4><div id="aa">닉네임: <%=mem_info.getMem_nick() %></div></h4>
        <hr>
        <h4><div id="bb">이메일: <%=mem_info.getMem_email() %></div></h4>
        <hr>
                
        <div id="inputBox">

            <input type="text" name="p_mem_pw" class="inputBox" placeholder="기존 비밀번호를 입력하세요"><br><br>
            <input type="text"  id="n_mem_pw" name="n_mem_pw" class="inputBox"  oninput="pwCheck()" placeholder="새로운 비밀번호를 입력하세요"><br><br>
            <input type="text" id="n_mem_pw_Check" name="n_mem_pw_Check" class="inputBox"  oninput="pwCheck()" placeholder="비밀번호를 확인하세요"><br><br>
            <span id="pwConfirm"></span>
            <br>
            <input type="submit" class="button" value="변경하기"><br><br>
            <div class="button">되돌아가기</div><br>

        </div> 

    </div>
 </form>  
    
  <script>
 
$(document).ready(function(){
	$('form').submit(function(e){
		e.preventDefault();
		
		var currentPassword = $('input[name="p_mem_pw"]').val();
		
		$.ajax({
			url: 'CheckPasswordService',
			method:	'POST',
			data: {currentPassword: currentPassword},
			success: function(response){
				if(response === "success"){
					$('form').unbind('submit').submit();
				}else{
					alert("기존 비밀번호가 올바르지 않습니다.")	;
				}
				
			},
			error: function(xhr, status, error){
				consoel.error(xhr.responseText);
			}
			
			
		});//ajax
		
		
		
	});//subfunc
});//readyfunc
  
  
  
  
  
  
  
  
  
  function pwCheck(){
		if($('#n_mem_pw').val()==$('#n_mem_pw_Check').val()){
			$('#pwConfirm').text("비밀번호가 일치합니다").css('color','green')
		}else{
			$('#pwConfirm').text('비밀번호가 일치하지 않습니다.').css('color','red')			
		}
	}
  
  
  
  
  
  
  
  
  
  
  
  </script> 
    
    
</body>
</html>