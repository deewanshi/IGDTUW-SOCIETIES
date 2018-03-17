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
	String lemail = request.getParameter("email");
	//request.setAttribute("user",lname);
	//String lpass = request.getParameter("pass");
	String email = null,pass=null;
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
			 email = rs.getString("emailid");
			 if(lemail.equals(email))
			 {
			 	
			 		session.setAttribute("eid",email);
					flag=1;
			}
		}
					rs=stmt.executeQuery("select * from registration where emailid='"+email+"'");
					while(rs.next())
					{
						pass=rs.getString("password");
						session.setAttribute("pass",pass);
					}
		if(flag!=1)
		{
			
			%>
			<jsp:forward page="error4.jsp"></jsp:forward>
			<%
		}
		else
			{
				
			%>
			<jsp:forward page="home.jsp"></jsp:forward>
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