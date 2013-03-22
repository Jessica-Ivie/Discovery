
<%@ page import="org.jessica.Instructor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instructor.label', default: 'Instructor')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-instructor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-instructor" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'instructor.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'instructor.lastName.label', default: 'Last Name')}" />
					
						<th><g:message code="instructor.course.label" default="Course" /></th>
					
						<g:sortableColumn property="email" title="${message(code: 'instructor.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phoneNumber" title="${message(code: 'instructor.phoneNumber.label', default: 'Phone Number')}" />
					
						<g:sortableColumn property="backgroundCheck" title="${message(code: 'instructor.backgroundCheck.label', default: 'Background Check')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${instructorInstanceList}" status="i" var="instructorInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${instructorInstance.id}">${fieldValue(bean: instructorInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: instructorInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: instructorInstance, field: "course")}</td>
					
						<td>${fieldValue(bean: instructorInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: instructorInstance, field: "phoneNumber")}</td>
					
						<td><g:formatBoolean boolean="${instructorInstance.backgroundCheck}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${instructorInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
