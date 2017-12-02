<%-- 
    Document   : max
    Created on : 10 Sep, 2016, 10:37:52 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*,java.text.SimpleDateFormat, java.util.Date,java.text.*, java.util.Calendar" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
    <%
 if(session.getAttribute("id2")==null)
            {
                response.sendRedirect("admin.jsp");
            }
 else{
  %>

<HTML>
    <HEAD>
        <TITLE>The Database Table </TITLE>
    </HEAD>

    <body background="issue.png">
        <%response.setIntHeader("Refresh", 20);%>
        <center><h2><font color="yellow">MAXIMUM BORROWED BOOK</font></h2><br><br>
            
        <% if(session.isNew())
            {
                response.sendRedirect("admin.html");
            }
else{
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/subrata", "root", "");

            Statement statement = connection.createStatement() ;
            String sql1=("SELECT Unique_id,count(Unique_id) as count1  FROM issue group by Unique_id order by count1 desc");
                ResultSet rs2=statement.executeQuery(sql1);
                while(rs2.next()){
                //String user= rs2.getString("User_id");
                //Integer c=Integer.parseInt("Count%>
                <h2><font style="color: mediumvioletred">
                <%
                out.println("BOOK : '"+rs2.getString("Unique_id")+"' IS MAXIMUM BORROWED : '"+rs2.getString("count1")+"' TIMES");
                %>
                </font></h2>
                <%
                                 }             
            
        %>
        <a href="front.jsp"><input type="button" value="Back"></a><br><br><br>
    </BODY>
</HTML>
<%}}%>
