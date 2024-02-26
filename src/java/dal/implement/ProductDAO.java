/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.Product;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ProductDAO extends GenericDAO<Product> {

    @Override
    public List<Product> findAll() {
        return queryGenericDAO(Product.class);
    }

    @Override
    public int insert(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Product findById(Product product) {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[image]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[categoryId]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("id", product.getId());
        
        List<Product> list = queryGenericDAO(Product.class,sql,parameterMap);
        // neu nhu list empty => khong co sp => null
        
        // nguoc lai list ma ko empty => co sp => nam o vi tri dau tien => lay ve vi tri so 0
        return list.isEmpty() ? null : list.get(0);
    }

}
