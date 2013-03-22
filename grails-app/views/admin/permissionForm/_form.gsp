<%@ page import="org.jessica.PermissionForm" %>



<div class="fieldcontain ${hasErrors(bean: permissionFormInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="permissionForm.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${org.jessica.Course.list()}" optionKey="id" required="" value="${permissionFormInstance?.course?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: permissionFormInstance, field: 'date', 'error')} ">
	<label for="date">
		<g:message code="permissionForm.date.label" default="Date" />
		
	</label>
	<g:datePicker name="date" precision="day"  value="${permissionFormInstance?.date}" default="none" noSelection="['': '']" />
</div>

