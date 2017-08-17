
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %> 
<!DOCTYPE html>
<html lang="en">
<head >
  <title>Kaleva</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
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
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
   <br>
    <div class="container-fluid" >
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
         <!-- Indicators -->
        <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" >

    <div class="item active">
       <img src="resources/images/swt1.jpg" alt="" width="460" height="345" >
    </div>

    <div class="item">
      <img src="resources/images/swt2.jpg" alt="Magazine holder" width="460" height="345">
    </div>

    <div class="item">
      <img src="resources/images/swt3.jpg" alt="wall art" width="460" height="345">
    </div>

    <div class="item">
     <img src="resources/images/swt4.jpg" alt="candle stand" width="460" height="345">
    </div>

    <div class="item">
      <img src="resources/images/swt5.jpg" alt="wall mirror" width="460" height="345">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
    </div>
              <br>
 <div class="container" id="jumbo">
  <div class="jumbotron">
    <h1>Kaleva Sweets And Namkeen</h1>
    <p>Sweets add a special touch to every occasion.
     And in India, sweets form an integral part of celebration, be it marriage, birth of a child or festivals.
      And we, at Kaleva, have been trying to make every occasion a special one  with our sweets.</p>
  </div>
  <p> KALEVA means sweets or snacks served at any and every occasion.       </p>
  <p> At Kaleva, We have been preparing sweets from generation to generations in the  traditional method, giving  hygiene the top priority.
          So the next time you get the urge to eat, make sure it is from Kaleva.</p>
 </div>
 
  <h3 class="title"><span>New Products</span></h3>
   <div class="container" id="jumbo">
<div id="myCarouselOne" class="carousel slide">
	<!-- Dot Indicators -->
	<div class="carousel-inner">
	<div class="item active">
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
        					<a href="#" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-shopping-cart"></span>Add to cart</a>
        				</p>
        				<p class="btn-details">
        					 <a href="<c:url value='ProductDetails/${prod.prodId}'/>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-share"></span> More</a>

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
		<a class="left carousel-control" href="#myCarouselOne" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
		<a class="right carousel-control" href="#myCarouselOne" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
</div>
  </div>
   <footer>
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; Your Website 2017</p>
               
        </div>
    </footer>
   
</body>
</html>