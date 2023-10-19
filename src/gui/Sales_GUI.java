/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package gui;
import com.formdev.flatlaf.FlatClientProperties;

/**
 *
 * @author thanhcanhit
 */
public class Sales_GUI extends javax.swing.JPanel {
    /**
     * Creates new form Sales_GUI
     */
    public Sales_GUI() {
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

        splitPane_main = new javax.swing.JSplitPane();
        pnl_left = new javax.swing.JPanel();
        pnl_header = new javax.swing.JPanel();
        txt_search = new javax.swing.JTextField();
        btn_search = new javax.swing.JButton();
        pnl_cart = new javax.swing.JPanel();
        scr_cart = new javax.swing.JScrollPane();
        tbl_cart = new javax.swing.JTable();
        pnl_cartFooter = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        pnl_right = new javax.swing.JPanel();
        pnl_info = new javax.swing.JPanel();
        pnl_orderInfo = new javax.swing.JPanel();
        pnl_orderId = new javax.swing.JPanel();
        lbl_orderId = new javax.swing.JLabel();
        txt_orderId = new javax.swing.JTextField();
        pnl_orderDate = new javax.swing.JPanel();
        lbl_orderDate = new javax.swing.JLabel();
        txt_orderDate = new javax.swing.JTextField();
        pnl_discount = new javax.swing.JPanel();
        lbl_orderDiscount = new javax.swing.JLabel();
        txt_orderDiscount = new javax.swing.JTextField();
        pnl_orderPay = new javax.swing.JPanel();
        lbl_orderPay = new javax.swing.JLabel();
        txt_orderPay = new javax.swing.JTextField();
        pnl_orderPaymentMethod = new javax.swing.JPanel();
        lbl_orderPaymentMethod = new javax.swing.JLabel();
        cmb_orderPaymentMethod = new javax.swing.JComboBox<>();
        pnl_orderCustomerGive = new javax.swing.JPanel();
        lbl_orderCustomerGive = new javax.swing.JLabel();
        txt_orderCustomerGive = new javax.swing.JTextField();
        pnl_orderCustomerGiveOptions = new javax.swing.JPanel();
        btn_option1 = new javax.swing.JButton();
        btn_option2 = new javax.swing.JButton();
        btn_option3 = new javax.swing.JButton();
        pnl_orderCustomerReturn = new javax.swing.JPanel();
        lbl_orderCustomerReturn = new javax.swing.JLabel();
        txt_orderCustomerReturn = new javax.swing.JTextField();
        pnl_customerInfo = new javax.swing.JPanel();
        pnl_customerDefault = new javax.swing.JPanel();
        chk_defaultCustomer = new javax.swing.JCheckBox();
        pnl_customerPhone = new javax.swing.JPanel();
        lbl_customerPhone = new javax.swing.JLabel();
        txt_customerPhone = new javax.swing.JTextField();
        pnl_customerName = new javax.swing.JPanel();
        lbl_customerName = new javax.swing.JLabel();
        txt_customerName = new javax.swing.JTextField();
        pnl_customerRank = new javax.swing.JPanel();
        lbl_customerRank = new javax.swing.JLabel();
        txt_customerRank = new javax.swing.JTextField();
        pnl_control = new javax.swing.JPanel();
        pnl_btnGroup = new javax.swing.JPanel();
        btn_save = new javax.swing.JButton();
        btn_viewSaves = new javax.swing.JButton();
        btn_cancle = new javax.swing.JButton();
        btn_promotion = new javax.swing.JButton();
        pnl_btnMain = new javax.swing.JPanel();
        btn_submit = new javax.swing.JButton();

        setLayout(new java.awt.GridLayout(1, 0));

        splitPane_main.setMinimumSize(new java.awt.Dimension(1305, 768));

        pnl_left.setMinimumSize(new java.awt.Dimension(700, 59));
        pnl_left.setPreferredSize(new java.awt.Dimension(900, 768));
        pnl_left.setLayout(new java.awt.BorderLayout());

        pnl_header.setPreferredSize(new java.awt.Dimension(1366, 50));
        pnl_header.setLayout(new javax.swing.BoxLayout(pnl_header, javax.swing.BoxLayout.LINE_AXIS));

        txt_search.putClientProperty(FlatClientProperties.PLACEHOLDER_TEXT, "Mã sản phẩm");
        pnl_header.add(txt_search);

        btn_search.setText("Thêm");
        btn_search.setMaximumSize(new java.awt.Dimension(100, 50));
        btn_search.setMinimumSize(new java.awt.Dimension(100, 50));
        btn_search.setPreferredSize(new java.awt.Dimension(100, 50));
        btn_search.putClientProperty(FlatClientProperties.STYLE,""
            + "background:$Menu.background;"
            + "foreground:$Menu.foreground;");
        pnl_header.add(btn_search);

        pnl_left.add(pnl_header, java.awt.BorderLayout.NORTH);

        pnl_cart.setLayout(new java.awt.BorderLayout());

        tbl_cart.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {"SP0001", "Thiên tài bên trái, kẻ điên bên phải", "1", "100000", "100000"},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Mã sản phẩm", "Tên sản phẩm", "Số lượng", "Đơn giá", "Thành tiền"
            }
        ));
        scr_cart.setViewportView(tbl_cart);

        pnl_cart.add(scr_cart, java.awt.BorderLayout.CENTER);

        pnl_cartFooter.setPreferredSize(new java.awt.Dimension(800, 60));
        pnl_cartFooter.setLayout(new java.awt.BorderLayout());

        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.TRAILING);
        jLabel1.setText("Tổng tiền");
        jLabel1.setToolTipText("");
        jLabel1.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        pnl_cartFooter.add(jLabel1, java.awt.BorderLayout.CENTER);

        pnl_cart.add(pnl_cartFooter, java.awt.BorderLayout.PAGE_END);

        pnl_left.add(pnl_cart, java.awt.BorderLayout.CENTER);

        splitPane_main.setLeftComponent(pnl_left);

        pnl_right.setPreferredSize(new java.awt.Dimension(400, 768));
        pnl_right.setLayout(new java.awt.BorderLayout());

        pnl_info.setLayout(new javax.swing.BoxLayout(pnl_info, javax.swing.BoxLayout.Y_AXIS));

        pnl_orderInfo.setBorder(javax.swing.BorderFactory.createCompoundBorder(javax.swing.BorderFactory.createTitledBorder("Thông tin hóa đơn"), javax.swing.BorderFactory.createEmptyBorder(5, 5, 5, 5)));
        pnl_orderInfo.setPreferredSize(new java.awt.Dimension(500, 400));
        pnl_orderInfo.setLayout(new javax.swing.BoxLayout(pnl_orderInfo, javax.swing.BoxLayout.Y_AXIS));

        pnl_orderId.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_orderId.setLayout(new javax.swing.BoxLayout(pnl_orderId, javax.swing.BoxLayout.LINE_AXIS));

        lbl_orderId.setText("Mã hóa đơn");
        lbl_orderId.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_orderId.add(lbl_orderId);

        txt_orderId.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_orderId.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_orderIdActionPerformed(evt);
            }
        });
        pnl_orderId.add(txt_orderId);

        pnl_orderInfo.add(pnl_orderId);

        pnl_orderDate.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 0, 0, 0));
        pnl_orderDate.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_orderDate.setLayout(new javax.swing.BoxLayout(pnl_orderDate, javax.swing.BoxLayout.LINE_AXIS));

        lbl_orderDate.setText("Ngày tạo");
        lbl_orderDate.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_orderDate.add(lbl_orderDate);

        txt_orderDate.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_orderDate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_orderDateActionPerformed(evt);
            }
        });
        pnl_orderDate.add(txt_orderDate);

        pnl_orderInfo.add(pnl_orderDate);

        pnl_discount.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 0, 0, 0));
        pnl_discount.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_discount.setLayout(new javax.swing.BoxLayout(pnl_discount, javax.swing.BoxLayout.LINE_AXIS));

        lbl_orderDiscount.setText("Chiết khấu");
        lbl_orderDiscount.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_discount.add(lbl_orderDiscount);

        txt_orderDiscount.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_orderDiscount.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_orderDiscountActionPerformed(evt);
            }
        });
        pnl_discount.add(txt_orderDiscount);

        pnl_orderInfo.add(pnl_discount);

        pnl_orderPay.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 0, 0, 0));
        pnl_orderPay.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_orderPay.setLayout(new javax.swing.BoxLayout(pnl_orderPay, javax.swing.BoxLayout.LINE_AXIS));

        lbl_orderPay.setText("Khách phải trả");
        lbl_orderPay.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_orderPay.add(lbl_orderPay);

        txt_orderPay.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_orderPay.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_orderPayActionPerformed(evt);
            }
        });
        pnl_orderPay.add(txt_orderPay);

        pnl_orderInfo.add(pnl_orderPay);

        pnl_orderPaymentMethod.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 0, 0, 0));
        pnl_orderPaymentMethod.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_orderPaymentMethod.setLayout(new javax.swing.BoxLayout(pnl_orderPaymentMethod, javax.swing.BoxLayout.LINE_AXIS));

        lbl_orderPaymentMethod.setText("Phương thức");
        lbl_orderPaymentMethod.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_orderPaymentMethod.add(lbl_orderPaymentMethod);

        cmb_orderPaymentMethod.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Tiền mặt", "ATM" }));
        pnl_orderPaymentMethod.add(cmb_orderPaymentMethod);

        pnl_orderInfo.add(pnl_orderPaymentMethod);

        pnl_orderCustomerGive.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 0, 0, 0));
        pnl_orderCustomerGive.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_orderCustomerGive.setLayout(new javax.swing.BoxLayout(pnl_orderCustomerGive, javax.swing.BoxLayout.LINE_AXIS));

        lbl_orderCustomerGive.setText("Tiền khách đưa");
        lbl_orderCustomerGive.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_orderCustomerGive.add(lbl_orderCustomerGive);

        txt_orderCustomerGive.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_orderCustomerGive.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_orderCustomerGiveActionPerformed(evt);
            }
        });
        pnl_orderCustomerGive.add(txt_orderCustomerGive);

        pnl_orderInfo.add(pnl_orderCustomerGive);

        pnl_orderCustomerGiveOptions.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 5, 5, 5));
        pnl_orderCustomerGiveOptions.setPreferredSize(new java.awt.Dimension(561, 60));
        pnl_orderCustomerGiveOptions.setLayout(new java.awt.GridLayout(1, 3, 5, 0));

        btn_option1.setText("Gợi ý 1");
        pnl_orderCustomerGiveOptions.add(btn_option1);

        btn_option2.setText("Gợi ý 2");
        pnl_orderCustomerGiveOptions.add(btn_option2);

        btn_option3.setText("Gợi ý 3");
        pnl_orderCustomerGiveOptions.add(btn_option3);

        pnl_orderInfo.add(pnl_orderCustomerGiveOptions);

        pnl_orderCustomerReturn.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_orderCustomerReturn.setLayout(new javax.swing.BoxLayout(pnl_orderCustomerReturn, javax.swing.BoxLayout.LINE_AXIS));

        lbl_orderCustomerReturn.setText("Tiền thừa");
        lbl_orderCustomerReturn.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_orderCustomerReturn.add(lbl_orderCustomerReturn);

        txt_orderCustomerReturn.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_orderCustomerReturn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_orderCustomerReturnActionPerformed(evt);
            }
        });
        pnl_orderCustomerReturn.add(txt_orderCustomerReturn);

        pnl_orderInfo.add(pnl_orderCustomerReturn);

        pnl_info.add(pnl_orderInfo);

        pnl_customerInfo.setBorder(javax.swing.BorderFactory.createCompoundBorder(javax.swing.BorderFactory.createTitledBorder("Thông tin khách hàng"), javax.swing.BorderFactory.createEmptyBorder(5, 5, 5, 5)));
        pnl_customerInfo.setPreferredSize(new java.awt.Dimension(500, 150));
        pnl_customerInfo.setLayout(new javax.swing.BoxLayout(pnl_customerInfo, javax.swing.BoxLayout.Y_AXIS));

        pnl_customerDefault.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_customerDefault.setLayout(new java.awt.BorderLayout());

        chk_defaultCustomer.setText("Khách hàng mặc định");
        pnl_customerDefault.add(chk_defaultCustomer, java.awt.BorderLayout.CENTER);

        pnl_customerInfo.add(pnl_customerDefault);

        pnl_customerPhone.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_customerPhone.setLayout(new javax.swing.BoxLayout(pnl_customerPhone, javax.swing.BoxLayout.LINE_AXIS));

        lbl_customerPhone.setText("Số điện thoại");
        lbl_customerPhone.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_customerPhone.add(lbl_customerPhone);

        txt_customerPhone.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_customerPhone.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_customerPhoneActionPerformed(evt);
            }
        });
        pnl_customerPhone.add(txt_customerPhone);

        pnl_customerInfo.add(pnl_customerPhone);

        pnl_customerName.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 0, 0, 0));
        pnl_customerName.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_customerName.setLayout(new javax.swing.BoxLayout(pnl_customerName, javax.swing.BoxLayout.LINE_AXIS));

        lbl_customerName.setText("Họ và tên");
        lbl_customerName.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_customerName.add(lbl_customerName);

        txt_customerName.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_customerName.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_customerNameActionPerformed(evt);
            }
        });
        pnl_customerName.add(txt_customerName);

        pnl_customerInfo.add(pnl_customerName);

        pnl_customerRank.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 0, 0, 0));
        pnl_customerRank.setPreferredSize(new java.awt.Dimension(561, 40));
        pnl_customerRank.setLayout(new javax.swing.BoxLayout(pnl_customerRank, javax.swing.BoxLayout.LINE_AXIS));

        lbl_customerRank.setText("Hạng thành viên");
        lbl_customerRank.setPreferredSize(new java.awt.Dimension(130, 40));
        pnl_customerRank.add(lbl_customerRank);

        txt_customerRank.setPreferredSize(new java.awt.Dimension(64, 40));
        txt_customerRank.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_customerRankActionPerformed(evt);
            }
        });
        pnl_customerRank.add(txt_customerRank);

        pnl_customerInfo.add(pnl_customerRank);

        pnl_info.add(pnl_customerInfo);

        pnl_right.add(pnl_info, java.awt.BorderLayout.CENTER);

        pnl_control.setLayout(new javax.swing.BoxLayout(pnl_control, javax.swing.BoxLayout.PAGE_AXIS));

        pnl_btnGroup.setBorder(javax.swing.BorderFactory.createEmptyBorder(5, 5, 5, 5));
        pnl_btnGroup.setPreferredSize(new java.awt.Dimension(281, 100));
        pnl_btnGroup.setLayout(new java.awt.GridLayout(2, 2, 5, 5));

        btn_save.setText("LƯU TẠM");
        pnl_btnGroup.add(btn_save);

        btn_viewSaves.setText("XỨ LÍ ĐƠN LƯU TẠM");
        pnl_btnGroup.add(btn_viewSaves);

        btn_cancle.setText("HỦY");
        pnl_btnGroup.add(btn_cancle);

        btn_promotion.setText("KHUYẾN MÃI");
        pnl_btnGroup.add(btn_promotion);

        pnl_control.add(pnl_btnGroup);

        pnl_btnMain.setBorder(javax.swing.BorderFactory.createEmptyBorder(0, 5, 5, 5));
        pnl_btnMain.setPreferredSize(new java.awt.Dimension(561, 60));
        pnl_btnMain.setLayout(new java.awt.BorderLayout());

        btn_submit.setFont(btn_submit.getFont().deriveFont((float)18));
        btn_submit.setText("THANH TOÁN");
        pnl_btnMain.add(btn_submit, java.awt.BorderLayout.CENTER);
        btn_submit.putClientProperty(FlatClientProperties.STYLE,""
            + "background:$Menu.background;"
            + "foreground:$Menu.foreground;");

        pnl_control.add(pnl_btnMain);

        pnl_right.add(pnl_control, java.awt.BorderLayout.SOUTH);

        splitPane_main.setRightComponent(pnl_right);

        add(splitPane_main);
    }// </editor-fold>//GEN-END:initComponents

    private void txt_customerPhoneActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_customerPhoneActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_customerPhoneActionPerformed

    private void txt_customerNameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_customerNameActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_customerNameActionPerformed

    private void txt_customerRankActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_customerRankActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_customerRankActionPerformed

    private void txt_orderIdActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_orderIdActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_orderIdActionPerformed

    private void txt_orderDateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_orderDateActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_orderDateActionPerformed

    private void txt_orderDiscountActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_orderDiscountActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_orderDiscountActionPerformed

    private void txt_orderPayActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_orderPayActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_orderPayActionPerformed

    private void txt_orderCustomerGiveActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_orderCustomerGiveActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_orderCustomerGiveActionPerformed

    private void txt_orderCustomerReturnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_orderCustomerReturnActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txt_orderCustomerReturnActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btn_cancle;
    private javax.swing.JButton btn_option1;
    private javax.swing.JButton btn_option2;
    private javax.swing.JButton btn_option3;
    private javax.swing.JButton btn_promotion;
    private javax.swing.JButton btn_save;
    private javax.swing.JButton btn_search;
    private javax.swing.JButton btn_submit;
    private javax.swing.JButton btn_viewSaves;
    private javax.swing.JCheckBox chk_defaultCustomer;
    private javax.swing.JComboBox<String> cmb_orderPaymentMethod;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel lbl_customerName;
    private javax.swing.JLabel lbl_customerPhone;
    private javax.swing.JLabel lbl_customerRank;
    private javax.swing.JLabel lbl_orderCustomerGive;
    private javax.swing.JLabel lbl_orderCustomerReturn;
    private javax.swing.JLabel lbl_orderDate;
    private javax.swing.JLabel lbl_orderDiscount;
    private javax.swing.JLabel lbl_orderId;
    private javax.swing.JLabel lbl_orderPay;
    private javax.swing.JLabel lbl_orderPaymentMethod;
    private javax.swing.JPanel pnl_btnGroup;
    private javax.swing.JPanel pnl_btnMain;
    private javax.swing.JPanel pnl_cart;
    private javax.swing.JPanel pnl_cartFooter;
    private javax.swing.JPanel pnl_control;
    private javax.swing.JPanel pnl_customerDefault;
    private javax.swing.JPanel pnl_customerInfo;
    private javax.swing.JPanel pnl_customerName;
    private javax.swing.JPanel pnl_customerPhone;
    private javax.swing.JPanel pnl_customerRank;
    private javax.swing.JPanel pnl_discount;
    private javax.swing.JPanel pnl_header;
    private javax.swing.JPanel pnl_info;
    private javax.swing.JPanel pnl_left;
    private javax.swing.JPanel pnl_orderCustomerGive;
    private javax.swing.JPanel pnl_orderCustomerGiveOptions;
    private javax.swing.JPanel pnl_orderCustomerReturn;
    private javax.swing.JPanel pnl_orderDate;
    private javax.swing.JPanel pnl_orderId;
    private javax.swing.JPanel pnl_orderInfo;
    private javax.swing.JPanel pnl_orderPay;
    private javax.swing.JPanel pnl_orderPaymentMethod;
    private javax.swing.JPanel pnl_right;
    private javax.swing.JScrollPane scr_cart;
    private javax.swing.JSplitPane splitPane_main;
    private javax.swing.JTable tbl_cart;
    private javax.swing.JTextField txt_customerName;
    private javax.swing.JTextField txt_customerPhone;
    private javax.swing.JTextField txt_customerRank;
    private javax.swing.JTextField txt_orderCustomerGive;
    private javax.swing.JTextField txt_orderCustomerReturn;
    private javax.swing.JTextField txt_orderDate;
    private javax.swing.JTextField txt_orderDiscount;
    private javax.swing.JTextField txt_orderId;
    private javax.swing.JTextField txt_orderPay;
    private javax.swing.JTextField txt_search;
    // End of variables declaration//GEN-END:variables
}
