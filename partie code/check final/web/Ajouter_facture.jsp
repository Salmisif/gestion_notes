<%-- Document : Ajouter_facture Created on : 17 déc. 2022, 14:45:03 Author : HP
--%>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
        <%@ taglib
uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
            <%@page
contentType="text/html" pageEncoding="UTF-8"%>
                <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/commerciale" user="root" password="sifo123" />
                <!DOCTYPE html>
                <html>

                <head>
                    <title>Mon Site</title>

                    <link rel="stylesheet" href="css/ajouter_facture.css" media="screen" type="text/css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
                </head>

                <body>
                    <c:if test="${param.sav!=null}">
                        <sql:update dataSource="${ds}" var="insert">
                            insert into Facture(DateFacture,Id_Client,Mode_paiement) values(?,?,?);

                            <sql:param value="${param.DateFacture}" />
                            <sql:param value="${param.Id_Client}" />
                            <sql:param value="${param.Mode_paiement}" />
                            <c:if test="insert > 0">
                                <c:set property="S" scope="session" value="user created" var="S" />
                            </c:if>
                        </sql:update>
                    </c:if>
                    <c:if test="${param.save!=null}">
                        <sql:update dataSource="${ds}" var="inser">
                            insert into lignefacture(RA,NF,QuantityVend) values(?,?,?);

                            <sql:param value="${param.RA}" />
                            <sql:param value="${param.NF}" />
                            <sql:param value="${param.QuantityVend}" />
                            <c:if test="inser > 0">
                                <c:set property="S" scope="session" value="user created" var="S" />
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
                            <input type="submit" id="article" value="Article" onclick="window.location='article.jsp'" />
                            <input type="submit" id="facture" value="Factures" onclick="window.location='factures.jsp'" />
                            <input type="submit" id="disc" value="Deconnecter" style="margin-left: 450px" onclick="window.location='login.jsp'"/>
                        </div>
                    </div>
                    <div style="display: flex">
                        <div style="margin-left: 20%">
                            <div id="ab">
                                <br />

                                <form style="margin-top: 0px">
                                    <h2>Ajouter Facture</h2>
                                    <label><b>Date Facture</b></label
            ><br />
            <input type="date" name="DateFacture" required />
            <label><b>Num du client</b></label>
                                    <input type="text" placeholder="Entrer l'ID du client" name="Id_Client" required /><br />
                                    <label><b>Mode paiment</b></label
            ><br />
            <select class="custom-select" name="Mode_paiement">
              <option value="0">Choisisez le mode de paiment:</option>
              <option value="carte-de-credit">carte de credit</option>
              <option value="Espéce">Espéce</option>
            </select>
            <br />
            <br />
            <input type="submit" id="submit1" value="Ajouter" name="sav" />
          </form>
        </div>
      </div>

      <div id="ab">
        <form style="margin-top: 0px" method="post">
          <h2>Ajouter un Article</h2>
          <label><b>Num Article</b></label>
                                    <input type="text" placeholder="Entrer le numero de l'article" name="RA" required />

                                    <label><b>Num de Facture</b></label>
                                    <input type="text" placeholder="Entrer le numero de la facture" name="NF" required />
                                    <label><b>Quantité</b></label>
                                    <input type="number" placeholder="Entrer la quantité" name="QuantityVend" required />
                                    <input type="submit" id="submit1" value="Ajouter" name="save" />
                                </form>
                            </div>
                        </div>
                        <sql:query dataSource="${ds}" var="r"> select * from facture; </sql:query>
                        <div style="margin-left: 20%">
                            <form class="tab" style="margin-top: 5px">
                                <table class="table table-dark table-hover" >
                                    <tr>
                                        <td style="color: white">N°Facture</td>
                                        <td style="color: white">Date</td>
                                        <td style="color: white">ModePaiement</td>
                                        
                                        <td style="color: white">ClientId</td>
                                    </tr>
                                    <c:forEach var="id" items="${r.rows}">
                                        <tr>
                                            <td style="color: white">
                                                <c:out value="${id.NF }" />
                                            </td>
                                            <td style="color: white">
                                                <c:out value="${id.DateFacture}" />
                                            </td>
                                            <td style="color: white">
                                                <c:out value="${id.Mode_paiement}" />
                                            </td>
                                            <td style="color: white">
                                                <c:out value="${id.Id_Client}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </form>
                        </div>
                      
                </body>

                </html>