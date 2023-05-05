<%-- 
    Document   : delete.jsp
    Created on : 6 déc. 2022, 12:35:51
    Author     : HP
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<sql:setDataSource var="ds" 
                            driver="com.mysql.jdbc.Driver"
                            url="jdbc:mysql://localhost:3306/commerciale"
                   user="root"
           password="sifo123"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:update var="request" dataSource="${ds}">
            delete from client where Id_Client=?;
            <sql:param value="${param.Id_Client}"/>
        </sql:update>
            <c:redirect url="clients.jsp"/>
    </body>
</html>
