/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class TotalProductSelled {
    private String name;
    private int TOTAL_SOLD;
    private int TOTAL_AMOUNT_SOLD;

    public TotalProductSelled() {
    }

    public TotalProductSelled(String name, int TOTAL_SOLD, int TOTAL_AMOUNT_SOLD) {
        this.name = name;
        this.TOTAL_SOLD = TOTAL_SOLD;
        this.TOTAL_AMOUNT_SOLD = TOTAL_AMOUNT_SOLD;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTOTAL_SOLD() {
        return TOTAL_SOLD;
    }

    public void setTOTAL_SOLD(int TOTAL_SOLD) {
        this.TOTAL_SOLD = TOTAL_SOLD;
    }

    public int getTOTAL_AMOUNT_SOLD() {
        return TOTAL_AMOUNT_SOLD;
    }

    public void setTOTAL_AMOUNT_SOLD(int TOTAL_AMOUNT_SOLD) {
        this.TOTAL_AMOUNT_SOLD = TOTAL_AMOUNT_SOLD;
    }

    @Override
    public String toString() {
        return "TotalProductSelled{" + "name=" + name + ", TOTAL_SOLD=" + TOTAL_SOLD + ", TOTAL_AMOUNT_SOLD=" + TOTAL_AMOUNT_SOLD + '}';
    }
    

   

    
    
    
    
}
