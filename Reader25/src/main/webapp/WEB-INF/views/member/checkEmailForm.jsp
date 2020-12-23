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
	 <form action="<%= request.getContextPath() %>/checkEmail.me" id="emailCheckFrom">
		<div class="outer" align="center">
		
			<h3 class="txt_check" align="center">이메일 중복확인</h3>
			<table class="check_put">
					<tr>
						<th class="txt_check_div1" width="100px">이메일</th>
						<td>
							<div class="input_id">
								<input type="text" name="inputEmail" id="inputEmail" required="required" placeholder="이메일을 입력하세요">
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
				<h2 class="txt_serch_div2" name=findEmailResult2 align="center">
				이미 사용중인 이메일입니다.</h2>
		<% 	} else {%>
				<h2 class="txt_serch_div2" name=findEmailResult2 align="center">
				사용 가능한 이메일 입니다.</h2>
		<%	}
		}
		%>
		
				
			<div class="BtnDiv" align="center">
				<input type="button"  onclick="usedEmail();" class="btn3" value="사용하기">
			</div>
		
		</div>
	
	<script>
		function inputValue() {
			if('<%= request.getAttribute("checkedEmail") %>' == 'null'){
				document.getElementById('inputEmail').value
					= opener.document.joinForm.joinEmail.value;
			} else {
				document.getElementById('inputEmail').value = "<%= request.getAttribute("checkedEmail") %>";
			}
		}
		
		function usedEmail(){
			opener.document.joinForm.joinEmail.value
				=document.getElementById('inputEmail').value;
			
			self.close();
		}
	</script>

</body>
</html>