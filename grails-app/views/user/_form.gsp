<%@ page import="MerchantAcquisition.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Merchant Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField minlength="2" title="Merchant Name should be at least 2 characters in length" name="username" required="" value="${userInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<input type="password" minlength="6" maxlength="20" title="Password should be at least 6 characters in length, must contain alphanumeric and special characters with at least one uppercase and one lowercase letter." pattern="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*_-]).{6,}$" id="password" name="password" required="" value="${userInstance?.password}"/>
	 <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
</div>

<div class="fieldcontain">
	<label for="confirmPassword">
		Confirm Pasword
		<span class="required-indicator">*</span>
	</label>
	<input type="password" title="Confirm Password should be exactly the same as the Password" maxlength="20" id="confirmPassword" name="confirmPassword" required=""/>
	<span toggle="#confirmPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="user.telephone.label" default="Telephone" />
		
	</label>
	<input type="tel" onkeypress="return /\d/.test(String.fromCharCode(((event||window.event).which||(event||window.event).which)));" name="telephone" value="${userInstance?.telephone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'mobileNo', 'error')} ">
	<label for="mobileNo">
		<g:message code="user.mobileNo.label" default="Mobile No" />
		
	</label>
	<input class="number" type="tel" minlength="13" maxlength="13" pattern="[+]{1}[6]{1}[3]{1}[0-9]{10}" onkeypress="return /\d/.test(String.fromCharCode(((event||window.event).which||(event||window.event).which)));" name="mobileNo" value="+639"/>


</div>


%{-- <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

</div>
--}%

%{-- <div style="display:none" class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled = false}" />

</div> --}%
%{--  
<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />

</div> 
--}%
