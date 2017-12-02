<%-- 
    Document   : forget
    Created on : 28 Aug, 2016, 2:33:01 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
<body background="forget.jpg">
    <%response.setIntHeader("Refresh", 20);%>
<br><br><br><br><br><br><br>
<div class="container">
    <center> <h2><font style="color: WHITE">SET PASSWORD</font></h2></center>
    <div class="row">
            <div class="col-md-4 col-md-offset-4">
   
  <form>
    <div class="form-group" style="color: yellowgreen">
    
      <input type="text" class="form-control" name="uid" placeholder="Enter student id">
    </div>
    <div class="form-group" style="color: yellowgreen">
   
      <input type="password" class="form-control" name="pass1" placeholder="Enter password">
    </div>
    <button type="submit" name="submit" class="btn btn-default">Submit</button>
    <button type="link" name="submit" class="btn btn-default"><a href="login.jsp">Back</a></button><br><br><br>
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
                String sql,sql1;
                sql1="SELECT * FROM student";
                ResultSet rs = stmt.executeQuery(sql1);
                while(rs.next()){
                    //Retrieve by column name
                    String id = rs.getString("User_id");
                    String pass = rs.getString("Password");
                    if(request.getParameter("uid").compareTo(id)==0)
                    {
                        String id1=request.getParameter("uid");
                        String pass1=request.getParameter("pass1");
                        sql="UPDATE student SET Password='"+pass1+"' WHERE User_id='"+id1+"'";
                        stmt.executeUpdate(sql);
                        response.sendRedirect("login.jsp");
                       
                        return;
                        }
                    
                }
                response.sendRedirect("forget.jsp");
 %>
</body>
</html>
<%}%>