/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.TotalProductSelled;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ProductSellDAO extends GenericDAO<TotalProductSelled> {

    @Override
    public List<TotalProductSelled> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(TotalProductSelled t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<TotalProductSelled> getTotalProductSell() {
        String sql = "SELECT c.name, \n"
                + "       SUM(od.quantity) AS TOTAL_SOLD,\n"
                + "       SUM(o.amount) AS TOTAL_AMOUNT_SOLD\n"
                + "FROM [Order] AS o\n"
                + "JOIN OrderDetails AS od ON od.orderId = o.id\n"
                + "JOIN Product AS p ON p.id = od.productId\n"
                + "JOIN Category AS c ON c.id = p.categoryId\n"
                + "WHERE YEAR(o.createAt) = YEAR(GETDATE())\n"
                + "AND MONTH(o.createAt) = MONTH(GETDATE())\n"
                + "GROUP BY c.name \n"
                + "ORDER BY TOTAL_SOLD ASC;";
        return queryGenericDAO(TotalProductSelled.class, sql, null);
    }

    public static void main(String[] args) {
        ProductSellDAO dao = new ProductSellDAO();
        List<TotalProductSelled> list = dao.getTotalProductSell();

        if (list.isEmpty()) {
            System.out.println("No orders found.");
        } else {
            System.out.println("Orders found:");
            for (TotalProductSelled product : list) {
                System.out.println(product);
            }
        }
    }

}
