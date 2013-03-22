<%@ page import="org.jessica.Comment" %>



<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="comment.note.label" default="Note" />
		
	</label>
	<g:textField name="note" value="${commentInstance?.note}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="comment.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${org.jessica.Student.list()}" optionKey="id" required="" value="${commentInstance?.student?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: commentInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="comment.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${org.jessica.Course.list()}" optionKey="id" required="" value="${commentInstance?.course?.id}" class="many-to-one"/>
</div>

