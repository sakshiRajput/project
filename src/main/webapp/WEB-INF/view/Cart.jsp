<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>CartList</title>
</head>
<body  style="background-image: url(resources/images/bg.jpg)">
<jsp:include page="header.jsp"></jsp:include>
 <div class="jumbotron">
 
 <div class="page-header">
    <h1 align="center">My Cart</h1>      
  </div>
 </div>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <c:if test="${not empty cartInfo}">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>             </th>
                        <th>Quantity</th>

                        <th class="text-center">Price</th>

                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                     <c:forEach  var="ci"  items="${cartInfo}"  >
                    <tr>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${ProdName}</strong></td>
                        <td><img class="media-object" src="${pageContext.request.contextPath}/resources/images/${prod.prodId}.jpg" style="width: 72px; height: 72px;"> </td>
                        
                        <td>                </td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="number" class="form-control" id="Quantity" name="Quantity">
                        </td>

                        <td class="col-sm-1 col-md-1 text-center"><strong>${Price}</strong></td>

                        <td class="col-sm-1 col-md-1">
                        <button type="button" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Remove
                        </button></td>
                    </tr>

                     </c:forEach>

                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong> total</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td> <a href="/clearCart">  <button type="button" class="btn btn-success">
                            Clearcart
                        </button></a>  </td>
                        <td>   </td>
                        <td>
                      <a href="/index">  <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></a></td>
                        <td>
                       <a href="#">  <button type="button" class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></a>
                        </td>
                    </tr>
                </tbody>
            </table>
            </c:if>
        </div>
    </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>