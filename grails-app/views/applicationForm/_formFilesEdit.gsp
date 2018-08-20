<%@ page import="merchantacquisition.ApplicationForm" %>

<div style="display: none;" class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="applicationForm.status.label" default="DTI Certificate" />
	</label>
	<g:textArea name="appFormFiles.status" value="uploaded"/>
</div>



<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'birCorFullPath', 'error')} ">
	<label for="birCorFullPath">
		<g:message code="applicationForm.birCorFullPath.label" default="COR issued by BIR" />
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="birCorFullPath" id="birCorFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.birCorFullPath-grailsApplication.config.uploadFolder}</span>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'dtiCertFullPath', 'error')} ">
	<label for="dtiCertFullPath">
		<g:message code="applicationForm.dtiCertFullPath.label" default="DTI Certificate" />
		
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="dtiCertFullPath" id="dtiCertFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.dtiCertFullPath-grailsApplication.config.uploadFolder}</span>
</div>

%{-- added more input type files --}%

<div class="fieldcontain">
	<label for="bizPermFullPath">
		Business/Mayor’s Permit
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="bizPermFullPath" id="bizPermFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.bizPermFullPath-grailsApplication.config.uploadFolder}</span>
</div>

<div class="fieldcontain">
	<label for="govIdFullPath">
		Copy of gov’t issued I.D
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="govIdFullPath" id="govIdFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.govIdFullPath-grailsApplication.config.uploadFolder}</span>
</div>

<div class="fieldcontain">
	<label for="secCertFullPath">
		Sec Cert of authority of signatories showing authority of its representative to sign and enter this agreement (original)
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="secCertFullPath" id="secCertFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.secCertFullPath-grailsApplication.config.uploadFolder}</span>

</div>

<div class="fieldcontain">
	<label for="gsisFullPath">
		Latest GIS;(certified true copy)
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="gsisFullPath" id="gsisFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.gsisFullPath-grailsApplication.config.uploadFolder}</span>
</div>

<div class="fieldcontain">
	<label for="articleFullPath">
		Articles of Incorporation or Amended Articles of Incorporation;(certified true copy)
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="articleFullPath" id="articleFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.articleFullPath-grailsApplication.config.uploadFolder}</span>
</div>

<div class="fieldcontain">
	<label for="byLawFullPath">
		By-Laws or Amended By-Laws approved by  SEC (certified true copy)
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="byLawFullPath" id="byLawFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.byLawFullPath-grailsApplication.config.uploadFolder}</span>
</div>

<div class="fieldcontain">
	<label for="finStateFullPath">
		Latest Audited Financial Statement (certified true copy)
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="finStateFullPath" id="finStateFullPath" />
	<span class="property-value">${applicationFormInstance.appFormFiles.finStateFullPath-grailsApplication.config.uploadFolder}</span>
</div>






