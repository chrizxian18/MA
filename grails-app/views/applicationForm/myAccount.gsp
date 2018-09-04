<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>My Account</title>
		<style type="text/css">
			li {
				margin-bottom: 2%;
			}
			.myButton {
				margin-left:7%;
				 padding-top: 5px;
				 padding-bottom: 5px; 
				 background-color:#C3B6B6;
			}
		</style>
	</head>
	<body>
		<div id="create-applicationForm" class="content scaffold-create" role="main">
			<h1>Account Information</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${applicationFormInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${applicationFormInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="applicationForm" enctype="multipart/form-data" method="post" >
				<fieldset class="form">
					<p>Username: ${username}</p>
					<p>Merchant Name: ${username}</p>
			
				<g:each in="${applicationFormInstanceList}" status="i" var="applicationFormInstance">
					<span class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<span>Merchant Name:${applicationFormInstance.merchantName}</span>
					
					</span>
				</g:each>

				</fieldset>
				<fieldset class="buttons">
					%{-- <span class="myButton"><a href="${createLink(uri: '/applicationForm/create')}"><g:message code="Next"/></a></span> --}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
