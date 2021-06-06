<%-- 
    Document   : DBexterior
    Created on : Apr 26, 2021, 3:27:49 PM
    Author     : Amir
--%>

<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
    crs.setUrl("jdbc:derby://localhost:1527/ProjectAMG");
    crs.setUsername("AMG");
    crs.setPassword("AMG");
    crs.setCommand("Select * from CarList where id = ?");
    crs.setString(1, pageContext.getSession().getId());
    crs.execute();
    if (crs.next()) {
        crs.setCommand("update CarList set bodypaint = ?, wheeldesign = ? where id = ?");
        crs.setString(1, request.getParameter("radioColour"));
        crs.setString(2, request.getParameter("radioWheel"));
        crs.setString(3, pageContext.getSession().getId());
        crs.execute();
    } else {
        crs.setCommand("INSERT into CarList (id, bodypaint, wheeldesign) values(?,?,?)");
        crs.setString(1, pageContext.getSession().getId());
        crs.setString(2, request.getParameter("radioColour"));
        crs.setString(3, request.getParameter("radioWheel"));
        crs.execute();
    }

%>
<jsp:forward page="interior.html"></jsp:forward><!DOCTYPE html>

<%--
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%= crs.getString("id") %> </h1>
        <h1><%= pageContext.getSession().getId() %> </h1>
    </body>
</html>
--%>