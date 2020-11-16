<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- prefix="fn" ==> function -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송되어져 온 주민번호를 가지고 성별을 파악한 결과물 출력해주기</title>
</head>
<body>

	<c:set var="jubun" value="${param.jubun}" />
	<c:set var="len" value="${ fn:length(jubun) }" /> <!-- fn:length()문자열의 길이를 계산하는 함수 -->
	<c:set var="genderno" value="${ fn:substring(jubun, 6, 7) }" /> <!-- fn:substring()문자열에서 특정 인덱스의 문자열를 꺼내주는 함수 -->
	
	주민번호 : ${jubun} <br>
	주민번호 문자열 길이 : ${len} <br> 
	성별을 나타내어주는 숫자 : ${genderno} <br><br>
	
	<c:if test="${ len eq 0 }"> <!-- 입력한 주민번호의 길이가 0일 때 -->
		<span style="color: red;">주민번호를 입력하지 않으셨습니다!!</span> <br>
	</c:if>

	<c:if test="${ len ne 0 and len ne 13}"> <!-- 입력한 주민번호의 길이가 0도 아니고 13도 아닐 때 -->
		<span style="color: blue;">주민번호의 길이가 맞지 않습니다!!</span> <br>
	</c:if>
	
	<c:if test="${ len eq 13 }"> <!-- 입력한 주민번호가 13일 때  -->
		<c:choose> <%-- <c:when>태그들을 감싸는 태그 --%>
 			<c:when test="${ genderno eq '2' }"> <!-- 자바의 if문. 이 when문이 해당되면 안에 있는 코드를 실행하고 탈출. 이 when문이 해당되지 않는다면 다음 when태그로 내려감. -->
				1900년대생 여자입니다.
			</c:when>
	
			<c:when test="${ genderno eq '4' }"> <!-- 자바의 else if문. 이 when문이 해당되면 안에 있는 코드를 실행하고 탈출. 이 when문이 해당되지 않는다면 다음 when태그로 내려감. -->
				2000년대생 여자입니다.
			</c:when>
			
			<c:otherwise> <!-- 자바의 else문. 위의 모든 when태그가 해당되지 않았다면 이 안에 있는 코드를 실행하고 탈출. -->
				남자입니다.
			</c:otherwise>
		</c:choose>

		<br><br>
		
		<c:choose> 
 			<c:when test="${ genderno eq '1' or genderno eq '3' }"> <!-- or로도 표현 가능. -->
				남자입니다.
			</c:when>
	
			<c:otherwise> 
				여자입니다.
			</c:otherwise>
		</c:choose>
		
	</c:if>

</body>
</html>