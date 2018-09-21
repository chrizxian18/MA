<%@ page import="MerchantAcquisition.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Contact Us</title>
		
	</head>
	<body>
		
		<div class="content" role="main">
			<h1>Contact Us</h1>
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

				<fieldset class="form">
					
					<div class="fieldcontain">
						<label for="name">
							Name
							<span class="required-indicator">*</span>
						</label>
						<g:textField  name="name" required=""/>
					</div>
					<g:if test="${userInstance?.username}">
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
						<label for="username">
							<g:message code="user.username.label" default="User Name" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField readonly="readonly" minlength="2" title="User Name should be at least 2 characters in length" name="username" required="" value="${userInstance?.username}"/>
					</div>
				</g:if>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="user.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
					</div>

					<div class="fieldcontain">
						<label for="csubject">
							Subject
							<span class="required-indicator">*</span>
						</label>
						<g:textField  name="csubject" required=""/>
					</div>

					<div class="fieldcontain">
						<label for="details">
							Details
							<span class="required-indicator">*</span>
						</label>
						<g:textArea style="height:200px;" name="details" required=""/>
					</div>

				</fieldset>

				<fieldset class="buttons">
					<g:actionSubmit action="submitContactUs" class="save" value="Submit" />
					
				</fieldset>
			</g:form>
			
		</div>
		
	</body>
</html>
