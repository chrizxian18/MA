<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Application Form</title>
		<style type="text/css">
			.myListItem {
				margin-bottom: 2%;
			}
			.myButton {
				margin-left:7%;
				 padding-top: 5px;
				 padding-bottom: 5px; 
				 background-color:#C3B6B6;
			}
		</style>
	</head>
	<body>
		<div id="create-applicationForm" class="content scaffold-create" role="main">
			<h1>Application Form</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${applicationFormInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${applicationFormInstance}" var="error">
				<li> <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form controller="applicationForm" enctype="multipart/form-data" method="post" >
				<fieldset class="form">
					<h3>Please read carefully</h3>
					<br>
					<h4><em>Connect Commercial Terms</em></h4>
					<br>
					<p>Please see below details and attached draft MOA for your inquiry on 7-Connect. </p>
					<br>
					<div style="margin-left: 5%;">
					<ul>
						<li class="myListItem">Settlement preferred at BPI for online transfer. For other banks, only check payment for pick up at 7th  Floor Columbia Tower Ortigas Mandaluyong City</li>
						<li class="myListItem">Remittance is every Friday for Thurs to Wed transactions.</li>
					</ul>
				</div>

					<h4><em>Important Reminders</em></h4>
				<br>
				<div style="margin-left: 5%;">
					<ul>
						<li class="myListItem">Check the integration guide http://dev.philseven.com. Proceed with the processing of documents only if the integration guide is acceptable and doable on your end.</li>
						<li class="myListItem">MOA processing and IT integration should be considered before confirming slot schedule. We avoid announcing new merchants to stores if integration is not yet done.</li>
						<li class="myListItem">MOA will not be processed if documents are incomplete.</li>
						<li class="myListItem">Integration will not be processed without MOA being finalized.</li>
						<li class="myListItem">Submit the accreditation form. This will also be the basis of our Legal in finalizing the contract.</li>
						<li class="myListItem">The Merchant Agreement is our standard agreement and is not allowed for revision. Any revision is subject for approval of PSC Management.</li>
						<li class="myListItem">Please be informed that the usual process if check payment is:</li>
						<li class="myListItem">Transactions for Thursday to Wed will be requested for Payment on Thursday</li>
						<li class="myListItem">Friday: Will request for Check Payment (routing of signature and approval)</li>
						<li class="myListItem">Next Monday: Request loading of fund (routing for signature)</li>
						<li class="myListItem">Next Wednesday: Estimate release of check.</li>
						<li class="myListItem">Settlement report on Thursday.</li>
						<li class="myListItem">Pick up schedule is every Wed to Friday 1 to 5pm</li>
						<li class="myListItem">P2000 minimum amount for check release</li>
						<li class="myListItem">Once MOA has been finalized and execution copy has been provided:</li>
						<li class="myListItem">Produce 5 copies on a Legal sized bond paper and sign on every page with witness including the Annex</li>
						<li class="myListItem">Notarize the part of your company</li>
						<li class="myListItem">Return 3 copies of the signed and notarized MOA for PSC to sign.</li>
	
					</ul>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<span class="myButton"><a href="${createLink(uri: '/applicationForm/create')}"><g:message code="Next"/></a></span>
					%{-- <g:actionSubmit action="save" class="save" value="Save as Draft" onclick="return validate()"/>
					<g:actionSubmit action="saveAndSend" class="save" value="Submit" /> --}%
					%{-- <g:submitButton name="submit" action="saveAndSend"class="save" value="Submit" /> --}%
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
