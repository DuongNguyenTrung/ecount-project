<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
        <link rel="stylesheet"
              href="templateLogin/fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="templateLogin/css/style.css">
        <style type="text/css">
            .error {
                color: red;
            }
        </style>
    </head>
    <body>
        <div>
            <div class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Reset your password</h2>
                            <form method="POST" class="register-form" action="forgot"  id="register-form">
                                <div class="form-group">
                                    <label for="name"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                        type="text" name="username" id="name" placeholder="Input your username" />
                                </div>
                                <div class="error">${msg}</div>

                                <input type="submit" name="signup" id="signup"
                                       class="form-submit" value="Send" />
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure>
                                <img src="templateLogin/images/signup-image.jpg"
                                     alt="sign up image">
                            </figure>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>