<%-- 
    Document   : navbar
    Created on : Feb 11, 2023, 3:55:13 PM
    Author     : HiusBeos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <nav id="sidebar">
            <div class="p-4 pt-5">
                <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.jpg);"></a>

                <ul class="list-unstyled components mb-5">
                    <li>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li>
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">FPT Uni Service</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li>
                                <a href="#">1 1</a>
                            </li>
                            <li>
                                <a href="#">1 2</a>
                            </li>
                            <li>
                                <a href="#">1 3</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Sổ ghi nợ</a>
                    </li>
                    <li>
                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Dịch vụ</a>
                        <ul class="collapse list-unstyled" id="pageSubmenu">
                            <li>
                                <a href="#">Dịch vụ 1</a>
                            </li>
                            <li>
                                <a href="#">Dịch vụ 2</a>
                            </li>
                            <li>
                                <a href="#">Dịch vụ 3</a>
                            </li>
                        </ul>
                    </li>


                </ul>

            </div>
        </nav>
    </body>
</html>
