
<%@ page import="org.jessica.Instructor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instructor.label', default: 'Instructor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-instructor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-instructor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list instructor">
			
				<g:if test="${instructorInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="instructor.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${instructorInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="instructor.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${instructorInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.course}">
				<li class="fieldcontain">
					<span id="course-label" class="property-label"><g:message code="instructor.course.label" default="Course" /></span>
					
						<span class="property-value" aria-labelledby="course-label"><g:link controller="course" action="show" id="${instructorInstance?.course?.id}">${instructorInstance?.course?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="instructor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${instructorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="instructor.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${instructorInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.backgroundCheck}">
				<li class="fieldcontain">
					<span id="backgroundCheck-label" class="property-label"><g:message code="instructor.backgroundCheck.label" default="Background Check" /></span>
					
						<span class="property-value" aria-labelledby="backgroundCheck-label"><g:formatBoolean boolean="${instructorInstance?.backgroundCheck}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.picture}">
				<li class="fieldcontain">
					<span id="picture-label" class="property-label"><g:message code="instructor.picture.label" default="Picture" /></span>
					
						<span class="property-value" aria-labelledby="picture-label"><g:fieldValue bean="${instructorInstance}" field="picture"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instructorInstance?.employer}">
				<li class="fieldcontain">
					<span id="employer-label" class="property-label"><g:message code="instructor.employer.label" default="Employer" /></span>
					
						<span class="property-value" aria-labelledby="employer-label"><g:fieldValue bean="${instructorInstance}" field="employer"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${instructorInstance?.id}" />
					<g:link class="edit" action="edit" id="${instructorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
