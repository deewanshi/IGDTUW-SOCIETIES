<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "javax.swing.JOptionPane" %>
    <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String lname = request.getParameter("name");
	request.setAttribute("user",lname);
	String lpass = request.getParameter("pass");
	String nam = null;
	String pas = null;
	int flag=0,count=0,var=0;
	Connection conn = null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/socities","root","");
		String sql = "select *from registration";
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			 nam = rs.getString("name");
			 pas = rs.getString("password");
			 if(lname.equals(nam)&&lpass.equals(pas))
			 {
					flag=1;
			 }
		}
		if(flag!=1)
		{
			System.out.print("hi");
			request.setAttribute("Error","Enter Correct Detail");
			session.setAttribute("Loginmsg","plz sign in first");
			%>
			<jsp:forward page="error3.jsp"></jsp:forward>
			<%
		}
		else
			{
				session.setAttribute("loginname",lname);
			%>
			<jsp:forward page="com.jsp"></jsp:forward>
			<%
			}
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
</body>
</html>