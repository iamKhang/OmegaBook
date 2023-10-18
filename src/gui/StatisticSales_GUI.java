/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package gui;

/**
 *
 * @author KienTran
 */
public class StatisticSales_GUI extends javax.swing.JPanel {

    /**
     * Creates new form StatisticSales_GUI
     */
    public StatisticSales_GUI() {
        initComponents();
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
        pnl_control = new javax.swing.JPanel();
        filler26 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(20, 0), new java.awt.Dimension(10, 32767));
        pnl_filter = new javax.swing.JPanel();
        filler28 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        month_statistrcSales = new com.toedter.calendar.JMonthChooser();
        year_statisticSales = new com.toedter.calendar.JYearChooser();
        filler27 = new javax.swing.Box.Filler(new java.awt.Dimension(300, 0), new java.awt.Dimension(300, 0), new java.awt.Dimension(1000, 32767));
        pnl_infomaotionBody = new javax.swing.JPanel();
        pnl_orderQuantiy = new javax.swing.JPanel();
        filler1 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        lbl_orderQuantity = new javax.swing.JLabel();
        filler2 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        txt_orderQuantity = new javax.swing.JTextField();
        filler3 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        pnl_returnOrderQuantity = new javax.swing.JPanel();
        filler4 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        lbl_returnOrderQuanitty = new javax.swing.JLabel();
        filler5 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        txt_returnOrderQuantity = new javax.swing.JTextField();
        filler6 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        pnl_purchaseOrderQuantiy = new javax.swing.JPanel();
        filler7 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        lbl_purchaseOrderQuantity = new javax.swing.JLabel();
        filler8 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        txt_purchaseOrderQuanitty = new javax.swing.JTextField();
        filler9 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        pnl_orderQuantiy3 = new javax.swing.JPanel();
        filler10 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        lbl_orderQuantity3 = new javax.swing.JLabel();
        filler11 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        txt_orderQuantity3 = new javax.swing.JTextField();
        filler12 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        pnl_orderQuantiy4 = new javax.swing.JPanel();
        filler13 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        lbl_orderQuantity4 = new javax.swing.JLabel();
        filler14 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        txt_orderQuantity4 = new javax.swing.JTextField();
        filler15 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        pnl_productTypeStatistic = new javax.swing.JPanel();
        pnl_center = new javax.swing.JPanel();

        setMinimumSize(new java.awt.Dimension(1366, 768));
        setLayout(new java.awt.BorderLayout());

        pnl_header.setMinimumSize(new java.awt.Dimension(500, 75));
        pnl_header.setPreferredSize(new java.awt.Dimension(500, 368));
        pnl_header.setLayout(new java.awt.BorderLayout());

        pnl_control.setBorder(javax.swing.BorderFactory.createTitledBorder("Thống kê theo: "));
        pnl_control.setPreferredSize(new java.awt.Dimension(1366, 60));
        pnl_control.setLayout(new javax.swing.BoxLayout(pnl_control, javax.swing.BoxLayout.LINE_AXIS));
        pnl_control.add(filler26);

        pnl_filter.setMaximumSize(new java.awt.Dimension(300, 2147483647));
        pnl_filter.setMinimumSize(new java.awt.Dimension(300, 27));
        pnl_filter.setPreferredSize(new java.awt.Dimension(300, 56));
        pnl_filter.setLayout(new javax.swing.BoxLayout(pnl_filter, javax.swing.BoxLayout.LINE_AXIS));
        pnl_filter.add(filler28);

        month_statistrcSales.setMinimumSize(new java.awt.Dimension(120, 27));
        month_statistrcSales.setPreferredSize(new java.awt.Dimension(150, 20));
        pnl_filter.add(month_statistrcSales);

        year_statisticSales.setPreferredSize(new java.awt.Dimension(150, 20));
        pnl_filter.add(year_statisticSales);

        pnl_control.add(pnl_filter);
        pnl_control.add(filler27);

        pnl_header.add(pnl_control, java.awt.BorderLayout.NORTH);

        pnl_infomaotionBody.setBorder(javax.swing.BorderFactory.createTitledBorder("Thông tin chi tiết"));
        pnl_infomaotionBody.setLayout(new java.awt.GridLayout(2, 3));

        pnl_orderQuantiy.setBorder(javax.swing.BorderFactory.createEmptyBorder(40, 1, 40, 1));
        pnl_orderQuantiy.setLayout(new javax.swing.BoxLayout(pnl_orderQuantiy, javax.swing.BoxLayout.LINE_AXIS));
        pnl_orderQuantiy.add(filler1);

