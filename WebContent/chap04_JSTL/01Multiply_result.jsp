<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix="c" ==> custom -->
    
<%-- === 변수의 선언 방법 === --%>    
<c:set var="no1" value="${param.num1}" /> <!-- 이름이 no1인 변수를 선언하고 전 페이지에서 받아온 파라미터값 num1값을 넣어줌. -->    
<c:set var="no2" value="${param.num2}" /> <!-- 이름이 no2인 변수를 선언하고 전 페이지에서 받아온 파라미터값 num2값을 넣어줌. -->    
<c:set var="result" value="${no1 * no2}" /> <!-- 이름이 result인 변수를 선언하고 변수 no1과 no2를 곱한 값을 넣어줌. --> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두 개의 수를 입력받아서 곱셈한 결과 출력하기</title>
</head>
<body>
	${no1}와 ${no2}의 곱은 ${result}입니다. <br><br>
	${param.num1}와 ${param.num2}의 곱은 ${param.num1 * param.num2}입니다.
</body>
</html>