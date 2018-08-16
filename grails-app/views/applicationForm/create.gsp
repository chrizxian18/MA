<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationForm.label', default: 'ApplicationForm')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script>
			function checkFiles() {
				
				var dtiCert = document.getElementById("dtiCertFullPath").files.length;
				var cor = document.getElementById("corFullPath").files.length;
				if (dtiCert  == 0 || cor == 0){
				// if( document.getElementById("uploadRequired").files.length == 0 ){
			    alert("Please select files to upload")
			    return false
			}	else { return true}
						}
			
		function validate() {
		var a = 0, rdbtn=document.getElementsByName("companyType")
		for(i=0;i<rdbtn.length;i++) {
		if(rdbtn.item(i).checked == false) {
		a++;
		}
		}
		if(a == rdbtn.length) {
		alert("Please select Company Type")

		return false
		} else {
		// return true
		return checkFiles()
		}
	}

		</script>
	</head>
	<body>
		<a href="#create-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="create-applicationForm" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${applicationFormInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${applicationFormInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="applicationForm" enctype="multipart/form-data" method="post" >
				<fieldset class="form">
					<g:render template="form"/>
					<g:render template="formFiles"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit action="save" class="save" value="Save as Draft" onclick="return validate()"/>
					<g:actionSubmit action="saveAndSend" class="save" value="Submit" />
					%{-- <g:submitButton name="submit" action="saveAndSend"class="save" value="Submit" /> --}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
