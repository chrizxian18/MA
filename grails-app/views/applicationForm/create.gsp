<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'applicationForm.label', default: 'ApplicationForm')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	 	<script>
		$(document).ready(function(){

			    $("[type=file]").on("change", function(){
			  // Name of file and placeholder
			  var file = this.files[0].name;
			  var dflt = $(this).attr("placeholder");
			  if($(this).val()!=""){
			    $(this).next().text(file);
			    $(this).next().css('color', '#000000'); 
			  } else {
			    $(this).next().text(dflt);
			  }
			});



		});
		</script>
		<script>

			function corpo(){
				document.getElementById('formFilesCorporation').style.display ='block';
			  	document.getElementById('formFilesSingleProprietorship').style.display = 'none';

			  	document.getElementById('secCertFullPath').required = true;
			  	document.getElementById('gisFullPath').required = true;
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
			  	document.getElementById('gisFullPath').required = false;
			  	document.getElementById('articleFullPath').required = false;
			  	document.getElementById('byLawFullPath').required = false;
			  	document.getElementById('finStateFullPath').required = false;

			  	document.getElementById('birCorFullPath').required = true;
			  	document.getElementById('dtiCertFullPath').required = true;
			  	document.getElementById('bizPermFullPath').required = true;
			  	document.getElementById('govIdFullPath').required = true;
				}

			function cliqqType() {
				var x = document.getElementById('cliqqType')
				if (x.style.display=="none") {
					x.style.display="block"
					
				}
				else {x.style.display="none"
					document.getElementById('billsPayment').checked = false;
					document.getElementById('eload').checked = false;
					document.getElementById('ePins').checked = false;
					document.getElementById('eMoney').checked = false;
					document.getElementById('remittance').checked = false;
				}	
			}
		</script>
		<style type="text/css">
		

		/* Hide the file input using
		opacity */
		[type=file] {
		    position: absolute;
		    margin-top: -4%;
		    margin-left:28%;
		    float: left;
		    z-index: 1;
		    /*filter: alpha(opacity=0);*/
		    opacity: 0;
		}
		input,
		[type=file] + label {
			  /*border: 1px solid #CCC;*/
			  border-radius: 3px;
			  /*text-align: left;*/
			  padding: 5px;
			  /*padding-right: 6%;*/
			  /*width: 150px;*/
			  /*margin: 0;*/
			  /*left: 0;*/
			  color:gray;
			  /*position: relative;*/
		}
		[type=file] + label {
			  text-align: center;
			  /*left: 7.35em;*/
			  /*top: 0.5em;*/
			  /* Decorative */
			  background: #FFFFFF;
			  color: #333333;
			  border: inset;
			  cursor: pointer;
			  overflow-wrap: break-word;
			  width: 255px;
		}
			[type=file] + label:hover {
			  background: #3399ff;
			  color:black;
			}
		</style>
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
					<div>
					<span id="formFilesCorporation" class="hideMe">
						<g:render template="formFilesCorporation"/>
					</span>
					<span id="formFilesSingleProprietorship" class="hideMe">
						<g:render template="formFilesSingleProprietorship"/>
					</span>
					</div>
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
