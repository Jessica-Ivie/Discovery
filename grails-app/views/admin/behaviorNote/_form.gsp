<%@ page import="org.jessica.BehaviorNote" %>



<div class="fieldcontain ${hasErrors(bean: behaviorNoteInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="behaviorNote.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${behaviorNoteInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: behaviorNoteInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="behaviorNote.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${org.jessica.Course.list()}" optionKey="id" required="" value="${behaviorNoteInstance?.course?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: behaviorNoteInstance, field: 'student', 'error')} required">
	<label for="student">
		<g:message code="behaviorNote.student.label" default="Student" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="student" name="student.id" from="${org.jessica.Student.list()}" optionKey="id" required="" value="${behaviorNoteInstance?.student?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: behaviorNoteInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="behaviorNote.note.label" default="Note" />
		
	</label>
	<g:textField name="note" value="${behaviorNoteInstance?.note}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: behaviorNoteInstance, field: 'resolution', 'error')} ">
	<label for="resolution">
		<g:message code="behaviorNote.resolution.label" default="Resolution" />
		
	</label>
	<g:textField name="resolution" value="${behaviorNoteInstance?.resolution}"/>
</div>

