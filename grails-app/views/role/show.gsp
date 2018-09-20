
<%@ page import="MerchantAcquisition.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="show-role" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:if test="${flash.error}">
				<ul class="errors" role="alert">
					<li  role="status">${flash.error}</li>
				</ul>
			</g:if>

			<ol class="property-list role">
			
				<g:if test="${roleInstance?.authority}">
				<li class="fieldcontain">
					<label id="authority-label" class="property-label"><g:message code="role.authority.label" default="Authority" /></label>
					
						<span class="property-value" aria-labelledby="authority-label"><g:fieldValue bean="${roleInstance}" field="authority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.description}">
				<li class="fieldcontain">
					<label id="description-label" class="property-label"><g:message code="role.description.label" default="Description" /></label>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${roleInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.dateCreated}">
				<li class="fieldcontain">
					<label id="dateCreated-label" class="property-label"><g:message code="role.dateCreated.label" default="Date Created" /></label>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${roleInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.createdBy}">
				<li class="fieldcontain">
					<label id="createdBy-label" class="property-label"><g:message code="role.createdBy.label" default="Created By" /></label>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="user" action="show" id="${roleInstance?.createdBy?.id}">${roleInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.lastUpdated}">
				<li class="fieldcontain">
					<label id="lastUpdated-label" class="property-label"><g:message code="role.lastUpdated.label" default="Last Updated" /></label>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${roleInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.updatedBy}">
				<li class="fieldcontain">
					<label id="updatedBy-label" class="property-label"><g:message code="role.updatedBy.label" default="Updated By" /></label>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:link controller="user" action="show" id="${roleInstance?.updatedBy?.id}">${roleInstance?.updatedBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:roleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${roleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
