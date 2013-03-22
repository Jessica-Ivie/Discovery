<%@ page import="org.jessica.Instructor" %>



<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="instructor.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${instructorInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="instructor.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${instructorInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'course', 'error')} ">
	<label for="course">
		<g:message code="instructor.course.label" default="Course" />
		
	</label>
	<g:select id="course" name="course.id" from="${org.jessica.Course.list()}" optionKey="id" value="${instructorInstance?.course?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="instructor.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${instructorInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="instructor.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${instructorInstance?.phoneNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'backgroundCheck', 'error')} ">
	<label for="backgroundCheck">
		<g:message code="instructor.backgroundCheck.label" default="Background Check" />
		
	</label>
	<g:checkBox name="backgroundCheck" value="${instructorInstance?.backgroundCheck}" />
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'picture', 'error')} ">
	<label for="picture">
		<g:message code="instructor.picture.label" default="Picture" />
		
	</label>
	<g:textField name="picture" value="${instructorInstance?.picture}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instructorInstance, field: 'employer', 'error')} ">
	<label for="employer">
		<g:message code="instructor.employer.label" default="Employer" />
		
	</label>
	<g:textField name="employer" value="${instructorInstance?.employer}"/>
</div>

