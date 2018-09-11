<%@ page import="MerchantAcquisition.MyGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myGroup.label', default: 'MyGroup')}" />
		<title>Edit Group</title>
	</head>
	<body>
		<a href="#edit-myGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="index">Group List</g:link></li>
				<li><g:link class="create" action="create">New Group</g:link></li>
			</ul>
		</div>
		<div id="edit-myGroup" class="content scaffold-edit" role="main">
			<h1>Edit Group</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${myGroupInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${myGroupInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:myGroupInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${myGroupInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
						<div class="fieldcontain" >

							%{-- <g:select name="userRoles"
							          from="${roles}"
							          optionKey="id"
							           /> --}%


							<g:dualList 
		                        name="role"
		                        controller="myGroup"
		                                                                        
		                        update_available_list_action="updateAvailableList"                                                
		                        update_current_list_action="updateCurrentList"
		                        
		                        add_action="addSelected"
		                        remove_action="removeSelected"
		                        
		                        params="${params}"
		                    />   

		                        

						</div>																								
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
