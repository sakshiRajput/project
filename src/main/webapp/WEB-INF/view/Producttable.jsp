<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
   <style>

  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: 0;
  }</style>
   <style>/*Tooltip*/
$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});
</style>
  <style>.col-item {
  border: 1px solid #E1E1E1;
  background: #FFF;
  margin-bottom:12px;
}
.col-item .options {
  position:absolute;
  top:6px;
  right:22px;
}
.col-item .photo {
  overflow: hidden;
}
.col-item .photo .options {
  display:none;
}
.col-item .photo img {
  margin: 0 auto;
  width: 100%;
}

.col-item .options-cart {
  position:absolute;
  left:22px;
  top:6px;
  display:none;
}
.col-item .photo:hover .options,
.col-item .photo:hover .options-cart {
  display:block;
  -webkit-animation: fadeIn .5s ease;
  -moz-animation: fadeIn .5s ease;
  -ms-animation: fadeIn .5s ease;
  -o-animation: fadeIn .5s ease;
  animation: fadeIn .5s ease;
}
.col-item .options-cart-round {
  position:absolute;
  left:42%;
  top:22%;
  display:none;
}
.col-item .options-cart-round button {
  border-radius: 50%;
  padding:14px 16px;

}
.col-item .options-cart-round button .fa {
  font-size:22px;
}
.col-item .photo:hover .options-cart-round {
  display:block;
  -webkit-animation: fadeInDown .5s ease;
  -moz-animation: fadeInDown .5s ease;
  -ms-animation: fadeInDown .5s ease;
  -o-animation: fadeInDown .5s ease;
  animation: fadeInDown .5s ease;
}
.col-item .info {
  padding: 10px;
  margin-top: 1px;
}
.col-item .price-details {
  width: 100%;
  margin-top: 5px;
}
.col-item .price-details h1 {
  font-size: 14px;
  line-height: 20px;
  margin: 0;
  float:left;
}
.col-item .price-details .details {
  margin-bottom: 0px;
  font-size:12px;
}
.col-item .price-details span {
  float:right;
}
.col-item .price-details .price-new {
  font-size:16px;
}
.col-item .price-details .price-old {
  font-size:18px;
  text-decoration:line-through;
}
.col-item .separator {
  border-top: 1px solid #E1E1E1;
}

.col-item .clear-left {
  clear: left;
}
.col-item .separator a {
  text-decoration:none;
}
.col-item .separator p {
  margin-bottom: 0;
  margin-top: 6px;
  text-align: center;
}

.col-item .separator p i {
  margin-right: 5px;
}
.col-item .btn-add {
  width: 60%;
  float: left;
}
.col-item .btn-add a {
  display:inline-block !important;
}
.col-item .btn-add {
  border-right: 1px solid #E1E1E1;
}
.col-item .btn-details {
  width: 40%;
  float: left;
  padding-left: 10px;
}
.col-item .btn-details a {
  display:inline-block !important;
}
.col-item .btn-details a:first-child {
  margin-right:12px;
}</style>
  </style>
<title>product_table</title>
</head>
<body  style="background-image: url(resources/images/bg.jpg)">
<jsp:include page="header.jsp"></jsp:include>
 <div class="container">
 <div class="jumbotron">
  <h2 align="center">Products</h2>
  
  </div>
   <div class="container" id="jumbo">
<div >
	<!-- Dot Indicators -->
	<div>
	<div >
		<div class="row">
       <c:forEach items="${ProductList}" var="prod">
         <div class="col-sm-3">
        	<article class="col-item">
        		<div class="photo">
        			<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/${prod.prodId}.jpg" ></a>
        		</div>
        		<div class="info">
        			<div class="row">
        				<div class="price-details col-md-6">
        					<p class="details">${prod.prodDesc}</p>
        					<h1>${prod.prodName}</h1>
        					<span class="price-new"><i class="fa fa-inr"></i>${prod.price}</span>
        				</div>
        			</div>
        			<div class="separator clear-left">
        				<p class="btn-add">
        					<a href="${pageContext.request.contextPath}/addtocart/${prod.prodId}" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-shopping-cart"></span>Add to cart</a>
        				</p>
        				<p class="btn-details">
        					 <a href='ProductDetails/${prod.prodId}' class="btn btn-info btn-sm"><span class="glyphicon glyphicon-share"></span> More</a>

        				</p>
        			</div>
        			<div class="clearfix"></div>
        		</div>
        	</article>
        </div>
 </c:forEach>
  </div>
	</div>

	</div>
		
</div>
  </div>
</div>

<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>