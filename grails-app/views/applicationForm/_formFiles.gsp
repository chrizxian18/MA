<%@ page import="merchantacquisition.ApplicationForm" %>

%{-- <div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'corIssuedByBir', 'error')} ">
	<label for="corIssuedByBir">
		<g:message code="applicationForm.corIssuedByBir.label" default="COR Issued By BIR" />
		
	</label>
	<g:textArea name="appFormFiles.corIssuedByBir" value="${applicationFormInstance.appFormFiles?.corIssuedByBir}"/>
</div> --}%
%{-- style="display: none;" --}%
<div style="display: none;" class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="applicationForm.status.label" default="DTI Certificate" />
		
	</label>
	<g:textArea name="appFormFiles.status" value="uploaded"/>
</div>



<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'corFullPath', 'error')} ">
	<label for="corFullPath">
		<g:message code="applicationForm.corFullPath.label" default="COR" />
		
	</label>
	<input type="file" name="corFullPath" id="corFullPath"/>
</div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'dtiCertFullPath', 'error')} ">
	<label for="dtiCertFullPath">
		<g:message code="applicationForm.dtiCertFullPath.label" default="DTI Certificate" />
		
	</label>
	<input type="file" name="dtiCertFullPath" id="dtiCertFullPath" />
</div>






