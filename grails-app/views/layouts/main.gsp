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
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		%{-- <g:javascript library='jquery' /> --}%
		<g:layoutHead/>
	</head>
	<body>
		<div id="grailsLogo" role="banner" style="padding:2%; color:black;"><h1 style="color:black;">&nbsp;</h1></div>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><a href="${createLink(uri: '/applicationForm/createPage1')}"><g:message code="Application Form"/></a></li>
				<li><a href="${createLink(uri: '/applicationForm/showDrafts')}"><g:message code="Drafts"/></a></li>
				<li><a href="${createLink(uri: '/applicationForm/showApplications')}"><g:message code="Applications"/></a></li>
				<li><a href="#"><g:message code="My Account"/></a></li>
				<li><a href="#"><g:message code="Contact Us"/></a></li>
				<li><g:link controller="logout"> Log Out</g:link></li>
			</ul>
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
