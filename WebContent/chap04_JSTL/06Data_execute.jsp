<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	String myfriends = null; 
//	String myfriends = " "; 
//	String myfriends = ""; 
	String myfriends = "이제훈,고수,강산애,강동원,주원";
	myfriends = (myfriends == null) ? null : myfriends.trim(); // myfriends가 null이라면 그대로 null을 넣고 아니면 myfriends의 좌우 공백을 없애줌.
															   // myfriends가 null일 때 trim()을 하면 NullPointerException이 나기 때문.
	
	String mymembers = "수지,혜리,사나,서지혜,화사";

	String myheowons = "이순신,유관순.강감찬,연개소문/세종대왕";
	
	request.setAttribute("myfriends", myfriends); 
	request.setAttribute("mymembers", mymembers); 
	request.setAttribute("myheowons", myheowons); 
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("06View_result.jsp");
	dispatcher.forward(request, response);
%>