        lbl_orderQuantity.setText("Tổng số hoá đơn: ");
        lbl_orderQuantity.setPreferredSize(new java.awt.Dimension(110, 0));
        pnl_orderQuantiy.add(lbl_orderQuantity);
        pnl_orderQuantiy.add(filler2);

        txt_orderQuantity.setEditable(false);
        txt_orderQuantity.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_orderQuantity.setPreferredSize(new java.awt.Dimension(50, 20));
        pnl_orderQuantiy.add(txt_orderQuantity);
        pnl_orderQuantiy.add(filler3);

        pnl_infomaotionBody.add(pnl_orderQuantiy);

        pnl_returnOrderQuantity.setBorder(javax.swing.BorderFactory.createEmptyBorder(40, 1, 40, 1));
        pnl_returnOrderQuantity.setLayout(new javax.swing.BoxLayout(pnl_returnOrderQuantity, javax.swing.BoxLayout.LINE_AXIS));
        pnl_returnOrderQuantity.add(filler4);

        lbl_returnOrderQuanitty.setText("Tổng hoá đơn trả:");
        lbl_returnOrderQuanitty.setPreferredSize(new java.awt.Dimension(110, 0));
        pnl_returnOrderQuantity.add(lbl_returnOrderQuanitty);
        pnl_returnOrderQuantity.add(filler5);

        txt_returnOrderQuantity.setEditable(false);
        txt_returnOrderQuantity.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_returnOrderQuantity.setPreferredSize(new java.awt.Dimension(50, 20));
        pnl_returnOrderQuantity.add(txt_returnOrderQuantity);
        pnl_returnOrderQuantity.add(filler6);

        pnl_infomaotionBody.add(pnl_returnOrderQuantity);

        pnl_purchaseOrderQuantiy.setBorder(javax.swing.BorderFactory.createEmptyBorder(40, 1, 40, 1));
        pnl_purchaseOrderQuantiy.setLayout(new javax.swing.BoxLayout(pnl_purchaseOrderQuantiy, javax.swing.BoxLayout.LINE_AXIS));
        pnl_purchaseOrderQuantiy.add(filler7);

        lbl_purchaseOrderQuantity.setText("Tổng số đơn nhập: ");
        lbl_purchaseOrderQuantity.setMaximumSize(new java.awt.Dimension(130, 17));
        lbl_purchaseOrderQuantity.setMinimumSize(new java.awt.Dimension(130, 17));
        lbl_purchaseOrderQuantity.setPreferredSize(new java.awt.Dimension(120, 0));
        pnl_purchaseOrderQuantiy.add(lbl_purchaseOrderQuantity);
        pnl_purchaseOrderQuantiy.add(filler8);

        txt_purchaseOrderQuanitty.setEditable(false);
        txt_purchaseOrderQuanitty.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_purchaseOrderQuanitty.setPreferredSize(new java.awt.Dimension(50, 20));
        pnl_purchaseOrderQuantiy.add(txt_purchaseOrderQuanitty);
        pnl_purchaseOrderQuantiy.add(filler9);

        pnl_infomaotionBody.add(pnl_purchaseOrderQuantiy);

        pnl_orderQuantiy3.setBorder(javax.swing.BorderFactory.createEmptyBorder(40, 1, 40, 1));
        pnl_orderQuantiy3.setMinimumSize(new java.awt.Dimension(380, 20));
        pnl_orderQuantiy3.setPreferredSize(new java.awt.Dimension(380, 20));
        pnl_orderQuantiy3.setLayout(new javax.swing.BoxLayout(pnl_orderQuantiy3, javax.swing.BoxLayout.LINE_AXIS));
        pnl_orderQuantiy3.add(filler10);

        lbl_orderQuantity3.setText("Tổng doanh thu:");
        lbl_orderQuantity3.setPreferredSize(new java.awt.Dimension(110, 0));
        pnl_orderQuantiy3.add(lbl_orderQuantity3);
        pnl_orderQuantiy3.add(filler11);

        txt_orderQuantity3.setEditable(false);
        txt_orderQuantity3.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_orderQuantity3.setPreferredSize(new java.awt.Dimension(50, 20));
        pnl_orderQuantiy3.add(txt_orderQuantity3);
        pnl_orderQuantiy3.add(filler12);

