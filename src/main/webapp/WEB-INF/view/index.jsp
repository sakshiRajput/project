<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    <%@page isELIgnored="false"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %> 
     <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Theme Made By www.w3schools.com - No Copyright -->
    <title>kaleva</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
    body {
            font: 400 15px Lato, sans-serif;
            line-height: 1.8;
            color: #818181;
    }
    h2 {
            font-size: 24px;
            text-transform: uppercase;
            color: #303030;
            font-weight: 600;
            margin-bottom: 30px;
    }
    h4 {
            font-size: 19px;
            line-height: 1.375em;
            color: #303030;
            font-weight: 400;
            margin-bottom: 30px;
    }
    .jumbotron {
            background-color: #59e4f9;
            color: #fff;
            padding: 100px 25px;
            font-family: Montserrat, sans-serif;
    }
    .container-fluid {
            padding: 60px 50px;
    }
    .bg-grey {
            background-color: #f6f6f6;
    }
    .logo-small {
            color: #0d6977;
            font-size: 50px;
    }
    .logo {
            color:#0d6977;
            font-size: 200px;
    }
    .thumbnail {
            padding: 0 0 15px 0;
            border: none;
            border-radius: 0;
    }
    .thumbnail img {
            width: 100%;
            height: 100%;
            margin-bottom: 10px;
    }
    .carousel-control.right, .carousel-control.left {
            background-image: none;
            color: #0d6977;
    }
    .carousel-indicators li {
            border-color: #0d6977;
    }
    .carousel-indicators li.active {
            background-color: #0d6977;
    }
    .item h4 {
            font-size: 19px;
            line-height: 1.375em;
            font-weight: 400;
            font-style: italic;
            margin: 70px 0;
    }
    .item span {
            font-style: normal;
    }
    .panel {
            border: 1px solid #0d6977;
            border-radius:0 !important;
            transition: box-shadow 0.5s;
    }
    .panel:hover {
            box-shadow: 5px 0px 40px rgba(0,0,0, .2);
    }
    .panel-footer .btn:hover {
            border: 1px solid #0d6977;
            background-color: #fff !important;
            color: #0d6977;
    }
    .panel-heading {
            color: #fff !important;
            background-color: #0d6977 !important;
            padding: 2px;
            border-bottom: 1px solid transparent;
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
    }
    .panel-footer {
            background-color: white !important;
    }
    .panel-footer h3 {
            font-size: 32px;
    }
    .panel-footer h4 {
            color: #aaa;
            font-size: 14px;
    }
    .panel-footer .btn {
             border: 1px solid #0d6977;
            margin: 15px 0;
            background-color:#fff;
            color: #0d6977;
    }
    .navbar {
            margin-bottom: 0;
            background-color: #59e4f9;
            z-index: 9999;
            border: 0;
            font-size: 12px !important;
            line-height: 1.42857143 !important;
            letter-spacing: 4px;
            border-radius: 0;
            font-family: Montserrat, sans-serif;
    }
    .navbar li a, .navbar .navbar-brand {
            color: #fff !important;
    }
    .navbar-nav li a:hover, .navbar-nav li.active a {
            color: #59e4f9 !important;
            background-color: #fff !important;
    }
    .navbar-default .navbar-toggle {
            border-color: transparent;
            color: #fff !important;
    }
    footer .glyphicon {
            font-size: 20px;
            margin-bottom: 20px;
            color:#0d6977;
    }
