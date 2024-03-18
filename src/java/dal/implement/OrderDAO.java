/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Chart;
import entity.Order;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author Admin
 */
public class OrderDAO extends GenericDAO<Order> {

    @Override
    public List<Order> findAll() {
        return queryGenericDAO(Order.class);
    }

    @Override
    public int insert(Order t) {

        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([amount]\n"
                + "           ,[accountId]\n"
                + "           ,[createAt])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("1", t.getAmount());
        parameterMap.put("2", t.getAccountId());
        parameterMap.put("3", t.getCreateAt());
        return insertGenericDAO(sql, parameterMap);
    }

    

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        List<Order> orders = orderDAO.findByAccountId(9);

        if (orders.isEmpty()) {
            System.out.println("No orders found.");
        } else {
            System.out.println("Orders found:");
            for (Order order : orders) {
                System.out.println("Order ID: " + order.getId());
                System.out.println("Amount: " + order.getAmount());
                System.out.println("Account ID: " + order.getAccountId());
                System.out.println("Created at: " + order.getCreateAt());
                System.out.println();
            }
        }
    }

    public List<Order> findByAccountId(int accountId) {
        String sql = "SELECT * FROM [BookStry].[dbo].[Order] WHERE accountId = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("accountId", accountId);
        return queryGenericDAO(Order.class, sql, parameterMap);
    }

}
