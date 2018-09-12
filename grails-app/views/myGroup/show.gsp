
<%@ page import="MerchantAcquisition.MyGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myGroup.label', default: 'MyGroup')}" />
		<title>Group</title>
	</head>
	<body>
		<a href="#show-myGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index">Group List</g:link></li>
				<li><g:link class="create" action="create">New Group</g:link></li>
			</ul>
		</div>
		<div id="show-myGroup" class="content scaffold-show" role="main">
			<h1>Show Group</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list myGroup">
			
				<g:if test="${myGroupInstance?.name}">
				<li class="fieldcontain">
					<label id="name-label" class="property-label"> <g:message code="myGroup.name.label" default="Name" /></label>
					
						<span class="property-value" aria-labelledby="name-label"> <g:fieldValue bean="${myGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
				<h1>List of Authorities</h1>
			<ul class="property-list">
                                <g:each in="${ myGroupInstance.authorities }">
                                        <li>${it.authority}</li>
                                </g:each>
                        </ul>
			<g:form url="[resource:myGroupInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${myGroupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
