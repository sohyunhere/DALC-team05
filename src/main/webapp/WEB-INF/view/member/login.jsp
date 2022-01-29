<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel=stylesheet href="<c:url value='/css/login.css'/>" type="text/css">
<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
<title>로그인</title> <!-- 소셜로그인 연동 JS 코드필요  -->
</head>

<body>	
	<div class="main-container">
		<div class = "main-wrap">
			<header>
				<div class="logo-wrap">
					현대인의 간편한 건강 관리, <br>
					<img src = "" alt="바쁘다 바빠 현대사회 로고">
				</div>
			</header>
			<section class="login-input-section-wrap">
				<form name="form" method="POST" action="<c:url value='/member/login.do' />" enctype="multipart/form-data">
					<div class="login-input-wrap">
						<input type="text" name="member_id" placeholder="아이디" required="required">
					</div>
					<div class="login-input-wrap password-wrap">
						<input type="text" name="member_pw" placeholder="비밀번호" required="required">
					</div>
					<div class="login-button-wrap">
						<button> 로그인 </button>
					</div>
					<div class="login-stay-sign-in">
						<input type="checkbox"> <!-- class="far fa-check-circle" -->
						<span>자동 로그인</span>
					</div>
				</form>
			</section>
			<section class="Easy-sgin-in-wrap">
				<h2>추후 소셜로그인 자리</h2>
				<p class="forget-msg">
					회원이 아니신가요?   <a href="<c:url value='/main/join'/>"> 회원가입 </a>
				</p>
			</section>
		</div>
	</div>

</body>
</html>