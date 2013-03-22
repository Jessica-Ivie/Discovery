
<%@ page import="org.jessica.BehaviorNote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'behaviorNote.label', default: 'BehaviorNote')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-behaviorNote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-behaviorNote" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list behaviorNote">
			
				<g:if test="${behaviorNoteInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="behaviorNote.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${behaviorNoteInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${behaviorNoteInstance?.course}">
				<li class="fieldcontain">
					<span id="course-label" class="property-label"><g:message code="behaviorNote.course.label" default="Course" /></span>
					
						<span class="property-value" aria-labelledby="course-label"><g:link controller="course" action="show" id="${behaviorNoteInstance?.course?.id}">${behaviorNoteInstance?.course?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${behaviorNoteInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="behaviorNote.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${behaviorNoteInstance?.student?.id}">${behaviorNoteInstance?.student?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${behaviorNoteInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="behaviorNote.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${behaviorNoteInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${behaviorNoteInstance?.resolution}">
				<li class="fieldcontain">
					<span id="resolution-label" class="property-label"><g:message code="behaviorNote.resolution.label" default="Resolution" /></span>
					
						<span class="property-value" aria-labelledby="resolution-label"><g:fieldValue bean="${behaviorNoteInstance}" field="resolution"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${behaviorNoteInstance?.id}" />
					<g:link class="edit" action="edit" id="${behaviorNoteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
