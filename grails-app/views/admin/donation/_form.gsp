<%@ page import="org.jessica.Donation" %>



<div class="fieldcontain ${hasErrors(bean: donationInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="donation.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:currencySelect name="amount" value="${donationInstance?.amount}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: donationInstance, field: 'guardian', 'error')} ">
	<label for="guardian">
		<g:message code="donation.guardian.label" default="Guardian" />
		
	</label>
	<g:select id="guardian" name="guardian.id" from="${org.jessica.Guardian.list()}" optionKey="id" value="${donationInstance?.guardian?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: donationInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="donation.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${donationInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: donationInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="donation.note.label" default="Note" />
		
	</label>
	<g:textField name="note" value="${donationInstance?.note}"/>
</div>

