<%@ page import="merchantacquisition.ApplicationForm" %>

<div style="display: none;" class="fieldcontain ${hasErrors(bean: applicationFormInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="applicationForm.status.label" default="DTI Certificate" />
	</label>
	<g:textArea name="appFormFiles.status" value="uploaded" placeholder="First name"/>
</div>


 %{-- <input id="f02" type="file" placeholder="Add profile picture" />
  <label for="f02">Add profile picture</label> --}%
  
<g:if test="${applicationFormInstance?.appFormFiles.birCorFullPath}">
<div class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'birCorFullPath', 'error')} ">
	<label class="tooltip" for="birCorFullPath">
		<g:message code="applicationForm.birCorFullPath.label" default="COR issued by BIR" />
	</label>
	<span class="tooltip">
		${applicationFormInstance.appFormFiles.birCorFullPath-grailsApplication.config.uploadFolder}
	</span>
	<input type="file" name="birCorFullPath" id="birCorFullPath" placeholder="Add profile picture"/>
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.birCorFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>
</g:if>

<g:if test="${applicationFormInstance?.appFormFiles.dtiCertFullPath}">
<div class="containtooltip ${hasErrors(bean: applicationFormInstance, field: 'dtiCertFullPath', 'error')} ">
	<label class="tooltip" for="dtiCertFullPath">
		<g:message code="applicationForm.dtiCertFullPath.label" default="DTI Certificate" />
	</label>
	<span>
		${applicationFormInstance.appFormFiles.dtiCertFullPath-grailsApplication.config.uploadFolder}
	</span>
	<input type="file" name="dtiCertFullPath" id="dtiCertFullPath" title="alsdfkjasdf"/>
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.dtiCertFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>
</g:if>


<g:if test="${applicationFormInstance?.appFormFiles.bizPermFullPath}">
<div class="containtooltip">
	<label class="tooltip" for="bizPermFullPath">
		Business/Mayor’s Permit
	</label>
	<input type="file" name="bizPermFullPath" id="bizPermFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.bizPermFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>
</g:if>

<g:if test="${applicationFormInstance?.appFormFiles.govIdFullPath}">
<div class="containtooltip">
	<label class="tooltip" for="govIdFullPath">
		Copy of gov’t issued I.D
	</label>
	<input type="file" name="govIdFullPath" id="govIdFullPath" />
	%{-- <span class="property-value">${applicationFormInstance.appFormFiles.govIdFullPath-grailsApplication.config.uploadFolder}</span> --}%
</div>
</g:if>

