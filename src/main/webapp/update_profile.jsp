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
            
            #gender{
                display: inline;
                width: auto;
            }
        </style>
    </head>
    <body>
        <div>
            <div class="signup">
                <div class="container">
                    <div class="signup-form">
                        <h2 class="form-title">Update information</h2>
                        <form method="POST" action="update">    
                            <div >
                                Full Name :<input type="text" name="name" >
                            </div>
                            <div >
                                Gender :
                                <input id="gender" type="radio" name="gender" value="Male">Male
                                <input id="gender" type="radio" name="gender" value="Female">Female
                            </div>
                            <div >
                                Email :<input type="text" name="email" >
                            </div>
                            <div >
                                Address :<input type="text" name="address" >
                            </div>
                            <div >
                                Phone :<input type="text" name="phone" >
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="update" id="update"
                                       class="form-submit" value="Save" >
                            </div>
                            <br/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>