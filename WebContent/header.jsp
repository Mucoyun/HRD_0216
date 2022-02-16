<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습 31 -</title>
	<style>
		*{
			margin: 0; padding: 0;
		}html,body{
			width: 100%; height: 100%;
		}a{
			text-decoration: none;
		}table{
			border: 3px solid black;
			border-collapse: collapse;
			margin: 0 auto;
		}tr,th,td{
			border: 1px solid black;
		}th{
			background-color: #EEEEEE;
		}
		
		header{
			width: 100%; height: 10%;
			color: black; background-color: lightgray;
			text-align: center; display: table;
		}header > h1{
			display: table-cell;
			vertical-align: middle;
		}
		
		nav{
			width: 100%; height: 5%;
			color: white; background-color: black;
			text-align: left; display: table;
		}nav > ul{
			display: table-cell;
			vertical-align: middle;
			list-style: none;
		}nav > ul li{
			display: inline-block;
			margin: 0 20px;
			font-size: 1vw;
		}nav > ul li > a{
			color: white;
			font-weight: bold;
		}nav > ul li > a:HOVER{
			color: red;
			font-weight: bold;
		}
		
		section{
			width: 100%; height: 80%;
			color: black; background-color: white;
		}section > h2{
			text-align: center;
			padding: 20px 0;
		}section > p{
			padding-left: 40px;
			font-weight: bold;
		}section > ol{
			padding-left: 40px;	
		}
		
		footer{
			width: 100%; height: 5%;
			color: white; background-color: gray;
			text-align: center; display: table;
		}footer > h3{
			display: table-cell;
			vertical-align: middle;
		}
		
	</style>
</head>
<body>
	<header>
		<h1>쇼필몰 회원관리 ver1.0</h1>
	</header>
</body>
</html>