/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package gui;

import bus.StatisticSales_BUS;
import gui.customchart.ModelChart;
import gui.customchart.piechart.ModelPolarAreaChart;
import gui.customchart.piechart.PolarAreaChart;
import java.awt.Color;
import java.beans.PropertyChangeEvent;

import org.knowm.xchart.*;
import utilities.FormatNumber;

/**
 *
 * @author KienTran
 */
public final class StatisticSales_GUI extends javax.swing.JPanel {

    private XChartPanel<PieChart> pieChartPanel;
    private final StatisticSales_BUS bus = new StatisticSales_BUS();
    private final PolarAreaChart polarAreaChart = new PolarAreaChart();

    /**
     * Creates new form StatisticSales_GUI
     */
    public StatisticSales_GUI() {
        initComponents();
        init();
    }

    public void init() {
        
        chart.setBackground(getBackground());
        chart.addLegend("Doanh thu", new Color(71, 118, 185));

//        pieChartPanel = new XChartPanel<>(getPieChart());
//        pnl_productTypeStatistic.add(pieChartPanel);
        getChart();
        getPieChart();
        renderInfo();
        month_statisticSales.addPropertyChangeListener((PropertyChangeEvent evt) -> {
            if ("month".equals(evt.getPropertyName())) {
                int month = month_statisticSales.getMonth();
                int year = year_statisticSales.getYear();
//                pnl_productTypeStatistic.remove(pieChartPanel);
                polarAreaChart.clear();
                getPieChart();
                chart.clear();
                getChart();
//                pieChartPanel = new XChartPanel<>(getPieChart());
//                pnl_productTypeStatistic.add(pieChartPanel);
//                pieChartPanel.updateUI();
                renderInfo();

            }
        });
        year_statisticSales.addPropertyChangeListener((PropertyChangeEvent evt) -> {
            if ("year".equals(evt.getPropertyName())) {
                int month = month_statisticSales.getMonth();
                int year = year_statisticSales.getYear();
                pnl_productTypeStatistic.remove(pieChartPanel);
                polarAreaChart.clear();
                getPieChart();
//                pieChartPanel = new XChartPanel<>(getPieChart());
//                pnl_productTypeStatistic.add(pieChartPanel);
//                pieChartPanel.updateUI();
                chart.clear();
                getChart();

                renderInfo();

            }
        });

    }

    public void getChart() {

        double[] listTotal = bus.getTotalPerDay(month_statisticSales.getMonth() + 1, year_statisticSales.getYear());

        for (int i = 0; i < listTotal.length; i++) {
            chart.addData(new ModelChart("" + (i+1), new double[]{listTotal[i]}));
        }
        chart.start();

    }

    public void getPieChart() {
        
        polarAreaChart.setBackground(getBackground());
        
        polarAreaChart.addItem(new ModelPolarAreaChart(new Color(71, 118, 185), "Sách", bus.getQuantityProductType(1, month_statisticSales.getMonth() + 1, year_statisticSales.getYear())));
        polarAreaChart.addItem(new ModelPolarAreaChart(new Color(135, 206, 255), "Văn phòng phẩm", bus.getQuantityProductType(2, month_statisticSales.getMonth() + 1, year_statisticSales.getYear())));
        polarAreaChart.start();

    }

