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
 
<title>product_table</title>
</head>
<body  style="background-image: url(resources/images/bg.jpg)">
<jsp:include page="header.jsp"></jsp:include>
<br><br>

<!--  <div class="jumbotron" > -->
<!--   <h2 align="center">Products</h2> -->
  

<!--    <div class="container" id="jumbo"> -->
<!-- <div > -->

                <div class="panel-heading">
                    <h1 align="center">Products</h1>
                </div>
	<!-- Dot Indicators -->
	
	<br><br>
	<div>
	<div class="container" >
	
	  <div class="row slideanim">

      <c:forEach items="${ProductList}" var="prod">
            <div class="item">
        <div class="col-sm-4 col-xs-12">
            <div class="panel panel-default text-center">
                <div class="panel-heading">
                    <h1>${prod.prodName}</h1>
                </div>
                <div class="panel-body">
                 <img src="${pageContext.request.contextPath}/resources/images/${prod.prodId}.jpg" alt="Paris" width="300" height="200">
                </div>
                <div class="panel-footer">
                    <h3><span class="price-new"><i class="fa fa-inr"></i>${prod.price}</span></h3>
<!--                     <button class="btn btn-lg">Sign Up</button> <button class="btn btn-lg">Sign Up</button> -->
						  <button class="btn btn-lg"><a href="${pageContext.request.contextPath}/addtocart/${prod.prodId}" ><span class="glyphicon glyphicon-shopping-cart"></span>Add to cart</a>
        				  </button>
        				 <button class="btn btn-lg"> <a href='ProductDetails/${prod.prodId}'><span class="glyphicon glyphicon-share"></span> More</a>
						</button>
        			
               </div>
            </div>
        </div>

       </div>
 </c:forEach>
      
      
        
     </div>
	
	
	
	
<!-- 		<div class="row"> -->
<%--        <c:forEach items="${ProductList}" var="prod"> --%>
<!--          <div class="col-sm-3"> -->
<!--         	<article class="col-item"> -->
<!--         		<div class="photo"> -->
<%--         			<a href="#"> <img src="${pageContext.request.contextPath}/resources/images/${prod.prodId}.jpg" ></a> --%>
<!--         		</div> -->
<!--         		<div class="info"> -->
<!--         			<div class="row"> -->
<!--         				<div class="price-details col-md-6"> -->
<%--         					<p class="details">${prod.prodDesc}</p> --%>
<%--         					<h1>${prod.prodName}</h1> --%>
<%--         					<span class="price-new"><i class="fa fa-inr"></i>${prod.price}</span> --%>
<!--         				</div> -->
<!--         			</div> -->
<!--         			<div class="separator clear-left"> -->
<!--         				<p class="btn-add"> -->
<%--         					<a href="${pageContext.request.contextPath}/addtocart/${prod.prodId}" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-shopping-cart"></span>Add to cart</a> --%>
<!--         				</p> -->
<!--         				<p class="btn-details"> -->
<%--         					 <a href='ProductDetails/${prod.prodId}' class="btn btn-info btn-sm"><span class="glyphicon glyphicon-share"></span> More</a> --%>

<!--         				</p> -->
<!--         			</div> -->
<!--         			<div class="clearfix"></div> -->
<!--         		</div> -->
<!--         	</article> -->
<!--         </div> -->
<%--  </c:forEach> --%>
<!--   </div> -->
	</div>

	</div>
		


<jsp:include page="Footer.jsp"></jsp:include>
</body>
</html>