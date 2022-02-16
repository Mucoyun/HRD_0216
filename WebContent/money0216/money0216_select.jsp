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
			width: 350px !important;
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
				<th width="100">상품코드</th>
				<th width="100">상품명</th>
				<th width="200">매출</th>
			</tr>
			<%
			int no = 0;
			try{
				String sql = "select a.pcode,a.pname,sum(b.price) from product0216 a,money0216 b where a.pcode=b.pcode group by a.pcode,a.pname order by a.pcode asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String pcode = rs.getString(1);
					String pname = rs.getString(2);
					String price = rs.getString(3);
					
					%>
					<tr>
						<td><%=no %></td>
						<td><%=pcode %></td>
						<td><%=pname %></td>
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
