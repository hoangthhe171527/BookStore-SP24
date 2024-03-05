/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import entity.Product;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
//dung de xu ly image
@MultipartConfig
public class ProductAdminServlet extends HttpServlet {

    ProductDAO pdao = new ProductDAO();
    CategoryDAO cateDao = new CategoryDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // get session
        HttpSession session = request.getSession();
        // get action
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add":
                addProduct(request);
                break;
            case "edit":
                editProduct(request);
                break;
            case "delete":
                deleteProduct(request);
                break;

            default:

        }

        response.sendRedirect("dashboard");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void addProduct(HttpServletRequest request) {
        try {
            // get name
            String name = request.getParameter("name");
            // get price
            int price = Integer.parseInt(request.getParameter("price"));
            // get quantity
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            // get description
            String description = request.getParameter("description");
            // get categoryId
            int categoryId = Integer.parseInt(request.getParameter("category"));

            // image
            Part part = request.getPart("image");
            String imagePath = null;
            if (part.getSubmittedFileName() == null || part.getSubmittedFileName().trim().isEmpty()
                    || part == null) {
                imagePath = null;
            } else {
                // duong dan luu anh
                String path = request.getServletContext().getRealPath("/images");
                File dir = new File(path);

                // xem duong dan da ton tai chua
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File image = new File(dir, part.getSubmittedFileName());
                // ghi file vao trong duong dan
                part.write(image.getAbsolutePath());
                // lay ra context path cua project
                imagePath = request.getContextPath() + "/images/" + image.getName();
            }

            Product product = Product.builder()
                    .name(name)
                    .price(price)
                    .quantity(quantity)
                    .categoryId(categoryId)
                    .description(description)
                    .image(imagePath)
                    .build();
            pdao.insert(product);

        } catch (NumberFormatException | IOException | ServletException ex) {
            ex.printStackTrace();
        }

    }

    private void deleteProduct(HttpServletRequest request) {
        // get id
        int id = Integer.parseInt(request.getParameter("id"));
        pdao.deleteById(id);

    }

    private void editProduct(HttpServletRequest request) throws IOException, ServletException {
        try {
            // get id
            int id = Integer.parseInt(request.getParameter("id"));
            // get name
            String name = request.getParameter("name");
            // get price
            float price = Float.parseFloat(request.getParameter("price"));
            // get quantity
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            // get description
            String description = request.getParameter("description");
            // get categoryId
            int categoryId = Integer.parseInt(request.getParameter("category"));
            
            // image
            Part part = request.getPart("image");
            String imagePath = null;
            if (part.getSubmittedFileName() == null || part.getSubmittedFileName().trim().isEmpty()
                    || part == null) {
                imagePath = request.getParameter("currentImage");
            } else {
                // duong dan luu anh
                String path = request.getServletContext().getRealPath("/images");
                File dir = new File(path);

                // xem duong dan da ton tai chua
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File image = new File(dir, part.getSubmittedFileName());
                // ghi file vao trong duong dan
                part.write(image.getAbsolutePath());
                // lay ra context path cua project
                imagePath = request.getContextPath() + "/images/" + image.getName();
            }
            
            Product product = Product.builder()
                    .id(id)
                    .name(name)
                    .quantity(quantity)
                    .price(price)
                    .description(description)
                    .categoryId(categoryId)
                    .image(imagePath)
                    .build();
            
            pdao.update(product);
            
        } catch (NumberFormatException | IOException | ServletException ex) {
            ex.printStackTrace();
        }
    }

}
