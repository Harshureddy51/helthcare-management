<html>
<head>
</head>
<body bgcolor="#f09970">
<center><h1>Welcome Administrator</h1></center>
 <A href="./AdminHome.jsp">Home</a>
<%@ page import="java.sql.*" %>
<%
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:health","health","health");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("select * from patient_details");
%>
<br>
<br>
<br>
<br>
<table align="center" border="2">
<tr>
<th>
Patient ID
</th>
<th>
Name
</th>
<th>
Problem
</th>
<th>
Date to Visit
</th>
<th>
Doctor to Visit
</th>
</tr>
<%
while(rs.next())
{
out.println("<tr>");
out.println("<td>");
out.println(rs.getString(1));
out.println("<td>");
out.println(rs.getString(2));
out.println("<td>");
out.println(rs.getString(7));
out.println("<td>");
java.sql.Date dtt=rs.getDate(10);
if(dtt==null)
	out.println("To be shedule");
else
out.println(""+dtt.getDate()+"-"+dtt.getMonth()+"-"+dtt.getYear());
out.println("<td>");
String dne=rs.getString(11);
if(dne==null)
out.println("To be shedule");
else
	out.println(dne);
out.println("</tr>");
}%>
</table>
</center>
<br>
<br>
<center>Select Patient Id:&nbsp;&nbsp;&nbsp;
<form action="./shedule.jsp" method="post">
<select name="pid">
<%
rs=stmt.executeQuery("select * from patient_details where status='false'");
while(rs.next())
{
out.println("<option>"+rs.getString(1));
}
%>
</select>
<input type="submit" value="shedule">
</form>
</body>
</html>
