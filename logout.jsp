<%-- 
    Document   : logout
    Created on : 10 Sep, 2016, 4:24:18 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                 session.setAttribute("id1", null);
                 session.setAttribute("id2", null);
                 //request.getSession().invalidate();
                 //session.setAttribute(null,request.getParameter("uid"));
                response.sendRedirect("index.jsp");
        %>
    </body>
</html>