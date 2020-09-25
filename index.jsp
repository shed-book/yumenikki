	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.Date"%>




<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>MadoChan</title>
</head>
<body>
<header>
<div>
<img id="yumenikki" src="yumenikki.png">
</div>
</header>
<!--１つ目-->
<div id="Left" style="overflow: scroll;overflow-x: hidden;">

<div style="border: 2px dotted #333333;
			text-align: center
			">
			<a href="index.jsp" >トップ</a>
<br>
<a href="notice.jsp" >お知らせ</a>
<br>
<a href="rule.jsp">ルール</a>
<br>
<a href="fq.jsp">FAQ</a>

</div>
<!-- ２つ目 -->
<div style=" border: 2px dotted #333333;
			text-align: center">
<a href="">イラスト/漫画</a>
<br>
<a href="">音楽</a>
<br>
<a href="">小説・ポエム</a>
<br>
<a href="">考察</a>
<br>
<a href="notice.jsp">告知</a>
</div>
</div>
<!-- 右側要素 -->
<div id="Right">
<h3 style="text-align:center; color:#333333;">イラスト/漫画</h3>
<div id="textbox">
<!-- スレッド作成データ送信 -->
<form action="complate.jsp" method="post">
<font style="margin-right:28px; ">名前</font><input name="Author" type="text"></input><br>
<font style="margin-right:8px;">タイトル</font><input name="Subject" type="text"></input><br>
<textarea name="Body" rows="4" style="margin-left:60px; width: 70%; overflow-y: hidden; rows=7 " ></textarea>
<input name="illu" type="file" accept="image/png, image/jpeg, image/gif " style="margin-left:59px; ">
<input type="submit" value="スレッド作成">
</form>
<hr>
</div>
<!-- コメント表示 -->
<%
//acsess
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/yumenikki?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true", "root", "agopo");
Statement stmt = conn.createStatement();
String strSql = "select * from yumenikki order by id";
ResultSet rs = stmt.executeQuery(strSql);
Date date = new Date();
while(rs.next()){
int intId = rs.getInt("id");
long lngDateTime = rs.getLong("date_time");
date.setTime(lngDateTime);
String strAuthor = rs.getString("author");
String strSubject = rs.getString("subject");
String strBody = rs.getString("body");
%>

<font size="4">【<%=intId%>】名前:<%=strAuthor %>/<%=strSubject%></font>
 <%=date.toString()%><br>
<br>
<%=strBody %><br>
<hr>

<%}
conn.close();
%>
</div>
</body>
<!--  -->
</html>
