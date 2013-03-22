<%@ page import="org.jessica.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="course.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${courseInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="course.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${courseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'grade', 'error')} required">
	<label for="grade">
		<g:message code="course.grade.label" default="Grade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="grade" type="number" value="${courseInstance.grade}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'instructor', 'error')} required">
	<label for="instructor">
		<g:message code="course.instructor.label" default="Instructor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="instructor" name="instructor.id" from="${org.jessica.Instructor.list()}" optionKey="id" required="" value="${courseInstance?.instructor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'picture', 'error')} ">
	<label for="picture">
		<g:message code="course.picture.label" default="Picture" />
		
	</label>
	<g:textField name="picture" value="${courseInstance?.picture}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'sizeLimit', 'error')} required">
	<label for="sizeLimit">
		<g:message code="course.sizeLimit.label" default="Size Limit" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sizeLimit" type="number" value="${courseInstance.sizeLimit}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'requiresPermission', 'error')} ">
	<label for="requiresPermission">
		<g:message code="course.requiresPermission.label" default="Requires Permission" />
		
	</label>
	<g:checkBox name="requiresPermission" value="${courseInstance?.requiresPermission}" />
</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'needsTravel', 'error')} ">
	<label for="needsTravel">
		<g:message code="course.needsTravel.label" default="Needs Travel" />
		
	</label>
	<g:checkBox name="needsTravel" value="${courseInstance?.needsTravel}" />
</div>

