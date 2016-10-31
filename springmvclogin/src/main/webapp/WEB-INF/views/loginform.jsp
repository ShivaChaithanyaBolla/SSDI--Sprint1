<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <head>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

      
      <style>
      @import url(http://fonts.googleapis.com/css?family=Tenor+Sans);
html {
  background-color: #5D92BA;
  font-family: "Tenor Sans", sans-serif;
}

.container {
  width: 500px;
  height: 400px;
  margin: 0 auto;
}

.login {
  margin-top: 50px;
  width: 450px;
}

.login-heading {
  font: 1.8em/48px "Tenor Sans", sans-serif;
  color: white;
}

.input-txt {
  width: 100%;
  padding: 20px 10px;
  background: #5D92BA;
  border: none;
  font-size: 1em;
  color: white;
  margin-bottom: 10px;
  border-bottom: 1px dotted rgba(250, 250, 250, 0.4);
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -moz-transition: background-color 0.5s ease-in-out;
  -o-transition: background-color 0.5s ease-in-out;
  -webkit-transition: background-color 0.5s ease-in-out;
  transition: background-color 0.5s ease-in-out;
}
.input-txt:-moz-placeholder {
  color: #81aac9;
}
.input-txt:-ms-input-placeholder {
  color: #81aac9;
}
.input-txt::-webkit-input-placeholder {
  color: #81aac9;
}
.input-txt:focus {
  background-color: #4478a0;
}

.login-footer {
  margin: 10px 0;
  overlow: hidden;
  float: left;
  width: 100%;
}

.btn {
  padding: 15px 30px;
  border: none;
  background: white;
  color: #5D92BA;
  display: block;
  margin: 0 auto;
  border-radius: 5px;
  
}



.icon {
  display: inline-block;
}

.icon--min {
  font-size: .9em;
}

.lnk {
  font-size: .8em;
  line-height: 3em;
  color: white;
  text-decoration: none;
}

      </style>
    <meta charset="UTF-8">
    <title>Simple login form</title>    
  </head>
  <body>
    <div class="container">
  <div class="login">
  	<h1 class="login-heading">
      <strong>Welcome.</strong> Please login.</h1>
      <form:form action="loginform.html"  commandName="loginForm">
User Name:<FONT color="red"><form:errors
				path="userName" /></FONT>
				<form:input name="username" class="input-txt" id="username" path="userName" />
			Password:<FONT color="red"><form:errors
				path="password" /></FONT>
				<form:password name="password" class="input-txt" id="password" path="password" />
            <br><button type="submit" Value="Submit" class="btn btn--right">Sign in  </button>
</form:form>
  </div>
</div>    
  </body>
</html>

