<%-- 
    Document   : avail
    Created on : 12 Sep, 2016, 7:14:59 PM
    Author     : asus
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.TABLESWITCH"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*,java.text.SimpleDateFormat, java.util.Date,java.text.*, java.util.Calendar" %>
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
        <center><h2><font color="yellow">PLEASE ENTER TWO DATES TO CHECK </font></h2>
            <center><h3><font color="white">(ALL LETTERS ARE CAPITAL) </font></h3>
    <form method="POST" style="color: blue">
        STARTING DATE:<input type="date" name="stdt"><br><br>
        ENDING DATE:<input type="date" name="endt"><br><br>
        <input type="SUBMIT" name="SUBMIT">
         <a href="avail.jsp"><input type="button" value="Refresh"></a>
         <a href="front.jsp"><input type="button" value="Back"></a>
        </form>
            
        <% if(request.getParameter("SUBMIT")!=null)
                       {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/subrata", "root", "");

            Statement statement = connection.createStatement() ;  
            //SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
            String date1 =(request.getParameter("stdt"));
            String date2 =(request.getParameter("endt"));
            String sql=("select * from issue where Date_of_issue between '"+date1+"' and '"+date2+"' "); 
            ResultSet rs3=statement.executeQuery(sql);
        %>
            <H2 style="color: red">DETAILS OF BOOK</h2>
            <TABLE BORDER="2" style="color: white">
            <TR>
                <TH>User Id</TH>
                <TH>Book Id</TH>
                <TH>Date of Issue</TH>
                <TH>Date of Return</TH>
            </TR>
            <% while(rs3.next()){ %>
            <TR>
                <TD> <%= rs3.getString(1) %></TD>
                <TD> <%= rs3.getString(2) %></TD>
                <TD> <%= rs3.getString(3) %></TD>
                <TD> <%= rs3.getString(4) %></TD>
            </TR>
            <% }%>
        </TABLE><br><br>
<a href=http://localhost:8084/LIBRARYMANAGEMENTSYSTEM/book.jsp>BOOK MODULE PAGE</a>
    </BODY>
</HTML>
<%}}%>