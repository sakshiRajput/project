<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
  <h2>Add Supplier</h2>
 <sp:form action="${pageContext.request.contextPath}/addSupplier" method="post" modelAttribute="supplier" enctype="Multipart/form-data">
   
  <c:if test="${not empty supplier.supName}">
    Id<sp:input path="supId" readonly="true" disabled="true"/>
  </c:if>
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
   
    

</body>
</html>