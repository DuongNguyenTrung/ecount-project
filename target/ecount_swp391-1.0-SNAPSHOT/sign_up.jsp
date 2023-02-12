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
                            <h2 class="form-title">Sign up</h2>
                            <form method="POST" class="register-form" action="signUp"
                                  id="register-form">
                                <div class="form-group">
                                    <label for="name"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                        type="text" name="name" id="name" placeholder="Account" />
                                </div>
                                <div class="error ">${errorName}</div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
                                        type="password" name="pass" id="pass" placeholder="Password" />
                                </div>
                                <div class="error">${errorPassword}</div>
                                <div class="form-group">
                                    <label for="gmail"><i class="zmdi zmdi-email"></i></label> <input
                                        type="email" name="email" id="email" placeholder="Email" />
                                </div>
                                <div class="error">${errorEmail}</div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup"
                                           class="form-submit" value="Register" />
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure>
                                <img src="templateLogin/images/signup-image.jpg"
                                     alt="sign up image">
                            </figure>
                            <a href="login.jsp" class="signup-image-link">I
                                am already member</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>