<%@ page import="MerchantAcquisition.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Set Contact Email</title>
		
	</head>
	<body>
		
		
		<div class="content" role="main">
			<h1>Set Contact Email</h1>
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
				<g:form resource="${userInstance}" controller="user" enctype="multipart/form-data" method="put" >
					<fieldset>
				
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="user.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
					</div>
					
				</fieldset>

				<fieldset class="buttons">
					<g:actionSubmit action="update" class="save" value="Update" />
					
				</fieldset>
			</g:form>
			
		</div>
		
	</body>
</html>
