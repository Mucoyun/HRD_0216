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
		String send_custno = request.getParameter("send_custno");
		
		try{
			String sql = "delete from member0216 where custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_custno);
			pstmt.executeUpdate();
			%><script>
				alert("회원삭제가 완료 되었습니다.");
				location.href = "/HRD_0216/member0216/member0216_select.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>
