<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../main/top_temp.jsp"%>

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

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/all.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">

<script language="javascript">
	function checkAll() {
	    if (!checkExistData(form.member_name.value, "이름")) {
	        return false;
	    }
	    if (!checkPassword(form.member_pw.value, form.member_pw2.value)) {
	        return false;
	    }
	    if (!checkMail(form.member_id.value)) {
	        return false;
	    }
	    if (!checkExistData(form.member_nickName.value, "닉네임")) {
	        return false;
	    }
	    if (!checkExistData(form.member_birth.value, "생일")) {
	        return false;
	    }
	    if (!checkExistData(form.member_phone, "전화번호")) {
	        return false;
	    }
	    if (!checkIntro()) {
	        return false;
	    }
	
	    return true;
	}

	function checkMail(mail) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(mail, "이메일을"))
            return false;
 
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(mail)) {
            alert("이메일 형식이 올바르지 않습니다!");
            form.mail.value = "";
            form.mail.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }

	function checkExistData(value, dataName) {
    	if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }

	function checkPassword(password1, password2){

		if (!checkExistData(password1, "비밀번호를"))
            return false;
        //비밀번호 확인이 입력되었는지 확인하기
        if (!checkExistData(password2, "비밀번호 확인을"))
            return false;
	
		var pw = password1;

			
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,32}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		 
		if(false === reg.test(pw)) {
			alert('비밀번호는 8자 이상 32자 이하 이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			form.member_pw.focus();
			return false;
		}else if(/(\w)\1\1\1/.test(pw)){
		 	alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			form.member_pw.focus();
		 	return false;
		 }else if(pw.search(/\s/) != -1){
		 	alert("비밀번호는 공백 없이 입력해주세요.");
			form.member_pw.focus();
		 	return false;
		 }else if(hangulcheck.test(pw)){
			 alert("비밀번호에 한글을 사용 할 수 없습니다.");
			form.member_pw.focus();
			return false; 
		 }else if(!checkIt(password1, password2)){
		 	return false;
		 }else{
			return true;
		}
		return true;
	}
	
	function checkIt(password1, password2){
		
		if (password1 != password2) {
			alert("비밀번호가 일치하지 않습니다");
			return false;
		}
		if(form.member_pw.value.length <8 || form.member_pw.value.length > 32){
			alert("비밀번호를 8~32자 사이로 입력하세요");
			return false;
		}
		
		return true;
	}
</script>
<title>회원정보 수정</title>  
</head>

