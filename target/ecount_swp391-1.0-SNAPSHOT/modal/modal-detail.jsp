<%-- 
    Document   : modal-detail
    Created on : Feb 11, 2023, 6:33:26 PM
    Author     : HiusBeos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div  class="modal detail bd-example-modal-lg" id="modalDetail" tabindex="-1" role="dialog" aria-labelledby="modalDetail" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Tên người nợ</h5>
                        <!--                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAddDebit">
                                                    Tao phieu no
                                                </button>-->
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Ghi chu</th>
                                    <th scope="col">Loai no</th>
                                    <th scope="col">So tien</th>
                                    <th scope="col">Ngay lap phieu</th>
                                    <th scope="col">Thoi gian tao</th>
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
                                    <th></th>
                                </tr>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                    <td>@mdo</td>
                                    <td>@mdo</td>
                                    <!--                                    <th style="display: flex; right: 0">
                                                                             <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalDetail">Chi tiet </button>
                                                                             <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalAddDebit">Thêm phiếu nợ </button>
                                                                             button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalEdit">Sủa </button>
                                                                        </th>-->
                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-primary">Thêm</button>
                    </div>
                </div>


            </div>
        </div>

        <%--<jsp:include page="modal-add-debit.jsp"/>--%>
    </body>
</html>
