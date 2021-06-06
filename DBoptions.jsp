<%-- 
    Document   : DBinterior
    Created on : Apr 26, 2021, 4:41:38 PM
    Author     : Amir
--%>

<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int numCheckBox = 6;
    CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
    crs.setUrl("jdbc:derby://localhost:1527/ProjectAMG");
    crs.setUsername("AMG");
    crs.setPassword("AMG");
    crs.setCommand("Select id from CarList where id = ?");
    crs.setString(1, pageContext.getSession().getId());
    crs.execute();
    if (crs.next()) {
        
        crs.setCommand("Select car from CarFeatureList where car = ?");
        crs.setString(1, pageContext.getSession().getId());
        crs.execute();
        
        if(crs.next())
        {
            crs.setCommand("DELETE from CarFeatureList where car = ?");
            crs.setString(1, pageContext.getSession().getId());
            crs.execute();
        }
        
        for(int i =1; i <=numCheckBox; i++)
        {
            if(request.getParameter("checkOption" + i)!=null)
            {
                crs.setCommand("INSERT into CarFeatureList (car, feature) values(?,?)");
                crs.setString(1, pageContext.getSession().getId());
                crs.setString(2, request.getParameter("checkOption" + i));
                crs.execute();
                
                crs.setCommand("update CarList set featuresavailable = ? where id = ?");
                crs.setString(1, "Yes");
                crs.setString(2, pageContext.getSession().getId());
                crs.execute();
            }
        }
    } else {
        crs.setCommand("INSERT into CarList (id, featuresavailable) values(?,?)");
        crs.setString(1, pageContext.getSession().getId());
        crs.setString(2, "Yes");

        crs.execute();
        for(int i =1; i <=numCheckBox; i++)
        {
            if(request.getParameter("checkOption" + i)!=null)
            {
                crs.setCommand("INSERT into CarFeatureList (car, feature) values(?,?)");
                crs.setString(1, pageContext.getSession().getId());
                crs.setString(2, request.getParameter("checkOption" + i));
                crs.execute();
            }
        }
    }
%>
<jsp:forward page="summary.jsp"></jsp:forward><!DOCTYPE html>

<%--
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
            <%         for(int i =1; i <=6; i++)
        {
            %>

                <h1><%= request.getParameter("checkOption" + i)%> </h1>
           <%
        }
            %>
       
    </body>
</html>
--%>