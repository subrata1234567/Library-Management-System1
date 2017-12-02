<%-- 
    Document   : delete
    Created on : 28 Aug, 2016, 9:26:23 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    <%
 if(session.getAttribute("id2")==null)
            {
                response.sendRedirect("admin.jsp");
            }
 else{
  %>
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
   <body background="delete.jpg"><br><br><br><br><br><br><br>
        <center><h2><font color="blue">PLEASE ENTER BOOK ID TO DELETE BOOK RECORD</font></h2>
            <%response.setIntHeader("Refresh", 20);%>
        <form method="POST" style="color: black">
        UNIQUE_ID OF BOOK:<input type="text" name="uid"><br><br>  
        <input type="submit" name="submit">
        <a href="front.jsp"><input type="button" value="Back"></a>
         <p align="right">Developed by Subrata</p>
    </form>
    </center>
<%
if(request.getParameter("submit")!=null)
    {
      
                Class.forName("com.mysql.jdbc.Driver");
                // Open a connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                // Execute SQL query
                Statement stmt = conn.createStatement();
                    //Retrieve by column name
                //String sql;
                 String sql1;
                //sql="INSERT INTO student VALUES('"+request.getParameter("name")+"','"+request.getParameter("ename")+"','"+request.getParameter("num")+"','"+request.getParameter("uid")+"','"+request.getParameter("pass")+"','0')";
                sql1="SELECT * FROM book WHERE Unique_id='"+request.getParameter("uid")+"'";
                ResultSet rs1 = stmt.executeQuery(sql1);
                while(rs1.next()){
                    String id = rs1.getString(4);
                    String s1 = rs1.getString(7);
                    String s=Integer.toString(0);
                    if(s.compareTo(s1)==0)
                                               {
                    if(request.getParameter("uid").compareTo(id)==1)
                    {
                     %>
                       <table>
                <tr>
                    <td>
                <center>   <h3><%out.println("THE BOOK IS NOT IN LIBRARY");%></h3></center>
                    </td>
            </tr>
            </table>
                       <% return;
                    }
                                   }
                                   }
                       String sql=("DELETE FROM book WHERE Unique_id='"+request.getParameter("uid")+"'");
                        stmt.executeUpdate(sql);
                     //stmt.executeUpdate(sql);
                    response.sendRedirect("book.jsp");
                     stmt.close(); 
                     //return;
                                         }}
 %>
</body>
</html>
