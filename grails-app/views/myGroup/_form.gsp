<%@ page import="MerchantAcquisition.MyGroup" %>



<div class="fieldcontain ${hasErrors(bean: myGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="myGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${myGroupInstance?.name}"/>


</div>





