<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">

  <title>Welcome to Friends or foe!</title>

  <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">

  <link rel='stylesheet prefetch' href='resources/css/css.css'>

    <style>
html,
body {
  width: 100%;
  height: 100%;
}
body {
  margin: 0 auto;
  display: table;
  text-align: center;
  font-family: 'Open Sans', sans-serif;
  background: #81b5d6;
  max-width: 33em;
}
.wrap {
  margin-top:50px;
}

.flip-container {
  perspective: 1000;
  border-radius: 50%;
  margin: 0 auto 10px auto;
}

.logged-in {
	transform: rotateY(180deg);
}

.flip-container, .front, .back, .back-logo {
	width: 130px;
	height: 130px;
}

.flipper {
	transition-duration: 0.6s;
	transform-style: preserve-3d;
}

.front, 
.back {
	backface-visibility: hidden;
	position: absolute;
	top: 0;
	left: 0;
  background-size: cover;
}

.front {
	background: url(resources/images/Flip_Img.png) 0 0 no-repeat;
}

.back {
	transform: rotateY(180deg);
	background: url(resources/images/Flip_Img2.png) 0 0 no-repeat;
}

h1 {
  font-size: 22px;
  color: #FFF;
}
h1 span {
  font-weight: 300;
}
input[type=text],
input[type=password] {
  color:#FFF;
  background: #68add8; /* Old browsers */
  background: linear-gradient(45deg,  #68add8 0%,#8cbede 100%); /* W3C */
  width:250px;
  height:40px;
  margin: 0 auto 10px auto;
  font-size:14px;
  padding-left:15px;
  border:none;
  box-shadow: -3px 3px #679acb ;
  -webkit-appearance:none;
  border-radius:0;
  border-top: 1px solid #92c5e2;
  border-right: 1px solid #92c5e2;
}
input::-webkit-input-placeholder { 
  color: #FFF;
}
input:focus {
  outline:none;
}
input[type=submit] {
    color: #fff;
    background-color:#3f88b8;
    font-size: 14px;
    height: 40px;
    border: none;
    margin: 0 auto 0 17px;
    padding: 0 20px 0 20px;
    -webkit-appearance:none;
    border-radius:0;
    cursor: pointer;
}
input[type=submit]:hover {
  background-color:#3f7ba2;
}
a {
  color:#1c70a7;
  font-weight:600;
  font-size:12px;
  text-decoration:none;
}
a:hover {
  color:#3f7ba2;
}

.hint
{
  width:250px;
  dislay:block;
  margin:80px auto 0 auto;
  text-align:left;
}

.hint p
{
  padding: 5px 0 5px 0;
  color:#FFF;
  font-weight:600;
  font-size:20px;
}

.hint p span
{
  font-weight:300;
  font-size:16px;
}
.error {
	color: #ff0000;
}

.errorblock{
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding:8px;
	margin:16px;
}
</style>

    <script src="resources/js/prefixfree.min.js"></script>

</head>

<body>

  <!--    
        JS Credits to bartveneman
        Comments? Feel free!
 -->

<div class="wrap">

  <div class="flip-container" id='flippr'>
    <div class="flipper">
      <div class="front"></div>
      <div class="back"></div>
    </div>
  </div>

  <h1 class="text" id="welcome">Welcome. <span>please login.</span></h1>

  <form:form method='post' id="loginForm" name="loginForm" commandName="loginForm" action="/fof/login-user" >
  <form:errors path="*" cssClass="errorblock" element="div"/>
	<br clear="all" />
	<br clear="all" />
	<%
//System.out.println(request.getAttribute("test"));
int failedAttempts = request.getAttribute("failedtimes")!=null?(Integer)request.getAttribute("failedtimes"):0;
%>
    <form:input type='text'  path='userId' placeholder='Username' autocomplete="false"/>
    <form:input type='password' path='password' placeholder='Password' autocomplete="false"/>

    <div class='login'>
      <a href="forgot-pwd"><i class="icon-cog"></i> I've forgotten my password</a>
      <input type="submit" value="Login" />
    </div><!-- /login -->
    <h4 class="text" id="welcome1"><a href="register"><i class="icon-cog"></i> Create an Account for free</a></span></h4>
    
  </form:form>
</div><!-- /wrap -->

<div class='hint'>
<p> Hint:<br>
    <span>Username = jennifer<br> 
      Password = password</span></p>
</div>

  <script src='resources/js/jquery.js'></script>

  <script src="resources/js/index.js"></script>

</body>

</html>