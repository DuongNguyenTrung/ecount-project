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
                            <form method="POST" class="register-form" action="reset"  id="register-form">
                                <input hidden name="username" value="${username}"/>
                                <div class="form-group">
                                    <label for="name"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> <input
                                        type="text" name="pwd" id="pwd" placeholder="Input new password" />
                                </div>
                                <div class="form-group">
                                    <label for="name"><i
                                            class="zmdi zmdi-account material-icons-name"></i></label> 
                                    <input onblur="confirmPassword()"
                                           type="text" id="repwd" placeholder="Confirm your password" />
                                </div>
                                <div id="errPwd" class="error">${msg}</div>

                                <input type="submit" name="signup" id="signup"
                                       class="form-submit" value="Submit" />
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
        <script>
            const confirmPassword = () => {
                document.getElementById("errPwd").innerHTML = "";
                if (document.getElementById("pwd").value === document.getElementById("repwd").value)
                    return true;
                document.getElementById("errPwd").innerHTML = "Password not match!";
                return false;
            };
        </script>
    </body>
</html>