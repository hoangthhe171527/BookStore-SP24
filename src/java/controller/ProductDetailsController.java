/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.implement.ProductDAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ProductDetailsController extends HttpServlet {
   

    ProductDAO productDAO = new ProductDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // get ve id product
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = Product.builder()
                          .id(id)
                          .build();
        // lay product tu db
        Product productFoundById = productDAO.findById(product);
        // set product vao request va chuyen sang trang product-details.jsp
        request.setAttribute("product", productFoundById);
        request.getRequestDispatcher("view/homepage/product-details.jsp").forward(request, response);
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

    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
