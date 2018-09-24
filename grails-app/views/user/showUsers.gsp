<%@ page import="MerchantAcquisition.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		
		<title>Users</title>
	</head>
	<body>
		<div class="content scaffold-list" role="main">
			<div class="nav" role="navigation">
				<ul>
					<li><g:link class="create" action="create">New User</g:link></li>
				</ul>
			</div>
			<h1>Users</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'User Name')}" />
						<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
						<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: userInstance, field: "username")}</td>
						<td>${fieldValue(bean: userInstance, field: "email")}</td>
						<td>${fieldValue(bean: userInstance, field: "enabled")}</td>
						<td><g:link action="viewSelected" id="${userInstance.id}">VIEW</g:link> | <g:link action="edit" id="${userInstance.id}">EDIT</g:link></td>
					
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination2">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
