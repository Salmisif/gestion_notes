<%-- 
    Document   : deletArticle
    Created on : 17 déc. 2022, 11:15:36
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
            delete from article where RA=?;
            <sql:param value="${param.RA}"/>
        </sql:update>
            <c:redirect url="article.jsp"/>
    </body>
</html>
