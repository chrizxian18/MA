
<%@ page import="MerchantAcquisition.MyGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'myGroup.label', default: 'MyGroup')}" />
		<title>Group</title>
	</head>
	<body>
		<a href="#list-myGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="create" action="create">New Group</g:link></li>
			</ul>
		</div>
		<div id="list-myGroup" class="content scaffold-list" role="main">
			<h1>Group List</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'myGroup.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${myGroupInstanceList}" status="i" var="myGroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${myGroupInstance.id}">${fieldValue(bean: myGroupInstance, field: "name")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination2">
				<g:paginate total="${myGroupInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
