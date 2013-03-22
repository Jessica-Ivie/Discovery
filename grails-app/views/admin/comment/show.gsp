
<%@ page import="org.jessica.Comment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-comment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list comment">
			
				<g:if test="${commentInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="comment.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${commentInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentInstance?.student}">
				<li class="fieldcontain">
					<span id="student-label" class="property-label"><g:message code="comment.student.label" default="Student" /></span>
					
						<span class="property-value" aria-labelledby="student-label"><g:link controller="student" action="show" id="${commentInstance?.student?.id}">${commentInstance?.student?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${commentInstance?.course}">
				<li class="fieldcontain">
					<span id="course-label" class="property-label"><g:message code="comment.course.label" default="Course" /></span>
					
						<span class="property-value" aria-labelledby="course-label"><g:link controller="course" action="show" id="${commentInstance?.course?.id}">${commentInstance?.course?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${commentInstance?.id}" />
					<g:link class="edit" action="edit" id="${commentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
