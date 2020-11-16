<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chap03.MemberDTO"%>
    
<%
	// MemberDTO 객체 생성하기
	MemberDTO mbrdto1 = new MemberDTO(); // 기본생성자로 객체 생성
	mbrdto1.setName("일순신");
	mbrdto1.setJubun("9710201234567");

	String name1 = mbrdto1.getName();
	String jubun1 = mbrdto1.getJubun();
	String gender1 = mbrdto1.getGender();
	int age1 = mbrdto1.getAge(); 

 	
	MemberDTO mbrdto2 = new MemberDTO("이미자", "9203942134567"); // 인자생성자로 객체 생성

	String name2 = mbrdto2.getName();
	String jubun2 = mbrdto2.getJubun();
	String gender2 = mbrdto2.getGender();
	int age2 = mbrdto2.getAge();

	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 표준액션 중 useBean에 대해서 알아봅니다.</title>

<style type="text/css">

div {
	margin: 20px;
}

</style>

</head>
<body>

	<div>
		<h2>스크립틀릿을 사용하여 MemberDTO 클래스의 객체정보 불러오기</h2>
   		<ul>
			<li>성명 : <%=name1 %></li>
			<li>주민번호 : <%=jubun1 %></li>
			<li>성별 : <%=gender1 %></li>
			<li>나이 : <%=age1 %></li>
		</ul>
		
		<br>
		
		<ul>
			<li>성명 : <%=name2 %></li>
			<li>주민번호 : <%=jubun2 %></li>
			<li>성별 : <%=gender2 %></li>
			<li>나이 : <%=age2 %></li>
		</ul> 
	</div>

 	<div>
		<h2>JSP 표준액션 중 useBean을 사용하여 MemberDTO 클래스의 객체정보 불러오기</h2>
		<jsp:useBean id="mbrdto3" class="chap03.MemberDTO" /> <!-- 기본생성자로 객체를 생성한 것과 같음. --> <!-- class는 클래스 이름, id는 객체 이름. -->
		<jsp:setProperty property="name" name="mbrdto3" value="엄정화"/> <!-- name은 객체 이름, property는 객체의 setter 이름, value는 해당 멤버변수의 값 -->
		<jsp:setProperty property="jubun" name="mbrdto3" value="8439202172837"/> <!-- MemberDTO클래스에서는 getJubun이지만 get을 생략한 jubun으로 기입하면 알아서 매칭해준다. -->
		
		<ul>
			<li>성명 : <jsp:getProperty property="name" name="mbrdto3"/></li> <!-- property는 getter의 get을 뺀 이름, name은 객체 이름. -->
			<li>주민번호 : <jsp:getProperty property="jubun" name="mbrdto3"/></li> <!-- DTO에서 새로 넣는 함수는 getter의 이름과 같이 넣어야한다. ex)public int getAge() {})------- -->
			<li>성별 : <jsp:getProperty property="gender" name="mbrdto3"/></li> <!-- MemberDTO클래스에서는 getGender이지만 get을 생략한 gender로 기입하면 알아서 매칭해준다. -->
			<li>나이 : <jsp:getProperty property="age" name="mbrdto3"/></li>
		</ul>
	</div> 


</body>
</html>