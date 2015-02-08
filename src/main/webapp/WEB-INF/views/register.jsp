<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Friends or foe - Sign up page!</title>
  <link rel='stylesheet prefetch' href='resources/css/css.css'>
<style>
html, body {
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
	margin-top: 50px;
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

.front, .back {
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

input[type=text], input[type=password] {
	color: #FFF;
	background: #68add8; /* Old browsers */
	background: linear-gradient(45deg, #68add8 0%, #8cbede 100%); /* W3C */
	width: 250px;
	height: 40px;
	margin: 0 auto 10px auto;
	font-size: 14px;
	padding-left: 15px;
	border: none;
	box-shadow: -3px 3px #679acb;
	-webkit-appearance: none;
	border-radius: 0;
	border-top: 1px solid #92c5e2;
	border-right: 1px solid #92c5e2;
}

input::-webkit-input-placeholder {
	color: #FFF;
}

input:focus {
	outline: none;
}

input[type=submit] {
	color: #fff;
	background-color: #3f88b8;
	font-size: 14px;
	height: 40px;
	border: none;
	margin: 0 auto 0 17px;
	padding: 0 20px 0 20px;
	-webkit-appearance: none;
	border-radius: 0;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #3f7ba2;
}

input[type=button] {
	color: #fff;
	background-color: #3f88b8;
	font-size: 14px;
	height: 40px;
	border: none;
	margin: 0 auto 0 17px;
	padding: 0 20px 0 20px;
	-webkit-appearance: none;
	border-radius: 0;
	cursor: pointer;
}

input[type=botton]:hover {
	background-color: #3f7ba2;
}
a {
	color: #1c70a7;
	font-weight: 600;
	font-size: 12px;
	text-decoration: none;
}

a:hover {
	color: #3f7ba2;
}

.hint {
	width: 250px;
	dislay: block;
	margin: 80px auto 0 auto;
	text-align: left;
}

.hint p {
	padding: 5px 0 5px 0;
	color: #FFF;
	font-weight: 600;
	font-size: 20px;
}

.hint p span {
	font-weight: 300;
	font-size: 16px;
}

.error {
	color: #ff0000;
}

.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
</style>
<script type="text/javascript">
	 function validateForm()
	 {
		 if(document.forms[0]["name"].value.length<=0 ){
			 alert("Please enter user name");
			 return false;
		 }
		 if(document.forms[0]["loginId"].value.length<=0){
			 alert("Please enter login id");
			 return false;
		 }		
		 if(document.forms[0]["password"].value.length<=0){
			 alert("Please enter password");
			 return false;
		 }
		 if(document.forms[0]["repwd"].value.length<=0){
			 alert("Please enter your re enter password");
			 return false;
		 }	
		 if(document.forms[0]["repwd"].value!=document.forms[0]["password"].value){
			 alert("Your password and re enter password are not same");
			 return false;
		 }	
		 var x=document.forms[0]["email"].value;
		 var atpos=x.indexOf("@");
		 var dotpos=x.lastIndexOf(".");
		 if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
		   {
		   alert("Not a valid e-mail address");
		   return false;
		   }
	 }
	 function loginPage(){
		 document.location='<%=request.getContextPath()%>/login-user'
	 }
 </script>
</head>
<body>
	<h2>Sign Up</h2>
	<h4>It's free!</h4>
	<c:if test="${error!=null}">
		<div class="errorblock">
			<font color="red">${error}</font>
		</div>
	</c:if>
	<form:form method="POST" action="register" onsubmit="return validateForm();">
		<form:input path="name" value="${user.name}" placeholder='Full Name' size="400"/>
		<form:input path="loginId" value="${user.loginId}" placeholder='User Name' />
		<form:password path="password"  value="${user.password}" placeholder='Password' />
		<form:password path="" name="repwd" value="${user.password}" placeholder='Re enter you password' />
		<form:input path="email" value="${user.email}" placeholder='Email' />
		<form:hidden path="type" value="0" />
		<div class="_58mq _5dbb" id="u_0_b">
		<div class="mtm mbs _58mr">Birthday</div>
		<div class="_5k_5">
			<span class="_5k_4" data-type="selectors"
				data-name="birthday_wrapper" id="u_0_c"><span>
		<form:select name="birthday_month" path="month" class="_5dba">
			<option	value="0" selected="1">Month</option>
						<option value="1">Jan</option>
						<option value="2">Feb</option>
						<option value="3">Mar</option>
						<option value="4">Apr</option>
						<option value="5">May</option>
						<option value="6">Jun</option>
						<option value="7">Jul</option>
						<option value="8">Aug</option>
						<option value="9">Sep</option>
						<option value="10">Oct</option>
						<option value="11">Nov</option>
						<option value="12">Dec</option></form:select>
		<form:select name="birthday_day" path="day" class="_5dba">
			<option value="0" selected="1">Day</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</form:select>
					<form:select name="birthday_year" path="year" class="_5dba">
						<option value="0" selected="1">Year</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
						<option value="1980">1980</option>
						<option value="1979">1979</option>
						<option value="1978">1978</option>
						<option value="1977">1977</option>
						<option value="1976">1976</option>
						<option value="1975">1975</option>
						<option value="1974">1974</option>
						<option value="1973">1973</option>
						<option value="1972">1972</option>
						<option value="1971">1971</option>
						<option value="1970">1970</option>
						<option value="1969">1969</option>
						<option value="1968">1968</option>
						<option value="1967">1967</option>
						<option value="1966">1966</option>
						<option value="1965">1965</option>
						<option value="1964">1964</option>
						<option value="1963">1963</option>
						<option value="1962">1962</option>
						<option value="1961">1961</option>
						<option value="1960">1960</option>
						<option value="1959">1959</option>
						<option value="1958">1958</option>
						<option value="1957">1957</option>
						<option value="1956">1956</option>
						<option value="1955">1955</option>
						<option value="1954">1954</option>
						<option value="1953">1953</option>
						<option value="1952">1952</option>
						<option value="1951">1951</option>
						<option value="1950">1950</option>
						<option value="1949">1949</option>
						<option value="1948">1948</option>
						<option value="1947">1947</option>
						<option value="1946">1946</option>
						<option value="1945">1945</option>
						<option value="1944">1944</option>
						<option value="1943">1943</option>
						<option value="1942">1942</option>
						<option value="1941">1941</option>
						<option value="1940">1940</option>
						<option value="1939">1939</option>
						<option value="1938">1938</option>
						<option value="1937">1937</option>
						<option value="1936">1936</option>
						<option value="1935">1935</option>
						<option value="1934">1934</option>
						<option value="1933">1933</option>
						<option value="1932">1932</option>
						<option value="1931">1931</option>
						<option value="1930">1930</option>
						<option value="1929">1929</option>
						<option value="1928">1928</option>
						<option value="1927">1927</option>
						<option value="1926">1926</option>
						<option value="1925">1925</option>
						<option value="1924">1924</option>
						<option value="1923">1923</option>
						<option value="1922">1922</option>
						<option value="1921">1921</option>
						<option value="1920">1920</option>
						<option value="1919">1919</option>
						<option value="1918">1918</option>
						<option value="1917">1917</option>
						<option value="1916">1916</option>
						<option value="1915">1915</option>
						<option value="1914">1914</option>
						<option value="1913">1913</option>
						<option value="1912">1912</option>
						<option value="1911">1911</option>
						<option value="1910">1910</option>
						<option value="1909">1909</option>
						<option value="1908">1908</option>
						<option value="1907">1907</option>
						<option value="1906">1906</option>
						<option value="1905">1905</option>
					</form:select></span></span>
					
		</div>
		</div>
		<div class="mtm _5wa2 _5dbb" id="u_0_f">
			<span class="_5k_3" data-type="radio" data-name="gender_wrapper" id="u_0_g">
			<span class="_5k_2 _5dba">
				<form:radiobutton path="sex" value="1" id="u_0_d" /><form:label path="" class="_58mt" for="u_0_d">Female</form:label></span>
			<span class="_5k_2 _5dba">
				<form:radiobutton path="sex" value="2" id="u_0_e" /><form:label path="" class="_58mt" for="u_0_e">Male</form:label></span></span>
				<i class="_5dbc _5k_6 img sp_9vUokIDmpP8 sx_116e5b"></i><i
				class="_5dbd _5k_7 img sp_9vUokIDmpP8 sx_fa2374"></i>
		</div>
		<div class="_58mu" id="u_0_h">
			<p class="_58mv">
				By clicking Sign Up, you agree to our <b>Terms</b> and that you have read our
				<b>Data Use	Policy</b>, including our <b>Cookie Use</b>.
			</p>
		</div>
		<div class="clearfix">
			<div class='login'>
				<input type="submit" value="Signup" />&nbsp;
				<input type="button" onclick="loginPage()" value="Login" />
			</div>
			</div>
			<%-- <table border="1" style="border-color: teal; border-width: 1pt;border-spacing: 0pt">
       <tr style="background: teal;">
           <td><form:label path="name">User Name:</form:label></td>
           <td><form:input path="name" value="${user.name}"/></td>
       </tr>
       <tr style="background: teal;">
           <td><form:label path="loginId">Login Id:</form:label></td>
           <td><form:input path="loginId" value="${user.loginId}"/></td>
       </tr>       
       <tr style="background: teal;">
           <td><form:label path="password">User Password:</form:label></td>
           <td><form:password path="password" value="${user.password}"/></td>
       </tr>
       <tr style="background: teal;">
           <td><form:label path="email">User email:</form:label></td>
           <td><form:input path="email" value="${user.email}"/></td>
           <form:hidden path="type" value="0"/>
       </tr>
       <tr style="background: teal;">
			<td colspan="2" align="left">
		<c:if test="${error!=null}">
		<div class="errorblock"><font color="red">${error}</font></div></c:if></td></tr>
          <tr>
         <td colspan="2" style="background: teal;"><input type="submit" value="Register"/>&nbsp;<a href="<%=request.getContextPath()%>/login-user" shape="rect" style="color:buttonface;">Login</a></td>
        </tr>
  	 </table>  --%>
	</form:form>

</body>
</html>
