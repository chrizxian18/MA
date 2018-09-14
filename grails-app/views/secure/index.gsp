<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title>Document</title>
</head>
<body>
	<div id="show-user" class="content scaffold-show" role="main">
		<h1>Hello <sec:username /></h1>
			<g:if test="${flash.error}">
			<ul class="errors" role="alert"><li>${flash.error}</li></ul>
		</g:if>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
	</div>
</body>
</html>