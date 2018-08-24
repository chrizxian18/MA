<%@ page import="merchantacquisition.ApplicationForm" %>

<div style="display: none;" class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="applicationForm.status.label" default="DTI Certificate" />
	</label>
	<g:textArea name="appFormFiles.status" value="uploaded"/>
</div>



<div class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'birCorFullPath', 'error')} ">
	<label class="tooltip" for="birCorFullPath">
		<g:message code="applicationForm.birCorFullPath.label" default="COR issued by BIR" />
	</label>
	<input type="file" name="birCorFullPath" id="birCorFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.birCorFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>

<div class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'dtiCertFullPath', 'error')} ">
	<label class="tooltip" for="dtiCertFullPath">
		<g:message code="applicationForm.dtiCertFullPath.label" default="DTI Certificate" />
	</label>
	<input type="file" name="dtiCertFullPath" id="dtiCertFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.dtiCertFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>

%{-- added more input type files --}%

<div class="containtooltip">
	<label class="tooltip" for="bizPermFullPath">
		Business/Mayor’s Permit
	</label>
	<input type="file" name="bizPermFullPath" id="bizPermFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.bizPermFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>

<div class="containtooltip">
	<label class="tooltip" for="govIdFullPath">
		Copy of gov’t issued I.D
	</label>
	<input type="file" name="govIdFullPath" id="govIdFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.govIdFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>

<div class="containtooltip">
	<label class="tooltip" for="secCertFullPath">
		Sec Cert of authority
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Sec Cert of authority of signatories showing authority of its representative to sign and enter this agreement (original)</span>
	</label>
	<input type="file" name="secCertFullPath" id="secCertFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.secCertFullPath-grailsApplication.config.uploadFolder}</span> --}%

</div>

<div class="containtooltip">
	<label class="tooltip" for="gsisFullPath">
		Latest GIS
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Latest GIS;(certified true copy)</span>
	</label>
	<input type="file" name="gsisFullPath" id="gsisFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.gsisFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>

<div class="containtooltip">
	<label class="tooltip" for="articleFullPath">
		Articles of Incorporation
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Articles of Incorporation or Amended Articles of Incorporation;(certified true copy)</span>
	</label>
	<input type="file" name="articleFullPath" id="articleFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.articleFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>

<div class="containtooltip">
	<label class="tooltip" for="byLawFullPath">
		By-Laws
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">By-Laws or Amended By-Laws approved by SEC (certified true copy)</span>
	</label>
	<input type="file" name="byLawFullPath" id="byLawFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.byLawFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>

<div class="containtooltip">
	<label class="tooltip" for="finStateFullPath">
		Financial Statement
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Latest Audited Financial Statement (certified true copy)</span>
	</label>
	<input type="file" name="finStateFullPath" id="finStateFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.finStateFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>






