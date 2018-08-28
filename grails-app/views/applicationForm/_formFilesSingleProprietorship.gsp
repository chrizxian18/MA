<%@ page import="merchantacquisition.ApplicationForm" %>

%{-- <div style="display: none;" class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'status', 'error')} ">
	<g:textArea name="appFormFiles.status" value="uploaded"/>
</div> --}%


<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'birCorFullPath', 'error')} ">
	<label for="birCorFullPath">
		<g:message code="applicationForm.birCorFullPath.label" default="COR issued by BIR" />
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="birCorFullPath" id="birCorFullPath"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'dtiCertFullPath', 'error')} ">
	<label for="dtiCertFullPath">
		<g:message code="applicationForm.dtiCertFullPath.label" default="DTI Certificate" />
		
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="dtiCertFullPath" id="dtiCertFullPath" />
</div>


<div class="fieldcontain">
	<label for="bizPermFullPath">
		Business/Mayor’s Permit
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="bizPermFullPath" id="bizPermFullPath" />
</div>

<div class="fieldcontain">
	<label for="govIdFullPath">
		Copy of gov’t issued I.D
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="govIdFullPath" id="govIdFullPath" />
</div>
