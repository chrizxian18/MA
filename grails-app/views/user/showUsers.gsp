<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		
		<title>Users</title>
	</head>
	<body>
		<div class="content scaffold-list" role="main">
			<h1>Users</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<th>User Name</th>
						<th>Email</th>
						<th>Enabled</th>
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
