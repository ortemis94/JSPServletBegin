<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 컨텍스트명(context name)을 알아오고자 한다.
    String ctxPath = request.getContextPath();

 // System.out.println("ctxPath => " + ctxPath);
                     // ctxPath => /JSPServletBegin
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인성향 정보 변경 하기</title>

<style type="text/css">
	ul {list-style: none;}
	li {line-height: 200%;}
</style>

<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		// 1. 학력 입력(select)
		$("select#school").val("${psdto.school}");
		
		// 2. 색상 입력(radio)
		$("input:radio[name=color]").each(function(){
			if( $(this).prop("value") == "${psdto.color}") {
				$(this).prop("checked", true);
				return false;
			}
		});
		
		// 3. 음식 입력(checkbox)
		// alert("${psdto.strFood}"); // 짜장면,짬뽕,탕수육,팔보채
		
		var arrFood = "${psdto.strFood}".split(",");
		
		arrFood.forEach(function(item,index,array){
			// alert(item);  짜장면   짬뽕   탕수육   팔보채 
			
			$("input:checkbox[name=food]").each(function(){
				if($(this).val() == item) {
					$(this).prop("checked",true);
					return false;
				}
			});
		});
		
	}); // end of $(document).ready()----------------------------------
	
</script>

</head>
<body>

<form name="memberFrm" action="<%= ctxPath%>/personUpdate.do" method="post">

	<fieldset>
		<legend>${psdto.name}님의 개인성향 정보 변경 하기</legend>
		<ul>
			<li>
				<label for="name">성명</label>
				<input type="text" name="name" id="name" value="${psdto.name}"/> 
				<input type="hidden" name="seq" value="${psdto.seq}"/>
			</li>
			<li>
				<label for="school">학력</label>
				<select name="school" id="school">
					<option value="고졸">고졸</option>
					<option value="초대졸">초대졸</option>
					<option value="대졸">대졸</option>
					<option value="대학원졸">대학원졸</option>
				</select>
			</li>
			<li>
				<label for="">좋아하는 색상</label>
				<div>
					<label for="red">빨강</label>
					<input type="radio" name="color" id="red" value="red" />
					
					<label for="blue">파랑</label>
					<input type="radio" name="color" id="blue" value="blue" />
					
					<label for="green">초록</label>
					<input type="radio" name="color" id="green" value="green" />
					
					<label for="yellow">노랑</label>
					<input type="radio" name="color" id="yellow" value="yellow" />
				</div>
			</li>
			<li>
				<label for="">좋아하는 음식(다중선택)</label>
				<div>
				    <label for="food1">짜장면</label>
					<input type="checkbox" name="food" id="food1" value="짜장면" />
					&nbsp;
					
					<label for="food2">짬뽕</label>
					<input type="checkbox" name="food" id="food2" value="짬뽕" />
					&nbsp;
					
					<label for="food3">탕수육</label>
					<input type="checkbox" name="food" id="food3" value="탕수육" />
					&nbsp;
					
					<label for="food4">양장피</label>
					<input type="checkbox" name="food" id="food4" value="양장피" />
					&nbsp;
					
					<label for="food5">팔보채</label>
					<input type="checkbox" name="food" id="food5" value="팔보채" />
				</div>
			</li>
			<li>
				<input type="submit" value="수정" />
				<input type="reset" value="취소" />
			</li>
		</ul>
	</fieldset>
</form>

</body>
</html>