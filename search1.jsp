<%-- 
    Document   : search1
    Created on : 30 Aug, 2016, 4:41:47 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

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

  <body background="search1.jpg"><br><br>
      <%response.setIntHeader("Refresh", 20);%>
        <center><h2><font color="black">ENTER USER ID OR USER NAME TO KNOW THE DETAILS OF STUDENT</font></h2><br><br>
        <form  method="GET" style="color: blue">
        USER ID:<input type="text" name="sid">
        <H3 style="color: blueviolet">OR</h3>
        USER NAME:<input type="text" name="name"><br><br>
        <input type="submit" name="submit" value="search">
         <a href="front.jsp"><input type="button" name="submit" value="Back"></a><br><br><br>
    </form>
           

        <% if(request.getParameter("submit")!=null){%>
         <H2><font color="blue">View Of Student Database Table </h2></H2>
            <%Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/subrata", "root", "");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from student where User_id='"+request.getParameter("sid")+"' or Name='"+request.getParameter("name")+"'");
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>Name</TH>
                <TH>Email</TH>
                <TH>Phone No</TH>
                <TH>User Id</TH>
                <TH>Password</TH>
                <TH>Year Of Passing</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
                <TD> <%= resultset.getString(6) %></TD>
            </TR>
            <% } %>
        </TABLE><br>
        
                        <a href="front.jsp"><input type="button" value="Back"></a>
        </center>
    </BODY>
</HTML>
<%}}%>