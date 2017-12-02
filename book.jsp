<%-- 
    Document   : book
    Created on : 28 Aug, 2016, 3:10:34 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
 if(session.getAttribute("id2")==null)
            {
                response.sendRedirect("admin.jsp");
            }
 else{
  %>
 <html>
 <head>
 <title>WELCOME</title>
 </head>
 <body background="book1.png">
     <%response.setIntHeader("Refresh", 20);%>
     <h2><center><font color="magenta">WELCOME TO BOOK MODULE</font></center>></h2>
     <FORM METHOD="LINK" ACTION="newbook.jsp">
        <INPUT TYPE="submit" VALUE="NEW BOOK ENTRY" style="height:50px; width:250px;color: purple;background-color: yellowgreen">
        </FORM>
     <FORM METHOD="LINK" ACTION="viewbook.jsp" align="right">
        <INPUT TYPE="submit" VALUE="VIEW EXISTING BOOK" style="height:50px; width:250px;color: purple;background-color: yellowgreen">
        </FORM>
     <center><FORM METHOD="LINK" ACTION="update.jsp">
        <INPUT TYPE="submit" VALUE="UPDATE BOOK" style="height:50px; width:250px;color: purple;background-color: yellowgreen">
        </FORM></center>
     <FORM METHOD="LINK" ACTION="delete.jsp">
        <INPUT TYPE="submit" VALUE="DELETE BOOK" style="height:50px; width:250px;color: purple;background-color: yellowgreen">
        </FORM><
        <FORM METHOD="LINK" ACTION="front.jsp" align="right">
        <INPUT TYPE="submit" VALUE="GOTO HOME PAGE" style="height:50px; width:250px;color: red;background-color: yellowgreen">
        </FORM><br>
 
 
 <p align=right>Developed by Subrata</p>
 </body>
</html>
<%}%>
