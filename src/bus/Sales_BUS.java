/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bus;

import dao.OrderDetail_DAO;
import dao.Order_DAO;
import dao.Product_DAO;
import entity.Employee;
import entity.Order;
import entity.OrderDetail;
import entity.Product;
import entity.PurchaseOrder;
import entity.PurchaseOrderDetail;
import java.time.LocalDate;
import java.time.ZoneId;
import java.sql.Date;


/**
 *
 * @author thanhcanhit
 */
public class Sales_BUS {
    private final Order_DAO orderDAO = new Order_DAO();
    private final OrderDetail_DAO orderDetailDAO = new OrderDetail_DAO();
    private final Product_DAO productDAO = new Product_DAO();
    
     public Product getProduct(String id) {
        return productDAO.getOne(id);
    }

    public Order CreateNewOrder() throws Exception{
        Order order = new Order(orderDAO.generateID());
        order.setStatus(false);
        order.setEmployee(new Employee("NV001"));
        LocalDate now = LocalDate.now();
        order.setOrderAt(Date.from(now.atStartOfDay(ZoneId.systemDefault()).toInstant()));
        return order;
    }
    
    public boolean saveToDatabase(Order order) {
        if (!orderDAO.create(order)) {
            return false;
        }
        for (OrderDetail detail : order.getOrderDetail()) {
            if (!orderDetailDAO.create(detail)) {
                return false;
            }
        }

        return true;
    }

    public boolean decreaseProductInventory(Product product, int quantity) {
        int newInventory = product.getInventory() - quantity;
        return productDAO.updateInventory(product.getProductID(), newInventory);
    }

    public boolean increaseProductInventory(Product product, int quantity) {
        int newInventory = product.getInventory() + quantity;
        return productDAO.updateInventory(product.getProductID(), newInventory);
    }
}