<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, chap05.oracle.PersonDTO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인성향 정보 출력 페이지</title>

<style type="text/css">

table, th, td {
	border: solid 1px gray;
}

table {
	border-collapse: collapse;
}

div, button {
	margin: 20px;
}

tr.data:hover {
	background-color: blue;
	color: white;
	cursor: pointer;
}

</style>

</head>
<body>

	<div>
		<h2>개인성향 정보 출력 결과(스크립틀릿으로 작성한 것)</h2>
<%
	List<PersonDTO> personList = (List<PersonDTO>) request.getAttribute("personList");

	if(personList.size() > 0) { %>
		<table>
			<thead>
				<tr>
					<th>성명</th>
					<th>학력</th>
					<th>색상</th>
					<th>음식</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
			<% for(PersonDTO ps : personList){ %>
				<tr class="data">
					<td><%= ps.getName() %></td>
					<td><%= ps.getSchool() %></td>
					<td><%= ps.getColor() %></td>
					<td><%= ps.getStrFood() %></td>
					<td><%= ps.getRegisterday() %></td>
				</tr>
			<%} %>
			</tbody>
		</table>
<% 	}else{ %>
		<span style="color: red;">데이터가 존재하지 않습니다.</span>
<%	} %>		
	</div>


	<div>
		<h2>개인성향 정보 출력 결과(JSTL로 작성한 것)</h2>

		<table>
			<thead>
				<tr>
					<th>성명</th>
					<th>학력</th>
					<th>색상</th>
					<th>음식</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="psdto" items="${requestScope.personList}">
				<tr class="data">
					<td><span>${psdto.seq}</span>${psdto.name}</td>
					<td>${psdto.school}</td>
					<td>${psdto.color}</td>
					<td>${psdto.strFood}</td>
					<td>${psdto.registerday}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	
	<button onclick="javascript:location.href='personRegister.do'">입력페이지로 돌아가기1</button>
	<button onclick="javascript:location.href='<%= request.getContextPath()%>/personRegister.do'">입력페이지로 돌아가기2</button>

</body>

<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		$("span").hide();
		
		$("tr.data").click(function(event) {
			var $target = $(event.target); // <td>태그이다.
		//	var seq = $target.find("span").text(); // 클릭한 곳의 내부에서 span태그를 찾기 때문에 name이 들어있는 td태그를 선택할 때만 seq가 정상적으로 alert됨.
			var seq = $target.parent().find("span").text(); // 클릭한 곳에서 부모태그로 올라간 후, 내부에서 span 태그를 찾는다.
		//  alert(seq);
			
			location.href="personDetail.do?seq="+seq;
		});
		
		
	});

</script>

</html>