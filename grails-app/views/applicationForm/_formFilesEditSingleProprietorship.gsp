<%@ page import="merchantacquisition.ApplicationForm" %>

<div style="display: none;" class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'status', 'error')} ">
	<label for="status">
		%{-- <g:message code="applicationForm.status.label" default="DTI Certificate" /> --}%
	</label>
	<g:textArea name="appFormFiles.status" value="uploaded"/>
</div>

  
<g:if test="${applicationFormInstance?.appFormFiles.birCorFullPath}">
<div class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'birCorFullPath', 'error')} ">
	<label class="mytooltip" for="birCorFullPath">
		<g:message code="applicationForm.birCorFullPath.label" default="COR issued by BIR" />
	</label>
	<input type="file" name="birCorFullPath" id="birCorFullPath" placeholder=""/>
	<label class="mytooltip" id="lbl_birCorFullPath" for="birCorFullPath" >
		${applicationFormInstance.appFormFiles.birCorFullPath-grailsApplication.config.uploadFolder}
	</label>
</div>
</g:if>

<g:if test="${applicationFormInstance?.appFormFiles.dtiCertFullPath}">
<div class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'dtiCertFullPath', 'error')} ">
	<label class="mytooltip" for="dtiCertFullPath">
		<g:message code="applicationForm.dtiCertFullPath.label" default="DTI Certificate" />
	</label>
	<input type="file" name="dtiCertFullPath" id="dtiCertFullPath"/>
	<label class="mytooltip" for="dtiCertFullPath">
		${applicationFormInstance.appFormFiles.dtiCertFullPath-grailsApplication.config.uploadFolder}
	</label>
</div>
</g:if>


<g:if test="${applicationFormInstance?.appFormFiles.bizPermFullPath}">
<div class="containtooltip">
	<label class="mytooltip" for="bizPermFullPath">
		Business/Mayor’s Permit
	</label>
	<input type="file" name="bizPermFullPath" id="bizPermFullPath" />
	<label class="mytooltip" for="bizPermFullPath">${applicationFormInstance.appFormFiles.bizPermFullPath-grailsApplication.config.uploadFolder}</label>
</div>
</g:if>

<g:if test="${applicationFormInstance?.appFormFiles.govIdFullPath}">
<div class="containtooltip">
	<label class="mytooltip" for="govIdFullPath">
		Copy of gov’t issued I.D
	</label>
	<input type="file" name="govIdFullPath" id="govIdFullPath" />
	<label class="mytooltip" for="govIdFullPath">${applicationFormInstance.appFormFiles.govIdFullPath-grailsApplication.config.uploadFolder}</label>
</div>
</g:if>

