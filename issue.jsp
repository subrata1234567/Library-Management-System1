<%-- 
    Document   : issue
    Created on : 28 Aug, 2016, 11:40:13 PM
    Author     : asus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
      //java.sql.Date now=new java.sql.Date(new java.util.Date().getTime());
      java.sql.Date now=new java.sql.Date(new java.util.Date().getTime());
      //java.sql.Date after=new java.sql.Date(now.getTime()+15*24*60*60*1000);
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
     <body background="issue.png">
         <%response.setIntHeader("Refresh", 40);%>
        <center><h2><font color="magenta">PLEASE ENTER THE VALID DETAILS TO BORROW BOOK</font></h2>
       <h4><font color="red">(ADMIN SHOULD BE CAREFULL ABOUT VALIDITY OF BOOKS AND STUDENTS)</font></h4>
    <form method="POST" style="color: yellow">
        USER ID:<input type="text" name="uid" required><br><br>
        BOOK UNIQUE ID:<input type="text" name="bid"><br><br>
        ISSUE DATE:<input type="date" name="dt" value="<%=now%>"><br><br>
        <input type="SUBMIT" name="submit" value="ISSUE BOOK">
        <a href="front.jsp"><input type="button" value="Back"></a>
        </form>
    </center>
       <%
       if(request.getParameter("submit")!=null)
    {
                //String startDate="12-31-2014";
                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date date = sdf1.parse(request.getParameter("dt"));
                java.sql.Date Date = new Date(date.getTime()+15*24*60*60*1000); 
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                Statement stmt = conn.createStatement();
                ResultSet rs1=stmt.executeQuery("SELECT * FROM book where Unique_id='"+request.getParameter("bid")+"'");
                while(rs1.next()){
                String sta=Integer.toString(0);
                String stat=rs1.getString("Status");
                //String ss=Integer.toString(status); 
                if(stat.compareTo(sta)==1){%>
                <font style="color: white">
                   <% out.println("THE BOOK YOU WANT IS NOT IN LIBRARY");%>
                   </font>
                   <% return;
                                       }
                               else{
               ResultSet rs=stmt.executeQuery("SELECT * FROM student WHERE User_id='"+request.getParameter("uid")+"'");
                while(rs.next()){
                String fine=rs.getString(7);
                String year=rs.getString(6);
                String f=Integer.toString(0);
                if(fine.compareTo(f)==0)
                                                          {
                    Calendar now1 = Calendar.getInstance();
                     int year1 = now1.get(Calendar.YEAR);
                     String y = String.valueOf(year1);
                    if(year.compareTo(y)==0 && year.compareTo(y)==-1)
                       {%>
                         <table>
                <tr>
                    <td>
                <center>   <h3><font style="color: white"><%out.println("YOUR SESSION IS COMPLETED");%></font></h3></center>
                    </td>
            </tr>
            </table>
                  <%  return;
                                         }
                     
                                               
                   String sql=("SELECT count(Unique_id) as count FROM borrow WHERE User_id='"+request.getParameter("uid")+"'");
                   ResultSet rs2=stmt.executeQuery(sql);
                while(rs2.next()){
                String Count= rs2.getString("count");
                String c=Integer.toString(2);
                if(Count.compareTo(c)==0)
                                       {%>
                      <table >
                <tr>
                    <td>
                <center>   <h3><font style="color: white"><%out.println("YOU HAVE ALREADY BORROWED 2 BOOKS");%></font></h3></center>
                    </td>
            </tr>
            </table>
                   <% return;
                }
                if(date.after(now))
                 {%>
                      <table >
                <tr>
                    <td>
                <center>   <h3><font style="color: white"><%out.println("YOU HAVE GIVEN INVALID DATE");%></font></h3></center>
                    </td>
            </tr>
            </table>
                   <% return;
                }else{
                stmt.executeUpdate("INSERT INTO borrow VALUES('"+request.getParameter("uid")+"','"+request.getParameter("bid")+"','"+request.getParameter("dt")+"','"+Date+"','"+year+"')");
                
                //stmt.executeUpdate(sql);
                //String s=Integer.toString(1);
                stmt.executeUpdate("UPDATE book SET Status=1 WHERE Unique_id='"+request.getParameter("bid")+"'");
                response.sendRedirect("front.jsp");
                //stmt.executeUpdate(sql);
                stmt.executeUpdate("INSERT INTO issue VALUES('"+request.getParameter("uid")+"','"+request.getParameter("bid")+"','"+request.getParameter("dt")+"','"+Date+"')");
                stmt.close();
                //conn.close;
                            return;
                               }}
                               }else{
              response.sendRedirect("givefine.jsp");
                    return;}%>
                 <table>
                <tr>
                    <td>
                <center>   <h3><%%></h3></center>
                    </td>
            </tr>
            </table>
                <%//response.sendRedirect("issue.jsp");
                return;
          }}}
}
%>
    </body>
</html>
<%}%>