<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chap05.oracle.PersonDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개별 회원의 성향 결과</title>

<style type="text/css">

table, th, td {
	border: solid 1px gray;
}

table {
	border-collapse: collapse;
}

table, button {
	margin: 20px;
}

tr.data:hover {
	background-color: blue;
	color: white;
	cursor: pointer;
}

span.colorbox {
	display: inline-block;
	width: 20px; 
	height: 20px;
	margin-left: 10px;
}

div {
	display: inline-block;
	width: 20px; 
	height: 20px;
	margin-left: 10px;
}

</style>

</head>
<body>

	<c:if test="${not empty psdto}">
		<c:set var="title" value="${psdto.name}님의 개인성향 결과" />
		<h2>${title}</h2>	
		<table>
			<tr>
				<td>회원번호</td>
				<td>${psdto.seq}</td>
			</tr>
			<tr>
				<td>성명</td>
				<td>${psdto.name}</td>
			</tr>
			<tr>
				<td>학력</td>
				<td>${psdto.school}</td>
			</tr>
			<tr>
				<td>색상</td>
				<td>${psdto.color}<span class="colorbox"></span></td>
<%-- 			<td>${psdto.color}<div style="background-color: ${psdto.color}"></div></td> --%>
				
			</tr>
			<tr>
				<td>음식</td>
				<td>${psdto.strFood}</td>
			</tr>
			<tr>
				<td>음식이미지파일명</td>
				<td>${psdto.strFoodImgFileName}</td>
			</tr>
			<tr>
				<td>음식이미지</td>
				<td>
					<c:forTokens var="imgfilename" items="${psdto.strFoodImgFileName}" delims="," varStatus="status">
						<img width="153px" height="114px" src="<%= request.getContextPath()%>/chap05_images/${imgfilename}" />
						<c:if test="${status.count % 3 eq 0}">
							<br>
						</c:if>
					</c:forTokens>
				</td>
			</tr>
		</table>
	</c:if>
	
	<c:if test="${empty psdto}">
		<c:set var="title" value="회원이 존재하지 않습니다." />
		<h2>${title}</h2>	
	</c:if>

	<button onclick="location.href='personSelect.do'">모든회원 조회결과 페이지로 이동</button>
	<button onclick="location.href='personUpdate.do?seq=${psdto.seq}'">내정보 수정하기</button>
	
<%-- 	
	<c:if test="${!empty psdto}">
		<h2>${psdto.name}님의 개인성향 결과</h2>
	</c:if>
	<c:if test="${empty psdto}">
		<h2>회원이 존재하지 않습니다.</h2>
	</c:if>
--%>
 
</body>

<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("span.colorbox").css('background-color', '${psdto.color}');
});

</script>

</html>