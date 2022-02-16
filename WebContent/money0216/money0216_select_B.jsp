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
			width: 550px !important;
		}
		
	</style>
	<script>
		function notry() {
			location.href = "/HRD_0216/money0216/money0216_insert.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>회원 매출 정보 조회(회원번호별 집계)</h2>
		<hr>
		<table id="s_table">
			<tr>
				<th width="50">no</th>
				<th width="100">회원번호</th>
				<th width="100">회원이름</th>
				<th width="100">고객등급</th>
				<th width="200">매출</th>
			</tr>
			<%
			int no = 0;
			try{
				String sql = "select a.custno,b.custname,b.grade,sum(a.price) from money0216 a,member0216 b where a.custno=b.custno group by a.custno,b.custname,b.grade order by sum(a.price) desc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String custno = rs.getString(1);
					String custname = rs.getString(2);
					String grade = rs.getString(3);
					String price = rs.getString(4);
					
					%>
					<tr>
						<td><%=no %></td>
						<td><%=custno %></td>
						<td><%=custname %></td>
						<td><%=grade %></td>
						<td><%=price %></td>
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
