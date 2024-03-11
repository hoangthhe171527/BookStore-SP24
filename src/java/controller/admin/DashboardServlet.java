/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import constant.CommonConst;
import dal.implement.CateDetailsDAO;
import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import entity.Category;
import entity.CategoryDetails;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DashboardServlet extends HttpServlet {

    ProductDAO dao = new ProductDAO();
    CategoryDAO categoryDao = new CategoryDAO();
    CateDetailsDAO cateDetailsDAO = new CateDetailsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        List<Product> listProduct = dao.findAll();
        //get list category
        List<Category> listCategory = categoryDao.findAll();
        //get list category details
        List<CategoryDetails> listCateDetail = cateDetailsDAO.findAll();
        
        session.setAttribute(CommonConst.SESSION_PRODUCT, listProduct);
        session.setAttribute(CommonConst.SESSION_CATEGORY, listCategory);
        session.setAttribute(CommonConst.SESSION_CATEGORYDETAILS, listCateDetail);

        //chuyen sang trang dashboard
        request.getRequestDispatcher("../view/admin/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
