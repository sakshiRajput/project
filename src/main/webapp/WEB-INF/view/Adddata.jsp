<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <style type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
   </style>
  
</head>
<body>

<div class="container">
    <h2>Add data into the database</h2>
    <p>check the database also..</p>
   <div class="jumbotron">
    <ul class="nav nav-tabs">
        <li><a data-toggle="tab" href="#home">Home</a></li>
        <li><a data-toggle="tab" href="#menu1">Category</a></li>
        <li><a data-toggle="tab" href="#menu2">Product</a></li>
        <li><a data-toggle="tab" href="#menu3">Supplier</a></li>
<!--          <li><a data-toggle="tab" href="#menu4">CategoryList</a></li> -->
<!--           <li><a data-toggle="tab" href="#menu5">ProductList</a></li> -->
<!--            <li><a data-toggle="tab" href="#menu6">SupplierList</a></li> -->
    </ul>

    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <h3>HOME</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        </div>
        <div id="menu1" class="tab-pane fade">
            <div class="container">
                <h2>Add Category</h2>
                  <sp:form action="${pageContext.request.contextPath}/Adddata/addCategory" method="POST" modelAttribute="category">
                     <div>
                         <c:if test="${not empty category.catName}">
                          <sp:input path="catId" readOnly="true" disabled="true"/>
                          <sp:hidden path="catId"/>
                         </c:if>
                     </div>
                     <div class="form-group">
                         <sp:label  path="catName">Category Name:</sp:label>
                         <sp:input class="form-control"  path="catName" placeholder="Enter Category Name" />
                     </div>
                     <div class="form-group">
                         <sp:label  path="catDesc">category Desc:</sp:label>
                         <sp:input class="form-control"  path="catDesc" placeholder="Enter Category Descr" />
                     </div>
                        <sp:button type="submit" class="btn btn-default">Submit</sp:button>
                  </sp:form>
            </div>
             <div class="container">
  <h2>Category......</h2>
  <p>table of category...</p> 
  <c:if test="${not empty categoryList}">
<table border=1 class="table table-striped" >
<thead>
      <tr>
      <th align="center">Name</th>
      <th align="center">Action</th>
      
      </tr>
</thead>
<tbody>
<c:forEach items="${categoryList}" var="cat">
<tr>
<td>${cat.catName}</td>
<td><a class="btn btn-info btn-sm" href="<c:url value='Adddata/updateCategory/${cat.catId}'/>"><span class="glyphicon glyphicon-pencil"></span> Edit</a>
<a class="btn btn-info btn-sm" href="<c:url value='Adddata/deleteCategory/${cat.catId}'/>"> <span class="glyphicon glyphicon-trash"></span> Delete</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>
    
  
</div>

              </div>
        
        
        
        <div id="menu2" class="tab-pane fade">
              <div class="container">
  <h2>Add Product</h2>
 <sp:form action="${pageContext.request.contextPath}/Adddata/addProduct" method="post" modelAttribute="product" enctype="Multipart/form-data">

  <c:if test="${not empty product.prodName}"> 
    <sp:input type="hidden" path="prodId" readonly="true" disabled="true"/>
     <sp:hidden path="prodId"/>
  </c:if> 
    <div class="form-group">

      <sp:label  path="prodName">Product Name:</sp:label>
      <sp:input class="form-control"  path="prodName" placeholder="Enter Product Name" />
    </div>
    <div class="form-group">
      <sp:label  path="prodDesc">Product Desc:</sp:label>
      <sp:input class="form-control"  path="prodDesc" placeholder="Enter Product Descr" />
    </div>
    <div class="form-group">
      <sp:label path="price">Product price:</sp:label>
      <sp:input class="form-control"  path="price" placeholder="Enter Product price" />
    </div>
    <div class="form-group">
           <sp:label path="catId">Category Id:</sp:label><br>
         <sp:select class="form-control" path="catId" >

         <c:forEach items="${categoryList}" var="cat">

         <option>${cat.catId}</option>
         </c:forEach>
         </sp:select>
    </div>
     <div class="form-group">

      <sp:label  path="image">Image:</sp:label>
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
      <th align="center">Name</th>
      <th align="center">Image</th>
      <th align="center">Action</th>
      
      </tr>
</thead>
<tbody>
<c:forEach items="${productList}" var="prod">
<tr>
<td>${prod.prodName}</td>
<td><img src="${pageContext.request.contextPath}/resources/images/${prod.prodId}.jpg" height="50px" width="50px"></td>
<td><a class="btn btn-info btn-sm" href="<c:url value='Adddata/updateProduct/${prod.prodId}'/>"><span class="glyphicon glyphicon-pencil"></span>Edit</a>
<a class="btn btn-info btn-sm" href="<c:url value='Adddata/deleteProduct/${prod.prodId}'/>"> <span class="glyphicon glyphicon-trash"></span>Delete</a></td>
<tr>

</c:forEach>
</tbody>
</table>
</c:if>
</div>
           
           </div>
        
        
        <div id="menu3" class="tab-pane fade">
           <div class="container">
  <h2>Add Supplier</h2>
 <sp:form action="${pageContext.request.contextPath}/Adddata/addSupplier" method="post" modelAttribute="supplier" >
   <div>
  <c:if test="${not empty supplier.supName}">
    <sp:input path="supId" readonly="true" disabled="true"/>
      <sp:hidden path="supId"/>
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

    <sp:button type="submit" class="btn btn-default">Submit</sp:button>
</sp:form>
</div>
       
        
                   <div class="container">
  <h2>Supplier......</h2>
  <p>table of suppliers...</p> 
