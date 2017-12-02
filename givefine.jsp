<%-- 
    Document   : givefine
    Created on : 3 Sep, 2016, 4:26:37 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
   <%
 if(session.isNew())
            {
                response.sendRedirect("admin.html");
            }
 else{
  %>

<HTML>
    <HEAD>
        <TITLE>The Database Table </TITLE>
    </HEAD>

    <body background="fine.png">
        <%response.setIntHeader("Refresh", 20);%>
        <center><h2><font color="magenta">PLEASE ENTER USER ID TO KNOW FINE AMOUNT</font></h2>
    <form method="POST" style="color: green">
        USER ID:<input type="text" name="uid" required><br><br>
        <input type="SUBMIT" name="SUBMIT"><br><br><br>
        </form>
        <% 
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/subrata", "root", "");

            Statement statement = connection.createStatement() ;
             //String p1=Integer.toString(0);
            //statement.executeUpdate("UPDATE student SET Fine='"+p1+"'WHERE User_id='"+request.getParameter("uid")+"'");
            ResultSet resultset = statement.executeQuery("select * from student where User_id='"+request.getParameter("uid")+"'") ;
        %>
            <% while(resultset.next()){ %>

        <table>
                <tr>
                    <td>
                        <h3><%out.println("THE FINE OF  USER: '"+resultset.getString(4)+"'   IS:= '"+resultset.getString(7)+"' Rupees");%></h3>
                    </td>
            </tr>
             <% } %>
            </table>
        
<form method="POST" style="color: green">
    <center><h2><font color="magenta">PAY THE FINE AMOUNT</font></h2></center>
        PAY FINE:<input type="number" name="fa" required><br><br>
        <input type="SUBMIT" name="submit"><br><br><br>
</form>
<%

            String p1=Integer.toString(0);
            statement.executeUpdate("UPDATE student SET Fine='"+p1+"'WHERE User_id='"+request.getParameter("uid")+"'");
            //out.println("YOUR DUE FINE IS CLEARED");
            //out.println("PLEASE TAKE THE SLIP");
%>
<center><input type="submit" value="Print" onClick="window.print()"/>
 <a href="front.jsp"><input type="button" value="Back"></a>
</center>

    </BODY>
</HTML>
    <%}%>
