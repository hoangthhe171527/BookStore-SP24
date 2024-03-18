/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Total;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TotalDAO extends GenericDAO<Total>{
    public List<Total> getTotalRevenue() {
        String sql = "SELECT SUM(o.amount) AS TOTAL_REVENUE\n"
                + "FROM [Order] AS o\n"
                + "JOIN OrderDetails AS od ON od.orderId = o.id\n"
                + "JOIN Product AS p ON p.id = od.productId;";
        return queryGenericDAO(Total.class, sql, null);
    }

    @Override
    public List<Total> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Total t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
