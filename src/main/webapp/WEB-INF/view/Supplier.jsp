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
<title>Supplier</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br>
<div class="container bg-grey">
  <h2 align="center">Add Supplier</h2>
 <sp:form action="${pageContext.request.contextPath}/addSupplier" method="post" modelAttribute="supplier" >
   <div>
  <c:if test="${not empty supplier.supName}">
    Id<sp:input path="supId" readonly="true" disabled="true"/>
  </c:if>
  </div>
    <div class="form-group">
      <sp:label  path="supName">Supplier Name:</sp:label>
      <sp:input class="form-control"  path="supName" placeholder="Enter Supplier Name" />
    </div>
    <div class="form-group">
      <sp:label  path="supDesc">Supplier Desc:</sp:label>
      <sp:input class="form-control"  path="supDesc" placeholder="Enter supplier Descr" />
    </div>
    <div class="form-group">
      <sp:label path="supPrice">supplier price:</sp:label>
      <sp:input class="form-control"  path="supPrice" placeholder="Enter supplier price" />
    </div>
   
    <sp:button type="submit" class="btn btn-default" onclick="alert('Product added')">Submit</sp:button>
</sp:form>
</div>
<br><br>  
 <div class="container bg-grey">
  <h2 align="center">Supplier......</h2>
  <p align="center">Table of suppliers...</p> 
<c:if test="${not empty supplierList}">
<table border=1 class="table table-striped" >
<thead>
      <tr>
      <th>Name</th>
      <th>Supplier Description</th>
      <th>Supplier's cost</th>
      <th>Action</th>
      </tr>
</thead>
<tbody>
<c:forEach items="${supplierList}" var="sup">
<tr>
<td>${sup.supName}</td>
<td>${sup.supDesc}</td>
<td>${sup.supPrice}</td>
<td><a class="btn btn-info btn-sm" href="<c:url value='updateSupplier/${sup.supId}'/>"><span class="glyphicon glyphicon-pencil"></span>Edit</a>
<a class="btn btn-info btn-sm" href="<c:url value='deleteSupplier/${sup.supId}'/>"><span class="glyphicon glyphicon-trash"></span>Delete</a></td>
<tr>

</c:forEach>
</tbody>
</table>
</c:if>
</div>
 
 
</body>
</html>