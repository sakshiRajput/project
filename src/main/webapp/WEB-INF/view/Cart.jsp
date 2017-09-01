<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>CartList</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
 <div class="jumbotron">
    <h1 align="center"> <i class="glyphicon glyphicon-shopping-cart"></i>Cart</h1>      
 </div>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
        <c:if test="${ empty cartInfo}">
         <div>
               <p align="center"><img  src="resources/images/empty-cart-icon.svg" alt="swt2" style="width:15%" ></p>
               <h1 align="center">oops!!</h1>
               <p align="center">Empty cart:No item is added yet... </p>
               <p align="center"><a href="${pageContext.request.contextPath}/">  <button type="button" class="btn btn-success">
                            <i class="fa fa-shopping-bag"></i> Add Products</button></a></th> </p>
         </div>
        </c:if>
            <c:if test="${not empty cartInfo}">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <td>   </td>
                        <th>Quantity</th>
 						<td>   </td>
                        <th class="text-center">Price</th>
                        <td>   </td>
                        <th class="text-center"> Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                     <c:forEach  var="ci"  items="${cartInfo}"  >
                    <tr>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${ci.prodName}</strong></td>
                        <td>   </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${ci.quantity}</strong></td>
					    <td>   </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong><i class="fa fa-inr"></i>${ci.price}</strong></td>
 						<td>   </td>
 						<td class="col-sm-1 col-md-1 text-center"><strong><i class="fa fa-inr"></i>${ci.price*ci.quantity}</strong></td>
                        <td class="col-sm-1 col-md-1">
                        <a href="<c:url value='deleteCart/${ci.cartId}'/>"><button type="button" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Remove
                        </button></a></td>
                    </tr>

                     </c:forEach>

                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Grand Total</h3></td>
                        <td class="text-right"><h3><strong><i class="fa fa-inr"></i>${totalAmount}</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td><button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                            <i class="fa fa-check-square-o"></i>Confirm Details
                         </button> </td>
                        <td><a href="${pageContext.request.contextPath}/clearCart">  <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-remove-circle"></span> Clear cart
                        </button></a>   </td>
                        <td>
                      <a href="${pageContext.request.contextPath}/">  <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></a></td>
                        <td>
                       <a href="${pageContext.request.contextPath}/invoice">  <button type="button" class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-chevron-right"></span>
                        </button></a>
                        </td>
                    </tr>
                </tbody>
            </table>
            </c:if>
        </div>
    </div>
</div>
<br><br><br>
  <div class="modal fade" id="myModal" role="dialog">
    <br><br><br>
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Shipping Details</h4>
        </div>
        <div class="modal-body">
          <p></p>
          <div class="row invoice-info">
                            <div class="col-sm-4 invoice-col">
                                <strong> Shipping Address </strong>
                                <address>
                                    <strong>${pageContext.request.userPrincipal.name} </strong><br>
                                      ${shipaddr.shipapartNo}, ${shipaddr.shipstreetName }<br>
                                      ${shipaddr.shipcity }, ${shipaddr.shipstate }<br>
                                      ${shipaddr.shipcountry }<br>
                                      ${shipaddr.shipzipcode }<br>
                                                                          
                                </address>
                            </div>
                            <div class="col-sm-4 invoice-col">
                              <strong> Billing Address </strong>
                                <address>
                                    <strong>${pageContext.request.userPrincipal.name}</strong><br>
                                    ${billaddr.apartNo },${billaddr.streetName}    <br>
                                    ${billaddr.city }, ${billaddr.state }<br>
                                    ${billaddr.country }<br>
                                    ${billaddr.zipcode }<br>
                                 </address>
                            </div>
                            <div class="col-sm-4 invoice-col">
                                <b>Invoice </b><br>
                                <br>
                                <b>Mobile :</b> ${mobile}<br>
                                <b>Date:</b> ${Date}<br>
                                <b>Account:</b> ***-****
                           </div>
            </div>
        </div>
        <div class="modal-footer">
       <a href="${pageContext.request.contextPath}/edituser/${pageContext.request.userPrincipal.name}">  <button type="button" class="btn btn-success">
                       <i class="fa fa-pencil"></i>  Edit Details 
                        </button></a>
        <a href="${pageContext.request.contextPath}/invoice">  <button type="button" class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </button></a>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>