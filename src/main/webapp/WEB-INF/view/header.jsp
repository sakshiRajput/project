<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
     
    <%@page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %>    
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   


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
              <li><a href="#">ABOUT</a></li>
                <li><a href="#services">PROFILE</a></li>
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
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin <span class="caret"></span></a>
                   <ul class="dropdown-menu">
                         <li><a href="Product"><span class="glyphicon glyphicon-log-in"></span> Product</a></li>
                         <li><a href="Category"><span class="glyphicon glyphicon-log-in"></span> Category</a></li>
                         <li><a href="Supplier"><span class="glyphicon glyphicon-log-in"></span> Supplier</a></li>
                   </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="hasRole('ROLE_USER')" >
                <li><a href="${pageContext.request.contextPath}/all"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge badge-pill badge-primary">4</span></a></li>
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