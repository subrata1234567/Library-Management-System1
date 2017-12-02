<%-- 
    Document   : newbook
    Created on : 28 Aug, 2016, 3:45:31 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%
      java.sql.Date now=new java.sql.Date(new java.util.Date().getTime());
%>

<% Class.forName("com.mysql.jdbc.Driver"); %>
     <%
 if(session.getAttribute("id2")==null)
            {
                response.sendRedirect("admin.jsp");
            }
 else{
  %>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
   <body background="signup.png">
        <center><h2><font color="greenyellow">PLEASE ENTER THE BOOK DETAILS</font></h2>
    <form method="POST" style="color: black">
        BOOK NAME:<input type="text" name="name" required><br><br>
        SUBJECT NAME:<input type="text" name="bname" required><br><br>
        AUTHOR NAME:<input type="text" name="aname"><br><br>
        EDITION:<input type="number" name="edi"><br><br>
        UNIQUE_ID:<input type="text" name="uid" required><br><br>
        PUBLICATION:<input type="text" name="pub" required><br><br>
        PRICE:<input type="number" name="pri"><br><br>
        <input type="SUBMIT" name="submit" VALUE="submit">
        <a href="front.jsp"><input type="button" value="Back"></a>
        </FORM>
             
    </center>

<%
    if(request.getParameter("submit")!=null)
    {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                Statement stmt = conn.createStatement();
                 String sql,sql1;
                //sql="INSERT INTO student VALUES('"+request.getParameter("name")+"','"+request.getParameter("ename")+"','"+request.getParameter("num")+"','"+request.getParameter("uid")+"','"+request.getParameter("pass")+"','0')";
                sql1="SELECT * FROM book";
                ResultSet rs1 = stmt.executeQuery(sql1);
                while(rs1.next()){
                    String id = rs1.getString(4);
                    if(request.getParameter("uid").compareTo(id)==0)
                    {%>
                       <table>
                <tr>
                    <td>
                <center>   <h3><%out.println("THE BOOK ID IS ALREADY EXISTS");%></h3></center>
                    </td>
            </tr>
            </table>
                       <% return;
                    }
                
                }
               
                 sql="INSERT INTO book VALUES('"+request.getParameter("name")+"','"+request.getParameter("bname")+"','"+request.getParameter("aname")+"','"+request.getParameter("edi")+"','"+request.getParameter("uid")+"','"+now+"','"+request.getParameter("pub")+"','0','"+request.getParameter("pri")+"')";
                stmt.executeUpdate(sql);
                stmt.close();
                conn.close();
                response.sendRedirect("front.jsp");
                //response.sendRedirect("book.jsp");
                               }}
%>
</body>
</html>
