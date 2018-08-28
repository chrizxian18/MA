<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationForm.label', default: 'ApplicationForm')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	 	<script>
	// 		function checkFiles() {
				
	// 			var birCorFullPath = document.getElementById("birCorFullPath").files.length;
	// 			var dtiCertFullPath = document.getElementById("dtiCertFullPath").files.length;
	// 			var bizPermFullPath = document.getElementById("bizPermFullPath").files.length;
	// 			var govIdFullPath = document.getElementById("govIdFullPath").files.length;
	// 			var secCertFullPath = document.getElementById("secCertFullPath").files.length;
	// 			var gsisFullPath = document.getElementById("gsisFullPath").files.length;
	// 			var articleFullPath = document.getElementById("articleFullPath").files.length;
	// 			var byLawFullPath = document.getElementById("byLawFullPath").files.length;
	// 			var finStateFullPath = document.getElementById("finStateFullPath").files.length;
	// 			if (birCorFullPath  == 0 || dtiCertFullPath == 0 || bizPermFullPath == 0 || govIdFullPath == 0 || secCertFullPath == 0 || gsisFullPath == 0 || articleFullPath == 0 || byLawFullPath == 0 || finStateFullPath == 0){
	// 			// if( document.getElementById("uploadRequired").files.length == 0 ){
	// 		    alert("Please select all the required files to be uploaded")
	// 		    return false
	// 		}	else { return true}
	// 					}
			
	// 	function validate() {
	// 	var a = 0, rdbtn=document.getElementsByName("companyType")
	// 	for(i=0;i<rdbtn.length;i++) {
	// 	if(rdbtn.item(i).checked == false) {
	// 	a++;
	// 	}
	// 	}
	// 	if(a == rdbtn.length) {
	// 	alert("Please select Company Type")

	// 	return false
	// 	} else {
	// 	// return true
	// 	return checkFiles()
	// 	}
	// }
	function corpo(){
		document.getElementById('formFilesCorporation').style.display ='block';
	  	document.getElementById('formFilesSingleProprietorship').style.display = 'none';

	  	document.getElementById('secCertFullPath').required = true;
	  	document.getElementById('gsisFullPath').required = true;
	  	document.getElementById('articleFullPath').required = true;
	  	document.getElementById('byLawFullPath').required = true;
	  	document.getElementById('finStateFullPath').required = true;

	  	document.getElementById('birCorFullPath').required = false;
	  	document.getElementById('dtiCertFullPath').required = false;
	  	document.getElementById('bizPermFullPath').required = false;
	  	document.getElementById('govIdFullPath').required = false;

		}
	function singlePro(){
	  	document.getElementById('formFilesCorporation').style.display = 'none';
	  	document.getElementById('formFilesSingleProprietorship').style.display = 'block';
	  	document.getElementById('secCertFullPath').required = false;
	  	document.getElementById('gsisFullPath').required = false;
	  	document.getElementById('articleFullPath').required = false;
	  	document.getElementById('byLawFullPath').required = false;
	  	document.getElementById('finStateFullPath').required = false;

	  	document.getElementById('birCorFullPath').required = true;
	  	document.getElementById('dtiCertFullPath').required = true;
	  	document.getElementById('bizPermFullPath').required = true;
	  	document.getElementById('govIdFullPath').required = true;
	}
	</script>
	</head>
	<body>
		<a href="#create-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div id="create-applicationForm" class="content scaffold-create" role="main">
			<h1>Create Application Form</h1>
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
					
					<span id="formFilesCorporation" class="hide">
						<g:render template="formFilesCorporation"/>
					</span>

					<span id="formFilesSingleProprietorship" class="hide">
						<g:render template="formFilesSingleProprietorship"/>
					</span>
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
