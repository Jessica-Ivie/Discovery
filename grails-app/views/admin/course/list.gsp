
<%@ page import="org.jessica.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-course" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'course.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="grade" title="${message(code: 'course.grade.label', default: 'Grade')}" />
					
						<th><g:message code="course.instructor.label" default="Instructor" /></th>
					
						<g:sortableColumn property="picture" title="${message(code: 'course.picture.label', default: 'Picture')}" />
					
						<g:sortableColumn property="sizeLimit" title="${message(code: 'course.sizeLimit.label', default: 'Size Limit')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${courseInstanceList}" status="i" var="courseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: courseInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "grade")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "instructor")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "picture")}</td>
					
						<td>${fieldValue(bean: courseInstance, field: "sizeLimit")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${courseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
