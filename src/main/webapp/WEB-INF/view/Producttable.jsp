<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>product_table</title>
</head>
<body>
 <div class="container">
  <h2>Product......</h2>
  <p>table of products...</p> 
<c:if test="${not empty ProductList}">
<table border=1 class="table table-striped" >
<thead>
      <tr>
      <th>Name</th>
      <th>Image</th>
     
      </tr>
</thead>
<tbody>
<c:forEach items="${ProductList}" var="prod">
<tr>
<td>${prod.prodName}</td>
<td><img src="${pageContext.request.contextPath}/resources/images/${prod.prodId}.jpg" height="50px" width="50px"></td>

<tr>

</c:forEach>
</tbody>
</table>
</c:if>
</div>


</body>
</html>