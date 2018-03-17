<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String  cmm = request.getParameter("comments");
	Connection conn = null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/socities","root","");
		String sql = "insert into contact(name,emailid,comment) values('"+name+"','"+email+"','"+cmm+"')";

			int action = conn.createStatement().executeUpdate(sql);
			conn.setAutoCommit(true);
			if(action>=1)
			{
				%><jsp:forward page="home.jsp"></jsp:forward><% 
			}
	}
	
	catch(Exception e)
	{
		out.print(e);
	}
%>
</body>
</html>