<%-- 
    Document   : stud
    Created on : 30 Aug, 2016, 11:15:49 PM
    Author     : asus
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body background="lib.png"><CENTER>
       <%response.setIntHeader("Refresh", 20);%>
   <h2><font color="magenta">PLEASE ENTER THE CURRENT YEAR</font></h2>
    <form method="POST" style="color: black">
        YEAR:<input type="number" name="yr" required><br><br>
        <input type="SUBMIT" name="submit" value="ENTER">
        <a href="front.jsp"><input type="button" value="Back"></a>
        </form>

<% Class.forName("com.mysql.jdbc.Driver"); %>
    <%
 if(session.getAttribute("id2")==null)
            {
                response.sendRedirect("admin.jsp");
            }
 else{
  %>
        

        <% if(request.getParameter("submit")!=null){
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/subrata", "root", "");

            Statement statement = connection.createStatement() ;
            Calendar now1 = Calendar.getInstance();
            int year1 = now1.get(Calendar.YEAR);
            String y = String.valueOf(year1);
            ResultSet resultset = statement.executeQuery("select * from borrow where Year<'"+request.getParameter("yr") +"'"); 
            //out.println(String.valueOf(year1));
        %>
        <H2 style="color: yellow">EX STUDENT'S 
            <%out.println("OF YEAR: "+request.getParameter("yr")+" ");%>
            ARE BELOW WHO DON'T RETURN BOOK
        </H2>
        <TABLE BORDER="1">
            <TR>
                <TH>USER ID</TH>
                <TH>bOOK ID</TH>
                
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></td>
            </TR>
            <% } %>
        </TABLE><br><br>
         <a href="viewbook.jsp"><input type="button" value="View Book"></a>
          <a href="search1.jsp"><input type="button" value="Search Student"></a>
        </center>
    </BODY>
</HTML>
<%}}%>
