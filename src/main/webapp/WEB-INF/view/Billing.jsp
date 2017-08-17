<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  
 <sp:form action="${pageContext.request.contextPath}/addBillingaddress" method="POST" modelAttribute="billing">
  
   </div>
    <div class="form-group">
      <sp:label  path="streetName">street Name:</sp:label>
      <sp:input class="form-control"  path="streetName" placeholder="Enter street Name" />
    </div>
    <div class="form-group">
      <sp:label  path="apartNo">apartmentno:</sp:label>
      <sp:input class="form-control"  path="apartNo" placeholder="Enter apaertment number" />
    </div>
     <div class="form-group">
      <sp:label  path="city">city:</sp:label>
      <sp:input class="form-control"  path="city" placeholder="Enter City" />
    </div>
     <div class="form-group">
      <sp:label  path="state">city:</sp:label>
      <sp:input class="form-control"  path="state" placeholder="Enter state" />
    </div>
    <div class="form-group">
      <sp:label  path="country">country:</sp:label>
      <sp:input class="form-control"  path="country" placeholder="Enter country" />
    </div>
    <div class="form-group">
      <sp:label  path="zipcode">zipcode:</sp:label>
      <sp:input class="form-control"  path="zipcode" placeholder="Enter zipcode" />
    </div>
    
    
    <sp:button type="submit" class="btn btn-default">Submit</sp:button>
  </sp:form>
</div>



</body>
</html>