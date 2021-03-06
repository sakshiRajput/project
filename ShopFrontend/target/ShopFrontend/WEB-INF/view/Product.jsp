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
<title>Product</title>
</head>
<body>

<div class="container">
  <h2>Add Product</h2>
 <sp:form action="${pageContext.request.contextPath}/addProduct" method="post" modelAttribute="product" enctype="Multipart/form-data">
   
  <c:if test="${not empty product.prodName}">
    Id<sp:input path="productId" readonly="true" disabled="true"/>
  </c:if>
    <div class="form-group">
    
      <sp:label  path="ProdName">Product Name:</sp:label>
      <sp:input class="form-control"  path="ProdName" placeholder="Enter Product Name" />
    </div>
    <div class="form-group">
      <sp:label  path="ProdDesc">Product Desc:</sp:label>
      <sp:input class="form-control"  path="ProdDesc" placeholder="Enter Product Descr" />
    </div>
    <div class="form-group">
      <sp:label path="Price">Product price:</sp:label>
      <sp:input class="form-control"  path="Price" placeholder="Enter Product price" />
    </div>
     <div class="form-group">
    
      <sp:label  path="">Image:</sp:label>
      <sp:input type="file" class="form-control"  path="image" placeholder="Choose Path" />
    </div>
    
    <sp:button type="submit" class="btn btn-default">Submit</sp:button>
  </sp:form>
</div>
 <div class="container">
  <h2>Product......</h2>
  <p>table of products...</p> 
<c:if test="${not empty productList}">
<table border=1 class="table table-striped" >
<thead>
      <tr>
      <th>Name</th>
      <th>Edit</th>
      <th>Delete</th>
      </tr>
</thead>
<tbody>
<c:forEach items="${productList}" var="prod">
<tr>
<td>${prod.prodName}</td>
<td><a href="<c:url value='updateProduct/${prod.prodId}'/>">Edit</a></td>
<td><a href="<c:url value='deleteProduct/${prod.prodId}'/>">Delete</a></td>
<tr>

</c:forEach>
</tbody>
</table>
</c:if>
</div>
 
 
</body>
</html>