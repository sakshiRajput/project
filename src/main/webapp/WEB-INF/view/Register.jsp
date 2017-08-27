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
<title>SignUp</title>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<br><br><br><br>
     <div id="fullscreen_bg" class="fullscreen_bg"/>
         <div class="container">
            <div class="panel-heading">
                    <h1>Registration Form</h1>
                </div>
                 <div class="col-lg-12 well">
                <div class="row">
                <sp:form action="${pageContext.request.contextPath}/adduser" method="POST" modelAttribute="user" >

                 <div class="col-sm-12">
                     <div>
                     <c:if test="${not empty user.userName}">
                        <sp:input path="userId" readOnly="true" disabled="true"/>
                        <sp:hidden path="userId"/>
                      </c:if>
                       </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <sp:label path="userName">User Name</sp:label>
                                <sp:input type="text" path="userName" placeholder="Enter User Name" class="form-control"/>
                            </div>
                            <div class="col-sm-6 form-group">
                                <sp:label path="email">Email Id</sp:label>
                                <sp:input type="text" path="email" placeholder="Enter Last Name Here.." class="form-control"/>
                            </div>
                            <div class="col-sm-6 form-group">
                        <sp:label path="mobile">Phone Number</sp:label>
                        <sp:input type="text" path="mobile" placeholder="Enter Phone Number Here.." class="form-control"/>
                    </div>

                    <div class="col-sm-6 form-group">
                        <sp:label path="password">Password</sp:label>
                        <sp:input type="password" path="password" placeholder="Enter Password Here.." class="form-control"/>
                    </div>
                        </div>





                        <h2>Shipping Address</h2>
                        <div class="form-group">
                        <sp:label path="shippingaddress.shipapartNo">Apartment No.</sp:label>
                            <sp:input type="text" path="shippingaddress.shipapartNo" placeholder="Enter Apartment number " class="form-control"/>
                        </div>
                         <div class="row">
                        <div class="col-sm-6 form-group">
                        <sp:label path="shippingaddress.shipstreetName">Street Name</sp:label>
                            <sp:input type="text" path="shippingaddress.shipstreetName" placeholder="Enter Street address " class="form-control"/>
                        </div>
                        <div class="col-sm-6 form-group">
                                <sp:label path="shippingaddress.shipcity" >City</sp:label>
                                <sp:input type="text" path="shippingaddress.shipcity"  placeholder="Enter City Name Here.." class="form-control"/>
                            </div>


                         </div>

                        <div class="row">
                          <div class="col-sm-4 form-group">
                                <sp:label path="shippingaddress.shipcountry" >Country</sp:label>
                                <sp:input type="text" path="shippingaddress.shipcountry"  placeholder="Enter City Name Here.." class="form-control"/>
                            </div>
                            <div class="col-sm-4 form-group">
                                <sp:label path="shippingaddress.shipstate">State</sp:label>
                                <sp:input type="text" path="shippingaddress.shipstate" placeholder="Enter State Name Here.." class="form-control"/>
                            </div>
                            <div class="col-sm-4 form-group">
                                <sp:label  path="shippingaddress.shipzipcode">Zip</sp:label>
                                <sp:input type="text"  path="shippingaddress.shipzipcode" placeholder="Enter Zip Code Here.." class="form-control"/>
                            </div>

                        </div>
<!--                         <div class="col-sm-4 form-group"> -->
<%--                                <sp:label path="" >Same </sp:label>  <br>  --%>
<%--                                 <sp:input class="coupon_question" type="checkbox" path="" name="coupon_question" value="1"/>  --%>
<%--                                         <span class="item-text">Check Shipping address</span>  --%>
<!--                            </div>  -->







                        <h2>Billing Address</h2>
                        <div class="form-group">
                        <sp:label path="billingaddress.apartNo">Apartment No.</sp:label>
                            <sp:input type="text" path="billingaddress.apartNo" placeholder="Enter Apartment number " class="form-control"/>
                        </div>
                         <div class="row">
                        <div class="col-sm-6 form-group">
                        <sp:label path="billingaddress.streetName">Street Name</sp:label>
                            <sp:input type="text" path="billingaddress.streetName" placeholder="Enter Street address " class="form-control"/>
                        </div>
                        <div class="col-sm-6 form-group">
                                <sp:label path="billingaddress.city" >City</sp:label>
                                <sp:input type="text" path="billingaddress.city"  placeholder="Enter City Name Here.." class="form-control"/>
                            </div>


                         </div>

                        <div class="row">
                          <div class="col-sm-4 form-group">
                                <sp:label path="billingaddress.country" >Country</sp:label>
                                <sp:input type="text" path="billingaddress.country"  placeholder="Enter City Name Here.." class="form-control"/>
                            </div>
                            <div class="col-sm-4 form-group">
                                <sp:label path="billingaddress.state">State</sp:label>
                                <sp:input type="text" path="billingaddress.state" placeholder="Enter State Name Here.." class="form-control"/>
                            </div>
                            <div class="col-sm-4 form-group">
                                <sp:label  path="billingaddress.zipcode">Zip</sp:label>
                                <sp:input type="text"  path="billingaddress.zipcode" placeholder="Enter Zip Code Here.." class="form-control"/>
                            </div>

                        </div>
                    <sp:button type="submit" class="btn btn-lg btn-info">Submit</sp:button>
                    </div>
                </sp:form>
    </div>
    </div>
</div>
<!-- </div> -->
<script type="text/javascript">

</script>
</body>
</html>





