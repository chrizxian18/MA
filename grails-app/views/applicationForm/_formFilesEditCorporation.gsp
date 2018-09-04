<%@ page import="merchantacquisition.ApplicationForm" %>


<g:if test="${applicationFormInstance?.appFormFiles.secCertFullPath}">
<div class="containtooltip">
	<label class="mytooltip" for="secCertFullPath">
		Sec Cert of authority
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Sec Cert of authority of signatories showing authority of its representative to sign and enter this agreement (original)</span>
	</label>
	<input type="file" name="secCertFullPath" id="secCertFullPath" />
	<label class="mytooltip" for="secCertFullPath">${applicationFormInstance.appFormFiles.secCertFullPath-grailsApplication.config.uploadFolder}</label>

</div>
</g:if>

<g:if test="${applicationFormInstance?.appFormFiles.gisFullPath}">
<div class="containtooltip">
	<label class="mytooltip" for="gisFullPath">
		Latest GIS
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Latest GIS;(certified true copy)</span>
	</label>
	<input type="file" name="gisFullPath" id="gisFullPath" />
	<label class="mytooltip" for="gisFullPath">${applicationFormInstance.appFormFiles.gisFullPath-grailsApplication.config.uploadFolder}</label>
</div>
</g:if>

<g:if test="${applicationFormInstance?.appFormFiles.articleFullPath}">
<div class="containtooltip">
	<label class="mytooltip" for="articleFullPath">
		Articles of Incorporation
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Articles of Incorporation or Amended Articles of Incorporation;(certified true copy)</span>
	</label>
	<input type="file" name="articleFullPath" id="articleFullPath" />
	<label class="mytooltip" for="articleFullPath">${applicationFormInstance.appFormFiles.articleFullPath-grailsApplication.config.uploadFolder}</label>
</div>
</g:if>

<g:if test="${applicationFormInstance?.appFormFiles.byLawFullPath}">
<div class="containtooltip">
	<label class="mytooltip" for="byLawFullPath">
		By-Laws
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">By-Laws or Amended By-Laws approved by SEC (certified true copy)</span>
	</label>
	<input type="file" name="byLawFullPath" id="byLawFullPath" />
	<label class="mytooltip" for="byLawFullPath">${applicationFormInstance.appFormFiles.byLawFullPath-grailsApplication.config.uploadFolder}</label>
</div>
</g:if>


<g:if test="${applicationFormInstance?.appFormFiles.finStateFullPath}">
<div class="containtooltip">
	<label class="mytooltip" for="finStateFullPath">
		Financial Statement
		<i class="material-icons" style="color:#FF5C14; font-size:18px;">error_outline</i>
		<span class="tooltiptext">Latest Audited Financial Statement (certified true copy)</span>
	</label>
	<input type="file" name="finStateFullPath" id="finStateFullPath" />
	<label class="mytooltip" for="finStateFullPath">${applicationFormInstance.appFormFiles.finStateFullPath-grailsApplication.config.uploadFolder}</label>
</div>
</g:if>






