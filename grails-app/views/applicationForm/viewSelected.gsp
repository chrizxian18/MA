
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title></title>

	</head>
	<body>
		
		<div id="show-appForm" class="content scaffold-show" role="main">
			<h1>Application Details</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list applicationForm">

				%{-- Status --}%
				<g:if test="${applicationFormInstance?.status}">
				<li class="fieldcontain">
					<label id="status-label" class="property-label"><g:message code="appForm.status.label" default="Status" /></label>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${applicationFormInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.dateCreated}">
				<li class="fieldcontain">
					<label id="dateCreated-label" class="property-label"><g:message code="appForm.dateCreated.label" default="Date Created" /></label>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${applicationFormInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.lastUpdated}">
				<li class="fieldcontain">
					<label id="lastUpdated-label" class="property-label"><g:message code="appForm.lastUpdated.label" default="Last Updated" /></label>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${applicationFormInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>

				<h1>&nbsp;</h1>
			
				<g:if test="${applicationFormInstance?.sConnectWebIntegration}">
				<li class="fieldcontain">
					<label id="sConnectWebIntegration-label" class="property-label"><g:message code="appForm.sConnectWebIntegration.label" default="7-Connect Web Integration" /></label>
					
						<span class="property-value" aria-labelledby="sConnectWebIntegration-label"><g:formatBoolean boolean="${applicationFormInstance?.sConnectWebIntegration}" /></span>
					
				</li>
				</g:if>

			
				<g:if test="${applicationFormInstance?.cliqq}">
				<li class="fieldcontain">
					<label id="cliqq-label" class="property-label"><g:message code="appForm.cliqq.label" default="Cliqq" /></label>
					
						<span class="property-value" aria-labelledby="cliqq-label"><g:formatBoolean boolean="${applicationFormInstance?.cliqq}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.billsPayment}">
				<li class="fieldcontain">
					<label id="billsPayment-label" class="property-label"><g:message code="appForm.billsPayment.label" default="Bills Payment" /></label>
					
						<span class="property-value" aria-labelledby="billsPayment-label"><g:formatBoolean boolean="${applicationFormInstance?.billsPayment}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.eload}">
				<li class="fieldcontain">
					<label id="eload-label" class="property-label"><g:message code="appForm.eload.label" default="Load" /></label>
					
						<span class="property-value" aria-labelledby="eload-label"><g:formatBoolean boolean="${applicationFormInstance?.eload}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.ePins}">
				<li class="fieldcontain">
					<label id="ePins-label" class="property-label"><g:message code="appForm.ePins.label" default="E-Pins" /></label>
					
						<span class="property-value" aria-labelledby="ePins-label"><g:formatBoolean boolean="${applicationFormInstance?.ePins}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.eMoney}">
				<li class="fieldcontain">
					<label id="eMoney-label" class="property-label"><g:message code="appForm.eMoney.label" default="E-Money/E-Wallet " /></label>
					
						<span class="property-value" aria-labelledby="eMoney-label"><g:formatBoolean boolean="${applicationFormInstance?.eMoney}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.remittance}">
				<li class="fieldcontain">
					<label id="remittance-label" class="property-label"><g:message code="appForm.remittance.label" default="Remittance" /></label>
					
						<span class="property-value" aria-labelledby="remittance-label"><g:formatBoolean boolean="${applicationFormInstance?.remittance}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.merchantName}">
				<li class="fieldcontain">
					<label id="merchantName-label" class="property-label"><g:message code="appForm.merchantName.label" default="Merchant Name" /></label>
					
						<span class="property-value" aria-labelledby="merchantName-label"><g:fieldValue bean="${applicationFormInstance}" field="merchantName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.companyType}">
				<li class="fieldcontain">
					<label id="companyType-label" class="property-label"><g:message code="appForm.companyType.label" default="Company Type" /></label>
					
						<span class="property-value" aria-labelledby="companyType-label"><g:fieldValue bean="${applicationFormInstance}" field="companyType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.companyAddress}">
				<li class="fieldcontain">
					<label id="companyAddress-label" class="property-label"><g:message code="appForm.companyAddress.label" default="Company Address" /></label>
					
						<span class="property-value" aria-labelledby="companyAddress-label"><g:fieldValue bean="${applicationFormInstance}" field="companyAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.natureOfBusiness}">
				<li class="fieldcontain">
					<label id="natureOfBusiness-label" class="property-label"><g:message code="appForm.natureOfBusiness.label" default="Nature Of Business" /></label>
					
						<span class="property-value" aria-labelledby="natureOfBusiness-label"><g:fieldValue bean="${applicationFormInstance}" field="natureOfBusiness"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.businessDescription}">
				<li class="fieldcontain">
					<label id="businessDescription-label" class="property-label"><g:message code="appForm.businessDescription.label" default="Brief Description of Business" /></label>
					
						<span class="property-value" aria-labelledby="businessDescription-label"><g:fieldValue bean="${applicationFormInstance}" field="businessDescription"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.noOfSubscribers}">
				<li class="fieldcontain">
					<label id="noOfSubscribers-label" class="property-label"><g:message code="appForm.noOfSubscribers.label" default="No Of Subscribers" /></label>
					
						<span class="property-value" aria-labelledby="noOfSubscribers-label"><g:fieldValue bean="${applicationFormInstance}" field="noOfSubscribers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.websiteLink}">
				<li class="fieldcontain">
					<label id="websiteLink-label" class="property-label"><g:message code="appForm.websiteLink.label" default="Website Link" /></label>
					
						<span class="property-value" aria-labelledby="websiteLink-label"><g:fieldValue bean="${applicationFormInstance}" field="websiteLink"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.coveredAreas}">
				<li class="fieldcontain">
					<label id="coveredAreas-label" class="property-label"><g:message code="appForm.coveredAreas.label" default="Covered Areas" /></label>
					
						<span class="property-value" aria-labelledby="coveredAreas-label"><g:fieldValue bean="${applicationFormInstance}" field="coveredAreas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.launchDate}">
				<li class="fieldcontain">
					<label id="launchDate-label" class="property-label"><g:message code="appForm.launchDate.label" default="Launch Date" /></label>
					
						<span class="property-value" aria-labelledby="launchDate-label"><g:formatDate date="${applicationFormInstance?.launchDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.commissionFee}">
				<li class="fieldcontain">
					<label id="commissionFee-label" class="property-label"><g:message code="appForm.commissionFee.label" default="Commission Fee" /></label>
					
						<span class="property-value" aria-labelledby="commissionFee-label"><g:fieldValue bean="${applicationFormInstance}" field="commissionFee"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.modeOfPayment}">
				<li class="fieldcontain">
					<label id="modeOfPayment-label" class="property-label"><g:message code="appForm.modeOfPayment.label" default="Mode Of Payment" /></label>
					
						<span class="property-value" aria-labelledby="modeOfPayment-label"><g:fieldValue bean="${applicationFormInstance}" field="modeOfPayment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.bankName}">
				<li class="fieldcontain">
					<label id="bankName-label" class="property-label"><g:message code="appForm.bankName.label" default="Bank Name/Address" /></label>
					
						<span class="property-value" aria-labelledby="bankName-label"><g:fieldValue bean="${applicationFormInstance}" field="bankName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.accountType}">
				<li class="fieldcontain">
					<label id="accountType-label" class="property-label"><g:message code="appForm.accountType.label" default="Account Type" /></label>
					
						<span class="property-value" aria-labelledby="accountType-label"><g:fieldValue bean="${applicationFormInstance}" field="accountType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.accountName}">
				<li class="fieldcontain">
					<label id="accountName-label" class="property-label"><g:message code="appForm.accountName.label" default="Account Name" /></label>
					
						<span class="property-value" aria-labelledby="accountName-label"><g:fieldValue bean="${applicationFormInstance}" field="accountName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.accountNumber}">
				<li class="fieldcontain">
					<label id="accountNumber-label" class="property-label"><g:message code="appForm.accountNumber.label" default="Account Number" /></label>
					
						<span class="property-value" aria-labelledby="accountNumber-label"><g:fieldValue bean="${applicationFormInstance}" field="accountNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.moaSignatory}">
				<li class="fieldcontain">
					<label id="moaSignatory-label" class="property-label"><g:message code="appForm.moaSignatory.label" default="Name of MOA Signatory/Position" /></label>
					
						<span class="property-value" aria-labelledby="moaSignatory-label"><g:fieldValue bean="${applicationFormInstance}" field="moaSignatory"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.moaWitness}">
				<li class="fieldcontain">
					<label id="moaWitness-label" class="property-label"><g:message code="appForm.moaWitness.label" default="Name of MOA Witness" /></label>
					
						<span class="property-value" aria-labelledby="moaWitness-label"><g:fieldValue bean="${applicationFormInstance}" field="moaWitness"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.mainContactPerson}">
				<li class="fieldcontain">
					<label id="mainContactPerson-label" class="property-label"><g:message code="appForm.mainContactPerson.label" default="Main Contact Person/Details" /></label>
					
						<span class="property-value" aria-labelledby="mainContactPerson-label"><g:fieldValue bean="${applicationFormInstance}" field="mainContactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.itContactPerson}">
				<li class="fieldcontain">
					<label id="itContactPerson-label" class="property-label"><g:message code="appForm.itContactPerson.label" default="IT Contact Person/Details" /></label>
					
						<span class="property-value" aria-labelledby="itContactPerson-label"><g:fieldValue bean="${applicationFormInstance}" field="itContactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.afterSalesContactPerson}">
				<li class="fieldcontain">
					<label id="afterSalesContactPerson-label" class="property-label"><g:message code="appForm.afterSalesContactPerson.label" default="After Sales Contact Person/Details" /></label>
					
						<span class="property-value" aria-labelledby="afterSalesContactPerson-label"><g:fieldValue bean="${applicationFormInstance}" field="afterSalesContactPerson"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${applicationFormInstance?.financeContactPerson}">
				<li class="fieldcontain">
					<label id="financeContactPerson-label" class="property-label"><g:message code="appForm.financeContactPerson.label" default="Finance Contact Person/Details" /></label>
					
						<span class="property-value" aria-labelledby="financeContactPerson-label"><g:fieldValue bean="${applicationFormInstance}" field="financeContactPerson"/></span>
					
				</li>
				</g:if>

			

				%{-- uploadedFiles --}%
				<h1>&nbsp;</h1>
				<h3>Attachments</h3>
				<g:if test="${applicationFormInstance?.appFormFiles.birCorFullPath}">
				<li class="containtooltip">
					<label id="appFormFiles-label" class="property-label tooltip"><g:message code="appForm.appFormFiles.label" default="COR issued by BIR" /></label>
						<span class="property-value" aria-labelledby="appFormFiles-label" id="birCorFullPath">${applicationFormInstance.appFormFiles.birCorFullPath-grailsApplication.config.uploadFolder}</span>
					%{-- <span class="property-value"><g:link action="download" id="${applicationFormInstance.appFormFiles.id}">click to download and view attachment</g:link></span> --}%
				</li>
				</g:if>

				<g:if test="${applicationFormInstance?.appFormFiles.dtiCertFullPath}">
				<li class="containtooltip">
					<label class="property-label tooltip">DTI Certificate</label>
					
						<span class="property-value">${applicationFormInstance.appFormFiles.dtiCertFullPath-grailsApplication.config.uploadFolder}</span>
				</li>
				</g:if>
				
				<g:if test="${applicationFormInstance?.appFormFiles.bizPermFullPath}">
				<li class="containtooltip">
					<label class="property-label tooltip">Business/Mayor’s Permit</label>
					
						<span class="property-value">${applicationFormInstance.appFormFiles.bizPermFullPath-grailsApplication.config.uploadFolder}</span>
				</li>
				</g:if>


				<g:if test="${applicationFormInstance?.appFormFiles.govIdFullPath}">
				<li class="containtooltip">
					<label class="property-label tooltip">Copy of gov’t issued I.D</label>
					
						<span class="property-value">${applicationFormInstance.appFormFiles.govIdFullPath-grailsApplication.config.uploadFolder}</span>
				</li>
				</g:if>


				<g:if test="${applicationFormInstance?.appFormFiles.secCertFullPath}">
				<li class="containtooltip">
					<label class="property-label tooltip">Sec Cert of authority<span class="tooltiptext">Sec Cert of authority of signatories showing authority of its representative to sign and enter this agreement (original)</span></label>
					
						<span class="property-value">${applicationFormInstance.appFormFiles.secCertFullPath-grailsApplication.config.uploadFolder}</span>
				</li>
				</g:if>
				
				<g:if test="${applicationFormInstance?.appFormFiles.gisFullPath}">
				<li class="containtooltip">
					<label class="property-label tooltip">Latest GIS<span class="tooltiptext">Latest GIS;(certified true copy)</span></label>
						<span class="property-value">${applicationFormInstance.appFormFiles.gisFullPath-grailsApplication.config.uploadFolder}</span>
				</li>
				</g:if>

				<g:if test="${applicationFormInstance?.appFormFiles.articleFullPath}">
				<li class="containtooltip">
					<label class="property-label tooltip">Articles of Incorporation<span class="tooltiptext">Articles of Incorporation or Amended Articles of Incorporation;(certified true copy)</span></label>
						<span class="property-value">${applicationFormInstance.appFormFiles.articleFullPath-grailsApplication.config.uploadFolder}</span>
				</li>
				</g:if>

				<g:if test="${applicationFormInstance?.appFormFiles.byLawFullPath}">
				<li class="containtooltip">
					<label class="property-label tooltip">By-Laws<span class="tooltiptext">By-Laws or Amended By-Laws approved by SEC (certified true copy)</span></label>
						<span class="property-value">${applicationFormInstance.appFormFiles.byLawFullPath-grailsApplication.config.uploadFolder}</span>
				</li>
				</g:if>

				<g:if test="${applicationFormInstance?.appFormFiles.finStateFullPath}">
				<li class="containtooltip">
					<label class="property-label tooltip">Financial Statement<span class="tooltiptext">Latest Audited Financial Statement (certified true copy)</span></label>
						<span class="property-value">${applicationFormInstance.appFormFiles.finStateFullPath-grailsApplication.config.uploadFolder}</span>
				</li>
				</g:if>

			</ol>

				<g:form resource="${applicationFormInstance}" controller="applicationForm" enctype="multipart/form-data" method="POST" >
				<fieldset class="form">
				</fieldset>
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${applicationFormInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					%{-- <g:link class="edit" action="edit" resource="${applicationFormInstance.appFormFiles}"><g:message code="default.button.edit.label" default="Edit" /></g:link> --}%
					<g:actionSubmit action="delete" class="delete" value="Delete" />
					<g:actionSubmit action="saveAndSend" class="save" value="Submit" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
