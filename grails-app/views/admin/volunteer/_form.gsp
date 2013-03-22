<%@ page import="org.jessica.Volunteer" %>



<div class="fieldcontain ${hasErrors(bean: volunteerInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="volunteer.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${volunteerInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="volunteer.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${volunteerInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="volunteer.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${volunteerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="volunteer.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${volunteerInstance?.phoneNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerInstance, field: 'session', 'error')} required">
	<label for="session">
		<g:message code="volunteer.session.label" default="Session" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="session" name="session.id" from="${org.jessica.Session.list()}" optionKey="id" required="" value="${volunteerInstance?.session?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: volunteerInstance, field: 'preferredCourse', 'error')} required">
	<label for="preferredCourse">
		<g:message code="volunteer.preferredCourse.label" default="Preferred Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="preferredCourse" name="preferredCourse.id" from="${org.jessica.Course.list()}" optionKey="id" required="" value="${volunteerInstance?.preferredCourse?.id}" class="many-to-one"/>
</div>

