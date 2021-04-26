<%@ page import = "java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String fnm = request.getParameter("fnm");
String qn = request.getParameter("qn");
String details = request.getParameter("details");
String room = request.getParameter("room");
String nr= request.getParameter("nr");
String count= request.getParameter("count");
String mem= request.getParameter("mem");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

	try{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddetails","root","");
PreparedStatement ps = conn.prepareStatement("insert into data(fname, Quantity, details, rooms, NoOfRoom, Stay, CountAccompanied) values(?,?,?,?,?,?,?);");
Statement st=conn.createStatement();
ps.setString(1,fnm);
ps.setString(2,qn);
ps.setString(3,details);
ps.setString(4,room);
ps.setString(5,nr);
ps.setString(6,count);
ps.setString(7,mem);
int x = ps.executeUpdate();
if(x>0){
	out.println("Data added Successfully");
	int id=0;
           ResultSet rs=st.executeQuery("select * from data");
           if(rs.last()){
               id=rs.getInt("fid");
           }
           out.println("Your Reference Id: "+id);
	
}else{
	out.println("Registration failed");
}
}catch(Exception e){
out.println(e);
}	
%>



