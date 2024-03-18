/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Chart;
import entity.Total;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ChartDAO extends GenericDAO<Chart> {

    public List<Chart> getTotalCategoryInCurrentMonth() {
        String sql = "select c.name,SUM(o.amount) as TOTAL_AMOUNT from [Order] as o\n"
                + "join OrderDetails as od on od.orderId = o.id\n"
                + "join Product as p on p.id = od.productId\n"
                + "join Category as c on c.id = p.categoryId\n"
                + "where YEAR(o.createAt) = YEAR(GETDATE())\n"
                + "and MONTH(o.createAt) = MONTH(GETDATE())\n"
                + "group by c.name \n"
                + "Order by TOTAL_AMOUNT asc";
        return queryGenericDAO(Chart.class, sql, null);
    }

    public List<Chart> getBestSeller() {
        String sql = "select TOP 1 c.name,SUM(o.amount) as TOTAL_AMOUNT from [Order] as o\n"
                + "join OrderDetails as od on od.orderId = o.id\n"
                + "join Product as p on p.id = od.productId\n"
                + "join Category as c on c.id = p.categoryId\n"
                + "where YEAR(o.createAt) = YEAR(GETDATE())\n"
                + "and MONTH(o.createAt) = MONTH(GETDATE())\n"
                + "group by c.name \n"
                + "Order by TOTAL_AMOUNT desc";
        return queryGenericDAO(Chart.class, sql, null);
    }

    

    @Override
    public List<Chart> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insert(Chart t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
