
<%@ page import="org.jessica.BehaviorNote" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'behaviorNote.label', default: 'BehaviorNote')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-behaviorNote" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-behaviorNote" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="date" title="${message(code: 'behaviorNote.date.label', default: 'Date')}" />
					
						<th><g:message code="behaviorNote.course.label" default="Course" /></th>
					
						<th><g:message code="behaviorNote.student.label" default="Student" /></th>
					
						<g:sortableColumn property="note" title="${message(code: 'behaviorNote.note.label', default: 'Note')}" />
					
						<g:sortableColumn property="resolution" title="${message(code: 'behaviorNote.resolution.label', default: 'Resolution')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${behaviorNoteInstanceList}" status="i" var="behaviorNoteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${behaviorNoteInstance.id}">${fieldValue(bean: behaviorNoteInstance, field: "date")}</g:link></td>
					
						<td>${fieldValue(bean: behaviorNoteInstance, field: "course")}</td>
					
						<td>${fieldValue(bean: behaviorNoteInstance, field: "student")}</td>
					
						<td>${fieldValue(bean: behaviorNoteInstance, field: "note")}</td>
					
						<td>${fieldValue(bean: behaviorNoteInstance, field: "resolution")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${behaviorNoteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
