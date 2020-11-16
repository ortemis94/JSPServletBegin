<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- ==== JSTL(JSP Standard Tag Library) 사용하기 ==== --%>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
    fmt 태그는 Formatting 태그로 포맷에 관련된 태그입니다.
         참조사이트  https://sinna94.tistory.com/11
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자열로 되어진 숫자를 누적한 결과값(자동형변환, 형변환) 나타내기 및 정수로 되어진 데이터를 세자리마다 콤마를 찍어서 나타내어주기</title>
</head>
<body>

	<h2>문자열로 되어진 숫자를 누적한 결과값(자동형변환, 형변환) 나타내기(JSTL을 사용한 것)</h2>
	
	<c:set var="sum" value="0" /> <!-- 변수 sum을 선언하고 "0"값을 넣어줌. -->
	<c:if test="${not empty pointArr1}">
		<ul>
			<c:forEach var="point" items="${pointArr1}">
				<li>${point}</li>
				<c:set var="sum" value="${ sum + point }"/> <!-- sum의 초기값 "0"에 point를 차례로 더해줌. 배열에 있는 값들이 문자열이었으므로 문자열 결합이 되어야하는데 모양이 숫자인 경우, JSTL이 자동으로 형변환하여 숫자합으로 실행해줌. -->
															<!-- 만일 pointArr1 배열에 실제 문자열인 "abc"같은 문자가 섞여 있으면 문자열 결합이 되는 것이 아닌 형식오류(NumberFormatException)가 생김. -->	
			</c:forEach>
		</ul>
		pointArr1 누적의 합계 : ${sum}
	</c:if>
	
	<br>
	<hr style="border: solid 1px orange;">	
	<br>
	
	<h2>문자열로 되어진 숫자를 정수로 형변환하여 누적한 결과값 나타내기(JSTL을 사용한 것)</h2>
	
	<c:set var="sum" value="0" /> <!-- 변수 sum을 선언하고 "0"값을 넣어줌. -->
	<c:if test="${not empty pointArr1}">
		<ul style="list-style-type: circle;">
			<c:forEach var="point" items="${pointArr1}">
				<li>
					<fmt:parseNumber var="pointInt" value="${point}" integerOnly="true"/>
					<%-- fmt:parseNumber 은 문자열을 숫자형식으로 형변환 시키는 것이다.
                    	 integerOnly="true" 은 소수점은 절삭해버리고 정수만 취해오는 것이다.
						  정수만 취해온 값을 변수 pointInt 에 넣어줌.
               		--%>
					${pointInt}
				</li>
				<c:set var="sum" value="${ sum + pointInt }"/> <!-- sum의 초기값 "0"에 pointInt를 더해줌.-->
			</c:forEach>
		</ul>
		pointArr1 누적의 합계 : ${sum}
	</c:if>
	
	<br>
	<hr style="border: solid 1px orange;">	
	<br>
	
	<h2>forEach를 사용하면서 index 번호를 나타내기</h2>
	
	<c:if test="${not empty pointArr1}">
		<ul>
			<c:forEach var="point" items="${pointArr1}" varStatus="status">
				<li>${point}&nbsp;(인덱스번호 &nbsp; ${status.index})</li>
				<%-- ${status.index}는 0부터 시작한다. --%>
			</c:forEach>
		</ul>
	</c:if>
	
	<br>
	<hr style="border: solid 1px orange;">	
	<br>
	
	<h2>forEach를 사용하면서 순서번호를 나타내기</h2>
	
	<c:if test="${not empty pointArr1}">
		<ul>
			<c:forEach var="point" items="${pointArr1}" varStatus="status">
				<li>${point}&nbsp;(순서번호 &nbsp; ${status.count})</li>
				<%-- ${status.count}는 1부터 시작한다. --%>
			</c:forEach>
		</ul>
	</c:if>
	
	<br>
	<hr style="border: solid 1px blue;">	
	<br>
	
	<h2>정수로 되어진 데이터를 세자리마다 콤마를 찍어서 나타내어주기(JSTL을 사용한 것)</h2>
	
	<c:set var="sum" value="0" /> 
	<c:if test="${not empty priceArr}">
		<ul>
			<c:forEach var="price" items="${priceArr}">
				<li><fmt:formatNumber value="${price}" pattern="#,###" /></li>
				<c:set var="sum" value="${ sum + price }"/> 
			</c:forEach>
		</ul>
		priceArr 누적의 합계 : <fmt:formatNumber value="${sum}" pattern="#,###" />
	</c:if>
	
</body>
</html>