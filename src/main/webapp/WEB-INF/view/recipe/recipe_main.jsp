<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../main/top_temp.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 외부 스타일 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<title>아아현 레시피추천</title>

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">

<style type="text/css">
.content_start {
padding: 10px 10px 5px 10px;
}

#main_title {
font-style: normal;
font-weight: bold;
color: #000000;
}

.issue-title {
font-style: normal;
font-size: 0.95vw;
color: #4E4E4E;
padding: 5px 10px 0px 10px;
}

.issue-info {
font-style: normal;
font-size: 0.9vw;
color: #4E4E4E;
padding: 0px 10px 0px 10px;
}

.img1 {
height: 100%;
width:100%;
border-radius: 6px;
}

.img2 {
height: 100%;
width:100%;
border-radius: 6px;
}

.sick_btns {
margin:10px 0px 0px 10px;
}

.news-div {
margin: 25px 10px 0px 10px;
}

#news-one {
margin: 0px 10px 25px 10px;
}

.news-title {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: bold;
font-size: 1.3vw;
color: #4E4E4E;
}

#news-contents {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: normal;
font-size: 0.9vw;
color: #4E4E4E;
}

#news-info {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: normal;
font-size: 0.9vw;
color: #4E4E4E;
}

.single_btn{
background-color: #851BD8;
border: none;
color: #ffffff;
font-size: 12px;
font-weight: bold;
text-align: center;
padding: 7px 15px;
border-radius: 79px;
}
</style>
</head>

<body>
<div class="content_start">
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">오늘의 인기 레시피</div>
			<div class="swiper-container" >
	   			<div class="swiper-wrapper"> <!-- 포이치반복문 들어갈곳 -->
		        	<div class="swiper-slide">
		        		<table>
		        			<tr><td style="text-align: center;"><a href=""><img class="img1" src="<c:url value='/images/testImg.jpg'/>" alt="테스트용" ></a></td></tr>
		        			<tr><th class="issue-title">레시피 제목이 들어갈 자리입니다.</th></tr>
		        			<tr><td class="issue-info">레시피에 대한 내용(조회수)</td></tr>
		        			<tr><td class="issue-info">(조리시간 + 몇인분)</td></tr>
		        		</table>
		            </div>
		            <div class="swiper-slide">
		        		<table>
		        			<tr><td style="text-align: center;"><a href=""><img class="img1" src="<c:url value='/images/testImg.jpg'/>" alt="테스트용" ></a></td></tr>
		        			<tr><th class="issue-title">레시피 제목1</th></tr>
		        			<tr><td class="issue-info">레시피에 대한 내용</td></tr>
		        		</table>
		            </div>
		            <div class="swiper-slide">
		        		<table>
		        			<tr><td style="text-align: center;"><a href=""><img class="img1" src="<c:url value='/images/testImg.jpg'/>" alt="테스트용" ></a></td></tr>
		        			<tr><th class="issue-title">레시피 제목1</th></tr>
		        			<tr><td class="issue-info">레시피에 대한 내용</td></tr>
		        		</table>
		            </div>
		            <div class="swiper-slide">
		        		<table>
		        			<tr><td style="text-align: center;"><a href=""><img class="img1" src="<c:url value='/images/testImg.jpg'/>" alt="테스트용" ></a></td></tr>
		        			<tr><th class="issue-title">레시피 제목1</th></tr>
		        			<tr><td class="issue-info">레시피에 대한 내용</td></tr>
		        		</table>
		            </div>   
		        </div>
				<div class="swiper-button-next"></div>	<!-- 오른쪽 버튼 -->
      			<div class="swiper-button-prev"></div>	<!-- 왼쪽 버튼 --> <br>
      			<div class="swiper-pagination"></div>	<!-- 페이징 -->
   	 		</div>
			<div class="fs-4" id="main_title">질병별 추천레시피</div>
			 	<div class="sick_btns">     
					<c:forEach var="illness" items="${sicks}">
						<button class="single_btn" type="button" onclick="location.href='<c:url value=''>
							<c:param name="sick_code" value="${illness.sick_code}"></c:param></c:url>'" >
							${illness.sick_name}</button>
					</c:forEach>	
				</div>
		    <div class="news-div"> 
		    	<!-- 포이치 들어갈 곳 -->
					<table class="table" id="news-one">
				        		<tr>
				        			<td rowspan="3" style="width:22%; height:100%">
				        				<a href="">
				        				<img class="img2" src="<c:url value='/images/testImg.jpg'/>" alt="테스트용" ></a>
				        			</td>
				            		<th class="news-title" >
				            			레시피 제목입니다
				            		</th>
				            	<tr>
				            		<td class="table-secondary" id="news-contents">
				            			음싱 정보입니다
				            		</td>
				            	</tr>
				            	<tr>
				            		<td class="table-secondary"  id="news-info" >
				            			재료 정보입니다
				            		</td>     
				            	</tr>
				      </table>
			</div>
 		</div>
 		<div class="col-lg-2 col-md-1 col-1"></div>
	</div>
</div>			
   <script>
   new Swiper('.swiper-container', {
      slidesPerView : 4, // 동시에 보여줄 슬라이드 rotn
      spaceBetween : 10, // 슬라이드 간 간격
      slidesPerGroup : 4, // 그룹으로 묶는 개수
      
      // 그룹수가 맞지 않을 경우 빈칸으로 메우기
      loopFillGroupWithBlank : true,
      loop : true, // 무한 반복
      
      pagination : { // 페이징
         el : '.swiper-pagination',
         clickable : true, // 페이징을 클릭하면 해당 영역으로 이동 <- 필요시 지정
      },
      
      navigation : { // 네비게이션
         nextEl : '.swiper-button-next', // 다음 버튼 클래스명
         prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
      },   
   });
   </script>
   
</body>
</html>