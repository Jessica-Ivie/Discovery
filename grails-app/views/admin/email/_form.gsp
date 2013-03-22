<%@ page import="org.jessica.Email" %>



<div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="email.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${emailInstance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="email.body.label" default="Body" />
		
	</label>
	<g:textField name="body" value="${emailInstance?.body}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'session', 'error')} required">
	<label for="session">
		<g:message code="email.session.label" default="Session" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="session" name="session.id" from="${org.jessica.Session.list()}" optionKey="id" required="" value="${emailInstance?.session?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="email.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${org.jessica.Course.list()}" optionKey="id" required="" value="${emailInstance?.course?.id}" class="many-to-one"/>
</div>

