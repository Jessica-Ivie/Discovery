<%@ page import="org.jessica.Session" %>



<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'theme', 'error')} ">
	<label for="theme">
		<g:message code="session.theme.label" default="Theme" />
		
	</label>
	<g:textField name="theme" value="${sessionInstance?.theme}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sessionInstance, field: 'courses', 'error')} ">
	<label for="courses">
		<g:message code="session.courses.label" default="Courses" />
		
	</label>
	<g:select name="courses" from="${org.jessica.Course.list()}" multiple="multiple" optionKey="id" size="5" value="${sessionInstance?.courses*.id}" class="many-to-many"/>
</div>

