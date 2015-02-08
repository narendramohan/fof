<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
    <header id='PageTop' class="gradient fixed"> <nav> <div class="tbl mobile"> <div class="row"> <div class="cell left"> <span class='mainMenu menuLink icon'> <i class='mainMenu'><span>Site Menu</span></i> </span> <i class="vert-hlpr"></i> </div> <div class="cell center " style="width:99.9%"> <a href='/index.htm' target='_top' tabindex='-1' class='logo'><i class='logo'><span>Home</span></i><i class="vert-hlpr"></i></a> </div> <div class="cell right"> <span class='acctMenu menuLink icon showHH'> <a target='_top' rel='nofollow' class='signin'><i class='acctMenu'><span>My Account</span></i> </a> </span> <i class="vert-hlpr"></i> </div> </div> </div> <div class="tbl search"> <div class="row"> <div class="cell hideHH"> <a href='/index.htm' target='_top' tabindex='-1' class='logo'><i class="logo"><span>Home</span></i><i class="vert-hlpr"></i></a> </div> <div class="cell hideHH"> <ul class="headerMenu"> <li class='jobs tab gradient'> <a href='/Job/index.htm' class='gradient' target='_top' data-search-url='/Job/jobs.htm'><span>Jobs</span><i class="vert-hlpr"></i></a> </li> <li class='reviews tab active gradient'> <a href='/Reviews/index.htm' class='gradient' target='_top' data-search-url='/GD/Reviews/company-reviews.htm'><span class="hideTab">Companies & Reviews</span><span class="showTab">Companies</span><i class="vert-hlpr"></i></a> </li> <li class='salaries tab gradient'> <a href='/Salaries/index.htm' class='gradient' target='_top' data-search-url='/GD/Salaries/company-salaries.htm'><span>Salaries</span><i class="vert-hlpr"></i></a> </li> <li class='interviews tab gradient'> <a href='/Interview/index.htm' class='gradient' target='_top' data-search-url='/GD/Interview/job-interview-questions.htm'><span>Interviews</span><i class="vert-hlpr"></i></a> </li> </ul> </div> <div class="cell" style="width:99.9%;position:relative;vertical-align: middle;"> <div id='SiteSrchTop' class="search-container cf"> <form action='/GD/Reviews/company-reviews.htm' method='get' target='_top' class='siteSrchForm' data-allow-postal-codes='false' data-pick-best-match='true'> <input type='hidden' name='suggestCount' class='suggestCount' value='0'/> <input type='hidden' name='suggestChosen' class='suggestChosen' value='false'/> <input type='hidden' name='clickSource' value='searchBtn'/> <input type='hidden' name='typedKeyword' class='typedKey' value=""/> <select id='SrchSelectTop' class='url gradient hidden' style="display:none;"> <option value='/Job/jobs.htm' data-placeholder="Job Title, Keywords, or Company" data-zipcodes-ok='true' data-subtitle=""> Jobs</option> <option value='/GD/Reviews/company-reviews.htm' selected='selected' data-placeholder="Company Name" data-zipcodes-ok='false' data-subtitle=""> Companies</option> <option value='/GD/Salaries/company-salaries.htm' data-placeholder="Job Title or Company" data-zipcodes-ok='false' data-subtitle=""> Salaries</option> <option value='/GD/Interview/job-interview-questions.htm' data-placeholder="Job Title or Company" data-zipcodes-ok='false' data-subtitle=""> Interviews</option> </select> <div class="tbl"> <div class="row"> <div class="cell"><i class="close"></i></div> <div class="cell" style="width: 99.9%;position:relative;"> <i class="srch-green"></i> <input type='text' class='std keyword med gradient' name='sc.keyword' value='' placeholder="Search..." data-auto-complete='true'/> <input type='text' value='' data-srch-type='popular' class='std loc med gradient' placeholder="City, State, or Zip"/> <input type='hidden' class='locType' name='locT' value=''/> <input type='hidden' class='locId' name='locId' value=''/> <button type='submit' data-btn-id='' class='searchSubmit tight gd-btn gd-btn-submit gd-btn-2 gd-btn-med gd-btn-icon gradient'> <i class='btn-search-blue'></i><i class='hlpr'></i></button> </div> </div> </div> </form> <script type='text/x-deferred-js' data-desc='siteSrch.jspf'>
            /* <![CDATA[ */
            $(function() {
                
                GD.site.initSrchAC("EMPLOYER");
                

                GD.site.initSiteSearch(null, false, true);
            });
            /* ]]> */
        </script> </div> </div> <div class="cell hideHH"> <div class='actions'> <i class="vert-hlpr"></i> <span class='employers menuLink'> Employers / Post Job </span> <a target='_top' rel='nofollow' class='signin'>Sign in</a> <a href='/survey/start_input.htm?contentOriginHook=PAGE_HEADER_NAV&showSurvey=REVIEWS' class='gd-btn gd-btn-link gradient gd-btn-1 gd-btn-med gd-btn-icon btn-plus tight hideHH'><i class='btn-plus'><span>Write a Review</span></i><span></span><i class='hlpr'></i> </a> </div> </div> </div> </div> </nav> <div id='EmployersMenu' class='hdrDropdown selectboxit-container'> <ul class='selectboxit-options selectboxit-list hidden' tabindex='-1'> <li class='selectboxit-option' role='option'> <a href='/partners/account/create.htm?source=employermenu' rel='nofollow' class='selectboxit-option-anchor' target='_blank' data-ga-lbl='get-free-emp-acct'> Get Free Employer Account</a> </li> <li class='selectboxit-option' role='option'> <a href='/partners/index.htm' rel='nofollow' class='selectboxit-option-anchor' target='_blank' data-ga-lbl='get-free-emp-acct'> Sign In to Employer Center</a> </li> <li> <div class="hr"> <hr/> </div> </li> <li class='selectboxit-option' role='option'> <a href='/partners/post-a-job/index.htm?src=site-header' class='selectboxit-option-anchor' target='_blank' data-ga-lbl='post-a-job'> Post a Job on Glassdoor</a> </li> <li class='selectboxit-option' role='option'> <a class='selectboxit-option-anchor' target='_blank' data-ga-lbl='post-a-job' id="manage-jobs"> Manage My Job Postings</a> </li> <li> <div class="hr"> <hr/> </div> </li> <li class='selectboxit-option' role='option'> <a href='http://employers.glassdoor.com' class='selectboxit-option-anchor SL_norewrite' target='_blank' data-ga-lbl='talent-solutions'> Solutions for Employers</a> </li> <li class='selectboxit-option' role='option'> <a href='http://employers.glassdoor.com/employer-branding' class='selectboxit-option-anchor SL_norewrite sub' target='_blank' data-ga-lbl='emp-branding-blog'> Employer Branding</a> </li> <li class='selectboxit-option' role='option'> <a href='http://employers.glassdoor.com/job-advertising' class='selectboxit-option-anchor SL_norewrite sub' target='_blank' data-ga-lbl='job-advertising-blog'> Job Advertising</a> </li> <li class='selectboxit-option' role='option'> <a href='http://employers.glassdoor.com/blog' class='selectboxit-option-anchor SL_norewrite' target='_blank' data-ga-lbl='recruiting-blog'> Recruiting Blog</a> </li> </ul> </div> <script type='text/x-deferred-js' data-desc='menuEmployers.jspf'>
	/* <![CDATA[ */
	GD.site.initDropdown($('#PageTop span.employers.menuLink'), $('#EmployersMenu'));
	/* ]]> */
</script> </header>
        <div align="center">
	        <h1>Contact List</h1>
        	<table border="1">
	        	<th>No</th>
	        	<th>Username</th>
	        	<th>Email</th>
	        	
				<c:forEach var="user" items="${userList}" varStatus="status">
	        	<tr>
	        		<td>${status.index + 1}</td>
					<td>${user.username}</td>
					<td>${user.email}</td>
							
	        	</tr>
				</c:forEach>	        	
        	</table>
        </div>
    </body>
</html>