/*     .slideanim {visibility:hidden;} */
    .slide {
            animation-name: slide;
            -webkit-animation-name: slide;
            animation-duration: 1s;
            -webkit-animation-duration: 1s;
            visibility: visible;
    }
    @keyframes slide {
        0% {
            opacity: 0;
            transform: translateY(70%);
        }
        100% {
            opacity: 1;
            transform: translateY(0%);
        }
    }
    @-webkit-keyframes slide {
        0% {
            opacity: 0;
            -webkit-transform: translateY(70%);
        }
        100% {
            opacity: 1;
            -webkit-transform: translateY(0%);
        }
    }
    @media screen and (max-width: 768px) {
        .col-sm-4 {
            text-align: center;
            margin: 25px 0;
        }
        .btn-lg {
                width: 100%;
                margin-bottom: 35px;
        }
    }
    @media screen and (max-width: 480px) {
        .logo {
                font-size: 150px;
                font-family:cursive;
        }
    }
    </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#myPage"><span class="glyphicon glyphicon-cutlery"></span>Kaleva<span class="glyphicon glyphicon-grain"></span></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li><a href="#about">ABOUT</a></li>
                <li><a href="#services">SERVICES</a></li>
                <li><a href="#portfolio">CATEGORY</a></li>
                <li><a href="#contact">CONTACT</a></li>
                <li  class="dropdown">
                 <a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
                   <ul class="dropdown-menu">
                       <c:forEach items="${categoryList}" var="cat">
                          <li><a href="${pageContext.request.contextPath}/productByCategory/${cat.catId}">${cat.catId}</a></li>
                      </c:forEach>
                  </ul>
                 </li>
                  <sec:authorize access="hasRole('ROLE_ADMIN')" >
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin <span class="caret"></span></a>
                   <ul class="dropdown-menu">
                         <li><a href="Product"><span class="glyphicon glyphicon-log-in"></span> Product</a></li>
                         <li><a href="Category"><span class="glyphicon glyphicon-log-in"></span> Category</a></li>
                         <li><a href="Supplier"><span class="glyphicon glyphicon-log-in"></span> Supplier</a></li>
                   </ul>
                </li>
                </sec:authorize>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="hasRole('ROLE_USER')" >
                <li><a href="${pageContext.request.contextPath}/all"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge badge-pill badge-primary">${numberProducts}</span></a></li>
		        </sec:authorize>
		        <sec:authorize access="isAuthenticated()" >
                <li><a href="${pageContext.request.contextPath}/LogOut">Logout</a></li>
		        </sec:authorize>
		       <sec:authorize access="isAnonymous()">
	        	 <li><a href="${pageContext.request.contextPath}/Login"><span class="glyphicon glyphicon-log-in"></span> LOGIN</a></li>
                
	         	<li><a href="${pageContext.request.contextPath}/Register"><span class="glyphicon glyphicon-user"></span> REGISTER</a></li>
		      </sec:authorize>
            </ul>
        </div>
    </div>
</nav>

<div class="jumbotron text-center">
    <h1>Kaleva Sweets</h1>
    <p>We specialize in sweets</p>
    <h3> <sec:authorize access="isAuthenticated()">Welcome :<i>${pageContext.request.userPrincipal.name}</i></sec:authorize></h3>

</div>

<!-- carousel -->
       <div id="myCarousel" class="carousel slide container" data-ride="carousel"  >
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
       <img src="resources/images/swt7.jpg" alt="" style="width:100%" >
    </div>

    <div class="item">
      <img src="resources/images/swt2.jpg" alt="Magazine holder" style="width:100%">
    </div>

    <div class="item">
      <img src="resources/images/swt3.jpg" alt="wall art" style="width:100%">
    </div>

    <div class="item">
     <img src="resources/images/swt4.jpg" alt="candle stand" style="width:100%">
    </div>

    <div class="item">
      <img src="resources/images/swt5.jpg" alt="wall mirror" style="width:100%">
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
<!-- Container (About Section) -->
<div id="about" class="container-fluid">
    <div class="row">
        <div class="col-sm-8">
            <h2>About Kaleva</h2><br>
            <h4>Hygiene is the buzz word in our kitchens with modernized equipment keeping a constant check on quality and cleanliness. However, care is taken that there is no compromise on  taste and aroma as it was centuries ago.</h4><br>
             <p>Kaleva,  located in heart of Delhi, stocks close to 1000 varieties of sweets, namkeens and other traditional eatables.
   Be it the Bengali Rossogolla, Rajasthani Ghevar, Karachi Halwa or the Mysore Pak, we at Kaleva give you the very best and exotic Indian taste.
    Sweets that are made in the traditional way passed on to generations for the past 500 years. Ours is a family involved in business of preserving the traditional method of sweet making.
    We are the fourth generation of Agarwals, initially from Bikaner in Rajasthan, presently running   business..
    </p>

            <br><button class="btn btn-default btn-lg">Get in Touch</button>
        </div>
        <div class="col-sm-4">
             <img src="resources/images/png4.png" alt="Paris" width="400" height="300">
        </div>
    </div>
</div>

<div class="container-fluid bg-grey">
    <div class="row">
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-globe logo slideanim"></span>
        </div>
        <div class="col-sm-8">
            <h2>Our Speciality</h2><br>
            <h4><strong>HYGIENE:</strong> Hygiene is the buzz word in our kitchens with modernized equipment keeping a constant check on quality and cleanliness. However, care is taken that there is no compromise on  taste and aroma as it was centuries ago</h4><br>
          <p>  Kaleva specializes in sweets that   remind  you of a forgotten era with Raj Bhog, Rasmalai, Pista Burfi,   Kaju roll and more than 15 varieties of ladoo.
    Sweets that have been savored by the royals that have ruled the country in the past.
Kaleva's preparation involves the most ethnic way of sweet making using the traditional method while keeping your health as a priority.</p>
        </div>
    </div>
