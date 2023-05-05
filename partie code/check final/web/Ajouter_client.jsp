<%-- 
    Document   : Ajouter_client
    Created on : 15 déc. 2022, 14:09:43
    Author     : HP
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <sql:setDataSource var="ds" 
                            driver="com.mysql.jdbc.Driver"
                            url="jdbc:mysql://localhost:3306/commerciale"
                   user="root"
           password="sifo123"/>
<!DOCTYPE html>
<html>
<title>Mon Site</title>

<link rel="stylesheet" href="css/ajouter-client.css" media="screen" type="text/css" />

<body>
         <c:if test="${param.save!=null}">
                <sql:update dataSource="${ds}" var="insert">
                             insert into client(NomClient,phone,email) values(?,?,?);
                             
                              <sql:param value="${param.NomClient}"/>
                              <sql:param value="${param.phone}"/>
                              <sql:param value="${param.email}"/>
                              <c:if test="insert > 0">
                                  <c:set property="S" scope="session" value="user created" var="S"/>
                              </c:if> 
                </sql:update>
                          
         </c:if>
    <div class="sidenav" style="width: 15%">
        <br />
        <br />
        <h3 class="barlien"></h3>
        <br />
         
        <a href="Ajouter_client.jsp">Ajouter Client</a><br />
        <a href="Ajouter-article.jsp">Ajouter Article</a><br />
        <a href="Ajouter_facture.jsp">Ajouter Facture</a><br />
    </div>

    <!-- Page Content -->
    <div style="margin-left: 15%">
        <div class="topnav">
            
            <input type="submit" id="client" value="Clients" style="margin-left: 20px" onclick="window.location='clients.jsp'" />
            <input type="submit" id="article" value="Article" onclick="window.location='article.jsp'"/>
            <input type="submit" id="facture" value="Factures" onclick="window.location='factures.jsp'"/>
            <input type="submit" id="disc" value="Deconnecter" style="margin-left: 450px" onclick="window.location='login.jsp'"/>
        </div>
    </div>

    <div style="margin-left: 15%">
        <div id="ab">
            <form style="margin-top: 0px">
                <h1>Ajouter Client</h1>
                 
                <label><b>Nom </b></label>
                <input type="text" placeholder="Entrer le Nom" name="NomClient" required />
                <label><b>Telephone</b></label>
                <input type="text" placeholder="Entrer le Numero" name="phone" required />
                <label><b>Email</b></label>
                <input type="text" placeholder="Entrer l'Email" name="email" required />
                <input type="submit" id="submit1" value="Ajouter" name="save" />
            </form>
        </div>
    </div>
</body>

</html>