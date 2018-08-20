%{-- <%@ page import="merchantacquisition.ApplicationForm" %> --}%

<div><h1></h1></div>

<div class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'remarks', 'error')} required">
	<label for="remarks">
		<g:message code="applicationForm.remarks.label" default="Remarks" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="remarks" required="" value="${applicationFormInstance?.remarks}"/>
</div>