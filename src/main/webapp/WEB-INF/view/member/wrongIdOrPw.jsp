<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title> <!-- 소셜로그인 연동 JS 코드필요  -->
</head>
<body>
틀린 아이디와 비밀번호입니다. 
	<form name="form" method="POST" action="<c:url value='/member/login.do' />" enctype="multipart/form-data">	
		<div>현대인의 간편한 건강 관리
			<div>이미지
				<div align="center"> <!-- 로그인시, 아이디인지 이메일인지,, -->
					<input type="text" name="member_id" placeholder="아이디" required="required"> <br>
					<input type="text" name="member_pw" placeholder="비밀번호" required="required"> <br>		
					<input type="checkbox">자동로그인
					<input type="button" value="비밀번호 찾기">
					<input type="submit" value="로그인">	
				</div>
			</div>
		</div>				
	</form>
	
	
	<div align="center">
		회원이 아니신가요? <a href="<c:url value='/main/join'/>"> 회원가입 </a>
	</div>

</body>
</html>