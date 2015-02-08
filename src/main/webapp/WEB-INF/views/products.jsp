<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Friends or foe social page!</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="resources/css/style1.css" rel="stylesheet" type="text/css" />
<!-- <script type="text/javascript" src="resources/js/jquery-1.3.2.min.js"></script> -->
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/script.js"></script>
<script type="text/javascript" src="resources/js/cufon-yui.js"></script>
<script type="text/javascript" src="resources/js/arial.js"></script>
<script type="text/javascript" src="resources/js/cuf_run.js"></script>
<script type="text/javascript" src="resources/js/jquery.webRating.min.js"></script>
<script src="resources/js/oasis.stars.js"></script>
<script src="resources/js/jquery.autocomplete.min.js"></script>
		<link href="resources/css/oasis.stars.css" rel="stylesheet"/>
<style type="text/css">
#nav {
    line-height:30px;
    background-color:#FFFFFF;
    height:30px;
    width:100%;
    padding:5px;	      
    border-top-left-radius: 10px 5px;
	border-bottom-right-radius: 10px 5px;
	border-top-right-radius: 10px 5px;
	border-bottom-left-radius: 10px 5px;
}
<c:forEach var="products" items="${products}">
#${products.productid}p { float: right; margin: 10px; }
#${products.productid}p .rating-label {  color: #FFF; font-variant: small-caps; font-family: "proxima-nova", sans-serif; text-decoration: none; float: left; padding-right: 5px;  }
#${products.productid}p .star { background: url('${pageContext.request.contextPath}/resources/images/star-empty-icon.png') top left no-repeat; width: 15px; height: 15px; float: left; display: block; margin: 0 2px; }
#${products.productid}p .star.hover { background: url('${pageContext.request.contextPath}/resources/images/star-icon.png') left top no-repeat; }
</c:forEach>

