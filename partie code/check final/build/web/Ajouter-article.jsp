<%-- 
    Document   : Ajouter-article
    Created on : 15 déc. 2022, 19:51:17
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

<link rel="stylesheet" href="css/ajouter-article.css" media="screen" type="text/css" />

<body>
    <c:if test="${param.save!=null}">
                <sql:update dataSource="${ds}" var="insert">
                             insert into article(NomArticle,Quantity,PrixVent) values(?,?,?);
                             <sql:param value="${param.NomArticle}"/>
                              <sql:param value="${param.Quantity}"/>
                              <sql:param value="${param.PrixVent}"/>
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
            <form style="margin-top: 0px" method="post">
                <h1>Ajouter Article</h1>
                <br />
                <label><b>Nom Article</b></label>
                <input type="text" placeholder="Entrer le Nom d'Article" name="NomArticle" required /><br />
                <label><br /><b>Quantité</b></label>
                <input type="number" placeholder="Entrer la quantité " name="Quantity" required />
                <label><br /><b>Prix vente</b></label>
                <input type="number" placeholder="Entrer le prix de vente " name="PrixVent" required />
                <input type="submit" id="submit1" value="Ajouter" name="save"/>
            </form>
        </div>
    </div>
</body>

</html>