<%-- 
    Document   : admin
    Created on : 28 Aug, 2016, 12:24:36 AM
    Author     : asus
--%>
<%@page import="com.sun.org.apache.bcel.internal.generic.BREAKPOINT"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>

<html lang="en">
<head>
  <title>Library</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background="admin.jpg">
<br><br><br><br><br><br><br>
<div class="container">
    <center> <h2><font style="color: blue">ADMIN LOGIN FORM</font></h2></center>
    <div class="row">
            <div class="col-md-4 col-md-offset-4">
   
  <form>
    <div class="form-group" style="color: black">
      <label for="uid">ADMIN ID:</label>
      <input type="text" class="form-control" name="uid" placeholder="Enter admin id">
    </div>
    <div class="form-group" style="color: black">
      <label for="pass">PASSWORD:</label>
      <input type="password" class="form-control" name="pass" placeholder="Enter password">
    </div>
    <button type="submit" name="submit" class="btn btn-default">Submit</button>
    <button type="link" name="submit" class="btn btn-default"><a href="index.jsp">Back</a></button><br><br><br>
  </form>
</div>
            </div>    
    </div>
<%if(request.getParameter("submit")!=null)
       {

                Class.forName("com.mysql.jdbc.Driver");
                // Open a connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                // Execute SQL query
                Statement stmt = conn.createStatement();
                String sql;
                sql="SELECT * FROM admin";
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
                    //Retrieve by column name
                    String id = rs.getString("User_id");
                    String pass = rs.getString("Password");
                    if(request.getParameter("uid").compareTo(id)==0)
                    {
                        if( request.getParameter("pass").compareTo(pass)==0)
                        {
                        //response.sendRedirect("SIGNUP1.html");
                            
                                session.setAttribute("id2",request.getParameter("uid"));
                                //session.setMaxInactiveInterval(20); 
                                response.sendRedirect("front.jsp");
                            
                        //out.println("<a href=welcome.html>WELCOME</a>");
                        //out.println("valid user");
                        return;
                        }
                    }
           }
                //out.println("invalid user");
               response.sendRedirect("admin.jsp");
                stmt.close();
                conn.close();
                               
%>
</body>
</html>
<%}%>
