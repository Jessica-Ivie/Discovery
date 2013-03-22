
<%@ page import="org.jessica.Volunteer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'volunteer.label', default: 'Volunteer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-volunteer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-volunteer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'volunteer.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'volunteer.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'volunteer.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phoneNumber" title="${message(code: 'volunteer.phoneNumber.label', default: 'Phone Number')}" />
					
						<th><g:message code="volunteer.session.label" default="Session" /></th>
					
						<th><g:message code="volunteer.preferredCourse.label" default="Preferred Course" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${volunteerInstanceList}" status="i" var="volunteerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${volunteerInstance.id}">${fieldValue(bean: volunteerInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: volunteerInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: volunteerInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: volunteerInstance, field: "phoneNumber")}</td>
					
						<td>${fieldValue(bean: volunteerInstance, field: "session")}</td>
					
						<td>${fieldValue(bean: volunteerInstance, field: "preferredCourse")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${volunteerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
