<%@page import="com.smhrd.model.MembersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wellness trip Planner</title>
<link rel="stylesheet" href="Main.css" />

<!-- Boot strap css 모달창 크기조절필요해서 가져옴 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Data ra -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" href="Main_login.css">

</head>
<body>
	<div id="container">

		<%
		MembersDTO mem_info = (MembersDTO) session.getAttribute("mem_info");
		%>

		<header>
			<div></div>
			<div id="menu">
				<div id="leftMenu">
					<a href=""><img src="./img/logo.png" id="logoImg"></a>



					<!-- 테스트중 -->
					<div class="btn btn-primary" id="makeTrips" data-toggle="modal"
						data-target="#exampleModal">여행 계획하기</div>


					<div onclick="location.href='board_main.jsp'">게시판</div>
				</div>

				<div id="rightMenu">
					<%
					if (mem_info == null) {
					%>
					<div onclick="location.href='Login.jsp';">로그인</div>
					<div onclick="location.href='register.jsp';">회원가입</div>
					<%
					} else {
					%>
					<div>마이페이지</div>
					<div onclick="location.href='LogoutService';">로그아웃</div>
					<%
					}
					%>
				</div>

			</div>
			<div id="logo">
				<h1>Wellness</h1>
				<h3>Trip Planner</h3>
			</div>
		</header>
		<div id="subMenuwrap">

			<%
			if (mem_info == null) {
			%>

			<div>
				<img src="./img/main_sample2.jpg"> <img
					src="./img/고흥 이미지/거금생태숲_1_공공3유형.jpg">
			</div>

			<section id="sec1">

				<div id=whitebox00>어쩌구</div>

			</section>
			<%
			} else {
			%>
			<div id="whiteBox">
				<p>어떤 여행을 계획하고 싶으신가요?</p>
			</div>
			<div id="whiteBox2"></div>
			<div id="whiteBox3">
				<a href="#">여행 계획하기</a>
			</div>
			<%
			}
			%>




		</div>
		<footer>
			<div>
				<h4>Wellness Road</h4>
				<h5>건강한 전남여행</h5>
				<h5>행복한 전남여행</h5>
				<h5>즐거운 전남여행</h5>
			</div>
		</footer>
	</div>








	<!-- 모달창인데 테스트중 -->
	<div class="modal" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document"
			style="width: 800px">


			<div class="modal-content" style="width: 800px">

				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">새로운 일정 만들기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>



				<!-- Modal Body -->
				<div class="modal-body" ; style="width: 800px; overflow-y: auto;">
					<div class="form-group">
						<label for="travelTitle">여행 제목:</label> <input type="text"
							name="trip_name" class="form-control" id="travelTitle">
					</div>
					<div class="form-group">
						<label for="travelPeriod">여행 기간:</label> <input type="text"
							class="form-control" id="travelPeriod">
					</div>
				</div>


				<!-- Modal Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" onclick="saveTrip()">저장</button>
				</div>
			</div>



		</div>
	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"
		defer></script>

	<script type="text/javascript">
  	
 	
 	
 	
 	//근데 이거 넣으면 mem_info 가 있을떄 (로그인 됐을때) 달력이 안뜸
 	// show.bs.modal은 Bootstrap 모달이 열리기직전에 발생하는 이벤트
 	 
 	
 	$('#exampleModal').on('show.bs.modal', function(e){
 		
 		// 여기서 mem_info는 객체로 불러와져서 문자열로 캐스팅해줘야함 - 조건문 비교도 똑같이 'null'로
 		var mem_info = '<%=mem_info%>';
 		if(mem_info=='null'){
 			alert("로그인을 해주세요.");
 			e.preventDefault(); //모달열기 막기
 		}
 	})
 	
    
    
 	
 	$(document).ready(function(){
        $('#travelPeriod').daterangepicker({
        	
        	opens: 'left', // 달력이 왼쪽에서 열립니다.
            locale: {
            	 format: 'YYYY-MM-DD',
                 daysOfWeek: [
                     "일", "월", "화", "수", "목", "금", "토"
                 ],
                 monthNames: [
                     "1월", "2월", "3월", "4월", "5월", "6월",
                     "7월", "8월", "9월", "10월", "11월", "12월"
                 ],
                applyLabel: "저장",
                cancelLabel: '취소' // 선택을 취소하는 레이블을 지정합니다.
            }
        });
    })
    

        
        
        
    
    
    
    
    //날짜값저장/쪼개기/
    function saveTrip(){
    	//Date Range Picker에서 선택한 날짜값 가져와서
    	//쪼개기 split?
    	var travelTitle = $('#travelTitle').val();
    	var selectedDates = $('#travelPeriod').val().split(" - ");
    	var startDate = selectedDates[0];
    	var endDate = selectedDates[1];
    	
    	console.log("시작 날짜 : " + startDate);
    	console.log("끝 날짜 : " + endDate);
     	
    	
    	<%if (mem_info != null) {%>
    	$.ajax({
    		 type: "get",
             url: "CreateTripService",
    		 data: {
    			mem_id: '<%=mem_info.getMem_id()%>'
				,
					travelTitle : travelTitle,
					startDate : startDate,
					endDate : endDate
				},
				success : function(response) {
					console.log("여행일정 저장완료");
				},
				error : function(xhr, status, error) {
					console.error("오류 발생: " + error);
				}

			});
	<%}%>
		}
	</script>









	<!-- Bootstrap JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>