
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Merchant Acquisition</title>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'myStyle.css')}" type="text/css">

  </head>
  <body>
	<div class="container-fluid">
		<div class="wrapper">
			<div class="row"> %{-- outer row --}%
				<div class="col-md-6 login_left" > %{-- outer column1 --}%
					<div class="row"> %{-- row1-1 --}%
						<div class="col-md-11 col-md-offset-1">
							<h3 style="font-family: Palatino Linotype, Book Antiqua, Palatino, serif;">Please Login</h3>
							<g:if test='${flash.message}'>
								%{-- <div class='login_message'>${flash.message}</div> --}%
								<div style="background-color:#FFF3F3; color:red; border: solid thin; padding: 10px;" clas="material-icons" id="message"><i class="material-icons" style="color:red; font-size:15px;">warning</i> ${flash.message}</div>
								</g:if>

								<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
									<p>
										<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
										<input type='text' class='' name='j_username' id='username'/>
									</p>

									<p>
										<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
										<input type='password' class='text_' name='j_password' id='password'/>
									</p>

									<p id="remember_me_holder">
										<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
										<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
									</p>

									<p>
										<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
									</p>
								</form>
						
						</div>
					</div>%{-- end row1-1 --}%	

					<div class="row"> %{-- row 1-2 --}%
						<div class="col-md-5 col-md-offset-1">
							<p>Forgot Password</p>
						</div>
						<div class="col-md-5 col-md-offset-1">
							<p><g:link action="create" controller="user" style="color:black">Sign Up</g:link></p>
							<br>
							<br>
						</div>
						
					</div>%{-- end row1-2 --}%	
				</div> %{-- end outer column1 --}%

				<div class="col-md-6 login_right"> %{-- outer column2 --}%
					%{-- <div class="row">row 2-1
						<div class="col-md-12"> --}%
							<br><br>
							<h2 style="text-align:center; font-family: Palatino Linotype, Book Antiqua, Palatino, serif;">Merchant Acquisition</h2>
							<br><br><br>
							<p style="text-align:center;">Contact Us</p>
						%{-- </div>

					</div> end row 2-1 --}%

				</div> %{-- end outer column2 --}%

			</div>%{-- end outer row --}%	
		</div>%{-- end wrapper --}%
	</div> %{-- end container-fluid --}%
  </body>
</html>