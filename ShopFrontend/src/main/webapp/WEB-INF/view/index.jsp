
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head >
  <title>Kaleva</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>

  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
 </style>
</head>

<body>

<jsp:include page="header.jsp"></jsp:include>
   <br>

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
   <footer>
                <div class="col-lg-12 text-center">
                    <p>Copyright &copy; Your Website 2014</p>
               
        </div>
    </footer>
   
</body>
</html>
