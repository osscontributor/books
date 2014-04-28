
<%@ page import="com.demo.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-book" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form action="update" method="PUT">
			    <table>
					<thead>
						<tr>
							<g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />

							<g:sortableColumn property="author" title="${message(code: 'book.title.label', default: 'Title')}" />

							<g:sortableColumn property="sold" title="${message(code: 'book.sold.label', default: 'Sold')}" />
						</tr>
					</thead>
				<tbody>
					<g:each in="${bookInstanceList}" status="i" var="bookInstance">
				    	<g:hiddenField name="books[${i}].id" value="${bookInstance?.id}" />
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td>${fieldValue(bean: bookInstance, field: "author")}</td>

							<td>${fieldValue(bean: bookInstance, field: "title")}</td>

							<td><g:checkBox name="books[${i}].sold" value="${bookInstance?.sold}" /></td>

						</tr>
					</g:each>
				</tbody>
			</table>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
			<div class="pagination">
				<g:paginate total="${bookInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
