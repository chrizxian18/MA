

		
	<ol class="property-list applicationForm">
		<div><h1></h1></div>
			<p>7-Connect Model:</p>
		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'sConnectWebIntegration', 'error')} ">
			<label for="sConnectWebIntegration">
				<g:message code="applicationForm.sConnectWebIntegration.label" default="7-Connect Web Integration" />
				
			</label>
			<g:checkBox onclick="return false;" name="sConnectWebIntegration" value="${applicationFormInstance?.sConnectWebIntegration}" />

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'cliqq', 'error')} ">
			<label for="cliqq">
				<g:message code="applicationForm.cliqq.label" default="Cliqq" />
				
			</label>
			<g:checkBox onclick="return false;" name="cliqq" value="${applicationFormInstance?.cliqq}" />

		</div>

		<div><h1></h1></div>

			<p>Cliqq Type:</p>
		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'billsPayment', 'error')} ">
			<label for="billsPayment">
				<g:message code="applicationForm.billsPayment.label" default="Bills Payment" />
				
			</label>
			<g:checkBox onclick="return false;" name="billsPayment" value="${applicationFormInstance?.billsPayment}" />

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'eload', 'error')} ">
			<label for="eload">
				<g:message code="applicationForm.eload.label" default="Load" />
				
			</label>
			<g:checkBox onclick="return false;" name="eload" value="${applicationFormInstance?.eload}" />

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'ePins', 'error')} ">
			<label for="ePins">
				<g:message code="applicationForm.ePins.label" default="E-Pins" />
				
			</label>
			<g:checkBox onclick="return false;" name="ePins" value="${applicationFormInstance?.ePins}" />

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'eMoney', 'error')} ">
			<label for="eMoney">
				<g:message code="applicationForm.eMoney.label" default="E-Money/E-Wallet" />
				
			</label>
			<g:checkBox onclick="return false;" name="eMoney" value="${applicationFormInstance?.eMoney}" />

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'remittance', 'error')} ">
			<label for="remittance">
				<g:message code="applicationForm.remittance.label" default="Remittance" />
				
			</label>
			<g:checkBox onclick="return false;" name="remittance" value="${applicationFormInstance?.remittance}" />

		</div>

		<div><h1></h1></div>

		<div class="fieldcontain">
			<label for="merchantName">
				<g:message code="applicationForm.merchantName.label" default="Merchant Name" />
				<span class="required-indicator">*</span>
			</label>
			<input type="text" readonly name="merchantName" required="" value="${applicationFormInstance?.merchantName}"/>

		</div>

		<div class="fieldcontain">
			<label>Company Type:</label>
		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'companyType', 'error')} required">
		<label for="Single Proprietorship">
			<g:message code="applicationForm.companyType.label" default="Single Proprietorship" />
			</label>
			<g:radio  onclick="return false;" id="companyType" required="" name="companyType" value="Single Proprietorship" checked="${applicationFormInstance?.companyType == 'Single Proprietorship'}"/>
			<label for="Corporation">
			<g:message code="applicationForm.companyType.label" default="Corporation"/>
		</label>
			<g:radio  onclick="return false;" name="companyType" required="" value="Corporation" checked="${applicationFormInstance?.companyType == 'Corporation'}"/>
		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'companyAddress', 'error')} required">
			<label for="companyAddress">
				<g:message code="applicationForm.companyAddress.label" default="Company Address" />
				<span class="required-indicator">*</span>
			</label>
			<input type="text" readonly name="companyAddress" required="" value="${applicationFormInstance?.companyAddress}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'natureOfBusiness', 'error')} required">
			<label for="natureOfBusiness">
				<g:message code="applicationForm.natureOfBusiness.label" default="Nature Of Business" />
				<span class="required-indicator">*</span>
			</label>
			<input type="text" readonly name="natureOfBusiness" required="" value="${applicationFormInstance?.natureOfBusiness}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'businessDescription', 'error')} required">
			<label for="businessDescription">
				<g:message code="applicationForm.businessDescription.label" default="Brief Description of Business" />
				<span class="required-indicator">*</span>
			</label>
			<g:textArea readonly="readonly" name="businessDescription" required="" value="${applicationFormInstance?.businessDescription}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'noOfSubscribers', 'error')} ">
			<label for="noOfSubscribers">
				<g:message code="applicationForm.noOfSubscribers.label" default="No Of Subscribers" />
				
			</label>
			<input type="text" readonly name="noOfSubscribers" type="number" value="${applicationFormInstance.noOfSubscribers}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'websiteLink', 'error')} ">
			<label for="websiteLink">
				<g:message code="applicationForm.websiteLink.label" default="Website Link" />
				
			</label>
			<input type="text" readonly name="websiteLink" value="${applicationFormInstance?.websiteLink}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'coveredAreas', 'error')} ">
			<label for="coveredAreas">
				<g:message code="applicationForm.coveredAreas.label" default="Covered Areas" />
				
			</label>
			<input type="text" readonly name="coveredAreas" value="${applicationFormInstance?.coveredAreas}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'launchDate', 'error')} required">
			<label for="launchDate">
				<g:message code="applicationForm.launchDate.label" default="Launch Date" />
				<span class="required-indicator">*</span>
			</label>
			<g:formatDate format="yyyy-MM-dd" date="${applicationFormInstance?.launchDate}"/>

		</div>


		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'commissionFee', 'error')} ">
			<label for="commissionFee">
				<g:message code="applicationForm.commissionFee.label" default="Commission Fee" />
				
			</label>
			<input type="text" readonly name="commissionFee" value="${fieldValue(bean: applicationFormInstance, field: 'commissionFee')}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'modeOfPayment', 'error')} required">
			<label for="modeOfPayment">
				<g:message code="applicationForm.modeOfPayment.label" default="Mode Of Payment" />
				<span class="required-indicator">*</span>
			</label>
			<input type="text" readonly name="modeOfPayment" required="" value="${applicationFormInstance?.modeOfPayment}"/>

		</div>

		<div><h1></h1></div>
		<p>Bank Details:</p>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'bankName', 'error')} ">
			<label for="bankName">
				<g:message code="applicationForm.bankName.label" default="Bank Name/Address" />
				
			</label>
			<input type="text" readonly name="bankName" value="${applicationFormInstance?.bankName}"/>

		</div>



		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'accountName', 'error')} ">
			<label for="accountName">
				<g:message code="applicationForm.accountName.label" default="Account Name" />
				
			</label>
			<input type="text" readonly name="accountName" value="${applicationFormInstance?.accountName}"/>

		</div>



		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'accountNumber', 'error')} ">
			<label for="accountNumber">
				<g:message code="applicationForm.accountNumber.label" default="Account Number" />
				
			</label>
			<input type="text" readonly name="accountNumber" type="number" value="${applicationFormInstance.accountNumber}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'accountType', 'error')} ">
			<label for="Savings">
			<g:message code="applicationForm.accountType.label" default="Savings" />
			</label>
			<g:radio  onclick="return false;" name="accountType" value="Savings" checked="${applicationFormInstance?.accountType.equals('Savings')}"/>
			<label for="Check">
			<g:message code="applicationForm.accountType.label" default="Check"/>
			</label>
			<g:radio  onclick="return false;" name="accountType" value="Check" checked="${applicationFormInstance?.accountType.equals('Check')}"/>
		</div>

		<div><h1></h1></div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'moaSignatory', 'error')} ">
			<label for="moaSignatory">
				<g:message code="applicationForm.moaSignatory.label" default="Name of MOA Signatory/Position" />
				
			</label>
			<g:textArea readonly="readonly" name="moaSignatory" value="${applicationFormInstance?.moaSignatory}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'moaWitness', 'error')} ">
			<label for="moaWitness">
				<g:message code="applicationForm.moaWitness.label" default="Name of MOA Witness" />
				
			</label>
			<input type="text" readonly name="moaWitness" value="${applicationFormInstance?.moaWitness}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'mainContactPerson', 'error')} required">
			<label for="mainContactPerson">
				<g:message code="applicationForm.mainContactPerson.label" default="Main Contact Person/Details" />
				<span class="required-indicator">*</span>
			</label>
			<g:textArea readonly="readonly" name="mainContactPerson" required="" value="${applicationFormInstance?.mainContactPerson}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'itContactPerson', 'error')} ">
			<label for="itContactPerson">
				<g:message code="applicationForm.itContactPerson.label" default="IT Contact Person/Details" />
				
			</label>
			<g:textArea readonly="readonly" name="itContactPerson" value="${applicationFormInstance?.itContactPerson}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'afterSalesContactPerson', 'error')} ">
			<label for="afterSalesContactPerson">
				<g:message code="applicationForm.afterSalesContactPerson.label" default="After Sales Contact Person/Details" />
				
			</label>
			<g:textArea readonly="readonly" name="afterSalesContactPerson" value="${applicationFormInstance?.afterSalesContactPerson}"/>

		</div>

		<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'financeContactPerson', 'error')} ">
			<label for="financeContactPerson">
				<g:message code="applicationForm.financeContactPerson.label" default="Finance Contact Person/Details" />
				
			</label>
			<g:textArea readonly="readonly" name="financeContactPerson" value="${applicationFormInstance?.financeContactPerson}"/>

		</div>


		<h1>&nbsp;</h1>
		<p>Legal Requirements:</p>
		<g:if test="${applicationFormInstance?.appFormFiles.birCorFullPath}">
		<li class="fieldcontain">
			<label id="appFormFiles-label" class="property-label"><g:message code="appForm.appFormFiles.label" default="COR issued by BIR" /></label>
			
				<span class="property-value" aria-labelledby="appFormFiles-label"><g:link action="downloadcor" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.birCorFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>

		<g:if test="${applicationFormInstance?.appFormFiles.dtiCertFullPath}">
		<li class="fieldcontain">
			<label class="property-label">DTI Certificate</label>
			
				<span class="property-value"><g:link action="downloaddtiCert" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.dtiCertFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>
		
		<g:if test="${applicationFormInstance?.appFormFiles.bizPermFullPath}">
		<li class="fieldcontain">
			<label class="property-label">Business/Mayor’s Permit</label>
			
				<span class="property-value"><g:link action="downloadbizPerm" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.bizPermFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>

		<g:if test="${applicationFormInstance?.appFormFiles.govIdFullPath}">
		<li class="fieldcontain">
			<label class="property-label">Copy of gov’t issued I.D</label>
			
				<span class="property-value"><g:link action="downloadgovId" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.govIdFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>

		<g:if test="${applicationFormInstance?.appFormFiles.secCertFullPath}">
		<li class="containtooltip">
			<span class="property-label tooltip">Sec Cert of authority<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i><span class="tooltiptext">Sec Cert of authority of signatories showing authority of its representative to sign and enter this agreement (original)</span></span>
			
				<span class="property-value"><g:link action="downloadsecCert" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.secCertFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>

		<g:if test="${applicationFormInstance?.appFormFiles.gisFullPath}">
		<li class="containtooltip">
			<span class="property-label tooltip">Latest GIS<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Latest GIS;(certified true copy)</span></span>
				<span class="property-value"><g:link action="downloadgis" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.gisFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>

		<g:if test="${applicationFormInstance?.appFormFiles.articleFullPath}">
		<li class="containtooltip">
			<span class="property-label tooltip">Articles of Incorporation<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Articles of Incorporation or Amended Articles of Incorporation;(certified true copy)</span></span>
				<span class="property-value"><g:link action="downloadarticle" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.articleFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>

		<g:if test="${applicationFormInstance?.appFormFiles.byLawFullPath}">
		<li class="containtooltip">
			<span class="property-label tooltip">By-Laws<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">By-Laws or Amended By-Laws approved by SEC (certified true copy)</span></span>
				<span class="property-value"><g:link action="downloadbyLaw" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.byLawFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>

		<g:if test="${applicationFormInstance?.appFormFiles.finStateFullPath}">
		<li class="containtooltip">
			<span class="property-label tooltip">Financial Statement<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Latest Audited Financial Statement (certified true copy)</span></span>
				<span class="property-value"><g:link action="downloadfinState" id="${applicationFormInstance.appFormFiles.id}">${applicationFormInstance.appFormFiles.finStateFullPath-grailsApplication.config.uploadFolder}</g:link></span>
		</li>
		</g:if>

	</ol>
