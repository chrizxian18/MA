<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<link rel="shortcut icon" href="${assetPath(src: 'favicon2.ico')}" type="image/x-icon">
		<asset:stylesheet src="main.css"/>
		<asset:javascript src="application.js"/>
		<script>
		$(document).ready(function(){
	        
			$(".toggle-password").click(function() {

			  $(this).toggleClass("fa-eye fa-eye-slash");
			  var input = $($(this).attr("toggle"));
			  if (input.attr("type") == "password") {
			    input.attr("type", "text");
			  } else {
			    input.attr("type", "password");
			  }
			});

		

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
		<div id="grailsLogo" role="banner" style="padding:2%; color:black;"><h1 style="color:black;">&nbsp;</h1></div>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
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
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
