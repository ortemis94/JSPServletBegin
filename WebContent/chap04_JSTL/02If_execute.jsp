<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두 개의 문자열을 입력받아서 같은지 다른지 검사하기</title>
</head>
<body>

	<form name="myFrm" action="02If_result.jsp">
		첫번째 입력란 : <input type="text" name="first" />
		두번째 입력란 : <input type="text" name="second" />
		세번째 입력란 : <input type="text" name="third" />
		<br>
		<input type="submit" value="확인" />
		<input type="reset" value="취소" />
		
	</form>

</body>

<script type="text/javascript" src="/JSPServletBegin/js/jquery-3.3.1.min.js"></script> <!-- /WebContent는 빼야 함. -->
<script type="text/javascript">

	$(document).ready(function() {
		
		$("form[name=myFrm]").submit(function() { 
			
		 	var firstVal = $("input:text[name=first]").val().trim();
		 	var secondVal = $("input:text[name=second]").val().trim();
			
			if (firstVal == "" || secondVal == "") {
				alert("문자를 입력하세요!!");
				return false; // submit을 하지 않고 탈출.
			}
			
		});// end of $("form[name=myFrm]").submit(function() {});--------------------------
		
	});// end of $(document).ready(function() {});----------------------

</script>

</html>