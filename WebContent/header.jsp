<%@ page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title> ABDUS SALAM SE JAVA </title>

    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
     <link type="text/css" href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" rel="stylesheet">
    <link type="text/css" href="assets/css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
   
   
   <div class="container-fluid">
   		<div class="row">
   			 <nav class="navbar navbar-inverse">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="/Abdus_Salam_SE_JAVA">ABDUS SALAM SE JAVA</a>
			    </div>
			    <ul class="nav navbar-nav">
			     <%--  <li><a href="dashboard"> Dashboard </a></li> --%>
			      <li class="dropdown activeMainMenu">
			        <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Product
			        <span class="caret"></span></a>
			        <ul class="dropdown-menu">
			          <li><a href="addProduct.jsp"> Sell new product </a></li>
			          <li><a href="product"> View all sell product </a></li>
			        </ul>
			      </li>
			      <li><a href="about.jsp"> About</a></li>
			    </ul>
			  </div>
			</nav> 
   		</div>
   </div>
   