<%@ page import="merchantacquisition.ApplicationForm" %>

%{-- <div style="display: none;" class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'status', 'error')} ">
	<g:textArea name="appFormFiles.status" value="uploaded"/>
</div> --}%


<div class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'birCorFullPath', 'error')} ">
	<label for="birCorFullPath">
		<g:message code="applicationForm.birCorFullPath.label" default="COR issued by BIR" />
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="birCorFullPath" id="birCorFullPath"/>
	<label for="birCorFullPath">Choose File</label>
</div>

<div class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'dtiCertFullPath', 'error')} ">
	<label for="dtiCertFullPath">
		<g:message code="applicationForm.dtiCertFullPath.label" default="DTI Certificate" />
		
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="dtiCertFullPath" id="dtiCertFullPath" />
	<label for="dtiCertFullPath">Choose File</label>
</div>


<div class="containtooltip">
	<label for="bizPermFullPath">
		Business/Mayor’s Permit
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="bizPermFullPath" id="bizPermFullPath" />
	<label for="bizPermFullPath">Choose File</label>
</div>

<div class="containtooltip">
	<label for="govIdFullPath">
		Copy of gov’t issued I.D
		<b class="required-indicator">*</b>
	</label>
	<input type="file" name="govIdFullPath" id="govIdFullPath" />
	<label for="govIdFullPath">Choose File</label>
</div>
