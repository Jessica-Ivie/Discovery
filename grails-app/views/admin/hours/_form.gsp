<%@ page import="org.jessica.Hours" %>



<div class="fieldcontain ${hasErrors(bean: hoursInstance, field: 'guardian', 'error')} required">
	<label for="guardian">
		<g:message code="hours.guardian.label" default="Guardian" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="guardian" name="guardian.id" from="${org.jessica.Guardian.list()}" optionKey="id" required="" value="${hoursInstance?.guardian?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: hoursInstance, field: 'hourAmount', 'error')} required">
	<label for="hourAmount">
		<g:message code="hours.hourAmount.label" default="Hour Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hourAmount" value="${fieldValue(bean: hoursInstance, field: 'hourAmount')}" required=""/>
</div>

