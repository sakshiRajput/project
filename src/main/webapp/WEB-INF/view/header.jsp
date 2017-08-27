<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
     
    <%@page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %>    
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   

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
           min-height: 10px;
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
        }
    }
    </style>





<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#myPage">Logo</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li><a href="${pageContext.request.contextPath}/"><span class="glyphicon glyphicon-home"></span>HOME</a></li>
              
                <li><a href="#">CATEGORY</a></li>
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