
<%@ page import="org.jessica.Guardian" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'guardian.label', default: 'Guardian')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-guardian" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-guardian" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'guardian.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'guardian.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'guardian.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phoneNumber" title="${message(code: 'guardian.phoneNumber.label', default: 'Phone Number')}" />
					
						<g:sortableColumn property="addressLine1" title="${message(code: 'guardian.addressLine1.label', default: 'Address Line1')}" />
					
						<g:sortableColumn property="addressLine2" title="${message(code: 'guardian.addressLine2.label', default: 'Address Line2')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${guardianInstanceList}" status="i" var="guardianInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${guardianInstance.id}">${fieldValue(bean: guardianInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: guardianInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: guardianInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: guardianInstance, field: "phoneNumber")}</td>
					
						<td>${fieldValue(bean: guardianInstance, field: "addressLine1")}</td>
					
						<td>${fieldValue(bean: guardianInstance, field: "addressLine2")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${guardianInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
