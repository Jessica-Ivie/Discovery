
<%@ page import="org.jessica.Donation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'donation.label', default: 'Donation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-donation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-donation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list donation">
			
				<g:if test="${donationInstance?.amount}">
				<li class="fieldcontain">
					<span id="amount-label" class="property-label"><g:message code="donation.amount.label" default="Amount" /></span>
					
						<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${donationInstance}" field="amount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${donationInstance?.guardian}">
				<li class="fieldcontain">
					<span id="guardian-label" class="property-label"><g:message code="donation.guardian.label" default="Guardian" /></span>
					
						<span class="property-value" aria-labelledby="guardian-label"><g:link controller="guardian" action="show" id="${donationInstance?.guardian?.id}">${donationInstance?.guardian?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${donationInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="donation.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${donationInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${donationInstance?.note}">
				<li class="fieldcontain">
					<span id="note-label" class="property-label"><g:message code="donation.note.label" default="Note" /></span>
					
						<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${donationInstance}" field="note"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${donationInstance?.id}" />
					<g:link class="edit" action="edit" id="${donationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
