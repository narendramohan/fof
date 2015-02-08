<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SocialNet | Contact</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="resources/css/style1.css" rel="stylesheet" type="text/css" />
<!-- <script type="text/javascript" src="resources/js/jquery-1.3.2.min.js"></script> -->
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>
<script type="text/javascript" src="resources/js/cufon-yui.js"></script>
<script type="text/javascript" src="resources/js/arial.js"></script>
<script type="text/javascript" src="resources/js/cuf_run.js"></script>
<script src="resources/js/oasis.stars.js"></script>
<script src="resources/js/jquery.autocomplete.min.js"></script>
		<link href="resources/css/oasis.stars.css" rel="stylesheet"/>
<script>
$(document).ready(function() {
	var start = new Oasis.Stars($('#vfm'), { currentScore: 0});
	var start1 = new Oasis.Stars($('#ras'), { currentScore: 0});
	var start2 = new Oasis.Stars($('#yrp'), { currentScore: 0});
	
	$('#productName').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getProducts',
		paramName: "productName",
		delimiter: ",",
	   transformResult: function(response) {
 
		return {      	
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {
 
		      return { value: item.productName, data: item.productId };
		   })
 
		 };
 
            }
 
	 });
});
</script>
</head>
<body>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="logo">
        <h1><a href="#"><span>Friends or foe</span> <small>social page</small></a></h1>
      </div>
      <div class="search">
        <form:form method="get" id="search" action="friendsSearch">
          <span>
          <input type="text" value="Search..." name="s" id="s" />
          <input name="searchsubmit" type="image" src="resources/images/search.gif" value="Go" id="searchsubmit" class="btn"  />
          </span>
        </form:form>
        <!--/searchform -->
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      <!-- <div class="menu_nav">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="support.html">Support</a></li>
          <li><a href="about.html">About Us</a></li>
          <li><a href="blog.html">Blog</a></li>
          <li class="active"><a href="contact.html">Contact Us</a></li>
        </ul>
        <div class="clr"></div>
      </div> -->
            <div class="menu_nav">
        <ul>
          <li><a href="home">Home</a></li>
          <li><a href="friends">Friends</a></li>
          <li><a href="allreviews">Reviews</a></li>
          <li class="active"><a href="allProducts">Products</a></li>
          <li><a href="logout">Logout</a></li>
         <!--  <li><a href="blog.html">Blog</a></li>
          <li><a href="contact.html">Contact Us</a></li> -->
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg"><img src="resources/images/New-Product.jpg" width="923" height="291" alt="" /></div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
          <div class="article">
            <h2><span>Here you can create new product</span></h2>
            <div class="clr"></div>
            <p>This new product will be available to the product list.</p>
          </div>
          <div class="article">
            <h2><span>New</span> Product</h2>
            <div class="clr"></div>
            <form:form commandName="product" action="saveProduct" method="post" id="sendemail">
              <ol>
                <li>
                  <label for="name">Product Name (required)</label>
                  <form:input path="productName" id="product.productName" name="product.productName" class="text" />
                 
                </li>
                <li>
                  <label for="email">Product Description (required)</label>
                  <form:input path="productDescription" id="product.productDescription" name="product.productDescription" class="text" />
                </li>

                <li>
                  <label for="Manu">Manufacturer</label>
                  <form:input path="manufacturer" id="product.manufacturer" name="product.manufacturer" class="text" />
                </li>
                <li>
                  <label for="Manu">Type</label>
                  <input path="type" id="product.type" name="product.type" class="text" />
                </li>
                <li>
                  <input type="image" name="imageField" id="imageField" src="resources/images/submit.gif" class="send" />
                  <div class="clr"></div>
                </li>
               
              </ol>
            </form:form>
          </div>
        </div>
        <div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span>Sidebar</span> Menu</h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li><a href="home">Home</a></li>
	          <li><a href="friends">Friends</a></li>
	          <li><a href="allreviews">Reviews</a></li>
	          <li class="active"><a href="allProducts">Products</a></li>
	         <!--  <li><a href="blog.html">Blog</a></li>
	          <li><a href="contact.html">Contact Us</a></li> -->
            </ul>
          </div>
          <!-- <div class="gadget">
            <h2 class="star"><span>Sponsors</span></h2>
            <div class="clr"></div>
            <ul class="ex_menu">
              <li><a href="http://www.dreamtemplate.com">DreamTemplate</a><br />
                Over 6,000+ Premium Web Templates</li>
              <li><a href="http://www.templatesold.com/">TemplateSOLD</a><br />
                Premium WordPress &amp; Joomla Themes</li>
              <li><a href="http://www.imhosted.com">ImHosted.com</a><br />
                Affordable Web Hosting Provider</li>
              <li><a href="http://www.myvectorstore.com">MyVectorStore</a><br />
                Royalty Free Stock Icons</li>
              <li><a href="http://www.evrsoft.com">Evrsoft</a><br />
                Website Builder Software &amp; Tools</li>
              <li><a href="http://www.csshub.com/">CSS Hub</a><br />
                Premium CSS Templates</li>
            </ul>
          </div> -->
         <!--  <div class="gadget">
            <h2 class="star"><span>Wise Words</span></h2>
            <div class="clr"></div>
            <div class="testi">
              <p><span class="q"><img src="resources/images/qoute_1.gif" width="20" height="15" alt="" /></span> We can let circumstances rule us, or we can take charge and rule our lives from within. <span class="q"><img src="resources/images/qoute_2.gif" width="20" height="15" alt="" /></span></p>
              <p class="title"><strong>Earl Nightingale</strong></p>
            </div>
          </div> -->
        </div>
        <div class="clr"></div>
      </div>
    </div>
  </div>
  <!-- <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image Gallery</span></h2>
        <a href="#"><img src="resources/images/pic_1.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="resources/images/pic_2.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="resources/images/pic_3.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="resources/images/pic_4.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="resources/images/pic_5.jpg" width="58" height="58" alt="" /></a> <a href="#"><img src="resources/images/pic_6.jpg" width="58" height="58" alt="" /></a> </div>
      <div class="col c2">
        <h2><span>Lorem Ipsum</span></h2>
        <p>Lorem ipsum dolor<br />
          Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. <a href="#">Morbi tincidunt, orci ac convallis aliquam</a>, lectus turpis varius lorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam.</p>
      </div>
      <div class="col c3">
        <h2><span>About</span></h2>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. llorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum. <a href="#">Learn more...</a></p>
      </div>
      <div class="clr"></div>
    </div>
  </div> -->
</div>
<div class="footer">
  <div class="footer_resize">
    <p class="lf">&copy; Copyright <a href="home">fof.com</a>.</p>
    <p class="rf">Layout for <a href="home">Friens or foe</a></p>
    <div class="clr"></div>
  </div>
</div>
<!-- <div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body> -->
</html>