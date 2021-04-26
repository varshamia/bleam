<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("fid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddetails", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM data WHERE fid="+id);
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>