<%@ page import="org.jessica.Guardian" %>



<div class="fieldcontain ${hasErrors(bean: guardianInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="guardian.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${guardianInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: guardianInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="guardian.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${guardianInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: guardianInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="guardian.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${guardianInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: guardianInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="guardian.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${guardianInstance?.phoneNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: guardianInstance, field: 'addressLine1', 'error')} ">
	<label for="addressLine1">
		<g:message code="guardian.addressLine1.label" default="Address Line1" />
		
	</label>
	<g:textField name="addressLine1" value="${guardianInstance?.addressLine1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: guardianInstance, field: 'addressLine2', 'error')} ">
	<label for="addressLine2">
		<g:message code="guardian.addressLine2.label" default="Address Line2" />
		
	</label>
	<g:textField name="addressLine2" value="${guardianInstance?.addressLine2}"/>
</div>

