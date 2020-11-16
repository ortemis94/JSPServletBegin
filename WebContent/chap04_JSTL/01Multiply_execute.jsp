<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두 개의 수를 입력받아서 곱셈하기</title>
</head>
<body>

	<form name="multiplyFrm">
		첫번째 수 : <input type="number" name="num1" id="num1" />
		두번째 수 : <input type="number" name="num2" id="num2" />
		<br>
		<input type="button" value="확인" />
		<input type="reset" value="취소" />
		
	</form>

</body>

<script type="text/javascript" src="/JSPServletBegin/js/jquery-3.3.1.min.js"></script> <!-- /WebContent는 빼야 함. -->
<script type="text/javascript">

	$(document).ready(function() {
		
		$("input:button[value=확인]").click(function() { 
			
		/*  1.
			var num1Val = $("input:number[name=num1]").val();
			var num2Val = $("input:number[name=num2]").val();
			
			2.
			var num1Val = $("input[name=num1]").val();
			var num2Val = $("input[name=num2]").val();
			
			:선택자에서는 number를 지원하지 않기 때문에 1번의 경우 코드상 오류가 나고 2번의 경우는 정상 실행된다. 
		*/
		 	var num1Val = $("#num1").val();
			var num2Val = $("#num2").val(); 
						
			if (num1Val == "" || num2Val == "") {
				alert("숫자를 입력하세요!!");
				return;
			}
			
			var frm = document.multiplyFrm;
			frm.action = "01Multiply_result.jsp"; // 이동할 경로
			frm.submit();
			
		});// end of $("input:button[value=확인]").click(function() {});--------------------------
		
	});// end of $(document).ready(function() {});----------------------

</script>

</html>