<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
     <link href="<c:url value='/css/shop-homepage.css'/>" rel="stylesheet">
    

    <!-- Custom CSS -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
  <body>
    <div class="container">
       
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
          <tiles:insertAttribute name="menu"/>
        </nav>
        
        <header class="row col">
          <tiles:insertAttribute name="header"/>
        
        </header>
      <main class="row col">
      <div class="row col">
        <aside class="col-md-3">
           <tiles:insertAttribute name="aside"/>
        </aside>
      </div> <br>
      
      <div class="row col">
       <article class="col-md-12">
         <tiles:insertAttribute name="body"/>
        </article>
      </div>
       
      </main>
        <footer class="bg-dark col row"> <tiles:insertAttribute name="footer"/></footer>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="<c:url value='/js/jquery.js'/>"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    
  </body>
</html>