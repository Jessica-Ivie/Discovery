<%@ page import="org.jessica.Budget" %>



<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'session', 'error')} required">
	<label for="session">
		<g:message code="budget.session.label" default="Session" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="session" name="session.id" from="${org.jessica.Session.list()}" optionKey="id" required="" value="${budgetInstance?.session?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: budgetInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="budget.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:currencySelect name="amount" value="${budgetInstance?.amount}"  />
</div>

