-- Tạo database ở đường dẫn sql mặc định
USE master
GO
-- Xóa cái trước đó nếu mà đã có
if exists (select * from sysdatabases where name='OmegaBook')
		drop database OmegaBook
GO

-- Tìm vị trí lưu trữ của máy tính
DECLARE @device_directory nvarchar(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

-- Tạo database
EXECUTE (N'CREATE DATABASE OmegaBook
  ON PRIMARY (NAME = N''OmegaBook'', FILENAME = N''' + @device_directory + N'OmegaBook.mdf'')
  LOG ON (NAME = N''OmegaBook_log'',  FILENAME = N''' + @device_directory + N'OmegaBook.ldf'')')

GO

USE [OmegaBook]
GO
CREATE TABLE Account (
  employeeID varchar(255) NOT NULL, 
  password   nvarchar(255) NOT NULL, 
  PRIMARY KEY (employeeID));
CREATE TABLE AcountingVoucher (
  acountingVoucherID varchar(255) NOT NULL, 
  createdDate        datetime NOT NULL, 
  endedDate          datetime NOT NULL, 
  cashCountSheetID   varchar(255) NOT NULL, 
  PRIMARY KEY (acountingVoucherID));
CREATE TABLE Brand (
  brandID varchar(255) NOT NULL, 
  name    nvarchar(255) NOT NULL, 
  country nvarchar(255) NOT NULL, 
  PRIMARY KEY (brandID));
CREATE TABLE CashCount (
  cashCountSheetID varchar(255) NOT NULL, 
  value            float(10) NOT NULL, 
  quantity         int NOT NULL, 
  PRIMARY KEY (cashCountSheetID, 
  value));
CREATE TABLE CashCountSheet (
  cashCountSheetID varchar(255) NOT NULL, 
  endedDate        datetime NOT NULL, 
  startedDate      datetime NOT NULL, 
  PRIMARY KEY (cashCountSheetID));
CREATE TABLE CashCountSheetDetail (
  auditorIndex     bit NOT NULL, 
  cashCountSheetID varchar(255) NOT NULL, 
  employeeID       varchar(255) NOT NULL, 
  PRIMARY KEY (auditorIndex, 
  cashCountSheetID));
CREATE TABLE Customer (
  customerID  varchar(255) NOT NULL, 
  name        nvarchar(255) NOT NULL, 
  dateOfBirth date NOT NULL, 
  gender      bit NOT NULL, 
  phoneNumber varchar(255) NOT NULL, 
  score       int NOT NULL, 
  address     nvarchar(255) NOT NULL, 
  PRIMARY KEY (customerID));
CREATE TABLE Employee (
  employeeID            varchar(255) NOT NULL, 
  name                  nvarchar(255) NOT NULL, 
  role                  nvarchar(255) NOT NULL, 
  status                bit NOT NULL, 
  dateOfBirth           date NOT NULL, 
  gender                bit NOT NULL, 
  phoneNumber           varchar(255) NOT NULL, 
  citizenIdentification varchar(255) NOT NULL, 
  address               nvarchar(255) NOT NULL, 
  storeID               varchar(255) NOT NULL, 
  PRIMARY KEY (employeeID));
CREATE TABLE [Order] (
  orderID            varchar(255) NOT NULL, 
  employeeID         varchar(255) NOT NULL, 
  customerID         varchar(255) NOT NULL, 
  status             int NOT NULL, 
  orderAt            datetime NOT NULL, 
  payment            bit NOT NULL, 
  totalDue           float(10) NOT NULL, 
  subTotal           float(10) NOT NULL, 
  promotionID        varchar(255) NULL, 
  acountingVoucherID varchar(255) NULL, 
  PRIMARY KEY (orderID));
CREATE TABLE OrderDetail (
  orderID   varchar(255) NOT NULL, 
  productID varchar(255) NOT NULL, 
  quantity  int NOT NULL, 
  price     float(10) NOT NULL, 
  lineTotal float(10) NOT NULL, 
  PRIMARY KEY (orderID, 
  productID));
CREATE TABLE Product (
  productID      varchar(255) NOT NULL, 
  productType    int NOT NULL, 
  bookType       int NULL, 
  bookCategory   int NULL, 
  stationeryType int NULL, 
  name           nvarchar(255) NOT NULL, 
  author         nvarchar(255) NULL, 
  price          float(10) NOT NULL, 
  costPrice      float(10) NOT NULL, 
  img            varbinary(max) NULL, 
  publishYear    int NULL, 
  publisher      nvarchar(255) NULL, 
  pageQuantity   int NULL, 
  isHardCover    bit NULL, 
  description    nvarchar(255) NULL, 
  language       nvarchar(255) NULL, 
  translater     nvarchar(255) NULL, 
  weight         float(10) NULL, 
  color          nvarchar(255) NULL, 
  material       nvarchar(255) NULL, 
  origin         nvarchar(255) NULL, 
  brandID        varchar(255) NULL, 
  VAT            float(10) NULL, 
  inventory      int NULL, 
  PRIMARY KEY (productID));
CREATE TABLE Promotion (
  promotionID varchar(255) NOT NULL, 
  type        int NOT NULL, 
  discount    float(10) NOT NULL, 
  startedDate date NOT NULL, 
  endedDate   date NOT NULL, 
  PRIMARY KEY (promotionID));
CREATE TABLE PurchaseOrder (
  purchaseOrderID varchar(255) NOT NULL, 
  orderDate       date NOT NULL, 
  receiveDate     date NULL, 
  status          int NOT NULL, 
  note            nvarchar(500) NOT NULL, 
  supplierID      varchar(255) NOT NULL, 
  employeeID      varchar(255) NOT NULL, 
  PRIMARY KEY (purchaseOrderID));
CREATE TABLE PurchaseOrderDetail (
  purchaseOrderID varchar(255) NOT NULL, 
  productID       varchar(255) NOT NULL, 
  quantity        int NOT NULL, 
  costPrice       float(10) NOT NULL, 
  PRIMARY KEY (purchaseOrderID, 
  productID));
CREATE TABLE ReturnOrder (
  returnOrderID varchar(255) NOT NULL, 
  orderID       varchar(255) NOT NULL, 
  type          int NULL, 
  status        int NOT NULL, 
  orderDate     date NULL, 
  employeeID    varchar(255) NOT NULL, 
  PRIMARY KEY (returnOrderID));
CREATE TABLE ReturnOrderDetail (
  productID     varchar(255) NOT NULL, 
  returnOrderID varchar(255) NOT NULL, 
  quantity      int NULL, 
  PRIMARY KEY (productID, 
  returnOrderID));
CREATE TABLE Shift (
  shiftID    varchar(255) NOT NULL, 
  employeeID varchar(255) NOT NULL, 
  startedAt  datetime NOT NULL, 
  endedAt    datetime NOT NULL, 
  PRIMARY KEY (shiftID));
CREATE TABLE Store (
  storeID varchar(255) NOT NULL, 
  name    nvarchar(255) NULL, 
  address nvarchar(255) NOT NULL, 
  PRIMARY KEY (storeID));
CREATE TABLE Supplier (
  supplierID varchar(255) NOT NULL, 
  name       nvarchar(255) NOT NULL, 
  address    nvarchar(255) NOT NULL, 
  PRIMARY KEY (supplierID));
ALTER TABLE [Order] ADD CONSTRAINT FKOrder887851 FOREIGN KEY (acountingVoucherID) REFERENCES AcountingVoucher (acountingVoucherID);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder872885 FOREIGN KEY (customerID) REFERENCES Customer (customerID);
ALTER TABLE ReturnOrder ADD CONSTRAINT FKReturnOrde954910 FOREIGN KEY (employeeID) REFERENCES Employee (employeeID);
ALTER TABLE PurchaseOrder ADD CONSTRAINT FKPurchaseOr474795 FOREIGN KEY (employeeID) REFERENCES Employee (employeeID);
ALTER TABLE ReturnOrderDetail ADD CONSTRAINT FKReturnOrde76079 FOREIGN KEY (returnOrderID) REFERENCES ReturnOrder (returnOrderID);
ALTER TABLE ReturnOrderDetail ADD CONSTRAINT FKReturnOrde815592 FOREIGN KEY (productID) REFERENCES Product (productID);
ALTER TABLE Product ADD CONSTRAINT FKProduct81625 FOREIGN KEY (brandID) REFERENCES Brand (brandID);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder659184 FOREIGN KEY (promotionID) REFERENCES Promotion (promotionID);
ALTER TABLE PurchaseOrderDetail ADD CONSTRAINT FKPurchaseOr207759 FOREIGN KEY (productID) REFERENCES Product (productID);
ALTER TABLE OrderDetail ADD CONSTRAINT FKOrderDetai727100 FOREIGN KEY (productID) REFERENCES Product (productID);
ALTER TABLE PurchaseOrder ADD CONSTRAINT FKPurchaseOr547978 FOREIGN KEY (supplierID) REFERENCES Supplier (supplierID);
ALTER TABLE PurchaseOrderDetail ADD CONSTRAINT FKPurchaseOr850638 FOREIGN KEY (purchaseOrderID) REFERENCES PurchaseOrder (purchaseOrderID);
ALTER TABLE AcountingVoucher ADD CONSTRAINT FKAcountingV457166 FOREIGN KEY (cashCountSheetID) REFERENCES CashCountSheet (cashCountSheetID);
ALTER TABLE CashCountSheetDetail ADD CONSTRAINT FKCashCountS656419 FOREIGN KEY (cashCountSheetID) REFERENCES CashCountSheet (cashCountSheetID);
ALTER TABLE CashCountSheetDetail ADD CONSTRAINT FKCashCountS667862 FOREIGN KEY (employeeID) REFERENCES Employee (employeeID);
ALTER TABLE CashCount ADD CONSTRAINT FKCashCount176433 FOREIGN KEY (cashCountSheetID) REFERENCES CashCountSheet (cashCountSheetID);
ALTER TABLE Shift ADD CONSTRAINT FKShift256712 FOREIGN KEY (employeeID) REFERENCES Account (employeeID);
ALTER TABLE Account ADD CONSTRAINT FKAccount516942 FOREIGN KEY (employeeID) REFERENCES Employee (employeeID);
ALTER TABLE Employee ADD CONSTRAINT FKEmployee758863 FOREIGN KEY (storeID) REFERENCES Store (storeID);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder635796 FOREIGN KEY (employeeID) REFERENCES Employee (employeeID);
ALTER TABLE ReturnOrder ADD CONSTRAINT FKReturnOrde974953 FOREIGN KEY (orderID) REFERENCES [Order] (orderID);
ALTER TABLE OrderDetail ADD CONSTRAINT FKOrderDetai440548 FOREIGN KEY (orderID) REFERENCES [Order] (orderID);




INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198210013', N'Trương Văn Tâm', CAST(N'1982-09-15' AS Date), 1, N'0565970622', 27000,  N'Số 161, Đường Trần Quốc Toản, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198210029', N'Trương Văn Tâm', CAST(N'1982-09-15' AS Date), 1, N'0827792035', 27000,  N'Số 9, Đường Trần Quốc Toản, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198300008', N'Lê Thị Thúy An', CAST(N'1983-08-08' AS Date), 0, N'0903042389', 18000,  N'Số 111, Đường Trần Hưng Đạo, Phường Cái Khế, Quận Ninh Kiều, TP.Cần Thơ')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198500019', N'Phạm Việt Thảo', CAST(N'1985-11-05' AS Date), 0, N'0865982103', 6700,  N'Số 221, Đường 30/4, Phường 1, Quận 5, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198500035', N'Huỳnh Thị La', CAST(N'1985-11-05' AS Date), 0, N'0935890131', 6700,  N'Số 15, Đường 30/4, Phường 1, Quận 5, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198510005', N'Vũ Quốc An', CAST(N'1985-04-25' AS Date), 1, N'0354391219', 30000,  N'Số 456, Đường Điện Biên Phủ, Phường Thủ Thiêm, Quận 2, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198510023', N'Đoàn Văn Thắng', CAST(N'1985-04-25' AS Date), 1, N'0337969324', 30000,  N'Số 3, Đường Hai Bà Trưng, Phường Tân Định, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198700010', N'Đặng Thị Ngọc', CAST(N'1987-07-22' AS Date), 0, N'0905348500', 7000,  N'Số 131, Đường Lê Thị Riêng, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198700026', N'Phạm Thị Lan', CAST(N'1987-07-22' AS Date), 0, N'0905125694', 18000,  N'Số 6, Đường Nguyễn Cư Trinh, Phường Cầu Ông Lãnh, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198710040', N'Hoàng Minh Nghĩa', CAST(N'1987-12-01' AS Date), 1, N'0766490995', 6600,  N'Số 20, Đường Hải Triều, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198810003', N'Trần Văn Cường', CAST(N'1988-11-03' AS Date), 1, N'0825371577', 50000,  N'Số 789, Đường Lý Thường Kiệt, Phường Tân Định, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198910015', N'Vũ Hoàng Nam', CAST(N'1989-12-12' AS Date), 1, N'0866675279', 31000,  N'Số 181, Đường Hùng Vương, Phường Hòa Khánh Bắc, Quận Liên Chiểu, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH198910031', N'Đinh Thế Hoàng', CAST(N'1989-12-12' AS Date), 1, N'0383053058', 31000,  N'Số 11, Đường Hùng Vương, Phường Hòa Khánh Bắc, Quận Liên Chiểu, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199000004', N'Phạm Thị Dung', CAST(N'1990-09-12' AS Date), 0, N'0373246328', 9000,  N'Số 101, Đường Hai Bà Trưng, Phường Quận 10, Quận 10, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199000017', N'Nguyễn Huỳnh Minh Mẫn', CAST(N'1990-09-15' AS Date), 0, N'0776072716', 7600,  N'Số 201, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199000021', N'Phan Thị Thùy Dung', CAST(N'1990-05-12' AS Date), 0, N'0365962232', 120000,  N'Số 1, Đường Nguyễn Huệ, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199000033', N'Hồ Thị Như Tâm', CAST(N'1990-09-15' AS Date), 0, N'0776072716', 7600,  N'Số 13, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199000093', N'Nguyễn Thị Mỹ Linh', CAST(N'1990-09-15' AS Date), 0, N'0776072716', 7600,  N'Số 73, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199010001', N'Nguyễn Văn Sang', CAST(N'1990-01-15' AS Date), 1, N'0866432245', 120000,  N'Số 123, Đường Lê Lợi, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199010038', N'Lê Quốc Mạnh', CAST(N'1990-12-25' AS Date), 1, N'0771776828', 78000,  N'Số 18, Đường Nguyễn Đình Chính, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199010098', N'Lê Quốc Nam', CAST(N'1990-12-25' AS Date), 1, N'0771776828', 78000,  N'Số 78, Đường Nguyễn Đình Chính, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199100012', N'Nguyễn Hoàng Việt', CAST(N'1991-06-07' AS Date), 0, N'0394394181', 4500,  N'Số 151, Đường Võ Thị Sáu, Phường Thạnh Lộc, Quận 12, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199100028', N'Huỳnh Phạm Thủy Tiên', CAST(N'1991-06-07' AS Date), 0, N'0383741660', 4500,  N'Số 8, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199100088', N'Lê Thị Quỳnh', CAST(N'1991-06-07' AS Date), 0, N'0325690224', 4500,  N'Số 68, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199110091', N'Đinh Gia Bảo', CAST(N'1991-12-12' AS Date), 1, N'0969936237', 31000,  N'Số 71, Đường Hùng Vương, Phường Hòa Khánh Bắc, Quận Liên Chiểu, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199200006', N'Tống Hoàng Hải Đăng', CAST(N'1992-10-18' AS Date), 0, N'0714774853', 6000,  N'Số 789, Đường Nguyễn Đình Chính, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199200024', N'Vũ Thị Hương', CAST(N'1992-09-18' AS Date), 0, N'0756864456', 9000,  N'Số 4, Đường Võ Thị Sáu, Phường Thạnh Lộc, Quận 12, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199200084', N'Vũ Thị Phương Linh', CAST(N'1992-09-18' AS Date), 0, N'0336551833', 9000,  N'Số 64, Đường Võ Thị Sáu, Phường Thạnh Lộc, Quận 12, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199210020', N'Trần Văn Minh', CAST(N'1992-03-20' AS Date), 1, N'0776072716', 48000,  N'Số 231, Đường 3/2, Phường 10, Quận 10, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199210036', N'Trần Văn Sang', CAST(N'1992-03-20' AS Date), 1, N'0776072716', 48000,  N'Số 16, Đường 3/2, Phường 10, Quận 10, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199210089', N'Lê Gia Bảo', CAST(N'1992-09-15' AS Date), 1, N'0766490995', 27000,  N'Số 69, Đường Trần Quốc Toản, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199210096', N'Trần Văn Minh', CAST(N'1992-03-20' AS Date), 1, N'0776072716', 48000,  N'Số 76, Đường 3/2, Phường 10, Quận 10, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199300014', N'Phạm Thị Út', CAST(N'1993-10-25' AS Date), 0, N'0776072716', 8800,  N'Số 171, Đường Nguyễn Văn Thoại, Phường An Hải Bắc, Quận Sơn Trà, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199300022', N'Nguyễn Hoàng Bảo Trân', CAST(N'1993-07-20' AS Date), 0, N'0728359586', 8000,  N'Số 2, Đường Lê Lợi, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199300030', N'Phạm Thị Ba', CAST(N'1993-10-25' AS Date), 0, N'0776072716', 8800,  N'Số 10, Đường Nguyễn Văn Thoại, Phường An Hải Bắc, Quận Sơn Trà, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199300039', N'Vương Thị Hạnh', CAST(N'1993-04-18' AS Date), 0, N'0714656124', 22000,  N'Số 19, Đường Bùi Thị Xuân, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199300082', N'Nguyễn Thị Quế Ngân', CAST(N'1993-07-20' AS Date), 0, N'0857567439', 8000,  N'Số 62, Đường Lê Lợi, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199300090', N'Phạm Văn Bốn', CAST(N'1993-10-25' AS Date), 0, N'0776072716', 8800,  N'Số 70, Đường Nguyễn Văn Thoại, Phường An Hải Bắc, Quận Sơn Trà, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199300099', N'Vương Thị Hạnh', CAST(N'1993-04-18' AS Date), 0, N'0966893017', 22000,  N'Số 79, Đường Bùi Thị Xuân, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199410009', N'Đặng Đình Mạnh', CAST(N'1994-12-03' AS Date), 1, N'0349424156', 24000,  N'Số 121, Đường Nguyễn Cư Trinh, Phường Cầu Ông Lãnh, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199500002', N'Tống An Nhiên', CAST(N'1995-05-20' AS Date), 0, N'0397190379', 8000,  N'Số 456, Đường Nguyễn Văn Linh, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199500081', N'Võ Thị Thùy Dương', CAST(N'1995-06-12' AS Date), 0, N'0364835692', 120000,  N'Số 61, Đường Nguyễn Huệ, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199500083', N'Nguyễn Thị Ngọc Trâm', CAST(N'1995-04-25' AS Date), 0, N'0899530610', 30000,  N'Số 63, Đường Hai Bà Trưng, Phường Tân Định, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199500095', N'Đỗ Thị Lam', CAST(N'1995-11-05' AS Date), 0, N'0986045261', 6700,  N'Số 75, Đường 30/4, Phường 1, Quận 5, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199510016', N'Đỗ Minh Tiền', CAST(N'1995-04-02' AS Date), 1, N'0327194438', 59000,  N'Số 191, Đường Bùi Thị Xuân, Phường 7, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199510025', N'Lâm Gia Bảo', CAST(N'1995-11-05' AS Date), 1, N'0739974354', 12000,  N'Số 5, Đường Trần Hưng Đạo, Phường Cái Khế, Quận Ninh Kiều, TP.Cần Thơ')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199510032', N'Hoàng Văn Xương', CAST(N'1995-04-02' AS Date), 1, N'0356480538', 59000,  N'Số 12, Đường Bùi Thị Xuân, Phường 7, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199510085', N'Lê Dương Bảo Lâm', CAST(N'1995-11-05' AS Date), 1, N'0365815480', 12000,  N'Số 65, Đường Trần Hưng Đạo, Phường Cái Khế, Quận Ninh Kiều, TP.Cần Thơ')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199510092', N'Hoàng Văn Kha', CAST(N'1995-04-02' AS Date), 1, N'0367819442', 59000,  N'Số 72, Đường Bùi Thị Xuân, Phường 7, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199600037', N'Đinh Thị Mỹ Linh', CAST(N'1996-09-10' AS Date), 0, N'0963430945', 15000,  N'Số 17, Đường Điện Biên Phủ, Phường Thủ Thiêm, Quận 2, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199600097', N'Đinh Thị Mỹ Linh', CAST(N'1996-09-10' AS Date), 0, N'0798553283', 15000,  N'Số 77, Đường Điện Biên Phủ, Phường Thủ Thiêm, Quận 2, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199700086', N'Phạm Thị Hạnh', CAST(N'1997-07-22' AS Date), 0, N'0776466189', 18000,  N'Số 66, Đường Nguyễn Cư Trinh, Phường Cầu Ông Lãnh, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199710007', N'Võ Văn Khanh', CAST(N'1997-03-01' AS Date), 1, N'0766490995', 15000,  N'Số 101, Đường Bùi Thị Xuân, Phường An Thới, Quận Bình Thuỷ, TP.Cần Thơ')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199710018', N'Nguyễn Văn Long', CAST(N'1997-08-30' AS Date), 1, N'0346549617', 42000,  N'Số 211, Đường Nguyễn Thái Bình, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199710034', N'Nguyễn Văn Bảo', CAST(N'1997-08-30' AS Date), 1, N'0344387030', 42000,  N'Số 14, Đường Nguyễn Thái Bình, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199710094', N'Phan Xích Long', CAST(N'1997-08-30' AS Date), 1, N'0355743978', 42000,  N'Số 74, Đường Nguyễn Thái Bình, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199710100', N'Nguyễn Đức Nam', CAST(N'1997-12-01' AS Date), 1, N'0767459058', 6600,  N'Số 80, Đường Hải Triều, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199810011', N'Lê Tống Gia Bảo', CAST(N'1998-05-10' AS Date), 1, N'0771776828', 36000,  N'Số 141, Đường Trần Quang Diệu, Phường 6, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199810027', N'Trần Minh', CAST(N'1998-05-10' AS Date), 1, N'0771776828', 36000,  N'Số 7, Đường Trần Quang Diệu, Phường 6, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH199810087', N'Trần Văn Nghĩa', CAST(N'1998-05-10' AS Date), 1, N'0771776828', 36000,  N'Số 67, Đường Trần Quang Diệu, Phường 6, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200000041', N'Đặng Thị Bích Ngọc', CAST(N'2000-05-12' AS Date), 0, N'0387228810', 120000,  N'Số 21, Đường Nguyễn Huệ, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200000053', N'Đỗ Thị Yến', CAST(N'2000-09-15' AS Date), 0, N'0776072716', 7600,  N'Số 33, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200010058', N'Lê Quốc Tuấn', CAST(N'2000-12-25' AS Date), 1, N'0771776828', 78000,  N'Số 38, Đường Nguyễn Đình Chính, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200100048', N'Nguyễn Thị Ngọc Châu', CAST(N'2001-06-07' AS Date), 0, N'0338004957', 4500,  N'Số 28, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200110051', N'Lý An Khang', CAST(N'2001-12-12' AS Date), 1, N'0902414929', 31000,  N'Số 31, Đường Hùng Vương, Phường Hòa Khánh Bắc, Quận Liên Chiểu, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200200044', N'Vũ Thị Phương Linh', CAST(N'2002-09-18' AS Date), 0, N'0947672072', 9000,  N'Số 24, Đường Võ Thị Sáu, Phường Thạnh Lộc, Quận 12, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200210049', N'Trương Văn Tâm', CAST(N'2002-09-15' AS Date), 1, N'0766490995', 27000,  N'Số 29, Đường Trần Quốc Toản, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200210056', N'Lê Minh', CAST(N'2002-03-20' AS Date), 1, N'0776072716', 48000,  N'Số 36, Đường 3/2, Phường 10, Quận 10, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200300042', N'Lê Thị Thúy Vi', CAST(N'2003-07-20' AS Date), 0, N'0378992622', 8000,  N'Số 22, Đường Lê Lợi, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200300050', N'Trần Thúy Kiều', CAST(N'2003-10-25' AS Date), 0, N'0776072716', 8800,  N'Số 30, Đường Nguyễn Văn Thoại, Phường An Hải Bắc, Quận Sơn Trà, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200300059', N'Vương Thị Hạnh', CAST(N'2003-04-18' AS Date), 0, N'0886700046', 22000,  N'Số 39, Đường Bùi Thị Xuân, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200500043', N'Lê Đỗ Kim Cương', CAST(N'2005-04-25' AS Date), 0, N'0732508218', 30000,  N'Số 23, Đường Hai Bà Trưng, Phường Tân Định, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200500055', N'Phạm Việt Hương', CAST(N'2005-11-05' AS Date), 0, N'0766490995', 6700,  N'Số 35, Đường 30/4, Phường 1, Quận 5, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200510045', N'Nguyễn Hồng Sơn', CAST(N'2005-11-05' AS Date), 1, N'0398638364', 12000,  N'Số 25, Đường Trần Hưng Đạo, Phường Cái Khế, Quận Ninh Kiều, TP.Cần Thơ')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200510052', N'Nguyễn Minh Sang', CAST(N'2005-04-02' AS Date), 1, N'0852606710', 59000,  N'Số 32, Đường Bùi Thị Xuân, Phường 7, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200600057', N'Lê Thị Anh Thư', CAST(N'2006-09-10' AS Date), 0, N'0398900123', 15000,  N'Số 37, Đường Điện Biên Phủ, Phường Thủ Thiêm, Quận 2, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200700046', N'Nguyễn Thị Hạnh', CAST(N'2007-07-22' AS Date), 0, N'0905348500', 18000,  N'Số 26, Đường Nguyễn Cư Trinh, Phường Cầu Ông Lãnh, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200710054', N'Lê Quang Huy', CAST(N'2007-08-30' AS Date), 1, N'0522206965', 42000,  N'Số 34, Đường Nguyễn Thái Bình, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200710060', N'Trần Lâm Gia Khang', CAST(N'2007-12-01' AS Date), 1, N'0766490995', 6600,  N'Số 40, Đường Hải Triều, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH200810047', N'Lê Nam', CAST(N'2008-05-10' AS Date), 1, N'0771776828', 36000,  N'Số 27, Đường Trần Quang Diệu, Phường 6, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201000061', N'Hồ Thị Như Thảo', CAST(N'2010-08-12' AS Date), 0, N'0943608225', 120000,  N'Số 41, Đường Nguyễn Huệ, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201000073', N'Nguyễn Thị Kim Thơ', CAST(N'2010-09-15' AS Date), 0, N'0776072716', 7600,  N'Số 53, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201010078', N'Lê An Khang', CAST(N'2010-12-25' AS Date), 1, N'0771776828', 78000,  N'Số 58, Đường Nguyễn Đình Chính, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201100068', N'Trần Tiểu Vi', CAST(N'2011-06-07' AS Date), 0, N'0943899717', 4500,  N'Số 48, Đường Võ Văn Tần, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201110071', N'Võ Lê Hoàng Khang', CAST(N'2011-12-12' AS Date), 1, N'0724020485', 31000,  N'Số 51, Đường Hùng Vương, Phường Hòa Khánh Bắc, Quận Liên Chiểu, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201200064', N'Vũ Thị Phương Linh', CAST(N'2012-09-18' AS Date), 0, N'0352468843', 9000,  N'Số 44, Đường Võ Thị Sáu, Phường Thạnh Lộc, Quận 12, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201210069', N'Trương Vô Kỵ', CAST(N'2012-09-15' AS Date), 1, N'0766490995', 27000,  N'Số 49, Đường Trần Quốc Toản, Phường 5, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201210076', N'Lê Nam', CAST(N'2012-03-20' AS Date), 1, N'0776072716', 48000,  N'Số 56, Đường 3/2, Phường 10, Quận 10, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201300062', N'Lê Thị Kim Kiều', CAST(N'2013-07-20' AS Date), 0, N'0393197895', 8000,  N'Số 42, Đường Lê Lợi, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201300070', N'Phạm Thúy Vân', CAST(N'2013-10-25' AS Date), 0, N'0776072716', 8800,  N'Số 50, Đường Nguyễn Văn Thoại, Phường An Hải Bắc, Quận Sơn Trà, TP.Đà Nẵng')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201300079', N'Vương Thị Hạnh', CAST(N'2013-04-18' AS Date), 0, N'0334405617', 22000,  N'Số 59, Đường Bùi Thị Xuân, Phường Phú Mỹ Hưng, Quận 7, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201500063', N'Lê Thị Thu Hà', CAST(N'2015-04-25' AS Date), 0, N'0377574337', 30000,  N'Số 43, Đường Hai Bà Trưng, Phường Tân Định, Quận 3, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201500075', N'Phạm Thị Hương', CAST(N'2015-11-05' AS Date), 0, N'0769347622', 6700,  N'Số 55, Đường 30/4, Phường 1, Quận 5, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201510065', N'Nguyễn Minh Tuấn', CAST(N'2015-11-05' AS Date), 1, N'0327410155', 12000,  N'Số 45, Đường Trần Hưng Đạo, Phường Cái Khế, Quận Ninh Kiều, TP.Cần Thơ')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201510072', N'Hoàng Văn Xương', CAST(N'2015-04-02' AS Date), 1, N'0819088848', 59000,  N'Số 52, Đường Bùi Thị Xuân, Phường 7, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201600077', N'Nguyễn Kim Anh', CAST(N'2016-09-10' AS Date), 0, N'0352904768', 15000,  N'Số 57, Đường Điện Biên Phủ, Phường Thủ Thiêm, Quận 2, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201700066', N'Phạm Thị Thảo', CAST(N'2017-07-22' AS Date), 0, N'0353426938', 18000,  N'Số 46, Đường Nguyễn Cư Trinh, Phường Cầu Ông Lãnh, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201710074', N'Lê Phước Sang', CAST(N'2017-08-30' AS Date), 1, N'0787945874', 42000,  N'Số 54, Đường Nguyễn Thái Bình, Phường Tân Bình, Quận Tân Phú, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201710080', N'Nguyễn Đức Đông', CAST(N'2017-12-01' AS Date), 1, N'0398890029', 6600,  N'Số 60, Đường Hải Triều, Phường Bến Thành, Quận 1, TP.Hồ Chí Minh')
INSERT [dbo].[Customer] ([customerID], [name], [dateOfBirth], [gender], [phoneNumber], [score], [address]) VALUES (N'KH201810067', N'Trần Thị Mai', CAST(N'2018-05-10' AS Date), 1, N'0771776828', 36000,  N'Số 47, Đường Trần Quang Diệu, Phường 6, Quận 3, TP.Hồ Chí Minh')
GO
INSERT [dbo].[Store] ([storeID], [name], [address]) VALUES (N'ST001', N'OmegaBook Nguyễn Văn Bảo', N'12 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP HCM')
INSERT [dbo].[Store] ([storeID], [name], [address]) VALUES (N'ST002', N'OmegaBook Lê Đức Thọ', N'237 Lê Đức Thọ, Phường 17, Quận Gò Vấp, TP HCM')
GO
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV019982020001', N'Phan Như Ngọc', N'Nhân Viên Bán Hàng', 1, CAST(N'1998-12-31' AS Date), 0, N'0885591038', N'077300123523', N'Quận Tân Bình, TP HCM', N'ST001')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV020032023001', N'Hồ Thị Như Tâm', N'Nhân Viên Bán Hàng', 1, CAST(N'2003-11-03' AS Date), 0, N'0336551833', N'077300123451', N'Phan Huy Ích, Phường 15, Quận Tân Bình, TP HCM', N'ST001')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV020032023002', N'Lê Thị Riêng', N'Nhân Viên Bán Hàng', 1, CAST(N'2003-02-10' AS Date), 0, N'0336509738', N'024310121423', N'Quận Gò Vấp, TP HCM', N'ST002')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV020032023003', N'Đỗ Thuý Hiền', N'Nhân Viên Bán Hàng', 1, CAST(N'2003-11-30' AS Date), 0, N'0908591038', N'024310115523', N'Quận Gò Vấp, TP HCM', N'ST002')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV119992020001', N'Nguyễn Văn Ba', N'Cửa Hàng Trưởng', 1, CAST(N'1999-04-10' AS Date), 1, N'0326891038', N'024310122579', N'Quận Gò Vấp, TP HCM', N'ST002')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV120002018001', N'Nguyễn Ngọc Dũng', N'Nhân Viên Bán Hàng', 0, CAST(N'2000-10-15' AS Date), 1, N'0336591038', N'024310123435', N'Quận Gò Vấp, TP HCM', N'ST001')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV120032023001', N'Trần Đình Kiên', N'Nhân Viên Bán Hàng', 1, CAST(N'2003-01-01' AS Date), 1, N'0909095678', N'012310123145', N'Quận Gò Vấp, TP HCM', N'ST001')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV120032023002', N'Lê Hoàng Khang', N'Cửa Hàng Trưởng', 1, CAST(N'2003-02-03' AS Date), 1, N'0331118972', N'053310123421', N'Quận Gò Vấp, TP HCM', N'ST001')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV120032023003', N'Nguyễn Thanh Cảnh', N'Giám Sát Viên', 1, CAST(N'2003-11-10' AS Date), 1, N'0336591038', N'024310123435', N'Quận Gò Vấp, TP HCM', N'ST001')
INSERT [dbo].[Employee] ([employeeID], [name], [role], [status], [dateOfBirth], [gender], [phoneNumber], [citizenIdentification], [address], [storeID]) VALUES (N'NV120032023004', N'Lê Văn Thọ', N'Nhân Viên Bán Hàng', 1, CAST(N'2003-12-03' AS Date), 1, N'0999591038', N'024310123400', N'Quận Gò Vấp, TP HCM', N'ST001')
GO

