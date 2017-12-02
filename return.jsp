<%-- 
    Document   : return
    Created on : 29 Aug, 2016, 12:07:17 AM
    Author     : asus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat, java.util.Date,java.text.*, java.util.Calendar" %>
<%
java.sql.Date now=new java.sql.Date(new java.util.Date().getTime());
java.sql.Date ago=new java.sql.Date(now.getTime()-15*24*60*60*1000);

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
     <body background="return.png">
         <%response.setIntHeader("Refresh", 40);%>
        <center><h2><font color="black">PLEASE ENTER THE DETAILS TO RETURN BOOK</font></h2>
    <form method="POST" style="color: blue">
        USER ID:<input type="text" name="uid" required><br><br>
        BOOK UNIQUE ID:<input type="text" name="bid"><br><br>
        RETURN DATE:<input type="date" name="dt" value="<%=now%>"><br><br>
        <input type="SUBMIT" name="submit">
        <a href="front.jsp"><input type="button" value="Back"></a>
        </form>
            
    </center>
<% 
        if(request.getParameter("submit")!=null)
    {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                Statement stmt = conn.createStatement();
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = sdf1.parse(request.getParameter("dt"));
                if(date.after(now))
                     {%>
                      <table>
                <tr>
                    <td>
                <center>   <h3><font style="color: white"><%out.println("YOU HAVE GIVEN INVALID DATE");%></font></h3></center>
                    </td>
            </tr>
            </table>
                   <% return;
                }else{
               
                String sql="select * from borrow WHERE Unique_id='"+request.getParameter("bid")+"' and User_id='"+request.getParameter("uid")+"'";
                ResultSet rs=stmt.executeQuery(sql);
                while(rs.next()){
                String user1=rs.getString("User_id");
                String book=rs.getString("Unique_id");
                String dt=rs.getString(3);
                if(request.getParameter("uid").compareTo(user1)==0 && request.getParameter("bid").compareTo(book)==0)
                {
                //String sql3="INSERT INTO return VALUES('"+request.getParameter("uid")+"','"+request.getParameter("bid")+"','"+dt+"','"+now+"')";
                stmt.executeUpdate("UPDATE borrow SET Date_of_return='"+request.getParameter("dt")+"'WHERE Unique_id='"+request.getParameter("bid")+"'");
                stmt.executeUpdate("UPDATE issue SET Date_of_return='"+request.getParameter("dt")+"'WHERE Unique_id='"+request.getParameter("bid")+"'");
                String sql1=("SELECT DATEDIFF(Date_of_return,Date_of_issue) AS DAY FROM borrow WHERE User_id='"+request.getParameter("uid")+"'");
                ResultSet rs2=stmt.executeQuery(sql1);
                while(rs2.next()){
                String Count1= rs2.getString("DAY");
                Integer c1=Integer.parseInt(Count1);
                Integer c2=15;
                if(c1>c2)
                                       {
                    int dif=(c1-c2)*2;
                    String fine=Integer.toString(dif);
                    stmt.executeUpdate("DELETE FROM borrow WHERE Unique_id='"+request.getParameter("bid")+"'");
                 String p=Integer.toString(0);
                stmt.executeUpdate("UPDATE book SET Status='"+p+"'WHERE Unique_id='"+request.getParameter("bid")+"'");
                stmt.executeUpdate("UPDATE student SET Fine='"+fine+"'WHERE User_id='"+request.getParameter("uid")+"'");
                    response.sendRedirect("givefine.jsp");
                    return;
                }
                else{
                stmt.executeUpdate("DELETE FROM borrow WHERE Unique_id='"+request.getParameter("bid")+"'");
                String p=Integer.toString(0);
                stmt.executeUpdate("UPDATE book SET Status='"+p+"'WHERE Unique_id='"+request.getParameter("bid")+"'");
                 //stmt.executeUpdate(sql3);
                response.sendRedirect("front.jsp");
                 return;
                                 }
                
                }

                                               /*else if(db1.compareTo(db2)==0)
                {
                    stmt.executeUpdate("DELETE FROM borrow WHERE Unique_id='"+request.getParameter("bid")+"'");
                 String p=Integer.toString(0);
                stmt.executeUpdate("UPDATE book SET Status='"+p+"'WHERE Unique_id='"+request.getParameter("bid")+"'");
                response.sendRedirect("front.jsp");
                return;
                }else{
                  response.sendRedirect("return.html");
                  return;
                                   }}*/
               
                //return;
}
                    out.println("CHECK YOUR USER ID OR BOOK ID");
                    return;

                
                }
                out.println("CHECK YOUR USER ID OR BOOK ID");
                    return;
      }}}
%>
