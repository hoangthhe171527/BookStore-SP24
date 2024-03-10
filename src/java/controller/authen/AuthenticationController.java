/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authen;

import constant.CommonConst;
import dal.implement.AccountDAO;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class AuthenticationController extends HttpServlet {
    AccountDAO accountDAO = new AccountDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // get ve action
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        // dua theo action set url trang can chuyen den
        String url;
        switch (action) {
            case "login":
                url = "view/authen/login.jsp";
                break;
            case "log-out":
                url = logOut(request,response);
                break;
            case "sign-up":
                url = "view/authen/register.jsp";
                break;
            default:
                url = "home";
        }
        // chuyen trang
        request.getRequestDispatcher(url).forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // get ve action
        String action = request.getParameter("action") != null
                ? request.getParameter("action")
                : "";
        // dua theo action de xu ly request
        String url;
        switch (action) {
            case "login":
                url = loginDoPost(request,response);
                break;
            case "sign-up":
                url = signUp(request,response);
                break;
            
            default:
                url = "home";
        }
        request.getRequestDispatcher(url).forward(request, response);
    }

    

    private String loginDoPost(HttpServletRequest request, HttpServletResponse response) {
        String url = null;
        // get ve cac thong tin ng dung nhap
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        // ktra thong tin co ton tai trong db khong
        Account account = Account.builder()
                .username(username)
                .password(password)
                .build();
        Account accFoundByUsernamePass = accountDAO.findByUsernamePass(account);
        // true => trang home ( set account vao trong session )
        if(accFoundByUsernamePass != null){
            HttpSession session = request.getSession();
            session.setAttribute(CommonConst.SESSION_ACCOUNT, accFoundByUsernamePass);
            url = "home";
        
        // false => quay tro lai trang login ( set thong bao loi )
        } else {
            request.setAttribute("error", "username or password incorrect!");
            url = "view/authen/login.jsp";
        }
        return url;
        
    }

    private String logOut(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute(CommonConst.SESSION_ACCOUNT);
        return "home";
    }

    private String signUp(HttpServletRequest request, HttpServletResponse response) {
        String url = null;
        // get ve thong tin nguoi dung nhap
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        // ktra xem user name ton tai trong db chua
        Account account = Account.builder()
                .username(username)
                .password(password)
                .build();
        boolean isUsernameExist = accountDAO.checkUsernameExist(account);
        // true => quay tro lai trang register(set thong bao loi )
        if(isUsernameExist){
            request.setAttribute("error", "Username exist!");
            url = "view/authen/register.jsp";
        }
        // false => quay tro lai trang home ( ghi tai khoan vao trong db )
        else {
            accountDAO.insert(account);
            url = "home";
        }
        return url;
     
    }

}
