<%@ page import="org.jessica.Expense" %>



<div class="fieldcontain ${hasErrors(bean: expenseInstance, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="expense.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${org.jessica.Course.list()}" optionKey="id" required="" value="${expenseInstance?.course?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: expenseInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="expense.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${expenseInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: expenseInstance, field: 'amount', 'error')} required">
	<label for="amount">
		<g:message code="expense.amount.label" default="Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:currencySelect name="amount" value="${expenseInstance?.amount}"  />
</div>

