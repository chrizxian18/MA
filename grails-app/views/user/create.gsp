<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<meta name="layout" content="main">
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<script>
		$(document).ready(function(){

		 $('input.number').keyup(function(){
        if (
            ($(this).val().length > 0) && ($(this).val().substr(0,3) != '+63')
            || ($(this).val() == '')
            ){
            $(this).val('+63');    
        }
    });

        function isNumber(e){
          e = e || window.event;
          var charCode = e.which ? e.which : e.keyCode;
          return /\d/.test(String.fromCharCode(charCode));
        }

        });	
        </script>

        <style type="text/css">
        	.field-icon {
        	  color:#277D5F;
			  float: right;
			  margin-left: -25px;
			  margin-top: 4px;
			  position: absolute;
			  z-index: 2;
			}
        </style>
	</head>
	<body>
		<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="create-user" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:if test="${flash.error}">
			<ul class="errors" role="alert"><li>${flash.error}</li></ul>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
