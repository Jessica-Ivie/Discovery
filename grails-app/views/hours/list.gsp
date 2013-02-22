
<%@ page import="org.jessica.Hours" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hours.label', default: 'Hours')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-hours" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-hours" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="hours.guardian.label" default="Guardian" /></th>
					
						<g:sortableColumn property="hourAmount" title="${message(code: 'hours.hourAmount.label', default: 'Hour Amount')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${hoursInstanceList}" status="i" var="hoursInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${hoursInstance.id}">${fieldValue(bean: hoursInstance, field: "guardian")}</g:link></td>
					
						<td>${fieldValue(bean: hoursInstance, field: "hourAmount")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${hoursInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
