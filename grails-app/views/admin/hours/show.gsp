
<%@ page import="org.jessica.Hours" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'hours.label', default: 'Hours')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-hours" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-hours" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list hours">
			
				<g:if test="${hoursInstance?.guardian}">
				<li class="fieldcontain">
					<span id="guardian-label" class="property-label"><g:message code="hours.guardian.label" default="Guardian" /></span>
					
						<span class="property-value" aria-labelledby="guardian-label"><g:link controller="guardian" action="show" id="${hoursInstance?.guardian?.id}">${hoursInstance?.guardian?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${hoursInstance?.hourAmount}">
				<li class="fieldcontain">
					<span id="hourAmount-label" class="property-label"><g:message code="hours.hourAmount.label" default="Hour Amount" /></span>
					
						<span class="property-value" aria-labelledby="hourAmount-label"><g:fieldValue bean="${hoursInstance}" field="hourAmount"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${hoursInstance?.id}" />
					<g:link class="edit" action="edit" id="${hoursInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
