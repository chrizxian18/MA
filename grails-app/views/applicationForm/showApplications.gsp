<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		
		<title>Applications</title>
	</head>
	<body>
		<div id="list-applicationForm" class="content scaffold-list" role="main">
			<h1>Drafts</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						
						<g:sortableColumn property="dateCreated" title="${message(code: 'applicationForm.dateCreated.label', default: 'Date Applied')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'applicationForm.lastUpdated.label', default: 'Last Updated')}" />
					
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicationFormInstanceList}" status="i" var="applicationFormInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="viewSelectedApplication" id="${applicationFormInstance.id}">${fieldValue(bean: applicationFormInstance, field: "dateApplied")}</g:link></td>
						<td><p>${fieldValue(bean: applicationFormInstance, field: "lastUpdated")}</p></td>
					
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${appFormInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>