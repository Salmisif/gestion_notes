<%-- Document : articles Created on : 17 déc. 2022, 15:01:42 Author : HP --%>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
        <%@ taglib
uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
            <%@page
contentType="text/html" pageEncoding="UTF-8"%>
                <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/commerciale" user="root" password="sifo123" />
                <!DOCTYPE html>
                <html>
                <title>Mon Site</title>

                <link rel="stylesheet" href="css/all.css" media="screen" type="text/css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

                <body>
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
                    <sql:query dataSource="${ds}" var="r">
                        select f.NF,QuantityVend,PrixVent,NomArticle,Id_Client from lignefacture l,article a,Facture f where l.RA=a.RA and l.NF=f.NF;
                    </sql:query>
                    <div style="margin-left: 18%">
                        <form class="tab" style="margin-top: 50px">
                            <br /><br />
                            <!-- hnaya li dir tableau bach ykhroj ldakhel lcarré lk7al li khdamtou -->
                            <table class="table table-dark table-hover">
                                <tr>
                                    <td style="color: white">Numero de Facture</td>
                                    <td style="color: white">article</td>
                                    <td style="color: white">Quantité</td>
                                    <td style="color: white">prix de vente</td>

                                    <td style="color: white">client ID</td>
                                    <td style="color: white">Prix Total</td>
                                </tr>
                                <c:forEach var="id" items="${r.rows}">
                                    <tr>
                                        <td style="color: white">
                                            <c:out value="${id.NF }" />
                                        </td>
                                        <td style="color: white">
                                            <c:out value="${id.NomArticle}" />
                                        </td>
                                        <td style="color: white">
                                            <c:out value="${id.QuantityVend}" />
                                        </td>
                                        <td style="color: white">
                                            <c:out value="${id.PrixVent}" /> $</td>

                                        <td style="color: white">
                                            <c:out value="${id.Id_Client}" />
                                        </td>
                                        <td style="color: white">
                                            <c:out value="${id.QuantityVend * id.PrixVent}" /> $
                                        </td>
                                       
                                    </tr>
                                </c:forEach>
                            </table>
                            <br />
                        </form>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
                </body>

                </html>