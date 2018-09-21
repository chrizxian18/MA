<%@ page import="MerchantAcquisition.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Forgot Password</title>
	</head>
	<body>
		<div class="content" role="main">
			<h1>Forgot Password</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${flash.error}">
				<ul class="errors" role="alert">
					<li  role="status">${flash.error}</li>
				</ul>
			</g:if>
				<g:form action="resetPassword" controller="user" name="changePassForm">

				<fieldset class="form">

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
						<label for="username">
							<g:message code="user.username.label" default="User Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField minlength="2" title="User Name should be at least 2 characters in length" name="username" required="" value="${userInstance?.username}"/>
					</div>
				</fieldset>

				<fieldset class="buttons">
					<g:actionSubmit action="resetPassword" class="save" value="Submit" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
