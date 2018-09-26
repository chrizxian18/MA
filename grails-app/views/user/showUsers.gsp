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
			<g:form method="post">
	            <div style="margin-left: 10%; margin-bottom:20px; ">
	                <input type="text" placeholder="Search Username" id="username" name="username">
	  				<g:actionSubmit class="btn btn-sm btn-default" action="showUsers" value="Search" />
	  				<span style="display:inline"><a href="${createLink(uri: '/user/showUsers')}">Reset</a></span>
	            </div>
					
	            <div class="buttons">
	            </div>
            </g:form>	

			<table>
			<thead>
					<tr>
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'User Name')}" />
						<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
						<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Enabled')}" />
						<g:sortableColumn property="dateCreated" title="${message(code: 'user.dateCreated.label', default: 'Date Created')}" />
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: userInstance, field: "username")}</td>
						<td>${fieldValue(bean: userInstance, field: "email")}</td>
						<td>${fieldValue(bean: userInstance, field: "enabled")}</td>
						<td>${fieldValue(bean: userInstance, field: "dateCreated")}</td>
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
