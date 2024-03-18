/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import constant.CommonConst;
import dal.implement.OrderDAO;
import dal.implement.OrderDetailsDAO;
import dal.implement.ProductDAO;
import entity.Account;
import entity.Order;
import entity.OrderDetails;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
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
public class CardController extends HttpServlet {

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
        request.getRequestDispatcher("view/user/payment/card.jsp").forward(request, response);
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
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add-product":
                addProduct(request, response);
                break;
            case "change-quantity":
                changeQuantity(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "check-out":
                checkOut(request, response);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("payment");

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

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // get ve session
        HttpSession session = request.getSession();
        // get ve product id
        int id = Integer.parseInt(request.getParameter("id"));
        // get ve quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        // lay ve card tren session
        Order cart = (Order) session.getAttribute("cart");
        if (cart == null) {
            cart = new Order();
        }
        OrderDetails od = new OrderDetails();
        od.setProductId(id);
        od.setQuantity(quantity);

        // them orderDetails vao trong card
        addOrderDetailsToOrder(od, cart);
        // set card moi len session
        session.setAttribute("cart", cart);
        response.sendRedirect("payment");
    }

    private void addOrderDetailsToOrder(OrderDetails od, Order cart) {
        boolean isAdd = false;
        for (OrderDetails obj : cart.getListOrderDetails()) {
            if (obj.getProductId() == od.getProductId()) {
                obj.setQuantity(obj.getQuantity() + od.getQuantity());
                isAdd = true;
            }
        }
        if (isAdd == false) {
            cart.getListOrderDetails().add(od);
        }
    }

    private void changeQuantity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
            // get ve product id
            int id = Integer.parseInt(request.getParameter("id"));
            // get ve quantity
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            // lay ve cart
            Order cart = (Order) session.getAttribute("cart");
            // thay doi quantity 
            for (OrderDetails obj : cart.getListOrderDetails()) {
                if (obj.getProductId() == id) {
                    obj.setQuantity(quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        // get id product muon xoa
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Order cart = (Order) session.getAttribute("cart");
        OrderDetails od = null;
        for (OrderDetails obj : cart.getListOrderDetails()) {
            if (obj.getProductId() == id) {
                od = obj;
            }
        }
        cart.getListOrderDetails().remove(od);
        session.setAttribute("cart", cart);
    }

    private void checkOut(HttpServletRequest request, HttpServletResponse response) {
        // lay ve cart
        HttpSession session = request.getSession();
        Order cart = (Order) session.getAttribute("cart");

        // lay ve account id
        int accountId = ((Account) session.getAttribute(CommonConst.SESSION_ACCOUNT)).getId();
        // get list product
        List<Product> list = (List<Product>) session.getAttribute(CommonConst.SESSION_PRODUCT);
        // amount
        int amount = calculateAmount(cart, list);
        // insert order
        // set information
        cart.setAccountId(accountId);
        cart.setAmount(amount);
        cart.setCreateAt(Timestamp.valueOf(LocalDateTime.now()));

        OrderDAO orderDAO = new OrderDAO();
        OrderDetailsDAO odDAO = new OrderDetailsDAO();
        int orderId = orderDAO.insert(cart);
        for (OrderDetails obj : cart.getListOrderDetails()) {
            obj.setOrderId(orderId);
            odDAO.insert(obj);
        }
        // tru di so luong san pham o trong csdl
        ProductDAO productDAO = new ProductDAO();
        for (OrderDetails orderDetails : cart.getListOrderDetails()) {
            // Lấy thông tin sản phẩm từ danh sách sản phẩm
            Product product = list.stream()
                    .filter(p -> p.getId() == orderDetails.getProductId())
                    .findFirst()
                    .orElse(null);
            if (product != null) {
                // Trừ đi số lượng sản phẩm đã mua
                product.setQuantity(product.getQuantity() - orderDetails.getQuantity());
                // Cập nhật thông tin sản phẩm trong cơ sở dữ liệu
                productDAO.update(product);
            }
            //remove
            session.removeAttribute("cart");
        }

    }

    private int calculateAmount(Order cart, List<Product> list) {
        int amount = 0;
        for (OrderDetails od : cart.getListOrderDetails()) {
            amount += (od.getQuantity() * findPriceById(list, od.getProductId()));
        }
        return amount;
    }

    private float findPriceById(List<Product> list, int bookId) {
        for (Product obj : list) {
            if (obj.getId() == bookId) {
                return obj.getPrice();
            }
        }
        return 0;
    }
    
    
}

