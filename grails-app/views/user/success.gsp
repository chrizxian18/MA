<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="main">
	<title>Document</title>
</head>
<body>
		<div id="create-user" class="content scaffold-create" role="main">
    <h1></h1>
     <div>
        ${message}
        <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:if test="${flash.error}">
				<ul class="errors" role="alert">
					<li  role="status">${flash.error}</li>
				</ul>
			</g:if>
     </div>
     </div>
</body>
</html>