        pnl_infomaotionBody.add(pnl_orderQuantiy3);

        pnl_orderQuantiy4.setBorder(javax.swing.BorderFactory.createEmptyBorder(40, 1, 40, 1));
        pnl_orderQuantiy4.setLayout(new javax.swing.BoxLayout(pnl_orderQuantiy4, javax.swing.BoxLayout.LINE_AXIS));
        pnl_orderQuantiy4.add(filler13);

        lbl_orderQuantity4.setText("Chỉ tiêu:");
        lbl_orderQuantity4.setPreferredSize(new java.awt.Dimension(110, 0));
        pnl_orderQuantiy4.add(lbl_orderQuantity4);
        pnl_orderQuantiy4.add(filler14);

        txt_orderQuantity4.setEditable(false);
        txt_orderQuantity4.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_orderQuantity4.setPreferredSize(new java.awt.Dimension(50, 20));
        pnl_orderQuantiy4.add(txt_orderQuantity4);
        pnl_orderQuantiy4.add(filler15);

        pnl_infomaotionBody.add(pnl_orderQuantiy4);

        pnl_header.add(pnl_infomaotionBody, java.awt.BorderLayout.CENTER);

        pnl_productTypeStatistic.setBorder(javax.swing.BorderFactory.createTitledBorder("Biểu đồ tỷ lệ sản phẩm "));
        pnl_productTypeStatistic.setPreferredSize(new java.awt.Dimension(400, 400));
        pnl_productTypeStatistic.setLayout(new javax.swing.BoxLayout(pnl_productTypeStatistic, javax.swing.BoxLayout.Y_AXIS));
        pnl_header.add(pnl_productTypeStatistic, java.awt.BorderLayout.EAST);

        add(pnl_header, java.awt.BorderLayout.NORTH);

        pnl_center.setBorder(javax.swing.BorderFactory.createTitledBorder("Thống kê doanh thu theo tháng"));
        pnl_center.setPreferredSize(new java.awt.Dimension(661, 400));
        pnl_center.setLayout(new java.awt.BorderLayout());
        add(pnl_center, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.Box.Filler filler1;
    private javax.swing.Box.Filler filler10;
    private javax.swing.Box.Filler filler11;
    private javax.swing.Box.Filler filler12;
    private javax.swing.Box.Filler filler13;
    private javax.swing.Box.Filler filler14;
    private javax.swing.Box.Filler filler15;
    private javax.swing.Box.Filler filler2;
    private javax.swing.Box.Filler filler26;
    private javax.swing.Box.Filler filler27;
    private javax.swing.Box.Filler filler28;
    private javax.swing.Box.Filler filler3;
    private javax.swing.Box.Filler filler4;
    private javax.swing.Box.Filler filler5;
    private javax.swing.Box.Filler filler6;
    private javax.swing.Box.Filler filler7;
    private javax.swing.Box.Filler filler8;
    private javax.swing.Box.Filler filler9;
    private javax.swing.JLabel lbl_orderQuantity;
    private javax.swing.JLabel lbl_orderQuantity3;
    private javax.swing.JLabel lbl_orderQuantity4;
    private javax.swing.JLabel lbl_purchaseOrderQuantity;
    private javax.swing.JLabel lbl_returnOrderQuanitty;
    private com.toedter.calendar.JMonthChooser month_statistrcSales;
    private javax.swing.JPanel pnl_center;
    private javax.swing.JPanel pnl_control;
    private javax.swing.JPanel pnl_filter;
    private javax.swing.JPanel pnl_header;
    private javax.swing.JPanel pnl_infomaotionBody;
    private javax.swing.JPanel pnl_orderQuantiy;
    private javax.swing.JPanel pnl_orderQuantiy3;
    private javax.swing.JPanel pnl_orderQuantiy4;
    private javax.swing.JPanel pnl_productTypeStatistic;
    private javax.swing.JPanel pnl_purchaseOrderQuantiy;
    private javax.swing.JPanel pnl_returnOrderQuantity;
    private javax.swing.JTextField txt_orderQuantity;
    private javax.swing.JTextField txt_orderQuantity3;
    private javax.swing.JTextField txt_orderQuantity4;
    private javax.swing.JTextField txt_purchaseOrderQuanitty;
    private javax.swing.JTextField txt_returnOrderQuantity;
    private com.toedter.calendar.JYearChooser year_statisticSales;
    // End of variables declaration//GEN-END:variables
}
