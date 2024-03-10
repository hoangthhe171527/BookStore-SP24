/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.homepage;

import constant.CommonConst;
import dal.implement.CateDetailsDAO;
import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import entity.CategoryDetails;
import entity.Category;
import entity.PageControl;
import entity.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HomeController extends HttpServlet {

    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDao = new CategoryDAO();
    CateDetailsDAO cateDetailsDAO = new CateDetailsDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PageControl pageControl = new PageControl();
        List<Product> listProduct = findProductDoGet(request, pageControl);
        //get list category
        List<Category> listCategory = categoryDao.findAll();
        //get list category details
        List<CategoryDetails> listCateDetail = cateDetailsDAO.findAll();

        //set listProduct, listCategory to session
        HttpSession session = request.getSession();
        session.setAttribute(CommonConst.SESSION_PRODUCT, listProduct);
        session.setAttribute(CommonConst.SESSION_CATEGORY, listCategory);
        session.setAttribute(CommonConst.SESSION_CATEGORYDETAILS,listCateDetail);
        request.setAttribute("pageControl", pageControl);
        request.getRequestDispatcher("view/homepage/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("home");
    }

    private List<Product> findProductDoGet(HttpServletRequest request, PageControl pagecontrol) {
        //get ve page 
        String pageRaw = request.getParameter("page");
        //valid page
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        //get ve search
        String actionSearch = request.getParameter("search") == null
                ? "default"
                : request.getParameter("search");
        //get list product dao
        List<Product> listProduct;
        //get request URL
        String requestURL = request.getRequestURL().toString();
        int totalRecord = 0;
        double minPrice, maxPrice;
        switch (actionSearch) {
            case "category":
                String categoryId = request.getParameter("categoryId");
                totalRecord = productDAO.findTotalRecordByCategory(categoryId);
                listProduct = productDAO.findByCategory(categoryId, page);
                pagecontrol.setUrlPattern(requestURL + "?search=category&categoryId=" + categoryId + "&");
                break;
            case "categoryDetails":
                String cateDetailsId = request.getParameter("categoryDetailsId");
                totalRecord = productDAO.findTotalRecordByCategoryDetails(cateDetailsId);
                listProduct = productDAO.findByCategoryDetails(cateDetailsId, page);
                pagecontrol.setUrlPattern(requestURL + "?search=cateDetails&categoryDetailsId=" + cateDetailsId + "&");
                break;
            case "searchByName":
                String keyword = request.getParameter("keyword");
                totalRecord = productDAO.findTotalRecordByName(keyword);
                listProduct = productDAO.findByName(keyword, page);
                pagecontrol.setUrlPattern(requestURL + "?search=searchByName&keyword=" + keyword + "&");
                break;
            case "price":
            // Lấy giá trị minPrice và maxPrice từ request
            try {
                minPrice = Double.parseDouble(request.getParameter("minPrice"));
                maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
            } catch (NumberFormatException e) {
                minPrice = 0;
                maxPrice = Double.MAX_VALUE;
            }
            // Thực hiện tìm kiếm sản phẩm theo giá tiền
            totalRecord = productDAO.findTotalRecordByPrice(minPrice, maxPrice);
            listProduct = productDAO.findByPrice(minPrice, maxPrice, page);
            pagecontrol.setUrlPattern(requestURL + "?search=price&minPrice=" + minPrice + "&maxPrice=" + maxPrice + "&");
            break;
            default:
                totalRecord = productDAO.findTotalRecord();
                listProduct = productDAO.findByPage(page);
                pagecontrol.setUrlPattern(requestURL + "?");
        }
        //total record
        //total page
        int totalPage = (totalRecord % CommonConst.RECORD_PER_PAGE) == 0
                ? (totalRecord / CommonConst.RECORD_PER_PAGE)
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        //set total record, total page, page vao pageControl
        pagecontrol.setPage(page);
        pagecontrol.setTotalPage(totalPage);
        pagecontrol.setTotalRecord(totalRecord);
        return listProduct;
    }

}
