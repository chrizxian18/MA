<%@ page import="merchantacquisition.ApplicationForm" %>




<div class="sConnect">
	<div>
		<p>7-Connect Model:</p>
		<div class="fieldcontain2 ${hasErrors(bean: applicationFormInstance, field: 'sConnectWebIntegration', 'error')} ">
			<label for="sConnectWebIntegration">
				<g:message code="applicationForm.sConnectWebIntegration.label" default="7-Connect Web Integration" />
				
			</label>
			<g:checkBox name="sConnectWebIntegration" value="${applicationFormInstance?.sConnectWebIntegration}" />

		</div>

		<div class="fieldcontain2 ${hasErrors(bean: applicationFormInstance, field: 'cliqq', 'error')} ">
			<label for="cliqq">
				<g:message code="applicationForm.cliqq.label" default="Cliqq" />
				
			</label>
			<g:checkBox onclick="cliqqType()" name="cliqq" value="${applicationFormInstance?.cliqq}" />

		</div>

		<div style="display:none;" id="cliqqType">
			<p style="margin-left: 12%;">Cliqq Type:</p>
			<div class="fieldcontain2 ${hasErrors(bean: applicationFormInstance, field: 'billsPayment', 'error')} ">
				<label for="billsPayment">
					<g:message code="applicationForm.billsPayment.label" default="Bills Payment" />
					
				</label>
				<g:checkBox name="billsPayment" id="billsPayment" value="${applicationFormInstance?.billsPayment}" />

			</div>

			<div class="fieldcontain2 ${hasErrors(bean: applicationFormInstance, field: 'eload', 'error')} ">
				<label for="eload">
					<g:message code="applicationForm.eload.label" default="Load" />
					
				</label>
				<g:checkBox name="eload" id="eload" value="${applicationFormInstance?.eload}" />

			</div>

			<div class="fieldcontain2 ${hasErrors(bean: applicationFormInstance, field: 'ePins', 'error')} ">
				<label for="ePins">
					<g:message code="applicationForm.ePins.label" default="E-Pins" />
					
				</label>
				<g:checkBox name="ePins" id="ePins" value="${applicationFormInstance?.ePins}" />

			</div>

			<div class="fieldcontain2 ${hasErrors(bean: applicationFormInstance, field: 'eMoney', 'error')} ">
				<label for="eMoney">
					<g:message code="applicationForm.eMoney.label" default="E-Money/E-Wallet" />
					
				</label>
				<g:checkBox name="eMoney" id="eMoney" value="${applicationFormInstance?.eMoney}" />

			</div>

			<div class="fieldcontain2 ${hasErrors(bean: applicationFormInstance, field: 'remittance', 'error')} ">
				<label for="remittance">
					<g:message code="applicationForm.remittance.label" default="Remittance" />
					
				</label>
				<g:checkBox name="remittance" id="remittance" value="${applicationFormInstance?.remittance}" />

			</div>
		</div>

	</div>
</div>
	
		
		



	

<div class="formCenter">
	<h1></h1>
<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'merchantName', 'error')} required">
	<label for="merchantName">
		<g:message code="applicationForm.merchantName.label" default="Merchant Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField style="color:black;" style="color:black;" name="merchantName" required="" value="${applicationFormInstance?.merchantName}"/>
</div>
<div class="fieldcontain">
	<label>Company Type: <b class="required-indicator">*</b></label>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'companyType', 'error')} required">
<label for="Single Proprietorship">
	<g:message code="applicationForm.companyType.label" default="Single Proprietorship" />
	</label>
	<g:radio onclick="singlePro();" id="singleProprietorship" required="" name="companyType" value="Single Proprietorship" checked="${applicationFormInstance?.companyType == 'Single Proprietorship'}"/>
	<label for="Corporation">
	<g:message code="applicationForm.companyType.label" default="Corporation"/>
