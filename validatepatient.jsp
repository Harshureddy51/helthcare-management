<html>
<head>
</head>
<body bgcolor="#f09970">
<br>
<br>
<br>
<font align="right"><a href="./AdminHome.jsp">Back</a></font>
<br>
<br>
<%@ page import="java.sql.*" %>
<form action="validate2.jsp" method="post">
<%
String pid=request.getParameter("pid");
String pname,problem;
int age;
pname="";
problem="";
age=0;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:health","health","health");
PreparedStatement pstm=con.prepareStatement("select * from patient_details where p_id=?");
pstm.setString(1,pid);
ResultSet rs=pstm.executeQuery();
while(rs.next())
{
pname=rs.getString(2);
age=Integer.parseInt(rs.getString(5));
problem=rs.getString(7);
}
session.setAttribute("pid",pid);
session.setAttribute("pname",pname);
session.setAttribute("age",Integer.toString(age));
session.setAttribute("problem",problem);
%>
<table align="center">
<tr>
<td>Patient ID:
<td><input type="text" name="pid" disabled="true" value=<%=pid%>>
</tr>
<tr>
<td>Patient Name:
<td><input type="text" name="pname" disabled="true" value=<%=pname%>>
</tr>
<tr>
<td>age:
<td><input type="text" name="age" disabled="true" value=<%=age%>>
</tr>
<tr>
<td>Problem:
<td><input type="text" name="problem" disabled="true" value=<%=problem%>>
</tr>
<tr>
<td>Category:
<td><select name="cate">
<option>General
<option>HalfYear
<option>Senior
</select>
</tr>
<tr>
<td>Conession: (%)
<td><input type="text" name="cone">
</tr>
<tr>
<td>&nbsp;
<td colspan="2"><input type="submit" value="validate">
</tr>
</table>
</form>
</body>
</html>
