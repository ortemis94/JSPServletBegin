<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ===== JSTL(JSP Standard Tag Library) 사용하기 ===== --%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- prefix="c" ==> custom -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전송되어져 온 값을 if를 사용하여 비교한 결과물 출력하기</title>
</head>
<body>

	<c:if test="${param.first eq param.second}"> <!-- eq는 좌우에 있는 값이 같은지를 말하는 것.(==) -->
		${param.first}와/과 ${param.second}은/는 같습니다.
	</c:if>
	
	<c:if test="${param.first ne param.second}"> <!-- ne는 좌우에 있는 값이 다른지를 말하는 것.(!=) -->
		${param.first}와/과 ${param.second}은/는 같지 않습니다.
	</c:if>

	<hr style="border: solid 1px red;">
	
	<c:if test="${param.first == param.second}"> 
		${param.first}와/과 ${param.second}은/는 같습니다.
	</c:if>
	
	<c:if test="${param.first != param.second}"> 
		${param.first}와/과 ${param.second}은/는 같지 않습니다.
	</c:if>

	<hr style="border: solid 1px red;">

	<c:if test="${empty param.third}">
		세번째 입력란은 입력하지 않으셨습니다.
	</c:if>
	
	<c:if test="${not empty param.third}">
		세번째 입력란을 입력하셨습니다.
	</c:if>

	<c:if test="${!empty param.third}"> <!-- !는 not과 같음. 논리를 부정하는 것. -->
		세번째 입력란을 입력하셨습니다.
	</c:if>
	

</body>
</html>