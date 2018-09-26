<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		
		<title>Applications</title>
	</head>
	<body>
		<div id="list-applicationForm" class="content scaffold-list" role="main">
			<h1>Applications</h1>
			%{-- <g:select name="book.category" from="${statusList}"
	          valueMessagePrefix="book.category" 
	          noSelection="['':'-Filter by Status-']"/> --}%
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>

			<g:form method="post">
	            <div style="margin-left: 14%; margin-bottom:20px; ">
	                <input type="text" placeholder="Search merchant..." id="merchantName" name="merchantName">
	  				<g:actionSubmit class="btn btn-sm btn-default" action="applicationList" value="Search" />
	  				<span style="display:inline"><a href="${createLink(uri: '/applicationForm/applicationList')}">Reset</a></span>
	            </div>
					
	            <div class="buttons">
	            </div>
            </g:form>

			<table>
			<thead>
					<tr>
						
						<g:sortableColumn property="merchantName" title="${message(code: 'applicationForm.merchantName.label', default: 'Merchant Name')}" />
						<g:sortableColumn property="status" title="${message(code: 'applicationForm.status.label', default: 'Status')}" />
						<g:sortableColumn property="dateApplied" title="${message(code: 'applicationForm.dateApplied.label', default: 'Date Applied')}" />
						<g:sortableColumn property="companyType" title="${message(code: 'applicationForm.companyType.label', default: 'Company Type')}" />
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${applicationFormInstanceList}" status="i" var="applicationFormInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="merchantAppDetails" id="${applicationFormInstance.id}">${fieldValue(bean: applicationFormInstance, field: "merchantName")}</g:link></td>
						<td><p>${fieldValue(bean: applicationFormInstance, field: "status")}</p></td>
						<td>${fieldValue(bean: applicationFormInstance, field: "dateApplied")}</td>
						<td><p>${fieldValue(bean: applicationFormInstance, field: "companyType")}</p></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination2">
				<g:paginate total="${appFormInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
