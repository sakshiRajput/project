<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
   </style>
<title>ProductList</title>
</head>
<body  style="background-image: url(resources/images/bg.jpg)">
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
  <h2>Product......</h2>
  <p>table of products...</p> 
<c:if test="${not empty productList}">
<table border=1 class="table table-striped" >
<thead>
      <tr>
      <th>Name</th>
      <th>Description</th>
      <th>Image</th>
      <th>Price</th>
      <th>Action</th>
     
      </tr>
</thead>
<tbody>
<c:forEach items="${productList}" var="prod">
<tr>
<td>${prod.prodName}</td>
<td>${prod.prodDesc}</td>
<td><img src="${pageContext.request.contextPath}/resources/images/${prod.prodId}.jpg" height="50px" width="50px"></td>
<td>${prod.price}</td>
<td><a class="btn btn-success" href="#" ><span class="glyphicons glyphicons-cart-in"></span>Add to Cart</a>
    <a class="btn" href=""><span class="glyphicons glyphicons-new-window-alt"></span>view details</a></td>
<tr>

</c:forEach>
</tbody>
</table>
</c:if>
</div>

</body>
</html>