    public void renderInfo() {

        txt_orderQuantity.setText(bus.getTotalNumberOrder(month_statisticSales.getMonth() + 1, year_statisticSales.getYear()) + "");
        txt_returnOrderQuantity.setText(bus.getTotalNumberReturnOrder(month_statisticSales.getMonth() + 1, year_statisticSales.getYear()) + "");
        txt_purchaseOrderQuanitty.setText(bus.getTotalNumberPurchaseOrder(month_statisticSales.getMonth() + 1, year_statisticSales.getYear()) + "");
        txt_total.setText(FormatNumber.toVND(bus.getTotalInMonth(month_statisticSales.getMonth() + 1, year_statisticSales.getYear())));
        txt_target.setText(FormatNumber.toNumberWithCommas(bus.getTargetInMonth(month_statisticSales.getMonth() + 1, year_statisticSales.getYear())) + " %");
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
        pnl_topleft = new javax.swing.JPanel();
        pnl_control = new javax.swing.JPanel();
        filler26 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(30, 0), new java.awt.Dimension(10, 32767));
        pnl_filter = new javax.swing.JPanel();
        filler28 = new javax.swing.Box.Filler(new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 0), new java.awt.Dimension(10, 32767));
        month_statisticSales = new com.toedter.calendar.JMonthChooser();
        year_statisticSales = new com.toedter.calendar.JYearChooser();
        filler27 = new javax.swing.Box.Filler(new java.awt.Dimension(300, 0), new java.awt.Dimension(300, 0), new java.awt.Dimension(1000, 32767));
        pnl_infomaotionBody = new javax.swing.JPanel();
        pnl_orderQuantiy = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        lbl_orderQuantity = new javax.swing.JLabel();
        txt_orderQuantity = new javax.swing.JTextField();
        pnl_returnOrderQuantity = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        lbl_returnOrderQuanitty = new javax.swing.JLabel();
        txt_returnOrderQuantity = new javax.swing.JTextField();
        pnl_purchaseOrderQuantiy = new javax.swing.JPanel();
        jPanel3 = new javax.swing.JPanel();
        lbl_purchaseOrderQuantity = new javax.swing.JLabel();
        txt_purchaseOrderQuanitty = new javax.swing.JTextField();
        pnl_orderQuantiy3 = new javax.swing.JPanel();
        jPanel5 = new javax.swing.JPanel();
        lbl_orderQuantity3 = new javax.swing.JLabel();
        txt_total = new javax.swing.JTextField();
        pnl_orderQuantiy4 = new javax.swing.JPanel();
        jPanel4 = new javax.swing.JPanel();
        lbl_orderQuantity4 = new javax.swing.JLabel();
        txt_target = new javax.swing.JTextField();
        jPanel6 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        pnl_topright = new javax.swing.JPanel();
        pnl_productTypeStatistic = new javax.swing.JPanel();
        pnl_center = new javax.swing.JPanel();
        chart = new gui.customchart.Chart(true);

        setMinimumSize(new java.awt.Dimension(1366, 768));
        setLayout(new java.awt.BorderLayout());

        pnl_header.setMinimumSize(new java.awt.Dimension(500, 75));
        pnl_header.setPreferredSize(new java.awt.Dimension(500, 368));
        pnl_header.setLayout(new java.awt.BorderLayout());

        pnl_topleft.setLayout(new java.awt.BorderLayout());

        pnl_control.setBorder(javax.swing.BorderFactory.createTitledBorder("Lọc: "));
        pnl_control.setPreferredSize(new java.awt.Dimension(1366, 70));
        pnl_control.setLayout(new javax.swing.BoxLayout(pnl_control, javax.swing.BoxLayout.LINE_AXIS));
        pnl_control.add(filler26);

        pnl_filter.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 1, 5, 1));
        pnl_filter.setMaximumSize(new java.awt.Dimension(300, 2147483647));
        pnl_filter.setMinimumSize(new java.awt.Dimension(300, 27));
        pnl_filter.setPreferredSize(new java.awt.Dimension(300, 56));
        pnl_filter.setLayout(new javax.swing.BoxLayout(pnl_filter, javax.swing.BoxLayout.LINE_AXIS));
        pnl_filter.add(filler28);

        month_statisticSales.setMinimumSize(new java.awt.Dimension(120, 27));
        month_statisticSales.setPreferredSize(new java.awt.Dimension(150, 20));
        pnl_filter.add(month_statisticSales);

        year_statisticSales.setBorder(javax.swing.BorderFactory.createEmptyBorder(1, 10, 1, 1));
        year_statisticSales.setPreferredSize(new java.awt.Dimension(150, 20));
        pnl_filter.add(year_statisticSales);

        pnl_control.add(pnl_filter);
        pnl_control.add(filler27);

        pnl_topleft.add(pnl_control, java.awt.BorderLayout.NORTH);

        pnl_infomaotionBody.setBorder(javax.swing.BorderFactory.createTitledBorder("Thông tin chi tiết"));
        pnl_infomaotionBody.setLayout(new java.awt.GridLayout(2, 3));

        pnl_orderQuantiy.setBorder(javax.swing.BorderFactory.createEmptyBorder(30, 10, 30, 10));
        pnl_orderQuantiy.setLayout(new javax.swing.BoxLayout(pnl_orderQuantiy, javax.swing.BoxLayout.Y_AXIS));

        jPanel1.setPreferredSize(new java.awt.Dimension(100, 20));
        jPanel1.setLayout(new java.awt.BorderLayout());

        lbl_orderQuantity.setFont(lbl_orderQuantity.getFont().deriveFont(lbl_orderQuantity.getFont().getStyle() | java.awt.Font.BOLD, 14));
        lbl_orderQuantity.setText("Tổng số hoá đơn: ");
        lbl_orderQuantity.setMaximumSize(new java.awt.Dimension(165, 20));
        lbl_orderQuantity.setMinimumSize(new java.awt.Dimension(165, 20));
        lbl_orderQuantity.setPreferredSize(new java.awt.Dimension(165, 50));
        jPanel1.add(lbl_orderQuantity, java.awt.BorderLayout.CENTER);

        pnl_orderQuantiy.add(jPanel1);

        txt_orderQuantity.setEditable(false);
        txt_orderQuantity.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 2, 0, new java.awt.Color(0, 0, 0)));
        txt_orderQuantity.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_orderQuantity.setPreferredSize(new java.awt.Dimension(50, 30));
        pnl_orderQuantiy.add(txt_orderQuantity);

        pnl_infomaotionBody.add(pnl_orderQuantiy);

        pnl_returnOrderQuantity.setBorder(javax.swing.BorderFactory.createEmptyBorder(30, 10, 30, 10));
        pnl_returnOrderQuantity.setLayout(new javax.swing.BoxLayout(pnl_returnOrderQuantity, javax.swing.BoxLayout.Y_AXIS));

        jPanel2.setPreferredSize(new java.awt.Dimension(100, 20));
        jPanel2.setLayout(new java.awt.BorderLayout());

        lbl_returnOrderQuanitty.setFont(lbl_returnOrderQuanitty.getFont().deriveFont(lbl_returnOrderQuanitty.getFont().getStyle() | java.awt.Font.BOLD, 14));
        lbl_returnOrderQuanitty.setText("Tổng hoá đơn trả:");
        lbl_returnOrderQuanitty.setPreferredSize(new java.awt.Dimension(130, 20));
        jPanel2.add(lbl_returnOrderQuanitty, java.awt.BorderLayout.CENTER);

        pnl_returnOrderQuantity.add(jPanel2);

        txt_returnOrderQuantity.setEditable(false);
        txt_returnOrderQuantity.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 2, 0, new java.awt.Color(0, 0, 0)));
        txt_returnOrderQuantity.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_returnOrderQuantity.setPreferredSize(new java.awt.Dimension(50, 30));
        pnl_returnOrderQuantity.add(txt_returnOrderQuantity);

        pnl_infomaotionBody.add(pnl_returnOrderQuantity);

        pnl_purchaseOrderQuantiy.setBorder(javax.swing.BorderFactory.createEmptyBorder(30, 10, 30, 10));
        pnl_purchaseOrderQuantiy.setLayout(new javax.swing.BoxLayout(pnl_purchaseOrderQuantiy, javax.swing.BoxLayout.Y_AXIS));

        jPanel3.setPreferredSize(new java.awt.Dimension(100, 20));
        jPanel3.setLayout(new java.awt.BorderLayout());

        lbl_purchaseOrderQuantity.setFont(lbl_purchaseOrderQuantity.getFont().deriveFont(lbl_purchaseOrderQuantity.getFont().getStyle() | java.awt.Font.BOLD, 14));
        lbl_purchaseOrderQuantity.setText("Tổng số đơn nhập: ");
        lbl_purchaseOrderQuantity.setMaximumSize(new java.awt.Dimension(130, 17));
        lbl_purchaseOrderQuantity.setMinimumSize(new java.awt.Dimension(130, 17));
        lbl_purchaseOrderQuantity.setPreferredSize(new java.awt.Dimension(130, 20));
        jPanel3.add(lbl_purchaseOrderQuantity, java.awt.BorderLayout.CENTER);

        pnl_purchaseOrderQuantiy.add(jPanel3);

        txt_purchaseOrderQuanitty.setEditable(false);
        txt_purchaseOrderQuanitty.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 2, 0, new java.awt.Color(0, 0, 0)));
        txt_purchaseOrderQuanitty.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_purchaseOrderQuanitty.setPreferredSize(new java.awt.Dimension(50, 30));
        pnl_purchaseOrderQuantiy.add(txt_purchaseOrderQuanitty);

        pnl_infomaotionBody.add(pnl_purchaseOrderQuantiy);

        pnl_orderQuantiy3.setBorder(javax.swing.BorderFactory.createEmptyBorder(30, 10, 30, 10));
        pnl_orderQuantiy3.setMinimumSize(new java.awt.Dimension(380, 20));
        pnl_orderQuantiy3.setPreferredSize(new java.awt.Dimension(380, 20));
        pnl_orderQuantiy3.setLayout(new javax.swing.BoxLayout(pnl_orderQuantiy3, javax.swing.BoxLayout.Y_AXIS));

        jPanel5.setLayout(new java.awt.BorderLayout());

        lbl_orderQuantity3.setFont(lbl_orderQuantity3.getFont().deriveFont(lbl_orderQuantity3.getFont().getStyle() | java.awt.Font.BOLD, 14));
        lbl_orderQuantity3.setText("Tổng doanh thu:");
        lbl_orderQuantity3.setPreferredSize(new java.awt.Dimension(130, 20));
        jPanel5.add(lbl_orderQuantity3, java.awt.BorderLayout.CENTER);

        pnl_orderQuantiy3.add(jPanel5);

        txt_total.setEditable(false);
        txt_total.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 2, 0, new java.awt.Color(0, 0, 0)));
        txt_total.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_total.setPreferredSize(new java.awt.Dimension(50, 30));
        pnl_orderQuantiy3.add(txt_total);

        pnl_infomaotionBody.add(pnl_orderQuantiy3);

        pnl_orderQuantiy4.setBorder(javax.swing.BorderFactory.createEmptyBorder(30, 10, 30, 10));
        pnl_orderQuantiy4.setLayout(new javax.swing.BoxLayout(pnl_orderQuantiy4, javax.swing.BoxLayout.Y_AXIS));

        jPanel4.setLayout(new java.awt.BorderLayout());

        lbl_orderQuantity4.setFont(lbl_orderQuantity4.getFont().deriveFont(lbl_orderQuantity4.getFont().getStyle() | java.awt.Font.BOLD, 14));
        lbl_orderQuantity4.setText("Chỉ tiêu:");
        lbl_orderQuantity4.setPreferredSize(new java.awt.Dimension(130, 20));
        jPanel4.add(lbl_orderQuantity4, java.awt.BorderLayout.CENTER);

        pnl_orderQuantiy4.add(jPanel4);

        txt_target.setEditable(false);
        txt_target.setBorder(javax.swing.BorderFactory.createMatteBorder(0, 0, 2, 0, new java.awt.Color(0, 0, 0)));
        txt_target.setMinimumSize(new java.awt.Dimension(50, 20));
        txt_target.setPreferredSize(new java.awt.Dimension(50, 30));
        pnl_orderQuantiy4.add(txt_target);

        pnl_infomaotionBody.add(pnl_orderQuantiy4);

        jPanel6.setLayout(new java.awt.BorderLayout());

        jLabel1.setFont(new java.awt.Font("Helvetica Neue", 0, 14)); // NOI18N
        jLabel1.setText("(Chỉ tiêu tháng: 50.000.000 VNĐ)");
        jLabel1.setBorder(javax.swing.BorderFactory.createEmptyBorder(80, 10, 50, 1));
        jPanel6.add(jLabel1, java.awt.BorderLayout.CENTER);

        pnl_infomaotionBody.add(jPanel6);

        pnl_topleft.add(pnl_infomaotionBody, java.awt.BorderLayout.CENTER);

        pnl_header.add(pnl_topleft, java.awt.BorderLayout.CENTER);

        pnl_topright.setPreferredSize(new java.awt.Dimension(450, 100));
        pnl_topright.setLayout(new java.awt.BorderLayout());

        pnl_productTypeStatistic.setBorder(javax.swing.BorderFactory.createTitledBorder("Biểu đồ tỷ lệ sản phẩm "));
        pnl_productTypeStatistic.setPreferredSize(new java.awt.Dimension(450, 450));
        pnl_productTypeStatistic.setLayout(new javax.swing.BoxLayout(pnl_productTypeStatistic, javax.swing.BoxLayout.Y_AXIS));
        pnl_topright.add(pnl_productTypeStatistic, java.awt.BorderLayout.EAST);
        pnl_productTypeStatistic.add(polarAreaChart);

        pnl_header.add(pnl_topright, java.awt.BorderLayout.EAST);

        add(pnl_header, java.awt.BorderLayout.NORTH);

        pnl_center.setBorder(javax.swing.BorderFactory.createTitledBorder("Thống kê doanh thu theo tháng"));
        pnl_center.setPreferredSize(new java.awt.Dimension(661, 400));
        pnl_center.setLayout(new java.awt.BorderLayout());
        pnl_center.add(chart, java.awt.BorderLayout.CENTER);

        add(pnl_center, java.awt.BorderLayout.CENTER);
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private gui.customchart.Chart chart;
    private javax.swing.Box.Filler filler26;
    private javax.swing.Box.Filler filler27;
    private javax.swing.Box.Filler filler28;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JLabel lbl_orderQuantity;
    private javax.swing.JLabel lbl_orderQuantity3;
    private javax.swing.JLabel lbl_orderQuantity4;
    private javax.swing.JLabel lbl_purchaseOrderQuantity;
    private javax.swing.JLabel lbl_returnOrderQuanitty;
    private com.toedter.calendar.JMonthChooser month_statisticSales;
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
    private javax.swing.JPanel pnl_topleft;
    private javax.swing.JPanel pnl_topright;
    private javax.swing.JTextField txt_orderQuantity;
    private javax.swing.JTextField txt_purchaseOrderQuanitty;
    private javax.swing.JTextField txt_returnOrderQuantity;
    private javax.swing.JTextField txt_target;
    private javax.swing.JTextField txt_total;
    private com.toedter.calendar.JYearChooser year_statisticSales;
    // End of variables declaration//GEN-END:variables
}
