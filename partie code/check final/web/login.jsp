<%-- 
    Document   : log
    Created on : 15 déc. 2022, 08:56:04
    Author     : HP
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <sql:setDataSource var="ds" 
                            driver="com.mysql.jdbc.Driver"
                            url="jdbc:mysql://localhost:3306/etude"
                   user="root"
           password="sifo123"/>
<!DOCTYPE html>
<html>
    <c:if test="${param.save!=null}">
                      <c:if test="${param.name == 'admin' and param.password =='admin'}">
                          <c:redirect url="Ajouter_facture.jsp"></c:redirect>
                       </c:if>            
            </c:if>
<title>Mon Site</title>

<link rel="stylesheet" href="css/project-login.css" media="screen" type="text/css" />

<body>
    <c:if test="${param.save!=null}">
                <sql:update dataSource="${ds}" var="insert">
                      insert into user values(?,?);
                             <sql:param value="${param.name}"/>
                             <sql:param value="${param.password}"/>
                      <c:if test="insert > 0">
                           <c:set property="S" scope="session" value="user created" var="S"/>
                      </c:if> 
                </sql:update>                
         </c:if>
    <div style="margin-left: 0%">
        <div id="ab">
            <form style="margin-top: 0px" name="register" action="" method="post">
                <h1>Authentification</h1>
                <label><b>Nom d'utilisateur</b></label>
                <input type="text" placeholder="Entrer le nom d'utilisateur" name="name" required />
                <label><b>Mot de passe</b></label>
                <input type="password" placeholder="Entrer le mot de passe" name="password" required />
                <input type="submit" id="submit1" name="save" value="s'authentifier" />
            </form>
        </div>
    </div>
</body>

</html>