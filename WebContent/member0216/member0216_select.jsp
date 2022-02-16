<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 31 -</title>
	<style>
		#s_table tr:FIRST-CHILD{
			height: 40px;
		}
		#s_table tr{
			height: 20px;
		}#s_table td{
			text-align: center;
		}#s_table a{
			color: blue;
			font-weight: bold;
		}#s_table a:HOVER{
			color: red;
			font-weight: bold;
		}
				
		#btn{
			height: 30px;
			width: 150px;
			display: block;
			margin: 20px auto;
			background-color: black;
			color: white;
		}
		p{
			padding : 0 !important;
			display: block;
			margin: 0 auto;
			width: 1400px !important;
		}
		
	</style>
	<script>
		function notry() {
			location.href = "/HRD_0216/member0216/member0216_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int no = 0;
		try{
			String sql = "select count(*) from member0216";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>회원 정보 목록</h2>
		<p>총 <%=no %>명의 회원이 있습니다.</p><hr>
		<table id="s_table">
			<tr>
				<th width="50">no</th>
				<th width="100">회원번호</th>
				<th width="100">회원성명</th>
				<th width="200">전화번호</th>
				<th width="300">주소</th>
				<th width="100">가입일자</th>
				<th width="75">고객등급</th>
				<th width="75">거주지역</th>
				<th width="300">관심상품</th>
				<th width="100">구분</th>
			</tr>
			<%
			
			no = 0;
			try{
				String sql = "select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city,goods from member0216 order by custno asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String custno = rs.getString(1);
					String custname = rs.getString(2);
					String phone = rs.getString(3);
					String address = rs.getString(4);
					String joindate = rs.getString(5);
					String grade = rs.getString(6);
					String city = rs.getString(7);
					String goods = rs.getString(8);
					
					if(grade.equals("A")){ grade = "VIP"; }
					else if(grade.equals("B")){ grade = "일반"; }
					else if(grade.equals("C")){ grade = "직원"; }
					else{ grade=""; }
					
					if(city.equals("01")){ city = "서울"; }
					else if(city.equals("02")){ city = "경기"; }
					else if(city.equals("10")){ city = "대전"; }
					else if(city.equals("20")){ city = "부산"; }
					else if(city.equals("30")){ city = "광주"; }
					else if(city.equals("40")){ city = "울산"; }
					else if(city.equals("50")){ city = "대구"; }
					else if(city.equals("60")){ city = "강원"; }
					else if(city.equals("70")){ city = "경상"; }
					else if(city.equals("80")){ city = "충청"; }
					else if(city.equals("90")){ city = "제주"; }
					else { city = ""; }
					
					%>
					<tr>
						<td><%=no %></td>
						<td><a href="member0216_update.jsp?send_custno=<%=custno%>"><%=custno %></a></td>
						<td><%=custname %></td>
						<td><%=phone %></td>
						<td><%=address %></td>
						<td><%=joindate %></td>
						<td><%=grade %></td>
						<td><%=city %></td>
						<td><%=goods %></td>
						<td>
							<a href="member0216_delete.jsp?send_custno=<%=custno%>"
							onclick="if(!confirm('정말로 삭제하시겠습니까?')){ return false; }">삭제</a>
						</td>
					</tr>
					<%
				}
				
			}catch(SQLException e){
				e.printStackTrace();
			}
			%>
		</table>
		<button id="btn" type="button" onclick="notry()">작성</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
