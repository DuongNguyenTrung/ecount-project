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
        <script src="https://www.google.com/recaptcha/api.js"></script>
    </head>
    <body>
        <div>
            <div class="sign-in" style="">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure>
                                <img src="templateLogin/images/signin-image.jpg"
                                     alt="sign up image">
                            </figure>
                            <a href="sign_up.jsp" class="signup-image-link">Create an account</a>
                            <a href="resetpass.jsp" class="signup-image-link">Reset password</a>
                        </div>

                        <div class="signin-form">
                            <h2 class="form-title">Login</h2>
                            <form method="POST" action="login" class="register-form" id="login-form"
                                  action="login">
                                <div class="form-group">
                                    <label for="your_name"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                        type="text" name="user" id="your_name" placeholder="Your Name" />
                                </div>
                                <div class="form-group">
                                    <label for="your_pass"><i class="zmdi zmdi-lock"></i></label> <input
                                        type="password" name="pwd" id="your_pass"
                                        placeholder="Password" />
                                </div>
                                <div class="g-recaptcha"
                                     data-sitekey="6Lf9yVMkAAAAAH8teVX5Z436cQalHCiKzF-J5I4S"></div> 
                                <div style="color: red;">${error }</div>
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" id="signin"
                                           class="form-submit" value="Log in" />
                                </div>
                            </form>
                            <div class="social-login">
                                <span class="social-label">Or login with</span>
                                <ul class="socials">
                                    <li><a href="#"><i
                                                class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                    <li><a href="#"><i
                                                class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                    <li><a href="#"><i
                                                class="display-flex-center zmdi zmdi-google"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>