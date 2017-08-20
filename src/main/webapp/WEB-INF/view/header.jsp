<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
     
    <%@page isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sp" %>    
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   

<nav class="navbar navbar-inverse"  >
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">KALEVA SWEETS</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">Home</a></li>
                <li><a href="Profile">Profile</a></li>
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
<!--                 <li><a href="Admin">Admin</a></li> -->
            </ul>
            <ul class="nav navbar-nav navbar-right">
<!--                   <li><a href="Adddata">Admin</a></li>   -->
                   <sec:authorize access="isAuthenticated()">
    <li class="nav-item" style="color:powderblue"> <br>Welcome <i>${pageContext.request.userPrincipal.name}</i></li>
       </sec:authorize>
       
        <sec:authorize access="hasRole('ROLE_USER')" >
                    <li class="nav-item"> <a href="${pageContext.request.contextPath}/mycart/all"><span class="glyphicon glyphicon-shopping-cart"></span><span class="badge badge-pill badge-primary">${numberProducts}</span></a></li>
                </sec:authorize>
                
                 <sec:authorize access="isAuthenticated()" >
                    <li class="nav-item"> <a href="${pageContext.request.contextPath}/LogOut">Logout</a></li>
                </sec:authorize>
               
                <sec:authorize access="isAnonymous()">
                         <li><a href="${pageContext.request.contextPath}/Login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li> 
                   		<li><a href="${pageContext.request.contextPath}/Register"><span class="glyphicon glyphicon-user"></span> Register</a></li>
         </sec:authorize>   
                  
<%--                   <c:if test="${pageContext.request.userPrincipal.name==null}"> --%>
<%--                  <li><a href="${pageContext.request.contextPath}/Login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li> --%>
<%--                 <li><a href="${pageContext.request.contextPath}/Register"><span class="glyphicon glyphicon-user"></span> Register</a></li> --%>
<%--                 </c:if> --%>
<%--                 <c:if test="${pageContext.request.userPrincipal.name!=null}"> --%>
<%--                   <li><a>Welcome: ${pageContext.request.userPrincipal.name} </a></li>   --%>
<!--                  <li><a href="Logout">Logout</a></li>   -->
<%--                 </c:if> --%>
            </ul>
        </div>
    </div>
    
     
</nav>
