<%-- 
    Document   : editAccountModal
    Created on : Mar 4, 2024, 9:53:54 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editAccountModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editAccountModalLabel">Edit Account</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editAccountForm" action="account?action=edit" method="POST">
                    <!--id-->
                    <div class="form-group" style="display: none">
                        <input type="text" class="form-control" id="idEditInput" name="id">
                    </div>
                    <!--Username-->
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" class="form-control" id="usernameEditInput" name="username">
                        <div id="usernameEditError" class="error"></div>
                    </div>
                    <!--Password-->
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="passwordEditInput" name="password">
                        <div id="passwordEditError" class="error"></div>
                    </div>
                    <!--Email-->
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="emailEditInput" name="email">
                        <div id="emailEditError" class="error"></div>
                    </div>
                    <!--Address-->
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="addressEditInput" name="address">
                        <div id="addressEditError" class="error"></div>
                    </div>
                    <!--Role-->
                    <div class="form-group">
                        <label for="role">Role:</label>
                        <select class="form-control" id="roleEditInput" name="role">
                            <c:forEach items="${listRoles}" var="role">
                                <option value="${role.id}">${role.name}</option>
                            </c:forEach>
                        </select>
                        <div id="roleEditError" class="error"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" form="editAccountForm"
                        onclick="validateAccountForm()">Update</button>
            </div>
        </div>
    </div>
</div>

<script>
    function validateAccountForm() {
        let username = $('#usernameEditInput').val();
        let password = $('#passwordEditInput').val();
        let email = $('#emailEditInput').val();
        let address = $('#addressEditInput').val();

        //xoá thông báo lỗi hiện tại
        $('.error').html('');

        if (username === '') {
            $('#usernameEditError').html('Tên người dùng không được để trống');
        }

        if (password === '') {
            $('#passwordEditError').html('Mật khẩu không được để trống');
        }

        if (email === '') {
            $('#emailEditError').html('Email không được để trống');
        }

        if (address === '') {
            $('#addressEditError').html('Địa chỉ không được để trống');
        }

        // Kiểm tra nếu không có lỗi thì submit form
        let error = '';
        $('.error').each(function () {
            error += $(this).html();
        });
        if (error === '') {
            $('#editAccountForm').submit();
        } else {
            event.preventDefault();
        }
    }

    function editAccountModal(button) {
        let id = $(button).closest('tr').find('td[name="id"]').text().trim();
        let username = $(button).closest('tr').find('td[name="username"]').text().trim();
        let password = $(button).closest('tr').find('td[name="password"]').text().trim();
        let email = $(button).closest('tr').find('td[name="email"]').text().trim();
        let address = $(button).closest('tr').find('td[name="address"]').text().trim();
        let roleText = $(button).closest('tr').find('td[name="role"]').text().trim();

        $('#idEditInput').val(id);
        $('#usernameEditInput').val(username);
        $('#passwordEditInput').val(password);
        $('#emailEditInput').val(email);
        $('#addressEditInput').val(address);

        //loop through role list to select the role
        $('#roleEditInput option').each(function () {
            if ($(this).text() === roleText) {
                $(this).prop('selected', true);
            }
        });
    }

</script>
