%{-- <%@ page import="merchantacquisition.ApplicationForm" %> --}%
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'applicationForm.label', default: 'ApplicationForm')}" />
		<meta name="layout" content="main">
		<asset:javascript src="application.js"/>
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
		</script>
		<style type="text/css">
		

		/* Hide the file input using
		opacity */
		[type=file] {
		    position: absolute;
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
			  position: relative;
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
		
		<a href="#edit-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="edit-applicationForm" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
			%{-- <g:form url="[resource:applicationFormInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${applicationFormInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset> --}%

				<g:form resource="${applicationFormInstance}" controller="applicationForm" enctype="multipart/form-data" method="put" >
				<fieldset class="form">
					<g:render template="form"/>
					%{-- <g:render template="formFilesEdit"/> --}%
					<span id="formFilesSingleProprietorship" >
						<g:render template="formFilesEditSingleProprietorship"/>
					</span>

					<span id="formFilesCorporation" >
						<g:render template="formFilesEditCorporation"/>
					</span>

				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit action="updateDrafts" class="save" value="Save as Draft" />
					<g:actionSubmit action="saveAndSend" class="save" value="Submit" />
				</fieldset>
			</g:form>
			
		</div>
		
	</body>
</html>
