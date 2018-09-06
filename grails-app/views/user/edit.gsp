%{-- <%@ page import="merchantacquisition.ApplicationForm" %> --}%
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<asset:javascript src="application.js"/>
		<title>Edit User</title>
		
	</head>
	<body>
		
		<a href="#edit-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div class="content scaffold-edit" role="main">
			<h1>Edit User</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
				<g:form resource="${userInstance}" controller="uesr" enctype="multipart/form-data" method="put" >

				<fieldset class="form">

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
						<label for="username">
							<g:message code="user.username.label" default="Merchant Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField minlength="2" title="Merchant Name should be at least 2 characters in length" name="username" required="" value="${userInstance?.username}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="user.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'telephone', 'error')} ">
						<label for="telephone">
							<g:message code="user.telephone.label" default="Telephone" />
						</label>
						<input type="tel" onkeypress="return /\d/.test(String.fromCharCode(((event||window.event).which||(event||window.event).which)));" name="telephone" value="${userInstance?.telephone}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mobileNo', 'error')} ">
						<label for="mobileNo">
							<g:message code="user.mobileNo.label" default="Mobile No" />
						</label>
						<input class="number" type="tel" minlength="13" maxlength="13" placeholder="+63xxxxxxxxxx" pattern="[+]{1}[6]{1}[3]{1}[0-9]{10}" name="mobileNo" value="${userInstance.mobileNo}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
						<label for="enabled">
							<g:message code="user.enabled.label" default="Enabled" />
						</label>
						<g:checkBox name="enabled" value="${userInstance?.enabled}"/>
					</div>
					
				</fieldset>

				<fieldset class="buttons">
					<g:actionSubmit action="update" class="save" value="Update" />
					
				</fieldset>
			</g:form>
			
		</div>
		
	</body>
</html>
