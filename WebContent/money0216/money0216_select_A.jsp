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
			width: 850px !important;
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
	<%
		int no = 0;
		try{
			String sql = "select count(*) from money0216";
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
		<h2>회원 매출 정보 목록</h2>
		<p>총 <%=no %>건의 매출정보가 있습니다.</p><hr>
		<table id="s_table">
			<tr>
				<th width="50">no</th>
				<th width="100">회원번호</th>
				<th width="100">회원이름</th>
				<th width="100">판매번호</th>
				<th width="100">단가</th>
				<th width="100">수량</th>
				<th width="100">가격</th>
				<th width="100">상품코드</th>
				<th width="100">판매일자</th>
			</tr>
			<%
			
			no = 0;
			try{
				String sql = "select a.custno,b.custname,a.saleno,a.pcost,a.amount,a.price,c.pname,to_char(a.sdate,'yyyy-mm-dd') from money0216 a,member0216 b,product0216 c where a.custno=b.custno and a.pcode=c.pcode order by a.custno asc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					no++;
					String custno = rs.getString(1);
					String custname = rs.getString(2);
					String saleno = rs.getString(3);
					String pcost = rs.getString(4);
					String amount = rs.getString(5);
					String price = rs.getString(6);
					String pname = rs.getString(7);
					String sdate = rs.getString(8);
					
					%>
					<tr>
						<td><%=no %></td>
						<td><%=custno %></td>
						<td><%=custname %></td>
						<td><%=saleno %></td>
						<td><%=pcost %></td>
						<td><%=amount %></td>
						<td><%=price %></td>
						<td><%=pname %></td>
						<td><%=sdate %></td>
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
