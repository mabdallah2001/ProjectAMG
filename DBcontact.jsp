<%-- 
    Document   : DBbackend
    Created on : Apr 24, 2021, 9:17:49 PM
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
    crs.setCommand("INSERT into Contact (email, comment, newsletter) values(?,?,?)");
    crs.setString(1, request.getParameter("contactEmail"));
    crs.setString(2, request.getParameter("contactComment"));
    if(request.getParameter("contactNewsletter") == null)
    {
        crs.setInt(3, 0);
    }
    else
    {
        crs.setInt(3, 1);
    }
    crs.execute();
%>
<jsp:forward page="contact.html"></jsp:forward>
