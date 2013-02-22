<%@ page import="org.jessica.Student" %>



<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="student.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${studentInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="student.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${studentInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="student.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="grade" type="number" value="${studentInstance.grade}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'studentId', 'error')} ">
	<label for="studentId">
		<g:message code="student.studentId.label" default="Student Id" />
		
	</label>
	<g:textField name="studentId" value="${studentInstance?.studentId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: studentInstance, field: 'guardians', 'error')} ">
	<label for="guardians">
		<g:message code="student.guardians.label" default="Guardians" />
		
	</label>
	<g:select name="guardians" from="${org.jessica.Guardian.list()}" multiple="multiple" optionKey="id" size="5" value="${studentInstance?.guardians*.id}" class="many-to-many"/>
</div>

