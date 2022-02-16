<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 31 -</title>
	<style>
		#iu_table tr{
			height: 30px;
		}#iu_table th{
			width: 200px;
		}#iu_table td{
			width: 600px;
		}
		
		#iu_table input[type="text"]{
			height: 25px;
			width: 400px;
		}#iu_table input[type="date"]{
			height: 25px;
			width: 400px;
		}#iu_table select{
			height: 28px;
			width: 200px;
		}
		
		#btntd{
			text-align: center;	
		}#btntd button{
			height: 25px;
			width: 150px;
		}		
		
	</style>
	<script>
		function gotry() {
			var goods = document.getElementsByName("goods");
			var goodsChk = false;
			for(var i=0; i<goods.length; i++){
				if(goods[i].checked == true){
					goodsChk = true;
					break;
				}
			}
			
			if(document.iu_form.custname.value == ""){
				alert("회원이름을 입력하세요.");
				document.iu_form.custname.focus();
			}else if(document.iu_form.phone.value == ""){
				alert("회원전화를 입력하세요.");
				document.iu_form.phone.focus();
			}else if(document.iu_form.address.value == ""){
				alert("회원주소를 입력하세요.");
				document.iu_form.address.focus();
			}else if(document.iu_form.joindate.value == ""){
				alert("회원일자를 입력하세요.");
				document.iu_form.joindate.focus();
			}else if(document.iu_form.grade.value == ""){
				alert("회원등급을 입력하세요.");
				document.iu_form.grade.focus();
			}else if(document.iu_form.city.value == ""){
				alert("도시코드를 입력하세요.");
				document.iu_form.city.focus();
			}else if(!goodsChk){
				alert("관심상품을 최소 하나 이상 선택하세요.");
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			document.iu_form.reset();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int custno = 0;
		try{
			String sql = "select max(custno) from member0216";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				custno = rs.getInt(1);
				custno++;
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>홈쇼핑 회원 등록 화면</h2><hr>
		<form name="iu_form" method="post" action="member0216_insert_process.jsp">
			<table id="iu_table">
				<tr>
					<th>회원번호(자동생성)</th>
					<td><input type="text" name="custno" value="<%=custno %>" readonly></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="date" name="joindate" value="2022-01-01"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td>
						<select name="grade">
							<option value="A">A:VIP</option>
							<option value="B">B:일반</option>
							<option value="C">C:직원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td>
						<select name="city">
							<option value="01">01:서울</option>
							<option value="02">02:경기</option>
							<option value="10">10:대전</option>
							<option value="20">20:부산</option>
							<option value="30">30:광주</option>
							<option value="40">40:울산</option>
							<option value="50">50:대구</option>
							<option value="60">60:강원</option>
							<option value="70">70:경상</option>
							<option value="80">80:충청</option>
							<option value="90">90:제주</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>관심상품</th>
					<td>
						<input type="checkbox" name="goods" value="의류">의류
						<input type="checkbox" name="goods" value="식료품">식료품
						<input type="checkbox" name="goods" value="컴퓨터">컴퓨터
						<input type="checkbox" name="goods" value="공산품">공산품
						<input type="checkbox" name="goods" value="관광">관광
						<input type="checkbox" name="goods" value="전자제품">전자제품
						<input type="checkbox" name="goods" value="건강제품">건강제품
						<input type="checkbox" name="goods" value="운동기구">운동기구
					</td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">등록</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
			</table>
		</form><hr>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
