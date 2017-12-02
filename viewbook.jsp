<%-- 
    Document   : viewbook
    Created on : 28 Aug, 2016, 4:15:47 AM
    Author     : asus
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.TABLESWITCH"%>
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
        <center><h2><font color="yellow">PLEASE ENTER BOOK NAME OR BOOK ID TO SEE THE DETAILS OF BOOKS </font></h2>
            <center><h3><font color="white">(ALL LETTERS ARE CAPITAL) </font></h3>
    <form method="POST" style="color: blue">
        BOOK NAME:<input type="text" name="name">
        <H4 style="color: blueviolet">OR</h4>
        SUBJECT NAME:<input type="text" name="bname">
        <H4 style="color: blueviolet">OR</h4>
        BOOK ID:<input type="text" name="bid">
        <H4 style="color: blueviolet">OR</h4>
        AUTHOR:<input type="text" name="au" ><br><br>
        <input type="SUBMIT" name="SUBMIT" value="Search">
         <a href="viewbook.jsp"><input type="button" value="Refresh"></a>
         <a href="issue.jsp"><input type="button" value="Issue Book"></a>
         <a href="front.jsp"><input type="button" value="Back"></a>
        </form>
            
                <% if(request.getParameter("SUBMIT")!=null){
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/subrata", "root", "");

            Statement statement = connection.createStatement() ;
            String p1;
            String sql1=("SELECT count(Name) AS count FROM book WHERE Name='"+request.getParameter("name")+"' or Unique_id='"+request.getParameter("bid")+"'");
                ResultSet rs2=statement.executeQuery(sql1);
                while(rs2.next()){
                // String Count= rs2.getString("count");
                //Integer c=Integer.parseInt("Count%>
                <h3><font style="color:peru">
               <% out.println("AVAILABLE BOOKS ARE:"+rs2.getString("count")+"");%>
                </h3></font>
                               <%  }             
                ResultSet resultset = statement.executeQuery("select * from book where Name='"+request.getParameter("name")+"' or Bname='"+request.getParameter("bname")+"' or Author='"+request.getParameter("au")+"' or Unique_id='"+request.getParameter("bid")+"'") ; 
                //String p=Integer.toString(1);
        %>
            <H2 style="color: red">DETAILS OF BOOK</h2>
        <TABLE BORDER="2" style="color: white">
            <TR>
                 <TH>Book Name</TH>
                <TH>Subject Name</TH>
                <TH>Author</TH>
                <TH>Edition</TH>
                <TH>Unique Id</TH>
                <TH>Date of Entry</TH>
                <TH>Publication</TH>
                <TH>Price</TH>
            </TR>
            <% while(resultset.next()){ 
                 %>
            <TR>
                
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
                <TD> <%= resultset.getString(6) %></TD>
                <TD> <%= resultset.getString(7) %></td>
                <TD> <%= resultset.getString(9) %></TD>
            </TR>
            <% } %>
        </TABLE>
        <%ResultSet resultset1 = statement.executeQuery("select * from book where Name='"+request.getParameter("name")+"' or Bname='"+request.getParameter("bname")+"' or Author='"+request.getParameter("au")+"' or Unique_id='"+request.getParameter("bid")+"'") ; 
        while(resultset1.next())
                       {
            String s=resultset1.getString("Status");
            String p=Integer.toString(0);
            if(s.compareTo(p)==0){%>
              <h3><font style="color:pink">  
                 <%out.println("THESE BOOK IS AVAILABLE IN LIBRARY");}%>
                </h3></font>
<%}
        //response.sendRedirect("book.jsp");%>
    </BODY>
</HTML>
<%}}%>