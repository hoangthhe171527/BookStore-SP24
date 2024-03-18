package controller.admin;

import dal.implement.AccountDAO;
import entity.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class AccountAdminServlet extends HttpServlet {

    AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Get session
        HttpSession session = request.getSession();
        // Get action
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");

        switch (action) {
            case "edit":
                editAccount(request);
                break;
            case "delete":
                deleteAccount(request);
                break;
            default:
                break;
        }

        response.sendRedirect("acc-control");
    }

    private void editAccount(HttpServletRequest request) {
        try {
            // Get ID
            int id = Integer.parseInt(request.getParameter("id"));
            // Get username
            String username = request.getParameter("username");
            // Get password
            String password = request.getParameter("password");
            // Get email
            String email = request.getParameter("email");
            // Get address
            String address = request.getParameter("address");
            // Get role ID
            int roleId = Integer.parseInt(request.getParameter("roleId"));

            // Create Account object
            Account account = new Account();
            account.setId(id);
            account.setUsername(username);
            account.setPassword(password);
            account.setEmail(email);
            account.setAddress(address);
            account.setRoleId(roleId);

            // Update account
            accountDAO.update(account);
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }
    }

    private void deleteAccount(HttpServletRequest request) {
        try {
            // Get ID
            int id = Integer.parseInt(request.getParameter("id"));

            // Delete account
            accountDAO.deleteById(id);
        } catch (NumberFormatException ex) {
            ex.printStackTrace();
        }
    }
}
