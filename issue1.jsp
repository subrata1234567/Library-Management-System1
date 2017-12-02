<%-- 
    Document   : issue1
    Created on : 5 Sep, 2016, 12:38:36 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" session="true" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>
     <%
 if(session.getAttribute("id1")==null)
            {
                response.sendRedirect("login.jsp");
            }
 else{
  %>
<HTML>
    <HEAD>
        <TITLE>The Database Table </TITLE>
    </HEAD>

    <body background="issue.jpg"><center>
        <%response.setIntHeader("Refresh", 20);%>
        <br><br><br>
    <form method="POST" style="color: yellow">
      <input type="hidden" name="uid" value="<%= request.getSession().getId() %>"/>
        </form>
        
        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/subrata", "root", "");
              // String s=Integer.toString(session.getId());
            Statement statement = connection.createStatement() ;
            
            ResultSet rs1 = statement.executeQuery("select * from student where User_id='"+session.getAttribute("id1")+"'") ; 
         while(rs1.next()){%>
         <H3><font style="color: yellowgreen"> 
        <% out.println("BORROW BOOKS DETAIL OF: "+rs1.getString("Name"));%>
       </font> </H3>
        <% }
           ResultSet resultset = statement.executeQuery("select * from borrow where User_id='"+session.getAttribute("id1")+"'") ; 
        %>
        <TABLE BORDER="2" STYLE="color: blue">
            <TR>
                <TH>BOOK ID</TH>
                <TH>DATE OF RETURN</TH>
               
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                
            </TR>
            <% } %>
        </TABLE><br><br>
        <a href="access.jsp"><input type="button" value="Back"></a>
    </BODY>
</HTML>
<%}%>
