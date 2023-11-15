/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package gui;

import bus.ViewAcountingVoucherList_BUS;
import entity.AcountingVoucher;
import entity.Employee;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.JLabel;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Hoàng Khang
 */
public class ViewAcountingVoucherList_GUI extends javax.swing.JPanel {

    private DefaultTableModel tblModel_acountingVoucherList;
    private ViewAcountingVoucherList_BUS viewAcountingVoucherList_BUS = new ViewAcountingVoucherList_BUS();

    /**
     * Creates new form ViewAcountingVoucherList_GUI
     */
    public ViewAcountingVoucherList_GUI() {
        initTableModel();
        initComponents();
        alterTable();
        renderCustomerTable(viewAcountingVoucherList_BUS.getAll());
        
    }

    public void alterTable() {
        DefaultTableCellRenderer rightAlign = new DefaultTableCellRenderer();
        rightAlign.setHorizontalAlignment(JLabel.RIGHT);

////        Align
        tbl_acountingVoucherList.getColumnModel().getColumn(5).setCellRenderer(rightAlign);
        tbl_acountingVoucherList.getColumnModel().getColumn(6).setCellRenderer(rightAlign);
        tbl_acountingVoucherList.getColumnModel().getColumn(7).setCellRenderer(rightAlign);

        tbl_acountingVoucherList.getColumnModel().getColumn(8).setCellRenderer(rightAlign);

    }

    public void renderCustomerTable(ArrayList<AcountingVoucher> list) {
        tblModel_acountingVoucherList.setRowCount(0);
        for (AcountingVoucher acountingVoucher : list) {
            String id = acountingVoucher.getAcountingVoucherID();
            Employee e1 = acountingVoucher.getCashCountSheet().getCashCountSheetDetailList().get(0).getEmployee();
            Employee e2 = acountingVoucher.getCashCountSheet().getCashCountSheetDetailList().get(1).getEmployee();
            Date start = acountingVoucher.getCreatedDate();
            Date end = acountingVoucher.getEndedDate();

            Object[] row = new Object[]{id, e1.getEmployeeID(), e2.getEmployeeID(), start, end, utilities.FormatNumber.toVND(acountingVoucher.getSale()), utilities.FormatNumber.toVND(acountingVoucher.getCashCountSheet().getTotal()), utilities.FormatNumber.toVND(acountingVoucher.getPayViaATM()), utilities.FormatNumber.toVND(acountingVoucher.getDifference())};
            tblModel_acountingVoucherList.addRow(row);
        }
    }

