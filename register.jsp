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
	String pass = request.getParameter("pass");
	String cpass = request.getParameter("cpass");
	String email = request.getParameter("email");
	String  mno = request.getParameter("mno");
	Connection conn = null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/socities","root","");
		String sql = "insert into registration(name,password,emailid,mobileno) values('"+name+"','"+pass+"','"+email+"','"+mno+"')";
		if((mno.length()!=10)&&(!((pass).equals(cpass))))
		{
			System.out.print("hi");
			request.setAttribute("Error","Enter Correct mobile no");
			%>
			<jsp:forward page="error2.jsp"></jsp:forward>
			<%
		}
		else if(!((pass).equals(cpass)))
		{
			request.setAttribute("Password","Passwords do not match");
			%>
			<jsp:forward page="error1.jsp"></jsp:forward>
			<%
		}
		else if((mno.length()!=10))
		{
			%>
			<jsp:forward page="error.jsp"></jsp:forward>
			<%
		}
		else 
		{
			int action = conn.createStatement().executeUpdate(sql);
			conn.setAutoCommit(true);
			if(action>=1)
			{
				session.setAttribute("loginname",name);
				%><jsp:forward page="com.jsp"></jsp:forward><% 
			}
		}
	}
	
	catch(Exception e)
	{
		out.print(e);
	}
%>
</body>
</html>