</label>
	<g:radio onclick="corpo();" name="companyType" id="Corporation" required="" value="Corporation" checked="${applicationFormInstance?.companyType == 'Corporation'}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'companyAddress', 'error')} required">
	<label for="companyAddress">
		<g:message code="applicationForm.companyAddress.label" default="Company Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField style="color:black;" name="companyAddress" required="" value="${applicationFormInstance?.companyAddress}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'natureOfBusiness', 'error')} required">
	<label for="natureOfBusiness">
		<g:message code="applicationForm.natureOfBusiness.label" default="Nature Of Business" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField style="color:black;" name="natureOfBusiness" required="" value="${applicationFormInstance?.natureOfBusiness}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'businessDescription', 'error')} required">
	<label for="businessDescription">
		<g:message code="applicationForm.businessDescription.label" default="Brief Description of Business" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="businessDescription" required="" value="${applicationFormInstance?.businessDescription}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'noOfSubscribers', 'error')} ">
	<label for="noOfSubscribers">
		<g:message code="applicationForm.noOfSubscribers.label" default="No Of Subscribers" />
		
	</label>
	<g:field style="color:black" name="noOfSubscribers" type="number" value="${applicationFormInstance.noOfSubscribers}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'websiteLink', 'error')} ">
	<label for="websiteLink">
		<g:message code="applicationForm.websiteLink.label" default="Website Link" />
		
	</label>
	<g:textField style="color:black;" name="websiteLink" value="${applicationFormInstance?.websiteLink}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'coveredAreas', 'error')} ">
	<label for="coveredAreas">
		<g:message code="applicationForm.coveredAreas.label" default="Covered Areas" />
		
	</label>
	<g:textField style="color:black;" name="coveredAreas" value="${applicationFormInstance?.coveredAreas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'launchDate', 'error')} required">
	<label for="launchDate">
		<g:message code="applicationForm.launchDate.label" default="Launch Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="launchDate" precision="day"  value="${applicationFormInstance?.launchDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'commissionFee', 'error')} ">
	<label for="commissionFee">
		<g:message code="applicationForm.commissionFee.label" default="Commission Fee" />
		
	</label>
	<g:field style="color:black" name="commissionFee" value="${fieldValue(bean: applicationFormInstance, field: 'commissionFee')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'modeOfPayment', 'error')} required">
	<label for="modeOfPayment">
		<g:message code="applicationForm.modeOfPayment.label" default="Mode of Payment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select from="['Cash', 'Check', 'Card']" name="modeOfPayment"  value="${applicationFormInstance?.modeOfPayment}" noSelection="['':'-Choose mode of Payment-']" required="required"/>

</div>

<div><h1></h1></div>
<p style="margin-left:10%;">Bank Details:</p>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'bankName', 'error')} ">
	<label for="bankName">
		<g:message code="applicationForm.bankName.label" default="Bank Name/Address" />
		
	</label>
	<g:textField style="color:black;" name="bankName" value="${applicationFormInstance?.bankName}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'accountName', 'error')} ">
	<label for="accountName">
		<g:message code="applicationForm.accountName.label" default="Account Name" />
		
	</label>
	<g:textField style="color:black;" name="accountName" value="${applicationFormInstance?.accountName}"/>

</div>



<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'accountNumber', 'error')} ">
	<label for="accountNumber">
		<g:message code="applicationForm.accountNumber.label" default="Account Number" />
		
	</label>
	<g:field style="color:black" name="accountNumber" type="number" value="${applicationFormInstance.accountNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'accountType', 'error')} ">
	<label for="Savings">
	<g:message code="applicationForm.accountType.label" default="Savings" />
	</label>
	<g:radio name="accountType" value="Savings" checked="${applicationFormInstance?.accountType.equals('Savings')}"/>
	<label for="Check">
	<g:message code="applicationForm.accountType.label" default="Check"/>
	</label>
	<g:radio name="accountType" value="Check" checked="${applicationFormInstance?.accountType.equals('Check')}"/>
</div>

<div><h1></h1></div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'moaSignatory', 'error')} ">
	<label for="moaSignatory">
		<g:message code="applicationForm.moaSignatory.label" default="Name of MOA Signatory/Position" />
		
	</label>
	<g:textField style="color:black;" name="moaSignatory" value="${applicationFormInstance?.moaSignatory}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'moaWitness', 'error')} ">
	<label for="moaWitness">
		<g:message code="applicationForm.moaWitness.label" default="Name of MOA Witness" />
		
	</label>
	<g:textField style="color:black;" name="moaWitness" value="${applicationFormInstance?.moaWitness}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'mainContactPerson', 'error')} required">
	<label for="mainContactPerson">
		<g:message code="applicationForm.mainContactPerson.label" default="Main Contact Person/Details" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="mainContactPerson" required="" value="${applicationFormInstance?.mainContactPerson}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'itContactPerson', 'error')} ">
	<label for="itContactPerson">
		<g:message code="applicationForm.itContactPerson.label" default="IT Contact Person/Details" />
		
	</label>
	<g:textArea name="itContactPerson" value="${applicationFormInstance?.itContactPerson}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'afterSalesContactPerson', 'error')} ">
	<label for="afterSalesContactPerson">
		<g:message code="applicationForm.afterSalesContactPerson.label" default="After Sales Contact Person/Details" />
		
	</label>
	<g:textArea name="afterSalesContactPerson" value="${applicationFormInstance?.afterSalesContactPerson}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'financeContactPerson', 'error')} ">
	<label for="financeContactPerson">
		<g:message code="applicationForm.financeContactPerson.label" default="Finance Contact Person/Details" />
		
	</label>
	<g:textArea name="financeContactPerson" value="${applicationFormInstance?.financeContactPerson}"/>

</div>

</div>
