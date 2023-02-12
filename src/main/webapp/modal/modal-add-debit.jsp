<%-- 
    Document   : modal-add-debit
    Created on : Feb 11, 2023, 5:46:11 PM
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
        <div class="modal add debit" id="modalAddDebit" tabindex="-1" role="dialog" aria-labelledby="modalAddDebit" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Tên người nợ</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Ghi chú:</label>
                                <textarea class="form-control" id="message-text" rows="6"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Loại nợ:</label>
                                <div style="display: flex">
                                    <button type="button" class="btn btn-primary" style="width: 49%; margin-right: 5px; margin-bottom: 5px;">-</button>
                                    <button type="button" class="btn btn-secondary" style="width: 49%; margin-right: 5px; margin-bottom: 5px;">+</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="money" class="col-form-label">Số tiền:</label>
                                <input type="number" min="0" class="form-control" id="money">
                            </div>
                            <div class="form-group">
                                <label for="datetime-name" class="col-form-label">Ngày lap phieu:</label>
                                <input type="datetime-local" class="form-control" id="datetime-name" name="datetime-name">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-primary">Thêm</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
