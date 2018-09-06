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

			var click = document.getElementById('cliqq')
			if (click.checked == true) {
				document.getElementById('cliqqType').style.display = 'block';
			}

			var ctCorporation = document.getElementById('Corporation')
			if (ctCorporation.checked == true) {
				// document.getElementById('cliqqType').style.display = 'block';
				document.getElementById('formFilesEditCorporation').style.display ='block';
		  	document.getElementById('formFilesCorporation').style.display ='none';
		  	document.getElementById('formFilesSingleProprietorship').style.display = 'none';
		  	document.getElementById('formFilesEditSingleProprietorship').style.display = 'none';
			}

			var ctsingleProprietorship = document.getElementById('singleProprietorship')
			if (ctsingleProprietorship.checked == true) {
				// document.getElementById('cliqqType').style.display = 'block';
				document.getElementById('formFilesEditCorporation').style.display ='none';
		  	document.getElementById('formFilesCorporation').style.display ='none';
		  	document.getElementById('formFilesSingleProprietorship').style.display = 'none';
		  	document.getElementById('formFilesEditSingleProprietorship').style.display = 'block';
			}

		});
		</script>
		<script>

		
			function corpo(){
				if (document.getElementById('lbl_gisFullPath')) {
					document.getElementById('formFilesEditCorporation').style.display ='block';
				  	document.getElementById('formFilesCorporation').style.display ='none';
				  	document.getElementById('formFilesSingleProprietorship').style.display = 'none';
				  	document.getElementById('formFilesEditSingleProprietorship').style.display = 'none';

				  	document.getElementById('secCertFullPath').required = false;
				  	document.getElementById('gisFullPath').required = false;
				  	document.getElementById('articleFullPath').required = false;	
				  	document.getElementById('byLawFullPath').required = false;
				  	document.getElementById('finStateFullPath').required = false;
				  	document.getElementById('birCorFullPath').required = false;
				  	document.getElementById('dtiCertFullPath').required = false;
				  	document.getElementById('bizPermFullPath').required = false;
				  	document.getElementById('govIdFullPath').required = false;
				}else{
					document.getElementById('formFilesCorporation').style.display ='block';
				  	document.getElementById('formFilesEditCorporation').style.display ='none';
				  	document.getElementById('formFilesSingleProprietorship').style.display = 'none';
				  	document.getElementById('formFilesEditSingleProprietorship').style.display = 'none';

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


			}

			function singlePro(){
				
				if (document.getElementById('lbl_birCorFullPath')) {
				  	document.getElementById('formFilesEditSingleProprietorship').style.display = 'block';
				  	document.getElementById('formFilesSingleProprietorship').style.display = 'none';
				  	document.getElementById('formFilesCorporation').style.display ='none';
					document.getElementById('formFilesEditCorporation').style.display ='none';
					
					document.getElementById('secCertFullPath').required = false;
				  	document.getElementById('gisFullPath').required = false;
				  	document.getElementById('articleFullPath').required = false;	
				  	document.getElementById('byLawFullPath').required = false;
				  	document.getElementById('finStateFullPath').required = false;
				  	document.getElementById('birCorFullPath').required = false;
				  	document.getElementById('dtiCertFullPath').required = false;
				  	document.getElementById('bizPermFullPath').required = false;
				  	document.getElementById('govIdFullPath').required = false;		
				}else{
				  	document.getElementById('formFilesSingleProprietorship').style.display = 'block';
					document.getElementById('formFilesEditSingleProprietorship').style.display = 'none';
				  	document.getElementById('formFilesCorporation').style.display ='none';
					document.getElementById('formFilesEditCorporation').style.display ='none';

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
			}

			function goBack(){
				history.back();
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
		    z-index: -1;
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
		
		<a href="#edit-applicationForm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="edit-applicationForm" class="content scaffold-edit" role="main">
			<h1>Edit Application Form</h1>
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
					<div>
						<span id="formFilesEditSingleProprietorship" >
							<g:render template="formFilesEditSingleProprietorship"/>
						</span>

						<span id="formFilesEditCorporation" >
							<g:render template="formFilesEditCorporation"/>
						</span>
					</div>
					%{-- if company type is changed --}%
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
					<g:actionSubmit action="updateDrafts" class="save" value="Save as Draft" />
					<g:actionSubmit action="saveAndSend" class="save" value="Submit" />
					<input type="button" data-toggle="modal" data-target="#cancelEdit" value="Cancel" />

				  <!-- Modal -->
				  <div class="modal fade" id="cancelEdit" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <i class="material-icons" style="color:#FF5C14; margin-left: 43%; font-size:50px;">warning</i><h2 class="modal-title" style="margin-left: 33%; height: 50px; color:#D9534F">Cancel Edit! </h2>
				        </div>
				        <div class="modal-body">
				          <p style="text-align: center;">Are you sure that you want to cancel? All of your changes will not be saved!</p>
				        </div>
				        <div class="modal-footer" style="text-align: center;">
				          <button type="button" class="btn btn-danger"  onclick="goBack()" data-dismiss="modal">Yes</button>
				          <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
				        </div>
				      </div>
				  </div>
				</div>

					
				</fieldset>
			</g:form>
			
		</div>
		
	</body>
</html>
