
<%@ page import="org.jessica.Volunteer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-volunteer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-volunteer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list volunteer">
			
				<g:if test="${volunteerInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="volunteer.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${volunteerInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="volunteer.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${volunteerInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="volunteer.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${volunteerInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerInstance?.phoneNumber}">
				<li class="fieldcontain">
					<span id="phoneNumber-label" class="property-label"><g:message code="volunteer.phoneNumber.label" default="Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="phoneNumber-label"><g:fieldValue bean="${volunteerInstance}" field="phoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerInstance?.session}">
				<li class="fieldcontain">
					<span id="session-label" class="property-label"><g:message code="volunteer.session.label" default="Session" /></span>
					
						<span class="property-value" aria-labelledby="session-label"><g:link controller="session" action="show" id="${volunteerInstance?.session?.id}">${volunteerInstance?.session?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${volunteerInstance?.preferredCourse}">
				<li class="fieldcontain">
					<span id="preferredCourse-label" class="property-label"><g:message code="volunteer.preferredCourse.label" default="Preferred Course" /></span>
					
						<span class="property-value" aria-labelledby="preferredCourse-label"><g:link controller="course" action="show" id="${volunteerInstance?.preferredCourse?.id}">${volunteerInstance?.preferredCourse?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${volunteerInstance?.id}" />
					<g:link class="edit" action="edit" id="${volunteerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