INSERT [dbo].[Account] ([employeeID], [password]) VALUES (N'NV020032023001', N'Lehoangkhang')
INSERT [dbo].[Account] ([employeeID], [password]) VALUES (N'NV120032023001', N'Lehoangkhang')
INSERT [dbo].[Account] ([employeeID], [password]) VALUES (N'NV120032023002', N'Lehoangkhang')
INSERT [dbo].[Account] ([employeeID], [password]) VALUES (N'NV120032023003', N'Lehoangkhang')

GO
USE [OmegaBook]
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020000', 1, 1, 2, NULL, N'Nghệ Thuật Tư Duy Chiến Lược', N'Kim Phúc', 280000, 200000, NULL, 2019, N'NXB Lao Động', 560, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 20)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020001', 1, 1, 2, NULL, N'Bí Mật Của Phan Thiên Ân (Tái Bản 2023)', N'Alan Phan', 69000, 49200, NULL, 2023, N'NXB Thế Giới', 212, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 20)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020002', 1, 1, 2, NULL, N'Bán Hàng 5.0', N'Nguyễn Hữu Tài, Trương Bến Hà', 179000, 127800, NULL, 2023, N'NXB Công Thương', 304, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020003', 1, 1, 2, NULL, N'Đừng Cố Gắng Bán - Hãy Giúp Khách Hàng Mua (2022)', N'Trịnh Minh Thảo', 169000, 120700, NULL, 2022, N'NXB Tổng Hợp TPHCM', 314, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 10)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020004', 1, 1, 2, NULL, N'Voi To Óc Bằng Quả Nho', N'A Tăng Kì', 175000, 125000, NULL, 2022, N'NXB Thanh Niên', 344, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 25)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020005', 1, 1, 2, NULL, N'Bán Hàng Shopee Thực Chiến Từ A-Z - 36 Chiến Lược Đỉnh Cao Bùng Nổ Doanh Số (Tái Bản)', N'Văn Chính', 249000, 177800, NULL, 2022, N'NXB Thanh Niên', 245, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 15)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020006', 1, 1, 2, NULL, N'UX CONTENT 4.0 - Chọn Đúng Chữ, Giữ Người Dùng (Tái Bản)', N'Khúc Cẩm Huyên, Võ Lê Tú Anh', 139000, 99200, NULL, 2022, N'NXB Thế Giới', 280, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 20)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020007', 1, 1, 2, NULL, N'Năng Suất Lao Động Của Việt Nam - Trong Bối Cảnh Kinh Tế Số', N'PGS TS Tô Trung Thành', 98000, 70000, NULL, 2021, N'NXB Chính Trị Quốc Gia Sự Thật', 212, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020008', 1, 1, 2, NULL, N'Kiểm Toán Độc Lập & Những Kỹ Năng Chuyên Nghiệp Để Thành Công', N'Phạm Thế Hưng', 199000, 142100, NULL, 2022, N'NXB Dân Trí', 296, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 18)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11020009', 1, 1, 2, NULL, N'Bóc Phốt Tài Chính - Giàu Chậm Nhưng Chắc (Tái Bản 2022)', N'Nguyễn Trọng Nhân', 189000, 135000, NULL, 2022, N'NXB Dân Trí', 216, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 25)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11030000', 1, 1, 3, NULL, N'Đắc nhân tâm', N'Dale Carnegie', 49285, 69000, NULL, 2021, N'NXB Tổng Hợp TPHCM', 300, 0, NULL, NULL, N'Nguyễn Văn Phước', NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11030001', 1, 1, 3, NULL, N'Khéo Ăn Nói Sẽ Có Được Thiên Hạ (Tái Bản 2022)', N'Trác Nhã', 65000, 91000, NULL, 2022, N'Văn Học', 404, 0, NULL, NULL, N'Nguyễn Phương Thảo', NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11030002', 1, 1, 3, NULL, N'Tâm Lý Học Tội Phạm - Phác Họa Chân Dung Kẻ Phạm Tội', N'Diệp Hồng Vũ', 82857, 116000, NULL, 2021, N'NXB Thanh Niên', 280, 0, NULL, NULL, N'Đỗ Ái Nhi', NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11030003', 1, 1, 3, NULL, N'Không Phải Sói Nhưng Cũng Đừng Là Cừu', N'Lê Bảo Ngọc', 72857, 102000, NULL, 2022, N'Thế Giới', 296, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11030004', 1, 1, 3, NULL, N'Đừng Lựa Chọn An Nhàn Khi Còn Trẻ (Tái Bản 2021)', N'Cảnh Thiên', 56571, 79200, NULL, 2022, N'Thế Giới', 316, 0, NULL, NULL, N'Đặng Quân', NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11040004', 1, 1, 4, NULL, N'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn (Tái Bản 2023)', N'Huỳnh Thái Ngọc', 84000, 60000, NULL, 2023, N'Dân trí', 216, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 200)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11060000', 1, 1, 6, NULL, N'Gánh Gánh Gồng Gồng (Tái Bản 2023)', N'Nguyễn Thị Xuân Phượng', 160000, 114200, NULL, 2023, N'NXB Tổng Hợp Thành Phố Hồ Chí Minh', 343, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 34)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11060001', 1, 1, 6, NULL, N'Lý Do Để Sống Tiếp', N'Matt Haig', 115000, 82100, NULL, 2023, N'NXB Văn Học', 245, 0, NULL, NULL, N'Thiên Nga', NULL, NULL, NULL, NULL, NULL, 10, 20)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11060002', 1, 1, 6, NULL, N'Tôi Tư Duy Là Tôi Chơi Bóng (Tái Bản 2023)', N'Andrea Pirlo', 160000, 114200, NULL, 2023, N'NXB Lao Động', 222, 0, NULL, NULL, N'Nguyễn An Nguyên', NULL, NULL, NULL, NULL, NULL, 10, 10)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11060003', 1, 1, 6, NULL, N'Ăn Tối Cùng Chef Và Nói Chuyện Bếp', N'Bếp Đơn', 170000, 121400, NULL, 2022, N'NXB Trẻ', 312, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 20)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11060004', 1, 1, 6, NULL, N'Bác Hồ Cầu Hiền Tài', N'Tuệ Minh', 54000, 38571, NULL, 2023, N'NXB Văn Học', 180, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11070000', 1, 1, 7, NULL, N'Tổng Ôn Ngữ Pháp Tiếng Anh (Tái Bản 2023)', N'Trang Anh', 135000, 189000, NULL, 2023, N'NXB Hồng Đức', 608, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11070001', 1, 1, 7, NULL, N'Sổ Tay Kiến Thức Toán Tiểu Học', N'Nguyễn Anh Vũ', 34285, 48000, NULL, 2023, N'Đại Học Quốc Gia Hà Nội', 270, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11070002', 1, 1, 7, NULL, N'Bài Tập Toán Nâng Cao Lớp 1 - Mở Rộng Kiến Thức Sách Giáo Khoa', N'Trần Thị Kim Cương', 36428, 51000, NULL, 2023, N'Đại Học Quốc Gia Hà Nội', 148, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP11070003', 1, 1, 7, NULL, N'Hoạt Động Trải Nghiệm, Hướng Nghiệp 8 - Bản 1 (Chân Trời Sáng Tạo) (2023)', N'Nhiều Tác Giả', 9285, 13000, NULL, 2023, N'Giáo Dục Việt Nam', 83, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020000', 1, 2, 2, NULL, N'Why Nations Fail: The Origins of Power, Prosperity, and Poverty', N'Professor Daron Acemoglu,David Florence Professor of Government James A Robinson', 350000, 250000, NULL, 2013, N'Crown Business', 529, 0, NULL, N'English', NULL, 430, NULL, NULL, NULL, NULL, 10, 10)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020001', 1, 2, 2, NULL, N'Wealth of Nations', N'Adam Smith', 184000, 131400, NULL, 2003, N'Bantam Doubleday Dell Publishing Group Inc', 1264, 0, NULL, N'English', NULL, 579, NULL, NULL, NULL, NULL, 10, 13)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020002', 1, 2, 2, NULL, N'Zero to One', N'Peter Thiel', 360000, 257100, NULL, 2014, N'Random House LCC US', 210, 0, NULL, N'English', NULL, 267, NULL, NULL, NULL, NULL, 10, 30)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020003', 1, 2, 2, NULL, N'Thank You for Being Late', N'Thomas L. Friedman', 333000, 237800, NULL, 2017, N'Penguin Books Ltd', 560, 0, NULL, N'English', NULL, 383, NULL, NULL, NULL, NULL, 10, 23)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020004', 1, 2, 2, NULL, N'Invisible Influence', N'Jonah Berger', 326000, 232800, NULL, 2017, N'Simon & Schuster', 272, 0, NULL, N'English', NULL, 227, NULL, NULL, NULL, NULL, 10, 18)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020005', 1, 2, 2, NULL, N'Money: Vintage Minis', N'Yuval Noah Harari', 89000, 63570, NULL, 2018, N'Vintage Classics', 144, 0, NULL, N'English', NULL, 81, NULL, NULL, NULL, NULL, 10, 19)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020006', 1, 2, 2, NULL, N'Don''t Trust Your Gut', N'Seth Stephens-Davidowitz', 275000, 196400, NULL, 2022, N'HarperCollins', 307, 0, NULL, N'English', NULL, 282, NULL, NULL, NULL, NULL, 10, 22)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020007', 1, 2, 2, NULL, N'The Model Thinker', N'Scott E. Page', 384000, 274280, NULL, 2021, N'Basic Books', 464, 0, NULL, N'English', NULL, 380, NULL, NULL, NULL, NULL, 10, 27)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020008', 1, 2, 2, NULL, N'Gigged: The Gig Economy, The End Of The Job And The Future Of Work', N'Sarah Kessler', 225000, 160700, NULL, 2019, N'Random House Business', 304, 0, NULL, N'English', NULL, 213, NULL, NULL, NULL, NULL, 10, 23)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12020009', 1, 2, 2, NULL, N'The Upside of Irrationality : The Unexpected Benefits of Defying Logic', N'Dan Ariely', 336000, 240000, NULL, 2011, N'Harpercollins Publishers Inc', 334, 0, NULL, N'English', NULL, 500, NULL, NULL, NULL, NULL, 10, 24)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040000', 1, 2, 4, NULL, N'Oshi No Ko - Dưới Ánh Hào Quang - Tập 2 - Bản Đặc Biệt - Tặng Kèm Bìa 2 Mặt + Oshi No Card Kèm Chữ Kí Đặc Biệt + OSHIkishi Đầy Màu Sắc', N'Aka Akasaka, Mengo Yokoyari', 78400, 56000, NULL, 2023, N'Hồng Đức', 194, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 350)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040001', 1, 2, 4, NULL, N'Chú Thuật Hồi Chiến - Tập 17: Ngậm Ngọn Cỏ Lau - Tặng Kèm Obi + Thẻ Bo Góc Nhựa', N'Gege Akutami', 26400, 18400, NULL, 2023, N'Kim Đồng', 200, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 200)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040002', 1, 2, 4, NULL, N'MASHLE - Tập 12: Mash Burnedead Và 5 Người Anh - Tặng Kèm Bookmark', N'Hajime Komoto', 28500, 20000, NULL, 2023, N'Kim Đồng', 192, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 100)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040003', 1, 2, 4, NULL, N'Fire Force - Tập 14 - Tặng Kèm Bookmark Giấy Hình Nhân Vật', N'Atsushi Ohkubo', 37840, 27000, NULL, 2023, N'Trẻ', 192, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 130)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040011', 1, 2, 4, NULL, N'Những Câu Chuyện Truyền Cảm Hứng - I Will Be Better: Dũng Cảm Thử Lại Lần Nữa', N'Yunan', 49280, 35200, NULL, 2021, N'Kim Đồng', 229, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 120)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040012', 1, 2, 4, NULL, N'Những Câu Chuyện Truyền Cảm Hứng - I Will Be Better: Con Cảm Ơn Mẹ', N'Yunan', 49280, 35200, NULL, 2019, N'Kim Đồng', 213, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 100)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040013', 1, 2, 4, NULL, N'Những Câu Chuyện Truyền Cảm Hứng - I Will Be Better: Con Sẽ Không Dựa Dẫm', N'Yunan', 49280, 35200, NULL, 2019, N'Kim Đồng', 223, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 80)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040014', 1, 2, 4, NULL, N'I Will Be Better - Những Câu Chuyện Truyền Cảm Hứng: Mẹ Không Phải Người Giúp Việc', N'Yunan', 45780, 32700, NULL, 2019, N'Kim Đồng', 192, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 100)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12040015', 1, 2, 4, NULL, N'Chú Thuật Hồi Chiến: Trường Chuyên Chú Thuật Tokyo - Tập 0 (Tái Bản)', N'Gege Akutami', 29490, 20350, NULL, 2022, N'Kim Đồng', 200, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 210)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12060000', 1, 2, 6, NULL, N'Shoe Dog', N'Phil Knight', 332000, 237100, NULL, 2018, N'Scribner Book Company', 400, 0, NULL, N'English', NULL, NULL, NULL, NULL, NULL, NULL, 10, 24)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12060001', 1, 2, 6, NULL, N'What I Talk About When I Talk About Running', N'Haruki Murakami,Philip Gabriel', 224000, 160000, NULL, 2009, N'Vintage Publishing', 192, 0, NULL, N'English', NULL, NULL, NULL, NULL, NULL, NULL, 10, 15)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12060002', 1, 2, 6, NULL, N'Anne Frank''s Story', N'Carol Ann Lee', 131000, 93570, NULL, 2001, N'Puffin', 96, 0, NULL, N'English', NULL, NULL, NULL, NULL, NULL, NULL, 10, 17)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12060003', 1, 2, 6, NULL, N'The Dynasty', N'Jeff Benedict', 513000, 366400, NULL, 2020, N'Simon & Schuster', 592, 0, NULL, N'English', NULL, NULL, NULL, NULL, NULL, NULL, 10, 8)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12060004', 1, 2, 6, NULL, N'The Undocumented Americans', N'Karla Cornejo Villavicencio', 389000, 277800, NULL, 2020, N'One World', 208, 1, NULL, N'English', NULL, NULL, NULL, NULL, NULL, NULL, 10, 10)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12080005', 1, 2, 8, NULL, N'Tự Học 2000 Từ Vựng Tiếng Anh Theo Chủ Đề (Tái Bản)', N'The Windy', 38900, 27800, NULL, 2019, N'NXB Đại Học Quốc Gia Hà Nội', 260, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 170)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12080006', 1, 2, 8, NULL, N'Combo Sách Mindmap English Grammar + Mindmap English Vocabulary (Bộ 2 Cuốn)', N'Hoàng Ngân, Linh Chi, Đỗ Nhung', 228200, 163000, NULL, 2018, N'Hồng Đức', 550, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 70)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12080007', 1, 2, 8, NULL, N'Cambridge IELTS 17 Academic With Answers (Savina)', N'Cambridge University', 207200, 148000, NULL, 2022, N'Cambridge', 328, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 310)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12080008', 1, 2, 8, NULL, N'500 Câu Hỏi Luyện Thi Năng Lực Nhật Ngữ - Trình Độ N2 (Tái Bản 2023)', N'Matsumoto, Sasaki Hitoko', 81200, 58000, NULL, 2023, N'Trẻ', 296, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 150)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12080009', 1, 2, 8, NULL, N'Giáo Trình Chuẩn HSK 1 (Tái Bản 2022)', N'Khương lệ Bình', 119000, 85000, NULL, 2022, N'NXB Tổng hợp TPHCM', 114, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 50)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP12080010', 1, 2, 8, NULL, N'Life BRE A1: Student Book With Web App Code And Online Workbook 2nd Edition', N'John Hughes', 247000, 176400, NULL, 2022, N'Cengage', 189, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 125)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20050007', 2, NULL, NULL, 5, N'Lốc 5 Tập Kẻ Ngang 80 Trang 70 gsm - Kèm Sticker Ngẫu Nhiên - Hải Tiến 6607 - Màu Vàng', NULL, 65520, 46800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 745, N'Vàng', N'Giấy', N'Hải tiến', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20050008', 2, NULL, NULL, 5, N'Tập Sinh Viên 200 Trang 70gsm Hello - Thành Đạt - Mẫu 3', NULL, 27440, 19600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 320, N'Nhiều màu', N'Giấy', N'Thành Đạt', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20050009', 2, NULL, NULL, 5, N'Sổ Bìa Da A5 Cyber Punk The Sun 04 + Bút Bi E886', NULL, 345800, 247000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 735, N'Đen', N'Giấy', N'The Sun', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20050010', 2, NULL, NULL, 5, N'Sổ Kế Hoạch 52 Tuần SDstationery - Treasure The Journey - Pink', NULL, 122990, 87850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 175, N'Hồng', N'Giấy', N'SDstationary', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20050011', 2, NULL, NULL, 5, N'Giấy Note 12.5 x 9 cm - Sen Mu 122017 (50 Tờ)', NULL, 14210, 10150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 50, N'Trắng', N'Giấy', N'Sen Mu', NULL, 0, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20050012', 2, NULL, NULL, 5, N'Giấy Photo A4 IK Yellow 70 gsm (500 Tờ)', NULL, 408800, 292000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11900, N'Nhiều màu', N'Giấy', N'IK', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20060000', 2, NULL, NULL, 6, N'Bộ 2 Băng Keo 2 Mặt 10 mm x 24 Yards - Song Lan - Màu Trắng', NULL, 12600, 9000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, N'Trắng', N'Giấy', N'Song Lan', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20060001', 2, NULL, NULL, 6, N'Băng Trang Trí Petit Deco Rush 6 x 3 mm - Plus 130-V007 - Hình Trái Tim', NULL, 28000, 20000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, N'Nhiều màu', N'Nhựa', N'Plus', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20060002', 2, NULL, NULL, 6, N'Hồ Khô 8g - Phiên Bản Sơn Tùng M-TP Giới Hạn - Deli A201 - Màu Xanh Dương', NULL, 7140, 5100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, N'Xanh dương', N'Nhựa', N'Deli', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20060003', 2, NULL, NULL, 6, N'Dao Rọc Giấy Bitex 18mm CK02 - Màu Vàng', NULL, 28700, 20500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 95, N'Vàng', N'Nhựa, Kim loại', N'Bitex', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20060004', 2, NULL, NULL, 6, N'Bút Xóa 12 ml - Gstar 028 - Thân Bút Màu Xanh Ngọc', NULL, 13440, 9600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, N'Xanh ngọc', N'Nhựa', N'Gstar', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20060005', 2, NULL, NULL, 6, N'Băng Keo Vàng 48 mm x 80 Yards - Song Lan', NULL, 22960, 16400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 180, N'Vàng', N'Nhựa', N'Song Lan', NULL, 8, 0)
GO
INSERT [dbo].[Product] ([productID], [productType], [bookType], [bookCategory], [stationeryType], [name], [author], [price], [costPrice], [img], [publishYear], [publisher], [pageQuantity], [isHardCover], [description], [language], [translater], [weight], [color], [material], [origin], [brandID], [VAT], [inventory]) VALUES (N'SP20060006', 2, NULL, NULL, 6, N'Băng Keo Trong 20 mm x 80 Yards - Song Lan', NULL, 9100, 6500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 78, N'Trong suốt', N'Nhựa', N'Song Lan', NULL, 8, 0)
GO



