
<%@ page import="MerchantAcquisition.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-role" class="content scaffold-list" role="main">
			<h1>Roles</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="authority" title="${message(code: 'role.authority.label', default: 'Authority')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'role.description.label', default: 'Description')}" />
					
						<th>Action</th>					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${roleInstanceList}" status="i" var="roleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: roleInstance, field: "authority")}</td>
						<td>${fieldValue(bean: roleInstance, field: "description")}</td>
					
					
						<td><g:link action="show" id="${roleInstance.id}">VIEW</g:link> | <g:link action="edit" id="${roleInstance.id}">EDIT</g:link></td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination2">
				<g:paginate total="${roleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
