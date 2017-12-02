<%-- 
    Document   : viewbook1
    Created on : 28 Aug, 2016, 11:25:31 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
    <%
 if(session.getAttribute("id1")==null)
            {
                response.sendRedirect("login.jsp");
            }
 else{
  %>
<!DOCTYPE html>
<html lang="en">
<head>
     <%response.setIntHeader("Refresh", 20);%>
  <title>Library</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body background="view.jpg">
<br>
<div class="container">
    <center> <h2><font style="color: yellow">ENTER THE DETAILS OF BOOK AND AUTHOR NAME TO SEARCH IT IS IN LIBRARY OR NOT</font></h2></center><br><br>
    <div class="row">
            <div class="col-md-4 col-md-offset-4">
   
  <form >
      <div class="form-group" >
      <input type="text" class="form-control" name="bname" placeholder="Enter Book Name">
    </div>
      <h3><font style="color: blue">OR</font></h3>
      <div class="form-group" style="color: black">
      <input type="text" class="form-control" name="aname" placeholder="Enter Author Name">
    </div>
        <h3><font style="color: blue">OR</font></h3>
      <div class="form-group" style="color: black">
      <input type="text" class="form-control" name="sname" placeholder="Enter Subject Name">
    </div>
    <button type="submit" name="submit" class="btn btn-default">Submit</button>
    <button type="link" name="submit" class="btn btn-default"><a href="access.jsp">Back</a></button><br><br><br>
  </form>
</div>
            </div>    
    </div>
<%
if(request.getParameter("submit")!=null)
    {
                Class.forName("com.mysql.jdbc.Driver");
                // Open a connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                // Execute SQL query
                Statement stmt = conn.createStatement();
                String sql;
                sql="SELECT * FROM book";
                ResultSet rs = stmt.executeQuery(sql);
                while(rs.next()){
                    //Retrieve by column name
                    String name = rs.getString(8);
                    String bame = rs.getString(1);
                    String author = rs.getString("Author");
                    String sta=rs.getString("Status");
                    if(request.getParameter("bname").compareTo(name)==0 || request.getParameter("aname").compareTo(author)==0 || request.getParameter("sname").compareTo(bame)==0 && Integer.toString(0).compareTo(sta)==0)
                    {%>
                       
                      <table>
                <tr>
                    <td>
                        <h3><font style="color:black"><%out.println("YOUR SEARCHING BOOK IS AVAILABLE IN LIBRARY");%></font></h3>
                    </td>
            </tr>
            </table>
        
                   <% 
                    return;
                    }
                   
         }

               response.sendRedirect("viewbook1.jsp");
                             }
%>
            
 </center>
    </body>
</html>
<%}%>