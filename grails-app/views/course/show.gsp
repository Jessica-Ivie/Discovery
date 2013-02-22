
<%@ page import="org.jessica.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-course" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list course">
			
				<g:if test="${courseInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="course.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${courseInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="course.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${courseInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.grade}">
				<li class="fieldcontain">
					<span id="grade-label" class="property-label"><g:message code="course.grade.label" default="Grade" /></span>
					
						<span class="property-value" aria-labelledby="grade-label"><g:fieldValue bean="${courseInstance}" field="grade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.instructor}">
				<li class="fieldcontain">
					<span id="instructor-label" class="property-label"><g:message code="course.instructor.label" default="Instructor" /></span>
					
						<span class="property-value" aria-labelledby="instructor-label"><g:link controller="instructor" action="show" id="${courseInstance?.instructor?.id}">${courseInstance?.instructor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.picture}">
				<li class="fieldcontain">
					<span id="picture-label" class="property-label"><g:message code="course.picture.label" default="Picture" /></span>
					
						<span class="property-value" aria-labelledby="picture-label"><g:fieldValue bean="${courseInstance}" field="picture"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.sizeLimit}">
				<li class="fieldcontain">
					<span id="sizeLimit-label" class="property-label"><g:message code="course.sizeLimit.label" default="Size Limit" /></span>
					
						<span class="property-value" aria-labelledby="sizeLimit-label"><g:fieldValue bean="${courseInstance}" field="sizeLimit"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.requiresPermission}">
				<li class="fieldcontain">
					<span id="requiresPermission-label" class="property-label"><g:message code="course.requiresPermission.label" default="Requires Permission" /></span>
					
						<span class="property-value" aria-labelledby="requiresPermission-label"><g:formatBoolean boolean="${courseInstance?.requiresPermission}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.needsTravel}">
				<li class="fieldcontain">
					<span id="needsTravel-label" class="property-label"><g:message code="course.needsTravel.label" default="Needs Travel" /></span>
					
						<span class="property-value" aria-labelledby="needsTravel-label"><g:formatBoolean boolean="${courseInstance?.needsTravel}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${courseInstance?.id}" />
					<g:link class="edit" action="edit" id="${courseInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
