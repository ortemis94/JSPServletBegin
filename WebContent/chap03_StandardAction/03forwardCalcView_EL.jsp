<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>계산된 결과값 보여주는 곳</title>
</head>
<body>
<h3>계산된 결과값(EL을 사용한 것)</h3>
	<br><br>
	${firstNum}부터 ${secondNum}까지의 합은?<br> <!-- ${requestScope.firstNum}이지만 requestScope.은 생략 가능!! -->
	결과값 : <span style="color: blue;">${sum}</span>
</body>
</html>