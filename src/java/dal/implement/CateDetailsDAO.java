/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import entity.CategoryDetails;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CateDetailsDAO extends GenericDAO<CategoryDetails>{

    @Override
    public List<CategoryDetails> findAll() {
        return queryGenericDAO(CategoryDetails.class);
    }

    @Override
    public int insert(CategoryDetails t) {
        return insertGenericDAO(t);
    }
    
    
    public static void main(String[] args) {
        CateDetailsDAO cateDetailsDAO = new CateDetailsDAO();
        List<CategoryDetails> cateDetailsList = cateDetailsDAO.findAll();
        
        if (cateDetailsList != null && !cateDetailsList.isEmpty()) {
            System.out.println("Dữ liệu từ CateDetails:");
            for (CategoryDetails cateDetails : cateDetailsList) {
                System.out.println(cateDetails.toString());
            }
        } else {
            System.out.println("Không có dữ liệu từ CateDetails.");
        }
    
}

    
}
