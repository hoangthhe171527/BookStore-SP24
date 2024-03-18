/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.account;

import constant.CommonConst;
import dal.implement.AccountDAO;
import dal.implement.OrderDAO;
import entity.Account;
import entity.Order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AccountInformations extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String newPassword = request.getParameter("newpassword");

        try {
            int id = Integer.parseInt(userId);

            AccountDAO accountDAO = new AccountDAO();

            boolean success = accountDAO.updateById(id, name, email, address, newPassword);

            if (success) {
                request.setAttribute("successMessage", "Successfully!");
                request.getRequestDispatcher("view/authen/myAccount.jsp").forward(request, response);
            } else {
                request.setAttribute("successMessage", "Failed!");
                request.getRequestDispatcher("view/authen/myAccount.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.getWriter().println("ID người dùng không hợp lệ.");
        }

    }

}
