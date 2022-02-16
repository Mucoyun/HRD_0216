<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 31 -</title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String custno = request.getParameter("custno");
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindate = request.getParameter("joindate");
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");
		String[] goods = request.getParameterValues("goods");
		String good = "";
		
		for(String g: goods){
			if(g.equals(goods[0])){
				good = g;
			}else{
				good = good + "," + g;
			}
		}
			
		try{
			String sql = "update member0216 set custname=?,phone=?,address=?,joindate=?,grade=?,city=?,goods=? where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(8, custno);
			pstmt.setString(1, custname);
			pstmt.setString(2, phone);
			pstmt.setString(3, address);
			pstmt.setString(4, joindate);
			pstmt.setString(5, grade);
			pstmt.setString(6, city);
			pstmt.setString(7, good);
			pstmt.executeUpdate();
			%><script>
				alert("회원수정이 완료 되었습니다.");
				location.href = "/HRD_0216/member0216/member0216_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>
