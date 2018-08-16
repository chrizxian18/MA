%{-- <%@ page import="merchantacquisition.ApplicationForm" %> --}%
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationForm.label', default: 'ApplicationForm')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#edit-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="edit-applicationForm" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			%{-- <g:form url="[resource:applicationFormInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${applicationFormInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset> --}%

				<g:form resource="${applicationFormInstance}" controller="applicationForm" enctype="multipart/form-data" method="put" >
				<fieldset class="form">
					<g:render template="form"/>
					<g:render template="formFiles"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit action="updateDrafts" class="save" value="Save as Draft" />
					<g:actionSubmit action="saveAndSend" class="save" value="Submit" />
				</fieldset>
			</g:form>
			
		</div>
	</body>
</html>
