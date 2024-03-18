/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Order;
import entity.OrderDetails;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDetailsDAO extends GenericDAO<OrderDetails> {

    @Override
    public int insert(OrderDetails t) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([quantity]\n"
                + "           ,[productId]\n"
                + "           ,[orderId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", t.getQuantity());
        parameterMap.put("2", t.getProductId());
        parameterMap.put("3", t.getOrderId());
        return insertGenericDAO(sql, parameterMap);
    }

    @Override
    public List<OrderDetails> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<OrderDetails> findByOrderId(int orderID) {
        String sql = "SELECT *\n"
                + "  FROM [BookStry].[dbo].[OrderDetails]\n"
                + "  where orderId = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("orderID", orderID);
        return queryGenericDAO(OrderDetails.class, sql, parameterMap);
    }
    
    
    public static void main(String[] args) {
        OrderDetailsDAO dao = new OrderDetailsDAO();
        List<OrderDetails> list = dao.findByOrderId(1);

        if (list.isEmpty()) {
            System.out.println("No orders found.");
        } else {
            System.out.println("Orders found:");
            for (OrderDetails order : list) {
                System.out.println("getId ID: " + order.getId());
                System.out.println("getOrderId: " + order.getOrderId());
                System.out.println("getProductId ID: " + order.getProductId());
                System.out.println("Quantity: " + order.getQuantity());
                System.out.println();
            }
        }
    }
}
