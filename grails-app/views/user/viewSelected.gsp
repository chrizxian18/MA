
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>User</title>
		
	</head>
	<body>
		<div class="content scaffold-show" role="main">
			<h1>User Details</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<ol class="property-list">

				<g:if test="${userInstance?.username}">
				<li class="fieldcontain">
					<label id="status-label" class="property-label">User Name</label>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
				</li>
				</g:if>

				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<label id="status-label" class="property-label">Email</label>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
				</li>
				</g:if>

				<g:if test="${userInstance?.telephone}">
				<li class="fieldcontain">
					<label id="status-label" class="property-label">Telephone</label>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userInstance}" field="telephone"/></span>
				</li>
				</g:if>

				<g:if test="${userInstance?.mobileNo}">
				<li class="fieldcontain">
					<label id="status-label" class="property-label">Mobile No</label>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userInstance}" field="mobileNo"/></span>
				</li>
				</g:if>

				<g:if test="${userInstance?.enabled}">
				<li class="fieldcontain">
					<label id="status-label" class="property-label">Enabled</label>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userInstance}" field="enabled"/></span>
				</li>
				</g:if>

				<g:if test="${userInstance?.dateCreated}">
				<li class="fieldcontain">
					<label id="status-label" class="property-label">Date Created</label>
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${userInstance}" field="dateCreated"/></span>
				</li>
				</g:if>
			
				<h1>List of Groups</h1>
				<ul class="property-list">
                    <g:each in="${ userInstance.authorities }">
                        <li>${it.name}</li>
                    </g:each>
                </ul>

				%{-- <h1>List of Authorities</h1>
				<ul class="property-list">
	                <g:each in="${ userInstance.authorities }">
	                        <li>${it.authorities}</li>
	                </g:each>
	           </ul> --}%

      		 </ol>


			




%{-- 
					<h1>List of Authorities</h1>
			<ul class="property-list">
                                <g:each in="${ myGroupInstance.authorities }">
                                        <li>${it.authority}</li>
                                </g:each>
                        </ul> --}%

				<g:form resource="${userInstance}" controller="applicationForm" enctype="multipart/form-data" method="POST" >
				<fieldset class="form">
				</fieldset>
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				</fieldset>
			</g:form>

			

		</div>
	</body>
</html>
