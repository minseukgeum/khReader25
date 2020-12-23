<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/check.css">

<style>
.outer{
		width: 400px; min-height: 520px; margin-left: auto; margin-right: auto; 
		margin-top:3%; margin-bottom: 3%;
	}
</style>
</head>
<body onload="inputValue();">
	 <form action="<%= request.getContextPath() %>/checkId.me" id="checkIdForm">
		<div class="outer" align="center">
		
			<h3 class="txt_check" align="center">아이디 중복확인</h3>
			<table class="check_put">
					<tr>
						<th class="txt_check_div1" width="100px">아이디</th>
						<td>
							<div class="input_id">
								<input type="text" name="inputId" id="inputId" required="required" placeholder="아이디를 입력하세요">
							</div>
						</td>
					</tr>
			</table>
			
			<br><br>
				
				<input type="submit"  class="btn1" value="중복확인">
	</form>				
			<br><br>
		
			
		<% 
		if(request.getAttribute("result") != null){
			int result = (Integer)request.getAttribute("result");
			if(result > 0){
		%>
				<h2 class="txt_serch_div2" name=findIdResult2 align="center">
				이미 사용중인 아이디입니다.</h2>
		<% 	} else {%>
				<h2 class="txt_serch_div2" name=findIdResult2 align="center">
				사용 가능한 아이디 입니다.</h2>
		<%	}
		}
		%>
		
				
			<div class="BtnDiv" align="center">
				<input type="button"  onclick="usedId();" class="btn3" value="사용하기">
			</div>
		
		</div>
	
	<script>
	
	function inputValue() {
		if('<%= request.getAttribute("checkedId") %>' == 'null'){
			document.getElementById('inputId').value
				= opener.document.SignUpForm.joinMemberid.value;
		} else {
			document.getElementById('inputId').value = "<%= request.getAttribute("checkedId") %>";
		}
	}
	
	function usedId(){
			opener.document.SignUpForm.joinMemberid.value
				=document.getElementById('inputId').value;
			
			self.close();
		}
	
	</script>

</body>
</html>