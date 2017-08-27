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
   <script>
   function myFunction() {
	    var x = document.getElementById("snackbar")
	    x.className = "show";
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 8000);
	}
   </script>

<title>Category</title>
</head>
<body  >
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
  <h2>Add Category</h2>
 <sp:form action="${pageContext.request.contextPath}/addCategory" method="POST" modelAttribute="category">
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
    <sp:button type="submit" class="btn btn-default" onclick="myFunction()">Submit</sp:button>
    <div id="snackbar">Category added..</div>
  </sp:form>
</div>
<div id="snackbar">Category added..</div>
<div class="container">
  <h2>Category......</h2>
  <p>table of category...</p> 
  <c:if test="${not empty categoryList}">
<table border=1 class="table table-striped" >
<thead>
      <tr>
      <th>Name</th>
      <th>edit</th>
      <th>delete</th>
      </tr>
</thead>
<tbody>
<c:forEach items="${categoryList}" var="cat">
<tr>
<td>${cat.catName}</td>
<td><a href="<c:url value='updateCategory/${cat.catId}'/>">Edit</a></td>
<td><a href="<c:url value='deleteCategory/${cat.catId}'/>">Delete</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</c:if>
    
  
</div>
</body>
</html>
