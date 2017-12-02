<%-- 
    Document   : signup
    Created on : 28 Aug, 2016, 2:16:05 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%Class.forName("com.mysql.jdbc.Driver");%>
    <%
 if(session.getAttribute("id2")==null)
            {
                response.sendRedirect("admin.jsp");
            }
 else{
  %>
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
<body background="signup.jpg">
<br><br><br><br>
<div class="container">
    <center> <h2><font style="color: greenyellow">ENTER THE DETAILS OF STUDENT</font></h2></center><br><br>
    <div class="row">
            <div class="col-md-4 col-md-offset-4">
   
  <form >
      <div class="form-group" style="color: black">
      <input type="text" class="form-control" name="name" placeholder="Enter Student Name">
    </div>
      <div class="form-group" style="color: black">
      <input type="email" class="form-control" name="ename" placeholder="Enter email id">
    </div>
      <div class="form-group" style="color: black">
      <input type="number" class="form-control" name="num" placeholder="Enter Phone No">
    </div>
   
      <div class="form-group" style="color: black">
      <input type="text" class="form-control" name="uid" placeholder="Enter User Id" >
    </div>
    <div class="form-group" style="color: black">
      <input type="password" class="form-control" name="pass" placeholder="Enter password">
    </div>
       <div class="form-group" style="color: black">
      <input type="number" class="form-control" name="yr" placeholder="Enter Year Of Passing">
    </div>
    <button type="submit" name="submit" class="btn btn-default">Submit</button>
    <button type="link" name="submit" class="btn btn-default"><a href="front.jsp">Back</a></button><br><br><br>
  </form>
</div>
            </div>    
    </div>
<%
  if(request.getParameter("submit")!=null)
    {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                Statement stmt = conn.createStatement();
                String sql,sql1;
                //sql="INSERT INTO student VALUES('"+request.getParameter("name")+"','"+request.getParameter("ename")+"','"+request.getParameter("num")+"','"+request.getParameter("uid")+"','"+request.getParameter("pass")+"','0')";
                sql1="SELECT * FROM student";
                ResultSet rs1 = stmt.executeQuery(sql1);
                while(rs1.next()){
                    String id = rs1.getString(2);
                    if(request.getParameter("ename").compareTo(id)==0)
                    {%>
                       <table>
                <tr>
                    <td>
                <center>   <h3><%out.println("THE EMAIL ID IS ALREADY EXISTS");%></h3></center>
                    </td>
            </tr>
            </table>
                       <% return;
                    }
                
                }
                sql="INSERT INTO student VALUES('"+request.getParameter("name")+"','"+request.getParameter("ename")+"','"+request.getParameter("num")+"','"+request.getParameter("uid")+"','"+request.getParameter("pass")+"','"+request.getParameter("yr")+"','0')";
                stmt.executeUpdate(sql);
                response.sendRedirect("front.jsp");
                // stmt.executeUpdate(sql);
                stmt.close();
                conn.close();
                               }}
%>
