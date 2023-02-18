<%-- 
    Document   : debit_book
    Created on : Feb 11, 2023, 3:36:57 PM
    Author     : HiusBeos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="wrapper d-flex align-items-stretch">
            <jsp:include page="sidebar.jsp"/>
            <!-- Page Content  -->
            <div id="content" class="p-4 p-md-5">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="btn btn-primary">
                            <i class="fa fa-bars"></i>
                            <span class="sr-only">Toggle Menu</span>
                        </button>
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fa fa-bars"></i>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <div class="nav navbar-nav ml-auto">
                                Login as: abcd
                            </div>
                        </div>
                    </div>
                </nav>
                <div>
                    <div style="display: flex">
                        <div>
                            <h3>Danh sách người nợ</h3>
                        </div>
                        <div style="position: absolute; right: 47px">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAdd" data-whatever="@mdo">THÊM MỚI NGƯỜI NỢ </button>
                        </div>
                    </div>

                    <div>
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">SĐT</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Tổng nợ</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">
                                        <div class="form-group w-200">
                                            <input type="text" class="form-control">
                                        </div>
                                    </th>
                                    <td>
                                        <div class="form-group w-200">
                                            <input type="text" class="form-control">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group w-200">
                                            <input type="text" class="form-control">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group w-200">
                                            <input type="text" class="form-control">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group w-200">
                                            <input type="text" class="form-control">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group w-200">
                                            <input type="text" class="form-control">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group w-200">
                                            <input type="text" class="form-control">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group w-200">
                                            <input type="text" class="form-control">
                                        </div>
                                    </td>
                                    <th></th>
                                </tr>
                            <c:forEach items="${listDebtor}" var="d">
                                <tr>
                                    <th scope="row">${d.debtorId}</th>
                                    <td>${d.fullname}</td>
                                    <td>${d.address}</td>
                                    <td>${d.phone}</td>
                                    <td>${d.email}</td>
                                    <td>${d.total}</td>
                                    <th style="display: flex; right: 0">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalDetail">Chi tiet </button>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAddDebit">Thêm phiếu nợ </button>
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalEdit">Sủa </button>
                                    </th>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                </div>



            </div>
        </div>

        <jsp:include page="modal/modal-add.jsp"/>
        <jsp:include page="modal/modal-edit.jsp"/>
        <jsp:include page="modal/modal-add-debit.jsp"/>
        <jsp:include page="modal/modal-detail.jsp"/>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
