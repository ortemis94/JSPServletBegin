<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form 태그를 사용한 데이터 전송시 useBean을 사용한 결과 보여주기</title>
</head>
<body>
	<%-- request.getParameter 대신 ${param.}으로도 가능 --%>
	<jsp:useBean id="psdto" class="chap03.PersonDTO" /><!-- Bean ==> 객체 -->
	<%--
	<jsp:setProperty property="name" name="psdto" value="${param.name}" />  
	<jsp:setProperty property="school" name="psdto" value="${param.school}" />
	<jsp:setProperty property="color" name="psdto" value="${param.color}" />
	<jsp:setProperty property="food" name="psdto" value="${paramValues.food}" /> <!-- 배열을 받아올 때에는 paramValues로 넣어야함 -->
	--%>
	<jsp:setProperty property="*" name="psdto"/> <!-- setter 이름과 DTO의 멤버변수 이름이 동일하다면 *로 대체할 수 있음. 이렇게 생성하면 한줄만 넣어도 객체 set이 끝남. -->
	<h2>개인성향 입력 결과 정보(JSP 표준액션 중 useBean을 사용한 것)</h2>
	
	<ul>
		<li>성명 : <jsp:getProperty property="name" name="psdto"/></li>
		<li>학력 : <jsp:getProperty property="school" name="psdto"/></li>
		<li>색상 : <jsp:getProperty property="color" name="psdto"/></li>
 		<li>음식 : <jsp:getProperty property="strFood" name="psdto"/></li> 
	</ul>

</body>
</html>