    public void initTableModel() {
        // Products
        tblModel_acountingVoucherList = new DefaultTableModel(new String[]{"Mã", "Người kiểm", "Đồng kiểm", "Bắt đầu", "Kết thúc", "Doanh thu", "Tiền mặt", "Thanh toán qua ATM", "Chênh lệch"
        }, 0);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        pnl_header = new javax.swing.JPanel();
        pnl_employee = new javax.swing.JPanel();
        pnl_employee1 = new javax.swing.JPanel();
        lbl_employee1 = new javax.swing.JLabel();
        txt_employee1 = new javax.swing.JTextField();
        pnl_employee2 = new javax.swing.JPanel();
        lbl_employee2 = new javax.swing.JLabel();
        txt_employee2 = new javax.swing.JTextField();
        pnl_date = new javax.swing.JPanel();
        pnl_startDate = new javax.swing.JPanel();
        lbl_startDate = new javax.swing.JLabel();
        date_startDate = new com.toedter.calendar.JDateChooser();
        pnl_endDate = new javax.swing.JPanel();
        lbl_endDate = new javax.swing.JLabel();
        date_endDate = new com.toedter.calendar.JDateChooser();
        pnl_money = new javax.swing.JPanel();
        pnl_sales = new javax.swing.JPanel();
        lbl_sales = new javax.swing.JLabel();
        cbo_sales = new javax.swing.JComboBox<>();
        pnl_difference = new javax.swing.JPanel();
        lbl_difference = new javax.swing.JLabel();
        cbo_difference = new javax.swing.JComboBox<>();
        pnl_button = new javax.swing.JPanel();
        btn_filter1 = new javax.swing.JButton();
        btn_filter = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tbl_acountingVoucherList = new javax.swing.JTable();

        setLayout(new java.awt.BorderLayout());

        pnl_header.setPreferredSize(new java.awt.Dimension(711, 70));
        pnl_header.setLayout(new javax.swing.BoxLayout(pnl_header, javax.swing.BoxLayout.X_AXIS));

        pnl_employee.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 5));
        pnl_employee.setLayout(new javax.swing.BoxLayout(pnl_employee, javax.swing.BoxLayout.Y_AXIS));

        pnl_employee1.setMinimumSize(new java.awt.Dimension(164, 30));
        pnl_employee1.setPreferredSize(new java.awt.Dimension(350, 30));
        pnl_employee1.setLayout(new javax.swing.BoxLayout(pnl_employee1, javax.swing.BoxLayout.X_AXIS));

        lbl_employee1.setText("Nhân viên kiểm:");
        lbl_employee1.setMaximumSize(new java.awt.Dimension(150, 16));
        lbl_employee1.setMinimumSize(new java.awt.Dimension(150, 16));
        lbl_employee1.setPreferredSize(new java.awt.Dimension(150, 16));
        pnl_employee1.add(lbl_employee1);

        txt_employee1.setPreferredSize(new java.awt.Dimension(200, 22));
        txt_employee1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_employee1ActionPerformed(evt);
            }
        });
        pnl_employee1.add(txt_employee1);

        pnl_employee.add(pnl_employee1);

        pnl_employee2.setPreferredSize(new java.awt.Dimension(350, 30));
        pnl_employee2.setLayout(new javax.swing.BoxLayout(pnl_employee2, javax.swing.BoxLayout.X_AXIS));

        lbl_employee2.setText("Nhân viên đồng kiểm:");
        lbl_employee2.setMaximumSize(new java.awt.Dimension(150, 16));
        lbl_employee2.setMinimumSize(new java.awt.Dimension(150, 16));
        lbl_employee2.setPreferredSize(new java.awt.Dimension(150, 16));
        pnl_employee2.add(lbl_employee2);

        txt_employee2.setPreferredSize(new java.awt.Dimension(200, 22));
        pnl_employee2.add(txt_employee2);

        pnl_employee.add(pnl_employee2);

        pnl_header.add(pnl_employee);

        pnl_date.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 5));
        pnl_date.setLayout(new javax.swing.BoxLayout(pnl_date, javax.swing.BoxLayout.Y_AXIS));

        pnl_startDate.setPreferredSize(new java.awt.Dimension(300, 30));
        pnl_startDate.setLayout(new javax.swing.BoxLayout(pnl_startDate, javax.swing.BoxLayout.X_AXIS));

        lbl_startDate.setText("Từ ngày: ");
        lbl_startDate.setMaximumSize(new java.awt.Dimension(100, 16));
        lbl_startDate.setMinimumSize(new java.awt.Dimension(100, 16));
        lbl_startDate.setPreferredSize(new java.awt.Dimension(100, 16));
        pnl_startDate.add(lbl_startDate);

        date_startDate.setDateFormatString("dd/MM/yyyy");
        date_startDate.setPreferredSize(new java.awt.Dimension(200, 22));
        pnl_startDate.add(date_startDate);

        pnl_date.add(pnl_startDate);

        pnl_endDate.setLayout(new javax.swing.BoxLayout(pnl_endDate, javax.swing.BoxLayout.X_AXIS));

        lbl_endDate.setText("Đến ngày: ");
        lbl_endDate.setMaximumSize(new java.awt.Dimension(100, 16));
        lbl_endDate.setMinimumSize(new java.awt.Dimension(100, 16));
        lbl_endDate.setPreferredSize(new java.awt.Dimension(100, 16));
        pnl_endDate.add(lbl_endDate);

        date_endDate.setDateFormatString("dd/MM/yyyy");
        date_endDate.setPreferredSize(new java.awt.Dimension(200, 30));
        pnl_endDate.add(date_endDate);

        pnl_date.add(pnl_endDate);

        pnl_header.add(pnl_date);

        pnl_money.setLayout(new javax.swing.BoxLayout(pnl_money, javax.swing.BoxLayout.Y_AXIS));

        pnl_sales.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 30));
        pnl_sales.setMinimumSize(new java.awt.Dimension(200, 24));
        pnl_sales.setPreferredSize(new java.awt.Dimension(200, 30));
        pnl_sales.setLayout(new javax.swing.BoxLayout(pnl_sales, javax.swing.BoxLayout.X_AXIS));

        lbl_sales.setText("Tổng từ:");
        lbl_sales.setMaximumSize(new java.awt.Dimension(80, 16));
        lbl_sales.setMinimumSize(new java.awt.Dimension(80, 16));
        lbl_sales.setPreferredSize(new java.awt.Dimension(80, 16));
        pnl_sales.add(lbl_sales);

        cbo_sales.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Tất cả", "Dưới 1 triệu", "Từ 1 đến 2 triệu", "Từ 2 đến 5 triệu", "Từ 5 đến 10 triệu", "Trên 10 triệu" }));
        cbo_sales.setPreferredSize(new java.awt.Dimension(140, 22));
        pnl_sales.add(cbo_sales);

        pnl_money.add(pnl_sales);

        pnl_difference.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 1, 30));
        pnl_difference.setPreferredSize(new java.awt.Dimension(250, 30));
        pnl_difference.setLayout(new javax.swing.BoxLayout(pnl_difference, javax.swing.BoxLayout.X_AXIS));

        lbl_difference.setText("Chênh lệch: ");
        lbl_difference.setMaximumSize(new java.awt.Dimension(80, 16));
        lbl_difference.setMinimumSize(new java.awt.Dimension(80, 16));
        lbl_difference.setPreferredSize(new java.awt.Dimension(80, 16));
        pnl_difference.add(lbl_difference);

        cbo_difference.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Tất cả", "Dưới 1 triệu", "Từ 1 đến 2 triệu", "Từ 2 đến 5 triệu", "Từ 5 đến 10 triệu", "Trên 10 triệu" }));
        cbo_difference.setPreferredSize(new java.awt.Dimension(140, 22));
        pnl_difference.add(cbo_difference);

        pnl_money.add(pnl_difference);

        pnl_header.add(pnl_money);

        pnl_button.setLayout(new javax.swing.BoxLayout(pnl_button, javax.swing.BoxLayout.Y_AXIS));

        btn_filter1.setText("Làm mới");
        btn_filter1.setMaximumSize(new java.awt.Dimension(200, 30));
        btn_filter1.setPreferredSize(new java.awt.Dimension(100, 30));
        pnl_button.add(btn_filter1);

        btn_filter.setText("Lọc");
        btn_filter.setMaximumSize(new java.awt.Dimension(200, 30));
        btn_filter.setPreferredSize(new java.awt.Dimension(100, 30));
        pnl_button.add(btn_filter);

        pnl_header.add(pnl_button);

        add(pnl_header, java.awt.BorderLayout.PAGE_START);

        tbl_acountingVoucherList.setModel(tblModel_acountingVoucherList);
        jScrollPane1.setViewportView(tbl_acountingVoucherList);

        add(jScrollPane1, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents

    private void txt_employee1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_employee1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_employee1ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_filter;
    private javax.swing.JButton btn_filter1;
    private javax.swing.JComboBox<String> cbo_difference;
    private javax.swing.JComboBox<String> cbo_sales;
    private com.toedter.calendar.JDateChooser date_endDate;
    private com.toedter.calendar.JDateChooser date_startDate;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lbl_difference;
    private javax.swing.JLabel lbl_employee1;
    private javax.swing.JLabel lbl_employee2;
    private javax.swing.JLabel lbl_endDate;
    private javax.swing.JLabel lbl_sales;
    private javax.swing.JLabel lbl_startDate;
    private javax.swing.JPanel pnl_button;
    private javax.swing.JPanel pnl_date;
    private javax.swing.JPanel pnl_difference;
    private javax.swing.JPanel pnl_employee;
    private javax.swing.JPanel pnl_employee1;
    private javax.swing.JPanel pnl_employee2;
    private javax.swing.JPanel pnl_endDate;
    private javax.swing.JPanel pnl_header;
    private javax.swing.JPanel pnl_money;
    private javax.swing.JPanel pnl_sales;
    private javax.swing.JPanel pnl_startDate;
    private javax.swing.JTable tbl_acountingVoucherList;
    private javax.swing.JTextField txt_employee1;
    private javax.swing.JTextField txt_employee2;
    // End of variables declaration//GEN-END:variables
}