.starRate {position:absolute; margin:20px; overflow:hidden; zoom:1;}
.starRate ul {width:160px; margin:0; padding:0;}
.starRate li {display:inline; list-style:none;}
.starRate a, .starRate b {background:url(${pageContext.request.contextPath}/resources/images/star_rate.gif) left top repeat-x;}
.starRate a {float:right; margin:0 80px 0 -144px; width:80px; height:16px; background-position:left 16px; color:#000; text-decoration:none;}
.starRate a:hover {background-position:left -32px;}
.starRate b {position:absolute; z-index:-1; width:80px; height:16px; background-position:left -16px;}
.starRate div b {left:0px; bottom:0px; background-position:left top;}
.starRate a span {position:absolute; left:-300px;}
.starRate a:hover span {left:90px; width:100%;}
</style>
<script>
$(document).ready(function() {
	 <c:forEach var="products" items="${products}">
		new Oasis.Stars($('#${products.productid}p'), { currentScore: 2});
	 </c:forEach>
	
	 jQuery("div").webRating({     
	        // count
	        ratingCount     : 5,

	        // image & color
	        imgSrc          : "${pageContext.request.contextPath}/resources/images/star-icon.png",
	        xLocation     	: 53, //in px
	        yLocation	      : 49, //in px
	        width		        : 15, //in px
	        height          : 15, //in px

	        //CSS
	        onClass         : 'onClass',
	        offClass        : 'offClass',
	        onClassHover  	: 'onClassHover', //Optional
	        offClassHover 	: 'offClassHover', //Optional

	        //on click funcitons
	        cookieEnable		: false,
	        cookiePrefix		: "myRating_",
	        maxClick				: 1,
	        onClick					: function(clickScore, data){
	            //Your function & post action
	        },

	        //Tooltip
	        tp_showAverage  : true,
	        prefixAverage   : "Avg",
	        tp_eachStar     : {'1':'Very Bad','2':'Bad','3':'Ok','4':'Good','5':'Very Good'} //Rating guide
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
        <form method="get" id="search" action="#">
          <span>
          <input type="text" value="Search..." name="s" id="s" />
          <input name="searchsubmit" type="image" src="resources/images/search.gif" value="Go" id="searchsubmit" class="btn"  />
          </span>
        </form>
        <!--/searchform -->
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
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
      <div class="hbg"><img src="resources/images/products.jpg" width="923" height="291" alt="" /></div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
          <div class="article">
            <h2><span>All Products</span></h2>
           <!--  <h1><font color="#EEDD82">Click on friend name to start chat</font></h1> -->
<div style="position: absolute; top:60px;left: 10px">

</div>
            <div class="clr"></div>
            <p class="post-data">List of all products available</p>
           <!--  <img src="resources/images/images_1.jpg" width="613" height="193" alt="" /> -->
            <c:if test="${!empty products}">
            <div id="friendlist">
            <!-- <ul> -->     
	            <c:forEach var="products" items="${products}">
					<%-- <c:if test="${products.friendUserName!=userName}" > --%>
					 <%-- <p class="spec">
					 <li class="com fl">                                                                                                                                                                                        
			          <a href="profile??user=${friend.friendUserName}" class="url" rel="friend">                                                                                                                       
			            <span class="fn">${friend.friendUserName}</span>                                                                                                                                                        
			          </a>                                                                                                                                                                                                              
			        </li>     </p> --%>
						<div id="nav">
							 <font color="CadetBlue" size="3" face="verdana">${products.productName}</font>&nbsp;&nbsp;
							<a href="createReview?productid=${products.productid}" >&nbsp;<font color="CornflowerBlue" size="3" face="verdana">Create Review</font></a> 
							<a href="viewReview?productid=${products.productid}" >&nbsp;<font color="CornflowerBlue" size="3" face="verdana">View Reviews</font></a>
							<font color="CadetBlue" size="3" face="verdana">Over All Reviews</font>	 
							<%--  --%><div id="${products.productid}p" data-id="1"></div>
							 <div class="starRate">
								<div>Currently rated: 3 stars<b></b></div>
								<ul>
								<li><a href="#"><span>Give it 5 stars</span></a></li>
								<li><a href="#"><span>Give it 4 stars</span></a></li>
								<li><a href="#"><span>Give it 3 stars</span><b></b></a></li>
								<li><a href="#"><span>Give it 2 stars</span></a></li>
								<li><a href="#"><span>Give it 1 star</span></a></li>
								</ul>
								</div> 
							</div>
					<%-- </c:if> --%>
					
				</c:forEach>
				                                                                                                                                                                                                               
		      <%-- {% for item in items %}
		        <li class="vcard">                                                                                                                                                                                        
		          <a href="{{ item.alternate.href }}" class="url" rel="friend">                                                                                                                       
		            <span class="fn">${friend.friendUserName}</span>                                                                                                                                                        
		          </a>                                                                                                                                                                                                              
		        </li>                                                                                                                                                                                                               
		      {% endfor %} --%>
		    <!-- </ul> -->
		    </div>
	<%-- <table width="100%" border="1" style="border-color: black; border-width: 1pt;border-spacing: 0pt">
	<tr style="background:gray;"><th>Friend Name</th></tr>
	
	<c:forEach var="friend" items="${friends}">
		<c:if test="${friend.friendUserName!=userName}" >
			<tr style="background: teal;;"><td>
			<a style="text-decoration: none; padding-left: 200px;" href="/webchat/chat-page?user=${friend.friendUserName}"><img style="padding-top: 20px; border: none;" src="../images/user.png"/><font color="white" size="6" face="verdana">${friend.friendUserName}</font></a><br/>
			</td>
			</tr>
		</c:if>
	</c:forEach>
	</table> --%>
		</c:if>
		<c:if test="${empty products}">
			<table border="1" width="100%" style="border-color: black;border-width:0pt;padding:0;margin: 0px">
			<tr style="background: teal;;"><td>No products available currently</td></tr>
			</table>
		</c:if>
		            <!-- <p>This is a free CSS website template by RocketWebsiteTemplates.com. This work is distributed under the <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0 License</a>, which means that you are free to use it for any personal or commercial purpose provided you credit me in the form of a link back to RocketWebsiteTemplates.com.</p>
            <p class="spec"><a href="#" class="com fr">Comments (3)</a> <a href="#" class="rm fl">Read more</a></p> -->
            <div class="clr"></div>
          </div>
          <!-- <div class="article">
            <h2><span>Lorem Ipsum</span> Dolor Sit</h2>
            <div class="clr"></div>
            <p class="post-data"><span class="date">March 15, 2010</span> &nbsp;|&nbsp; Posted by <a href="#">Owner</a> &nbsp;|&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a></p>
            <img src="resources/images/images_2.jpg" width="613" height="193" alt="" />
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. <a href="#">Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo.</a> Donec mattis, purus nec placerat bibendum, dui pede condimentum odio, ac blandit ante orci ut diam. Cras fringilla magna. Phasellus suscipit, leo a pharetra condimentum, lorem tellus eleifend magna, eget fringilla velit magna id neque. Curabitur vel urna. In tristique orci porttitor ipsum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam.</p>
            <p>Aenean commodo elit ac ante dignissim iaculis sit amet non velit. Donec magna sapien, molestie sit amet faucibus sit amet, fringilla in urna. Aliquam erat volutpat. Fusce a dui est. Sed in volutpat elit. Nam odio tortor, pulvinar non scelerisque in, eleifend nec nunc. Sed pretium, massa sed dictum dapibus, nibh purus posuere magna, ac porta felis lectus ut neque. Nullam sagittis ante vitae velit facilisis lacinia. Cras vehicula lacinia ornare. Duis et cursus risus. Curabitur consectetur justo sit amet odio viverra vel iaculis odio gravida. Ut imperdiet metus nec erat.</p>
            <p class="spec"><a href="#" class="com fr">Comments (7)</a> <a href="#" class="rm fl">Read more</a></p>
            <div class="clr"></div>
          </div> -->
          <div class="pagenavi"><span class="pages">Page 1 of 1</span><span class="current">1</span><!-- <a href="#">2</a><a href="#" >&raquo;</a> --></div>
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
          </div>
        <!-- <div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span>Sidebar</span> Menu</h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">TemplateInfo</a></li>
              <li><a href="#">Style Demo</a></li>
              <li><a href="#">Blog</a></li>
              <li><a href="#">Archives</a></li>
              <li><a href="#">Web Templates</a></li>
            </ul>
          </div>
          <div class="gadget">
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
          </div>
          <div class="gadget">
            <h2 class="star"><span>Wise Words</span></h2>
            <div class="clr"></div>
            <div class="testi">
              <p><span class="q"><img src="resources/images/qoute_1.gif" width="20" height="15" alt="" /></span> We can let circumstances rule us, or we can take charge and rule our lives from within. <span class="q"><img src="resources/images/qoute_2.gif" width="20" height="15" alt="" /></span></p>
              <p class="title"><strong>Earl Nightingale</strong></p>
            </div>
          </div>
        </div> -->
        <div class="clr"></div>
      </div>
    </div>
  </div>

</div>
<div class="footer">
  <div class="footer_resize">
    <p class="lf">&copy; Copyright <a href="home">fof.com</a>.</p>
    <p class="rf">Layout for <a href="home">Friens or foe</a></p>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>