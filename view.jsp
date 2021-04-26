<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("fname");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "fooddetails";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Retrieve data from database in jsp</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>fid</b></td>
<td><b>fname</b></td>
<td><b>Quantity</b></td>
<td><b>Details</b></td>
<td><b>rooms</b></td>
<td><b>NoOfRoom</b></td>
<td><b>Stay</b></td>
<td><b>CountAccompanied</b></td>

<td><b>Delete</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM data";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("fid") %></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("Quantity") %></td>
<td><%=resultSet.getString("details") %></td>
<td><%=resultSet.getString("rooms") %></td>
<td><%=resultSet.getString("NoOfRoom") %></td>
<td><%=resultSet.getString("Stay") %></td>
<td><%=resultSet.getString("CountAccompanied") %></td>

<td><a href="del.jsp?fid=<%=resultSet.getString("fid")%>">Remove</a></td>
</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>