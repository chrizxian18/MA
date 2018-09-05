<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	%{-- <meta name="layout" content="main"> --}%
	<title>Document</title>
	<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
</head>
<body>
		<div id="grailsLogo" role="banner" style="padding:2%; color:black;"><h1 style="color:black;">&nbsp;</h1></div>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
    <h1>Registration</h1>
     <div>
        ${message}
        <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
     </div>
     <div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>