<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon2.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		 <script type="text/javascript">
		 $(document).ready(function(){

		   
		    $(".toggle-password").click(function() {

			  $(this).toggleClass("fa-eye fa-eye-slash");
			  var input = $($(this).attr("toggle"));
			  if (input.attr("type") == "password") {
			    input.attr("type", "text");
			  } else {
			    input.attr("type", "password");
			  }
			});

    	});	

		  function clearContent() {
		      var currentPass = document.getElementById("currentPassword");
		      currentPass.value = "";
		      var NewPass = document.getElementById("newPassword");
		      NewPass.value = "";
		      var NewPass2 = document.getElementById("confirmPassword");
		      NewPass2.value = "";
		    }

		</script>
		<style type="text/css">
        	.field-icon {
        	  color:#337AB7;
			  float: right;
			  margin-left: -25px;
			  margin-top: 4px;
			  position: absolute;
			  z-index: 2;
			}
        </style>
		<g:layoutHead/>
	</head>
	<body>
		<div id="grailsLogo" role="banner" style="padding:2%; color:black;"><h1 style="color:black;">&nbsp;</h1></div>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<sec:ifLoggedIn>
				<sec:ifNotGranted roles="ROLE_ADMIN,ROLE_APPROVE_FORM,ROLE_REVIEW_FORM">
					<li><a href="${createLink(uri: '/applicationForm/createPage1')}"><g:message code="Application Form"/></a></li>
					<li><a href="${createLink(uri: '/applicationForm/showDrafts')}"><g:message code="Drafts"/></a></li>
					<li><a href="${createLink(uri: '/applicationForm/showApplications')}"><g:message code="Applications"/></a></li>
				</sec:ifNotGranted>
				
				<sec:ifAnyGranted roles="ROLE_APPROVE_FORM,ROLE_REVIEW_FORM">
					<li><a href="${createLink(uri: '/applicationForm/applicationList')}"><g:message code="Application List"/></a></li>
				</sec:ifAnyGranted>	
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><a href="${createLink(uri: '/user/showUsers')}"><g:message code="User List"/></a></li>
					<li><a href="${createLink(uri: '/role/index')}"><g:message code="User Role"/></a></li>
					<li><a href="${createLink(uri: '/myGroup/index')}"><g:message code="Group Role"/></a></li>
				</sec:ifAnyGranted>	
				<li><a href="#"><g:message code="Contact Us"/></a></li>
					 %{-- Dropdown for logout and change pass  --}%
                <div class="dropdown" style="float:right;">
                <li class="dropdown" style="float:right; margin-top:-4px; ">
                  <button type="button" class="btn" id="menu1" data-toggle="dropdown" style="background-color:transparent;">User: <sec:username />
                    <span class="glyphicon glyphicon-menu-down"></span></button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="menu1">
                      <li><a href="${createLink(uri: '/user/account')}" style="width:172px;">My Account</a></li>
                      <li role="presentation"><a style="width:172px;"role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#mdlChangep">Change Password</a></li>
                      <li role="presentation"><g:link controller="logout" style="width:172px;"> Log Out</g:link></li>
                    </ul>
                  </li>%{-- end of dropdown --}%
                  <!-- Modal for change pass-->
                  <div class="modal fade" id="mdlChangep" role="dialog">
                    <div class="modal-dialog">
                      
                      <!-- Modal content-->
                      <div class="modal-content">
                        <div class="modal-header">
                          <h3 class="modal-title" style="text-align:center;"><strong>Change Password</strong></h3>
                        </div>
                        <div>
                          <g:form action="changePassword" controller="user" name="changePassForm" onsubmit="return validate()">
                            <table border="0">
                              <tr>
                                <td style="text-align:right"><label for="currentPassword">Current Password</label></td>
                                <td><g:passwordField id="currentPassword" id="currentPassword" name="currentPassword" required="required"/>
                                	<span toggle="#currentPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span></td>

                              </tr>
                              <tr>
                                <td style="text-align:right"><label for="newPassword">New Password</label></td>
                                <td><input type="password" minlength="6" maxlength="20" title="Password should be at least 6 characters in length, must contain alphanumeric and special characters with at least one uppercase and one lowercase letter." pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*_-]).{6,}$" id="newPassword" name="newPassword" required=""/>
								 <span toggle="#newPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span></td>
                              </tr>
                              <tr>
                                <td style="text-align:right"><label for="confirmPassword">Confirm Password</label></td>
                                <td><input type="password" title="Confirm Password should be exactly the same as the Password" maxlength="20" id="confirmPassword" name="confirmPassword" required=""/>
								<span toggle="#confirmPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span></td>
                              </tr>
                              <tr>
                                <td style="text-align:right">  
                                  <g:actionSubmit class="btn btn-primary" value="Save" action="changePassword" controller="user"/>
                                 </td>
                                 
                                 
                                 	<td>
                                  <button type="button" id="cancel" class="btn btn-secondary" onclick="clearContent()" data-dismiss="modal">
                                    <span style="color:black">Cancel</span>

                                  </button>
                                </td>
                              </tr>
                            </table>
                          </g:form>
                        </div>
                      </div>
                    </div>
                  </div> <!-- end of modal for change pass-->
                   </sec:ifLoggedIn>
				
			</ul>
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
