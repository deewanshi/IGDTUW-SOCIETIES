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
	String name = (String)session.getAttribute("loginname");
	String notify[] = request.getParameterValues("notify");
	String checkValues[]=request.getParameterValues("society");
	Connection conn = null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/socities","root","");
		String value="";
		String value2="";
		for(int i=0;i<checkValues.length;i++){
		value+=checkValues[i]+" ";
		}
		for(int i=0;i<notify.length;i++){
		value2+=notify[i]+" ";
		}
		Statement stmt = conn.createStatement();
		int action=stmt.executeUpdate("update registration set notification='"+value2+"',society='"+value+"' where name='"+name+"'");
		conn.setAutoCommit(true);
		if(action>=1)
		{
			response.sendRedirect("com.jsp?message=your hint");
		}
		
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
</body>
</html>