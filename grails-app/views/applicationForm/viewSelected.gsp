
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title></title>
	</head>
	<body>
		
		<div id="show-appForm" class="content scaffold-show" role="main">
			<h1>&nbsp;</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list applicationForm">
			
				<g:if test="${applicationFormInstance?.sConnectWebIntegration}">
				<li class="fieldcontain">
					<span id="sConnectWebIntegration-label" class="property-label"><g:message code="appForm.sConnectWebIntegration.label" default="7-Connect Web Integration" /></span>
					
						<span class="property-value" aria-labelledby="sConnectWebIntegration-label"><g:formatBoolean boolean="${applicationFormInstance?.sConnectWebIntegration}" /></span>
					
				</li>
				</g:if>

			
				<g:if test="${applicationFormInstance?.cliqq}">
				<li class="fieldcontain">
					<span id="cliqq-label" class="property-label"><g:message code="appForm.cliqq.label" default="Cliqq" /></span>
					
						<span class="property-value" aria-labelledby="cliqq-label"><g:formatBoolean boolean="${applicationFormInstance?.cliqq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.billsPayment}">
				<li class="fieldcontain">
					<span id="billsPayment-label" class="property-label"><g:message code="appForm.billsPayment.label" default="Bills Payment" /></span>
					
						<span class="property-value" aria-labelledby="billsPayment-label"><g:formatBoolean boolean="${applicationFormInstance?.billsPayment}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.eload}">
				<li class="fieldcontain">
					<span id="eload-label" class="property-label"><g:message code="appForm.eload.label" default="Load" /></span>
					
						<span class="property-value" aria-labelledby="eload-label"><g:formatBoolean boolean="${applicationFormInstance?.eload}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.ePins}">
				<li class="fieldcontain">
					<span id="ePins-label" class="property-label"><g:message code="appForm.ePins.label" default="E-Pins" /></span>
					
						<span class="property-value" aria-labelledby="ePins-label"><g:formatBoolean boolean="${applicationFormInstance?.ePins}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.eMoney}">
				<li class="fieldcontain">
					<span id="eMoney-label" class="property-label"><g:message code="appForm.eMoney.label" default="E-Money/E-Wallet " /></span>
					
						<span class="property-value" aria-labelledby="eMoney-label"><g:formatBoolean boolean="${applicationFormInstance?.eMoney}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.remittance}">
				<li class="fieldcontain">
					<span id="remittance-label" class="property-label"><g:message code="appForm.remittance.label" default="Remittance" /></span>
					
						<span class="property-value" aria-labelledby="remittance-label"><g:formatBoolean boolean="${applicationFormInstance?.remittance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.merchantName}">
				<li class="fieldcontain">
					<span id="merchantName-label" class="property-label"><g:message code="appForm.merchantName.label" default="Merchant Name" /></span>
					
						<span class="property-value" aria-labelledby="merchantName-label"><g:fieldValue bean="${applicationFormInstance}" field="merchantName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.companyType}">
				<li class="fieldcontain">
					<span id="companyType-label" class="property-label"><g:message code="appForm.companyType.label" default="Company Type" /></span>
					
						<span class="property-value" aria-labelledby="companyType-label"><g:fieldValue bean="${applicationFormInstance}" field="companyType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.companyAddress}">
				<li class="fieldcontain">
					<span id="companyAddress-label" class="property-label"><g:message code="appForm.companyAddress.label" default="Company Address" /></span>
					
						<span class="property-value" aria-labelledby="companyAddress-label"><g:fieldValue bean="${applicationFormInstance}" field="companyAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.natureOfBusiness}">
				<li class="fieldcontain">
					<span id="natureOfBusiness-label" class="property-label"><g:message code="appForm.natureOfBusiness.label" default="Nature Of Business" /></span>
					
						<span class="property-value" aria-labelledby="natureOfBusiness-label"><g:fieldValue bean="${applicationFormInstance}" field="natureOfBusiness"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.businessDescription}">
				<li class="fieldcontain">
					<span id="businessDescription-label" class="property-label"><g:message code="appForm.businessDescription.label" default="Brief Description of Business" /></span>
					
						<span class="property-value" aria-labelledby="businessDescription-label"><g:fieldValue bean="${applicationFormInstance}" field="businessDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.noOfSubscribers}">
				<li class="fieldcontain">
					<span id="noOfSubscribers-label" class="property-label"><g:message code="appForm.noOfSubscribers.label" default="No Of Subscribers" /></span>
					
						<span class="property-value" aria-labelledby="noOfSubscribers-label"><g:fieldValue bean="${applicationFormInstance}" field="noOfSubscribers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.websiteLink}">
				<li class="fieldcontain">
					<span id="websiteLink-label" class="property-label"><g:message code="appForm.websiteLink.label" default="Website Link" /></span>
					
						<span class="property-value" aria-labelledby="websiteLink-label"><g:fieldValue bean="${applicationFormInstance}" field="websiteLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.coveredAreas}">
				<li class="fieldcontain">
					<span id="coveredAreas-label" class="property-label"><g:message code="appForm.coveredAreas.label" default="Covered Areas" /></span>
					
						<span class="property-value" aria-labelledby="coveredAreas-label"><g:fieldValue bean="${applicationFormInstance}" field="coveredAreas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.launchDate}">
				<li class="fieldcontain">
					<span id="launchDate-label" class="property-label"><g:message code="appForm.launchDate.label" default="Launch Date" /></span>
					
						<span class="property-value" aria-labelledby="launchDate-label"><g:formatDate date="${applicationFormInstance?.launchDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.commissionFee}">
				<li class="fieldcontain">
					<span id="commissionFee-label" class="property-label"><g:message code="appForm.commissionFee.label" default="Commission Fee" /></span>
					
						<span class="property-value" aria-labelledby="commissionFee-label"><g:fieldValue bean="${applicationFormInstance}" field="commissionFee"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.modeOfPayment}">
				<li class="fieldcontain">
					<span id="modeOfPayment-label" class="property-label"><g:message code="appForm.modeOfPayment.label" default="Mode Of Payment" /></span>
					
						<span class="property-value" aria-labelledby="modeOfPayment-label"><g:fieldValue bean="${applicationFormInstance}" field="modeOfPayment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.bankName}">
				<li class="fieldcontain">
					<span id="bankName-label" class="property-label"><g:message code="appForm.bankName.label" default="Bank Name/Address" /></span>
					
						<span class="property-value" aria-labelledby="bankName-label"><g:fieldValue bean="${applicationFormInstance}" field="bankName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.accountType}">
				<li class="fieldcontain">
					<span id="accountType-label" class="property-label"><g:message code="appForm.accountType.label" default="Account Type" /></span>
					
						<span class="property-value" aria-labelledby="accountType-label"><g:fieldValue bean="${applicationFormInstance}" field="accountType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.accountName}">
				<li class="fieldcontain">
					<span id="accountName-label" class="property-label"><g:message code="appForm.accountName.label" default="Account Name" /></span>
					
						<span class="property-value" aria-labelledby="accountName-label"><g:fieldValue bean="${applicationFormInstance}" field="accountName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.accountNumber}">
				<li class="fieldcontain">
					<span id="accountNumber-label" class="property-label"><g:message code="appForm.accountNumber.label" default="Account Number" /></span>
					
						<span class="property-value" aria-labelledby="accountNumber-label"><g:fieldValue bean="${applicationFormInstance}" field="accountNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.moaSignatory}">
				<li class="fieldcontain">
					<span id="moaSignatory-label" class="property-label"><g:message code="appForm.moaSignatory.label" default="Name of MOA Signatory/Position" /></span>
					
						<span class="property-value" aria-labelledby="moaSignatory-label"><g:fieldValue bean="${applicationFormInstance}" field="moaSignatory"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.moaWitness}">
				<li class="fieldcontain">
					<span id="moaWitness-label" class="property-label"><g:message code="appForm.moaWitness.label" default="Name of MOA Witness" /></span>
					
						<span class="property-value" aria-labelledby="moaWitness-label"><g:fieldValue bean="${applicationFormInstance}" field="moaWitness"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.mainContactPerson}">
				<li class="fieldcontain">
					<span id="mainContactPerson-label" class="property-label"><g:message code="appForm.mainContactPerson.label" default="Main Contact Person/Details" /></span>
					
						<span class="property-value" aria-labelledby="mainContactPerson-label"><g:fieldValue bean="${applicationFormInstance}" field="mainContactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.itContactPerson}">
				<li class="fieldcontain">
					<span id="itContactPerson-label" class="property-label"><g:message code="appForm.itContactPerson.label" default="IT Contact Person/Details" /></span>
					
						<span class="property-value" aria-labelledby="itContactPerson-label"><g:fieldValue bean="${applicationFormInstance}" field="itContactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.afterSalesContactPerson}">
				<li class="fieldcontain">
					<span id="afterSalesContactPerson-label" class="property-label"><g:message code="appForm.afterSalesContactPerson.label" default="After Sales Contact Person/Details" /></span>
					
						<span class="property-value" aria-labelledby="afterSalesContactPerson-label"><g:fieldValue bean="${applicationFormInstance}" field="afterSalesContactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.financeContactPerson}">
				<li class="fieldcontain">
					<span id="financeContactPerson-label" class="property-label"><g:message code="appForm.financeContactPerson.label" default="Finance Contact Person/Details" /></span>
					
						<span class="property-value" aria-labelledby="financeContactPerson-label"><g:fieldValue bean="${applicationFormInstance}" field="financeContactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="appForm.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${applicationFormInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="appForm.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${applicationFormInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="appForm.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:fieldValue bean="${applicationFormInstance}" field="updatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="appForm.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${applicationFormInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="appForm.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${applicationFormInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			%{-- <g:form url="[resource:applicationFormInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${applicationFormInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset> --}%

				<g:form resource="${applicationFormInstance}" controller="applicationForm" enctype="multipart/form-data" method="POST" >
				<fieldset class="form">
				</fieldset>
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${applicationFormInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit action="delete" class="delete" value="Delete" />
					<g:actionSubmit action="saveAndSend" class="save" value="Submit" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