<c:if test="${not empty supplierList}">
<table border=1 class="table table-striped" >
<thead>
      <tr>
      <th align="center">Name</th>
      <th align="center">Supplier Description</th>
      <th align="center">Supplier's cost</th>
      <th align="center">Action</th>
      
      </tr>
</thead>
<tbody>
<c:forEach items="${supplierList}" var="sup">
<tr>
<td>${sup.supName}</td>
<td>${sup.supDesc}</td>
<td>${sup.supPrice}</td>
<td><a class="btn btn-info btn-sm" href="<c:url value='Adddata/updateSupplier/${sup.supId}'/>"><span class="glyphicon glyphicon-pencil"></span>Edit</a>
<a  class="btn btn-info btn-sm" href="<c:url value='Adddata/deleteSupplier/${sup.supId}'/>"> <span class="glyphicon glyphicon-trash"></span>Delete</a></td>
<tr>

</c:forEach>
</tbody>
</table>
</c:if>
</div>
        </div>
        
        
        
       </div> 
       
       
       
            
    </div>
</div>


</body>
</html>
       
<!--            <div id="menu4" class="tab-pane fade"> -->
<!--            <div class="container"> -->
<!--   <h2>Category......</h2> -->
<!--   <p>table of category...</p>  -->
<%--   <c:if test="${not empty categoryList}"> --%>
<!-- <table border=1 class="table table-striped" > -->
<!-- <thead> -->
<!--       <tr> -->
<!--       <th align="center">Name</th> -->
<!--       <th align="center">Action</th> -->
      
<!--       </tr> -->
<!-- </thead> -->
<!-- <tbody> -->
<%-- <c:forEach items="${categoryList}" var="cat"> --%>
<!-- <tr> -->
<%-- <td>${cat.catName}</td> --%>
<%-- <td><a class="btn btn-info btn-sm" href="<c:url value='Adddata/updateCategory/${cat.catId}'/>"><span class="glyphicon glyphicon-pencil"></span> Edit</a> --%>
<%-- <a class="btn btn-info btn-sm" href="<c:url value='Adddata/deleteCategory/${cat.catId}'/>"> <span class="glyphicon glyphicon-trash"></span> Delete</a></td> --%>
<!-- </tr> -->
<%-- </c:forEach> --%>
<!-- </tbody> -->
<!-- </table> -->
<%-- </c:if> --%>
    
  
<!-- </div> -->
           
<!--            </div> -->
<!--            <div id="menu5" class="tab-pane fade"> -->
<!--            <div class="container"> -->
<!--   <h2>Product......</h2> -->
<!--   <p>table of products...</p>  -->
<%-- <c:if test="${not empty productList}"> --%>
<!-- <table border=1 class="table table-striped" > -->
<!-- <thead> -->
<!--       <tr> -->
<!--       <th align="center">Name</th> -->
<!--       <th align="center">Image</th> -->
<!--       <th align="center">Action</th> -->
      
<!--       </tr> -->
<!-- </thead> -->
<!-- <tbody> -->
<%-- <c:forEach items="${productList}" var="prod"> --%>
<!-- <tr> -->
<%-- <td>${prod.prodName}</td> --%>
<%-- <td><img src="${pageContext.request.contextPath}/resources/images/${prod.prodId}.jpg" height="50px" width="50px"></td> --%>
<%-- <td><a class="btn btn-info btn-sm" href="<c:url value='Adddata/updateProduct/${prod.prodId}'/>"><span class="glyphicon glyphicon-pencil"></span>Edit</a> --%>
<%-- <a class="btn btn-info btn-sm" href="<c:url value='Adddata/deleteProduct/${prod.prodId}'/>"> <span class="glyphicon glyphicon-trash"></span>Delete</a></td> --%>
<!-- <tr> -->

<%-- </c:forEach> --%>
<!-- </tbody> -->
<!-- </table> -->
<%-- </c:if> --%>
<!-- </div> -->
           
<!--            </div> -->
<!--            <div id="menu6" class="tab-pane fade"> -->
<!--            <div class="container"> -->
<!--   <h2>Supplier......</h2> -->
<!--   <p>table of suppliers...</p>  -->
<%-- <c:if test="${not empty supplierList}"> --%>
<!-- <table border=1 class="table table-striped" > -->
<!-- <thead> -->
<!--       <tr> -->
<!--       <th align="center">Name</th> -->
<!--       <th align="center">Supplier Description</th> -->
<!--       <th align="center">Supplier's cost</th> -->
<!--       <th align="center">Action</th> -->
      
<!--       </tr> -->
<!-- </thead> -->
<!-- <tbody> -->
<%-- <c:forEach items="${supplierList}" var="sup"> --%>
<!-- <tr> -->
<%-- <td>${sup.supName}</td> --%>
<%-- <td>${sup.supDesc}</td> --%>
<%-- <td>${sup.supPrice}</td> --%>
<%-- <td><a class="btn btn-info btn-sm" href="<c:url value='Adddata/updateSupplier/${sup.supId}'/>"><span class="glyphicon glyphicon-pencil"></span>Edit</a> --%>
<%-- <a  class="btn btn-info btn-sm" href="<c:url value='Adddata/deleteSupplier/${sup.supId}'/>"> <span class="glyphicon glyphicon-trash"></span>Delete</a></td> --%>
<!-- <tr> -->

<%-- </c:forEach> --%>
<!-- </tbody> -->
<!-- </table> -->
<%-- </c:if> --%>
<!-- </div> -->
           
           
   