<body>
<!-- 카카오, 네이버 연동 추가해야함  -->
<div class = "content">
<div class="col-md-12">
	<h2 class="mb-3">회원 정보 수정 </h2>
	
	
	<form class="needs-validation" name="form" method="POST" action="<c:url value='/member/my/update.do' />" enctype="multipart/form-data" novalidate>
	<div class="row">
	<h6 class="hr_write">나의 정보</h6>
	<p/>
	<p/>
	
	<img src="<c:url value='${me.member_image}'/>" class="img-fluid" alt="내  이미지"/>
	<div class="col-sm-12">
              <label for="name" class="form-label">이름</label>
              <input class="form-control" type="text" name="member_name" value="${me.member_name}" readonly>
          
    </div>
    <p/>
    <div class="col-sm-12">
              <label for="name" class="form-label">아이디(이메일)</label>
              <input class="form-control" type="email" name="member_id" readonly value="${me.member_id}" readonly>           
    </div>
    
    <p/>
    	 <div class="mb-3 row">
    	  <label for="nickname" class="col-sm-2 col-form-label">닉네임</label>
   		 <div class="col-sm-8">
              <input type="text" class="form-control"  name="member_nickName" id="nickName" value="${me.member_nickName}" placeholder="닉네임" required>
              <div class="invalid-feedback">
              	닉네임을 입력해주세요
              </div>
         </div>
         <div class="col-sm-2">
   			 <input type="button" class="w-100 btn sm-2 text-white" style="background-color: #851BD8;" onclick="<c:url value='/member/checkNickName' /> " value="중복확인" > 
					 <input type="hidden" name="idDulipcate" value="idDulipcate"> 
		 </div>
		 </div>
		 <p/>
		 
		 <div class="mb-3 row">
   			 <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
   			 <div class="col-sm-10">
    		  <input type="password" name="member_pw"  class="form-control" placeholder="영문 대문자/소문자/숫자/특수문자 모두 조합, 8자 ~ 32자" value="${me.member_pw}" id="inputPassword" required>
    		   <i class="fa fa-eye fa-lg"></i>
  			 </div>
		  </div>
		  <p/>
		  <div class="mb-3 row">
   			 <label for="inputPassword2" class="col-sm-2 col-form-label">비밀번호 확인 </label>
   			 <div class="col-sm-10">
    		  <input type="password" name="member_pw2"  class="form-control" placeholder="비밀번호 확인" id="inputPassword2" required>
    		   <i class="fa fa-eye fa-lg"></i>
  			  </div>
		  </div>
    	  <p/>
    	  
    	  <div class="mb-3 row">
   			 <label for="phone" class="col-sm-2 col-form-label">휴대전화 번호 </label>
   			 <div class="col-sm-10">
    		  <input type="text" name="member_phone"  class="form-control" value="${me.member_phone}" placeholder="휴대폰(-없이 숫자만 입력)" id="phone" value="" required>
  			  </div>
		  </div>
		  
		  <div class="mb-3 row">
   			 <label for="birthday" class="col-sm-2 col-form-label">생년월일 </label>
   			 <div class="col-sm-10">
    		  <input type="text" name="member_birth"  class="form-control" value="${me.member_birth}" readonly>
  			  </div>
		  </div>
		  
		   <div class="mb-3 row">
   			 <label for="sick" class="col-sm-2 col-form-label">현재 질환 및 관심 질병</label>
   			 <div class="col-sm-10">
    		 <select class="form-select" aria-label="Default select example" name="sick_code">
    		 	<option value="${me.sick_code}" selected>${me.sick_name}</option>
				<c:forEach var="illness" items="${sicks}">
					<option value="${illness.sick_code}">${illness.sick_name}</option>
				</c:forEach>
			 </select>
  			  </div>
		   </div>
		   <hr/>
		   
		   <h6 class="hr_write">추가정보</h6>
		    <p/>
		    <p/>
		    
		    <div class="col-sm-2">
		    <label for="member_sex" class="form-label">성별</label>
		    </div>
		
		<div class="col-sm-10">
			<div class="form-check">
		  <input class="form-check-input" type="radio" name="member_sex" id="flexRadioDefault1"	<c:if test="${me.member_sex == '정보 미제공'}"> checked</c:if>>
		  <label class="form-check-label" for="flexRadioDefault1">
		    정보 미제공
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="member_sex" id="flexRadioDefault2" <c:if test="${me.member_sex == '남자'}">checked</c:if>>
		  <label class="form-check-label" for="flexRadioDefault2">
		   남성
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="member_sex" id="flexRadioDefault3" <c:if test="${me.member_sex == '여자'}">checked</c:if>>
		  <label class="form-check-label" for="flexRadioDefault3">
		   여성
		  </label>
		</div>
		</div>
		
		<div class="mb-3 row">
   			 <label for="allergy" class="col-sm-2 col-form-label">음식 알레르기 </label>
   			 <div class="col-sm-10">
    		  <input type="text" name="member_allergy"  class="form-control" value="${me.member_allergy}" >
  			  </div>
		  </div>
		  
		  <div class="mb-3 row">
   			 <label for="image" class="col-sm-2 col-form-label">사진 등록 </label>
   			 <div class="col-sm-10">
    		  <input type="text" name="member_image"  class="form-control" value="${me.member_image}">
  			  </div>
		  </div>
		<p/>
	</div>	
	<input class="w-100 btn sm-2 text-white" style="background-color: #851BD8;" type="submit" value="정보 업데이트">
	</form>
	</div>
</div>
			
</body>
</html>