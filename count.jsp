<%-- 
    Document   : count
    Created on : 30 Aug, 2016, 11:47:49 PM
    Author     : asus
--%>

<%-- 
    Document   : stud
    Created on : 30 Aug, 2016, 11:15:49 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body background="issue.png">
        <center><h2><font color="blue">PLEASE ENTER USER ID TO KNOW HOW MANY BOOKS ARE BORROWED</font></h2>
    <form method="POST" style="color: green">
        ENTER USER ID:<input type="text" name="uid" required><br><br>
        <input type="SUBMIT" name="SUBMIT"><br><br><br>
        </form>
<% Class.forName("com.mysql.jdbc.Driver"); %>
   <%
  if(session.getAttribute("id2")==null)
            {
                response.sendRedirect("admin.jsp");
            }
 else{
  %>
        <H2 style="color: green">LIST OF BOOKS BORROWED BY THE GIVEN USER</H2>

        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/subrata", "root", "");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from borrow where User_id='"+request.getParameter("uid")+"'"); 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>User Id</TH>
                <TH>Unique Id</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></td>
            </TR>
            <% } %>
        </TABLE><br><br>
<a href=http://localhost:8084/LIBRARYMANAGEMENTSYSTEM/issue.html>BOOK ISSUE</a>
<a href=http://localhost:8084/LIBRARYMANAGEMENTSYSTEM/front.jsp>HOME PAGE</a>
        </center>>
    </BODY>
</HTML>
<%}%>

