<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, String> myMap = (HashMap<String, String>)request.getAttribute("paraMap");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 성향 테스트 결과화면</title>
</head>
<body>
	
	<h2>개인 성향 테스트 결과</h2>
	
	<h3>스크립틀릿을 사용한 것</h3>
	<span style='color: blue; font-weight: bold;'><%= myMap.get("name") %></span>님의 개인 성향은<br/><br/>
	학력은 <%= myMap.get("school") %>이며, <%= myMap.get("color") %>색을 좋아합니다.<br/><br/>
	좋아하는 음식은 <%= myMap.get("foodes") %>입니다.

	<hr style="border: solid 1px red;">
	
	<h3>EL을 사용한 것</h3>
	<span style='color: blue; font-weight: bold;'>${paraMap.name}</span>님의 개인 성향은<br/><br/>
	학력은 ${paraMap.school}이며, ${paraMap.color}색을 좋아합니다.<br/><br/>
	좋아하는 음식은 ${paraMap.foodes}입니다.
	
</body>
</html>