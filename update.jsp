<%-- 
    Document   : update
    Created on : 10 Sep, 2016, 6:46:58 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

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

    <body background="fine.png">
        <%response.setIntHeader("Refresh", 20);%>
        <center><h2><font color="black">PLEASE ENTER BOOK ID AND STATUS YOU WANT</font></h2>
    <form method="POST" style="color: green">
        ENTER BOOK ID:<input type="text" name="bid" required><br><br>
        STATUS:<input type="number" name="p"><br><br><br><br>
        <input type="SUBMIT" name="submit">
         <a href="front.jsp"><input type="button" value="Back"></a><br><br><br>
        </form>
    <% if(request.getParameter("submit")!= null){
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/subrata", "root", "");

            Statement statement = connection.createStatement() ;
            //String p1=Integer.toString(1);
            String p1=request.getParameter("p");
            statement.executeUpdate("UPDATE book SET Status='"+p1+"'WHERE Unique_id='"+request.getParameter("bid")+"'");
            out.println("BOOK IS UPDATED SUCCESSFULLY... ");
            
               }
%>

</center>

    </BODY>
</HTML>
    <%}%>