</div>

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center">
    <h2>SERVICES</h2>
    <h4>What we offer</h4>
    <br>
    <div class="row slideanim">
        <div class="col-sm-4">
             <i class="glyphicon glyphicon-send logo-small"></i>

            <h4>EXPORTING</h4>
            <p></p>
        </div>
        <div class="col-sm-4">
            <i class="glyphicon glyphicon-cutlery logo-small"></i>

            <h4>CATERING</h4>
            <p></p>
        </div>
        <div class="col-sm-4">
            <span class="glyphicon glyphicon-home logo-small"></span>
            <span class="glyphicon glyphicon-gift logo-small"></span>
            <h4>HOME DELIVERY</h4>
            <p></p>
        </div>
    </div>
    <br><br>
    <div class="row slideanim">
        <h2 align="center">What our customers say</h2>
    <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <h4>"This Shop is the best. I am so happy with the services!"<br><span>XYZ , viksapuri</span></h4>
            </div>
            <div class="item">
                <h4>"One word... WOW!!"<br><span>John ,Rohini</span></h4>
            </div>
            <div class="item">
                <h4>"Loved the taste and hygiene... "<br><span>Dexter , New Delhi</span></h4>
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    </div>
</div>

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
    <h2>CATEGORY</h2><br>
    <h4>What we have</h4>
    <div class="row text-center slideanim">
      <c:forEach items="${categoryList}" var="cat">
        <div class="col-sm-4">
            <div class="thumbnail">
<!--                 <img src="paris.jpg" alt="Paris" width="400" height="300"> -->
                     <br>
                     <p><strong><a href="${pageContext.request.contextPath}/productByCategory/${cat.catId}">${cat.catId}</a></strong></p>
<!--                 <p>Yes, we built Paris</p> -->
            </div>
        </div>
     </c:forEach>
      
    </div><br>



</div>

<!-- Container (Pricing Section) -->
<div id="pricing" class="container-fluid">
    <div class="text-center">
        <h2>New Products</h2>
        <h4>Have a look...</h4>
    </div>
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
						  <button class="btn btn-lg"><a href="<c:url value='addtocart/${prod.prodId}'/>" ><span class="glyphicon glyphicon-shopping-cart"></span>Add to cart</a>
        				  </button>
        				 <button class="btn btn-lg"> <a href="${pageContext.request.contextPath}/ProductDetails/${prod.prodId}"><span class="glyphicon glyphicon-share"></span> More</a>
						</button>
        			
               </div>
            </div>
        </div>

       </div>
 </c:forEach>
      
      
        
     </div>
</div>     

     
 

<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
    <h2 class="text-center">CONTACT</h2>
    <div class="row">
        <div class="col-sm-5">
            <p>Contact us and we'll get back to you as soon as possible.</p>
            <p><span class="glyphicon glyphicon-map-marker"></span> 109-Gole market,New Delhi-110001</p>
            <p><span class="glyphicon glyphicon-phone"></span> 91-01(345782)/3360968</p>
            <p><span class="glyphicon glyphicon-envelope"></span> xyz@kaleva.com</p>
        </div>
        <div class="col-sm-7 slideanim">
          <p>items</p>
                	<ul>
                    	<li class="line_rv">Sweets</li>
                        <li class="line_rv">Namkeen</li>
                        <li class="line_rv">Dry fruits</li>
                        <li class="line_rv">Pickles</li>
                        <li class="line_rv">Snacks</li>
                        <li class="line_rv">Gift Packs</li>
                        <li class="line_rv">Cold Drinks</li>
                        <li class="line_rv">Sharbat</li>
                    </ul>  
           
                
         
        </div>
    </div>
</div>

<footer class="container-fluid text-center">
    <a href="#myPage" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>
</footer>

<!-- Add Google Maps -->
<!-- -<div id="googleMap" style="height:400px;width:100%;"> -->





<footer class="container-fluid text-center">
    <a href="#myPage" title="To Top">
        <span class="glyphicon glyphicon-chevron-up"></span>
    </a>
    <p> Made By SakshiRajput</p>
</footer>

<script>
$(document).ready(function(){
    // Add smooth scrolling to all links in navbar + footer link
    $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {
            // Prevent default anchor click behavior
            event.preventDefault();

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 900, function(){

                // Add hash (#) to URL when done scrolling (default click behavior)
                window.location.hash = hash;
            });
        } // End if
    });

    $(window).scroll(function() {
        $(".slideanim").each(function(){
            var pos = $(this).offset().top;

            var winTop = $(window).scrollTop();
                if (pos < winTop + 600) {
                    $(this).addClass("slide");
                }
        });
    });
})
</script>

</body>
</html>
