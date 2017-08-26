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
<title>Editaddress</title>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
                @import "font-awesome.min.css";
@import "font-awesome-ie7.min.css";
/* Space out content a bit */
/*    body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #eee;
    }
    .fullscreen_bg {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-size: cover;
        background-position: 50% 50%;
        background-image: url('http://31.media.tumblr.com/ad65726441493f47e0c8f0473206f4e5/tumblr_mvwl4fCEb21rdpk23o1_1280.jpg');
    }  */
/*body {
    padding-top: 20px;
    padding-bottom: 20px;
}   */

/* Everything but the jumbotron gets side spacing for mobile first views */
.header,
.marketing,
.footer {
    padding-right: 15px;
    padding-left: 15px;
}

/* Custom page header */
.header {
    border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
    padding-bottom: 19px;
    margin-top: 0;
    margin-bottom: 0;
    line-height: 40px;
}

/* Custom page footer */
.footer {
    padding-top: 19px;
    color: #777;
    border-top: 1px solid #e5e5e5;
}

/* Customize container */
@media (min-width: 768px) {
    .container {
        max-width: 730px;
    }
}
.container-narrow > hr {
    margin: 30px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
    text-align: center;
    border-bottom: 1px solid #e5e5e5;
}
.jumbotron .btn {
    padding: 14px 24px;
    font-size: 21px;
}

/* Supporting marketing content */
.marketing {
    margin: 40px 0;
}
.marketing p + h4 {
    margin-top: 28px;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
    /* Remove the padding we set earlier */
    .header,
    .marketing,
    .footer {
        padding-right: 0;
        padding-left: 0;
    }
    /* Space out the masthead */
    .header {
        margin-bottom: 30px;
    }
    /* Remove the bottom border on the jumbotron for visual effect */
    .jumbotron {
        border-bottom: 0;
    }
}
        </style>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
     <div id="fullscreen_bg" class="fullscreen_bg"/>
         <div class="container">
           <h1 class="well">Registration Form</h1>
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
                        <sp:input type="text" path="password" placeholder="Enter Password Here.." class="form-control"/>
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





