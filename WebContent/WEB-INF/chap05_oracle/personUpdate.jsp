<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<% 
	String ctxPath = request.getContextPath();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인성향 수정 페이지</title>

<style type="text/css">
	ul {list-style: none;}
	li {line-height: 200%;}
</style>

</head>
<body>

	<c:if test="${not empty psdto}">
		<form name="memberFrm" action="<%= ctxPath%>/personUpdate.do?seq=${psdto.seq}" method="post"> <!-- action으로 폼을 보내면서 url에 seq를 넣어 보냄. -->
			<fieldset>
				<legend>${psdto.name}님의 개인성향 정보 수정하기 테스트</legend>
				<ul>
					<li>
						<label for="name">성명</label>
						<input type="text" name="name" id="name" value="${psdto.name}"/>
						<input type="hidden" name="seq" value="${psdto.seq}"/> <!-- action으로 폼으로 보내면서 사용자는 보이지 않도록 seq를 심어서 보내는 것. --> 
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
						<input type="submit" value="전송" />
						<input type="reset" value="취소" />
					</li>
				</ul>
			</fieldset>
		</form>
	</c:if>

	<c:if test="${empty psdto}">
		<c:set var="title" value="회원이 존재하지 않습니다." />
		<h2>${title}</h2>	
	</c:if>

</body>

<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		
		// == 기존에 저장되어있던 학력을 표시하기. ==
		$("select[name=school]").val("${psdto.school}");
		
		// == 기존에 저장되어있던 색상을 표시하기. ==
		$("input:radio[name=color]:radio[value='${psdto.color}']").prop("checked", true);  
		/* 이 방식도 가능
		$("input:radio[name=color]").each(function(){
			if( $(this).prop("value") == "${psdto.color}") {
				$(this).prop("checked", true);
				return false;
			}
		}); */
		
		
		// 기존에 저장되어있던 음식을 표시하기. ==
		var arrFood = "${psdto.strFood}".split(", "); // String으로 저장되어진 음식들을 ", "를 구분자로 잘라내어 arrFood 배열에 저장. 
		
		$("input:checkbox[name=food]").each(function(index, item) { // 체크박스를 모두 하나씩 돌려보며
			for (var i = 0; i < arrFood.length; i++) {				// 배열에 저장되어진 음식들과 비교하고 
				if (arrFood[i] == $(this).val()) {					// 만약 배열에 저장된 음식과 동일한 값의 체크박스가 나오면 
					$(this).prop("checked", true);					// 해당 체크박스를 체크하고
					break;											// 다음 체크박스로 넘어간다.
				}
			}
		});
		/* 이 방식도 가능
		arrFood.forEach(function(item,index,array){
			// alert(item);  짜장면   짬뽕   탕수육   팔보채 
			
			$("input:checkbox[name=food]").each(function(){
				if($(this).val() == item) {
					$(this).prop("checked",true);
					return false;
				}
			});
		});
		*/
		
	});// end of $(document).ready(function() {});--------------------------------------

</script>
</html>