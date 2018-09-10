<%@ page import="MerchantAcquisition.Group" %>



<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="group.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${groupInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="group.createdBy.label" default="Created By" />
		
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${MerchantAcquisition.User.list()}" optionKey="id" value="${groupInstance?.createdBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: groupInstance, field: 'updatedBy', 'error')} ">
	<label for="updatedBy">
		<g:message code="group.updatedBy.label" default="Updated By" />
		
	</label>
	<g:select id="updatedBy" name="updatedBy.id" from="${MerchantAcquisition.User.list()}" optionKey="id" value="${groupInstance?.updatedBy?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

