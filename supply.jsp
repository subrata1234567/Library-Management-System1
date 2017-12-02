<%-- 
    Document   : supply
    Created on : 10 Sep, 2016, 7:28:11 PM
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
        <center><h2><font color="black">UPDATE THE USER BY ONE YEAR</font></h2>
    <form method="POST" style="color: green">
        ENTER USER ID:<input type="text" name="uid" required><br><br><br><br>
        <input type="SUBMIT" name="submit">
         <a href="front.jsp"><input type="button" value="Back"></a><br><br><br>
        </form>
    <% if(request.getParameter("submit")!= null){
           Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                Statement stmt = conn.createStatement();
               
                String sql="select * from student WHERE User_id='"+request.getParameter("uid")+"'";
                ResultSet rs=stmt.executeQuery(sql);
                while(rs.next()){
                String yr1=rs.getString(6);
                String nm=rs.getString(1);
                Integer g=Integer.parseInt(yr1);
                Integer g1=g+1;
                String g2=Integer.toString(g1);
                stmt.executeUpdate("UPDATE student SET Year_of_passing='"+g2+"' WHERE User_id='"+request.getParameter("uid")+"'");
                out.println(nm+" DATABASE IS UPDATED SUCCESSFULLY... ");
                return;
               }}
%>

</center>

    </BODY>
</HTML>
    <%}%>
