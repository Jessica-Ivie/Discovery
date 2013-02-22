<%@ page import="org.jessica.Choice" %>



<div class="fieldcontain ${hasErrors(bean: choiceInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="choice.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${org.jessica.Student.list()}" optionKey="id" required="" value="${choiceInstance?.student?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: choiceInstance, field: 'session', 'error')} required">
	<label for="session">
		<g:message code="choice.session.label" default="Session" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="session" name="session.id" from="${org.jessica.Session.list()}" optionKey="id" required="" value="${choiceInstance?.session?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: choiceInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="choice.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${org.jessica.Course.list()}" optionKey="id" required="" value="${choiceInstance?.course?.id}" class="many-to-one"/>
</div>

