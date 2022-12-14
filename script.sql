USE [master]
GO
/****** Object:  Database [HostelManagement]    Script Date: 7/15/2022 1:18:36 PM ******/
CREATE DATABASE [HostelManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HostelManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HostelManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HostelManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\HostelManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HostelManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HostelManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HostelManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HostelManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HostelManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HostelManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HostelManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HostelManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HostelManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HostelManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HostelManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HostelManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HostelManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HostelManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HostelManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HostelManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HostelManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HostelManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HostelManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HostelManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HostelManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HostelManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HostelManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HostelManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HostelManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HostelManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HostelManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HostelManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HostelManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HostelManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HostelManagement', N'ON'
GO
ALTER DATABASE [HostelManagement] SET QUERY_STORE = OFF
GO
USE [HostelManagement]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBill](
	[billId] [int] IDENTITY(1,1) NOT NULL,
	[billName] [nvarchar](50) NOT NULL,
	[detail] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblBill_1] PRIMARY KEY CLUSTERED 
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBillDetail]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillDetail](
	[billId] [int] NOT NULL,
	[roomId] [int] NOT NULL,
	[date] [nvarchar](20) NOT NULL,
	[feeId] [int] NULL,
	[serviceId] [int] NULL,
 CONSTRAINT [PK_tblBillDetail] PRIMARY KEY CLUSTERED 
(
	[billId] ASC,
	[roomId] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBooking]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooking](
	[bookingId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[bookingDate] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblBooking] PRIMARY KEY CLUSTERED 
(
	[bookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBookingDetail]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookingDetail](
	[roomId] [int] NOT NULL,
	[bookingId] [int] NOT NULL,
	[checkInDate] [nvarchar](20) NOT NULL,
	[checkOutDate] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblBookingDetail] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC,
	[bookingId] ASC,
	[checkInDate] ASC,
	[checkOutDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[feedbackId] [int] IDENTITY(1,1) NOT NULL,
	[feedbackName] [nvarchar](100) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tblFeedback] PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedbackReply]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedbackReply](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentReply] [nvarchar](100) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblFeedbackReply] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFees]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFees](
	[feeId] [int] IDENTITY(1,1) NOT NULL,
	[detail] [nvarchar](500) NOT NULL,
	[feesPrice] [float] NOT NULL,
 CONSTRAINT [PK_tblFees] PRIMARY KEY CLUSTERED 
(
	[feeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblNotification]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNotification](
	[notificationId] [int] IDENTITY(1,1) NOT NULL,
	[notificationName] [nvarchar](100) NOT NULL,
	[detail] [nvarchar](500) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblNotification] PRIMARY KEY CLUSTERED 
(
	[notificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[paymentId] [int] NOT NULL,
	[paymentName] [nvarchar](100) NOT NULL,
	[methodUser] [nvarchar](20) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblPayment] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRegulation]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRegulation](
	[regulationId] [int] IDENTITY(1,1) NOT NULL,
	[regulationName] [nvarchar](100) NOT NULL,
	[regualtionDetail] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tblRegulation1] PRIMARY KEY CLUSTERED 
(
	[regulationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoom]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoom](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[roomDescription] [nvarchar](100) NOT NULL,
	[roomPrice] [float] NOT NULL,
	[image] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoom] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblService]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblService](
	[serviceId] [int] NOT NULL,
	[electronicDetail] [nvarchar](500) NOT NULL,
	[waterDetail] [nvarchar](500) NOT NULL,
	[electronicPrice] [float] NOT NULL,
	[waterPrice] [float] NOT NULL,
	[roomId] [int] NULL,
 CONSTRAINT [PK_Service1] PRIMARY KEY CLUSTERED 
(
	[serviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 7/15/2022 1:18:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[email] [nvarchar](400) NOT NULL,
	[address] [nvarchar](20) NULL,
	[phone] [nvarchar](10) NULL,
	[citizenIdentification] [nvarchar](12) NULL,
	[status] [bit] NULL,
	[role] [nvarchar](20) NULL,
	[image] [nvarchar](400) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblBill] ON 

INSERT [dbo].[tblBill] ([billId], [billName], [detail]) VALUES (1, N'bill Thanh Toan phong 1', N'Tong So tien la : ....')
INSERT [dbo].[tblBill] ([billId], [billName], [detail]) VALUES (2, N'bill Thanh Toan phong 2', N'Tong So tien la : ....')
INSERT [dbo].[tblBill] ([billId], [billName], [detail]) VALUES (3, N'Bill booking', N'Bill booking room no 1from 2023-02-08to 2023-12-22 is 100.0$')
INSERT [dbo].[tblBill] ([billId], [billName], [detail]) VALUES (4, N'Bill booking', N'Bill booking room no 1from 2026-07-10to 2026-11-28 is 40.0$')
INSERT [dbo].[tblBill] ([billId], [billName], [detail]) VALUES (5, N'Bill booking', N'Bill booking room no 2from 2022-07-30to 2024-07-26 is 132.0$')
INSERT [dbo].[tblBill] ([billId], [billName], [detail]) VALUES (6, N'Bill booking', N'Bill booking room no 3from 2022-07-16to 2022-11-25 is 80.0$')
INSERT [dbo].[tblBill] ([billId], [billName], [detail]) VALUES (7, N'Bill booking', N'Bill booking room no 4from 2022-07-23to 2022-09-29 is 60.0$')
SET IDENTITY_INSERT [dbo].[tblBill] OFF
GO
INSERT [dbo].[tblBillDetail] ([billId], [roomId], [date], [feeId], [serviceId]) VALUES (3, 1, N'13/07/2022', 1, NULL)
INSERT [dbo].[tblBillDetail] ([billId], [roomId], [date], [feeId], [serviceId]) VALUES (4, 1, N'14/07/2022', 2, NULL)
INSERT [dbo].[tblBillDetail] ([billId], [roomId], [date], [feeId], [serviceId]) VALUES (5, 2, N'15/07/2022', 3, NULL)
INSERT [dbo].[tblBillDetail] ([billId], [roomId], [date], [feeId], [serviceId]) VALUES (6, 3, N'15/07/2022', 4, NULL)
INSERT [dbo].[tblBillDetail] ([billId], [roomId], [date], [feeId], [serviceId]) VALUES (7, 4, N'15/07/2022', 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[tblBooking] ON 

INSERT [dbo].[tblBooking] ([bookingId], [username], [bookingDate]) VALUES (27, N'phatphse150445@fpt.edu.vn', N'13/07/2022')
INSERT [dbo].[tblBooking] ([bookingId], [username], [bookingDate]) VALUES (28, N'phatphse150445@fpt.edu.vn', N'14/07/2022')
INSERT [dbo].[tblBooking] ([bookingId], [username], [bookingDate]) VALUES (29, N'phatphse150445@fpt.edu.vn', N'15/07/2022')
SET IDENTITY_INSERT [dbo].[tblBooking] OFF
GO
INSERT [dbo].[tblBookingDetail] ([roomId], [bookingId], [checkInDate], [checkOutDate]) VALUES (1, 27, N'2022-09-16', N'2022-11-25')
INSERT [dbo].[tblBookingDetail] ([roomId], [bookingId], [checkInDate], [checkOutDate]) VALUES (1, 27, N'2023-02-08', N'2023-12-22')
INSERT [dbo].[tblBookingDetail] ([roomId], [bookingId], [checkInDate], [checkOutDate]) VALUES (1, 27, N'2024-07-04', N'2024-09-26')
INSERT [dbo].[tblBookingDetail] ([roomId], [bookingId], [checkInDate], [checkOutDate]) VALUES (1, 28, N'2026-07-10', N'2026-11-28')
INSERT [dbo].[tblBookingDetail] ([roomId], [bookingId], [checkInDate], [checkOutDate]) VALUES (2, 29, N'2022-07-30', N'2024-07-26')
INSERT [dbo].[tblBookingDetail] ([roomId], [bookingId], [checkInDate], [checkOutDate]) VALUES (3, 29, N'2022-07-16', N'2022-11-25')
INSERT [dbo].[tblBookingDetail] ([roomId], [bookingId], [checkInDate], [checkOutDate]) VALUES (4, 29, N'2022-07-23', N'2022-09-29')
GO
SET IDENTITY_INSERT [dbo].[tblFeedback] ON 

INSERT [dbo].[tblFeedback] ([feedbackId], [feedbackName], [username], [status]) VALUES (14, N'Phong nay co gian', N'nguyen', 1)
INSERT [dbo].[tblFeedback] ([feedbackId], [feedbackName], [username], [status]) VALUES (16, N'Ben canh phong em on qua em khong hoc bai duoc', N'hungphatne1', 1)
SET IDENTITY_INSERT [dbo].[tblFeedback] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFeedbackReply] ON 

INSERT [dbo].[tblFeedbackReply] ([id], [contentReply], [username]) VALUES (1, N'Thank you for your feedback, we will solve your problem as soon as possible', N'nguyen')
INSERT [dbo].[tblFeedbackReply] ([id], [contentReply], [username]) VALUES (2, N'Thank you for your feedback, we will solve your problem as soon as possible', N'nguyen')
INSERT [dbo].[tblFeedbackReply] ([id], [contentReply], [username]) VALUES (3, N'Thank you for your feedback, we will solve your problem as soon as possible', N'nguyen')
INSERT [dbo].[tblFeedbackReply] ([id], [contentReply], [username]) VALUES (4, N'Thank you for your feedback, we will solve your problem as soon as possible', N'nguyen')
INSERT [dbo].[tblFeedbackReply] ([id], [contentReply], [username]) VALUES (5, N'Thank you for your feedback, we will solve your problem as soon as possible', N'hungphatne1')
INSERT [dbo].[tblFeedbackReply] ([id], [contentReply], [username]) VALUES (6, N'Thank you for your feedback, we will solve your problem as soon as possible', N'nguyen')
SET IDENTITY_INSERT [dbo].[tblFeedbackReply] OFF
GO
SET IDENTITY_INSERT [dbo].[tblFees] ON 

INSERT [dbo].[tblFees] ([feeId], [detail], [feesPrice]) VALUES (1, N'Fee booking room no 1from 2023-02-08to 2023-12-22', 100)
INSERT [dbo].[tblFees] ([feeId], [detail], [feesPrice]) VALUES (2, N'Fee booking room no 1from 2026-07-10to 2026-11-28', 40)
INSERT [dbo].[tblFees] ([feeId], [detail], [feesPrice]) VALUES (3, N'Fee booking room no 2from 2022-07-30to 2024-07-26', 132)
INSERT [dbo].[tblFees] ([feeId], [detail], [feesPrice]) VALUES (4, N'Fee booking room no 3from 2022-07-16to 2022-11-25', 80)
INSERT [dbo].[tblFees] ([feeId], [detail], [feesPrice]) VALUES (5, N'Fee booking room no 4from 2022-07-23to 2022-09-29', 60)
SET IDENTITY_INSERT [dbo].[tblFees] OFF
GO
SET IDENTITY_INSERT [dbo].[tblNotification] ON 

INSERT [dbo].[tblNotification] ([notificationId], [notificationName], [detail], [username]) VALUES (2, N'Room fee', N'Room rate on August 13, 2022', N'nguyen')
INSERT [dbo].[tblNotification] ([notificationId], [notificationName], [detail], [username]) VALUES (5, N'Regulation 12', N'Hostel Management send a warning to you, if you repeat the offense, we will review and punish you according to regulations', N'phatphse150445@fpt.edu.vn')
INSERT [dbo].[tblNotification] ([notificationId], [notificationName], [detail], [username]) VALUES (6, N'Regulation 12', N'Hostel Management send a warning to you, if you repeat the offense, we will review and punish you according to regulations', N'phatphse150445@fpt.edu.vn')
INSERT [dbo].[tblNotification] ([notificationId], [notificationName], [detail], [username]) VALUES (7, N'Regulation 12', N'Hostel Management send a warning to you, if you repeat the offense, we will review and punish you according to regulations', N'phatphse150445@fpt.edu.vn')
SET IDENTITY_INSERT [dbo].[tblNotification] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRegulation] ON 

INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (1, N'Regulation 1', N'SỬ DỤNG, TÀN TRỮ, BUÔN BÁN CHẤT KÍCH THÍCH DƯỚI MỌI HÌNH THỨC')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (2, N'Regulation 2', N'GÂY GỔ ĐÁNH NHAU, LÀM MẤT ĐOÀN KẾT, MẤT TRẬT TỰ AN NINH TRONG TOÀ NHÀ')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (3, N'Regulation 3', N'KINH DOANH BUÔN BÁN CÁC LOẠI MẶT HÀNG DỄ CHÁY NỔ TRONG TOÀ NHÀ')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (4, N'Regulation 4', N'ĐỐT TIỀN VÀNG, VÀNG MÃ TRONG TOÀ NHÀ')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (5, N'Regulation 5', N'KHẠC NHỔ, HÚT THUỐC LÁ TRONG THANG MÁY')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (8, N'Regulation 6', N'KHÔNG MUA BÁN DÂM DƯỚI MỌI HÌNH THỨC TRONG NHÀ')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (9, N'Regulation 7', N'GIỮ GÌN VỆ SINH CHUNG, KHÔNG QUẢNG CÁO, VẼ BẬY HOẶC SƠN LINH TINH TRONG PHÒNG VÀ CÁC KHU BÊN TRONG TOÀ NHÀ')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (10, N'Regulation 8', N'KHÔNG CHỨA CHẤP TỘI PHẠM, CÁC PHÒNG CÓ KHÁCH Ở NHÀ QUA ĐÊM HOẶC TỚI CHƠI ĐỀU PHẢI KHAI BÁO CHO CHỦ TRỌ HOẶC QUẢN LÝ')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (11, N'Regulation 9', N'MỌI NGƯỜI TRONG NHÀ ĐỀU PHẢI CÓ Ý THỨC ĐỂ XE GỌN GÀNG, NGĂN NẮP, ĐÚNG NƠI QUY ĐỊNH')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (12, N'Regulation 10', N'CẤM PHÁ, THÁO DỠ CÁC ĐỒ DÙNG, CÁC PHẦN THIẾT BỊ LIÊN QUAN ĐẾN KẾT CẤU TOÀ NHÀ')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (13, N'Regulation 11', N'DÂN CƯ TRONG TOÀ NHÀ ĐI NHẸ, NÓI KHẼ, KHÔNG BẬT NHẠC LỚN GÂY ỒN ÀO ẢNH HƯỞNG ĐẾN MỌI NGƯỜI XUNG QUANH')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (14, N'Regulation 12', N'KHÔNG TỔ CHỨC ĂN NHẬU QUÁ 22H, KHÔNG ĐÁNH BẠC VỚI MỌI HÌNH THỨC')
INSERT [dbo].[tblRegulation] ([regulationId], [regulationName], [regualtionDetail]) VALUES (15, N'Regulation 14', N'CƯ DÂN RA VÀO PHẢI ĐÓNG CỬA CỔNG CẨN THẬN, KHI XẢY RA MẤT MÁT TÀI SẢN CỦA KHÁCH TRỌ HOẶC TÀI SẢN CỦA TOÀ NHÀ THÌ NGƯỜI KHÔNG ĐÓNG CỬA SẼ PHẢI CHỊU TRÁCH NHIỆM')
SET IDENTITY_INSERT [dbo].[tblRegulation] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoom] ON 

INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (1, N'ROOM 1 BED', 50, N'room1bed.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (2, N'ROOM 1 BED', 55, N'room1bed2.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (3, N'ROOM 2 BED', 100, N'room2bed3.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (4, N'ROOM 3 BED', 150, N'room3bed.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (5, N'ROOM 4 BED ', 500, N'room4bed.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (6, N'ROOM 3 BED', 450, N'room3bed.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (7, N'ROOM 2 BED', 500, N'room2bed.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (8, N'ROOM 4 BED', 1000, N'room4bed.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (9, N'ROOM 1 BED VIP', 1500, N'room1bedvip1.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (10, N'ROOM 1 BED VIP', 30, N'room1bedvip.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (11, N'ROOM 1 BED ', 50, N'room1bed3.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (12, N'ROOM 2 BED', 100, N'room2bed2.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (13, N'ROOM 2 BED', 120, N'room2bed4.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (14, N'ROOM 2 BED ', 105, N'room2bed5.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (15, N'ROOM 4 BED', 900, N'room4bed1.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (16, N'ROOM 4 BED ', 700, N'room4bed2.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (17, N'ROOM 4 BED ', 800, N'room4bed3.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (18, N'ROOM 1 BED ', 1000, N'room1bedvip2.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (19, N'ROOM 1 BED VIP', 1000, N'room1bedvip3.jpg', N'NB')
INSERT [dbo].[tblRoom] ([roomId], [roomDescription], [roomPrice], [image], [status]) VALUES (20, N'ROOM 1 BED VIP ', 1000, N'room1bedvip4.jpg', N'NB')
SET IDENTITY_INSERT [dbo].[tblRoom] OFF
GO
INSERT [dbo].[tblService] ([serviceId], [electronicDetail], [waterDetail], [electronicPrice], [waterPrice], [roomId]) VALUES (1, N'101', N'10m3', 101, 10, 1)
INSERT [dbo].[tblService] ([serviceId], [electronicDetail], [waterDetail], [electronicPrice], [waterPrice], [roomId]) VALUES (2, N'401', N'30m3', 401, 30, 2)
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (16, N'admin', N'1', N'admin', N'admin@gmail.com', NULL, NULL, NULL, 1, N'AD', NULL)
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (3, N'HoangHai', N'123', N'Nguyen Hoang Hai', N'nguyenbkse151446@fpt.edu.vn', N'Vinhome Grand Park', N'0981321039', N'079201018738', 1, N'US', N'assets/images/userImage/user-default.png')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (13, N'hostelmanagementad@gmail.com', N'1', N'Nguyen', N'hostelmanagementad@gmail.com', N'', N'', N'', 1, N'USGOOGLE', N'https://lh3.googleusercontent.com/a/AATXAJxyvFD3sHAsGHsQyk_y9Gfyxf7RG-NRFjkRSh5e=s96-c')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (19, N'hungphat', N'123', N'Pham Hung Phuc', N'phatphse15044@gmail.com', N'Bac Lieu', N'0833231856', N'123123781', 1, N'STAFF', N'blog-1.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (30, N'hungphatne1', N'123', N'Pham Phat', N'phatphse1505@gmail.com', N'15A Tan Hoa 2 ', N'0833231851', N'123123123', 1, N'US', N'blog-2.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (22, N'hungphatpl1', N'1', N'Bui Khoi Nguyen', N'nguyenvathuan@gmail.com', N'15A Tan Hoa 2 ', N'0833231853', N'123123123123', 1, N'STAFF', N'blog-3.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (24, N'hungphatpl15', N'1', N'Bui Khoi Nguyen', N'thuanminhse15044@gmail.com', N'15A Tan Hoa 2 ', N'0988987656', N'123123123', 1, N'STAFF', N'3-480x880.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (17, N'machao86960@gmail.com', N'1', N'Thuận', N'machao86960@gmail.com', N'', N'', N'', 1, N'USGOOGLE', N'https://lh3.googleusercontent.com/a-/AOh14GgRjGwypX3KqDENRElASWe13nxFCm74qWV1l2T_6Q=s96-c')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (1, N'nguyen', N'1', N'BUI KHOI NGUYEN', N'buikhoinguyen2001@gmail.com', N'Quan 10', N'0903314123', N'123124126', 1, N'US', N'assets/images/userImage/nguyen.png')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (25, N'nguyen123', N'1', N'Bui Khoi Nguyen', N'phatphse1504456@gmail.com', N'15A Tan Hoa 2 A', N'0833231852', N'123123123123', 1, N'STAFF', N'7-480x880.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (12, N'nguyenbkse151446@fpt.edu.vn', N'1', N'Bui Khoi Nguyen', N'nguyenbkse151446@fpt.edu.vn', N'', N'', N'', 1, N'USGOOGLE', N'https://lh3.googleusercontent.com/a-/AOh14Gh9U4H7yEJ3hUwGN-L9bD7rE-uTBloZJ2YWXM19bQ=s96-c')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (20, N'nguyenle', N'123', N'Bui Khoi Nguyen', N'phatphse1504456@gmail.com', N'15A Tan Hoa 2 ', N'0833231856', N'123123123', 1, N'STAFF', N'home-slide-1.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (26, N'nguyenle123', N'1', N'Bui Khoi Nguyen', N'haiprovjp@gmail.com', N'15A Tan Hoa 2 ', N'0833231852', N'123123123123', 1, N'STAFF', N'7-480x880.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (21, N'phatphse', N'123', N'Pham Hung Phat', N'phatphse1505@gmail.com', N'15A Tan Hoa 2 ', N'0833231852', N'123123123', 1, N'STAFF', N'blog-4.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (29, N'phatphse150445@fpt.edu.vn', N'1', N'Pham Hung Phat', N'phatphse150445@fpt.edu.vn', N'', N'', N'', 1, N'USGOOGLE', N'https://lh3.googleusercontent.com/a-/AFdZucop-rpk9f_e78vhkAhyF1n7UNWh5P8I6mIKmC2cEg=s96-c')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (14, N'staff', N'1 ', N'Hoang Minh Thien', N'thuanminhse15044@gmail.com', N'15A Tan Hoa 2 ', N'0988987656', N'123345234', 1, N'STAFF', NULL)
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (23, N'staff1', N'1', N'Bui Khoi Nguyen', N'nguyenvathuan@gmail.com', N'15A Tan Hoa 2 ', N'0833231852', N'123123123', 1, N'STAFF', N'7-480x880.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (27, N'staff2', N'1', N'Nguyen Hoang Hai', N'nguyenvathuan@gmail.com', N'15A Tan Hoa 2 ', N'0833231851', N'123123123', 1, N'STAFF', N'5-480x880.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (28, N'staff45', N'123', N'BUI KHOI NGUYEN A', N'thuanminhse15044@gmail.com', N'Bac Lieu Soc Trang', N'0833231856', N'123123123', 1, N'STAFF', N'4-480x880.jpg')
INSERT [dbo].[tblUser] ([idUser], [username], [password], [fullName], [email], [address], [phone], [citizenIdentification], [status], [role], [image]) VALUES (18, N'thuanhmse151387@fpt.edu.vn', N'1', N'Hoang Minh Thuan', N'thuanhmse151387@fpt.edu.vn', N'', N'', N'', 1, N'USGOOGLE', N'https://lh3.googleusercontent.com/a-/AFdZucrlaWquviG85IxXPl879FGt-HGjtUF4SGbuMnZ_-w=s96-c')
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBillDetail_tblBill] FOREIGN KEY([billId])
REFERENCES [dbo].[tblBill] ([billId])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [FK_tblBillDetail_tblBill]
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBillDetail_tblFees] FOREIGN KEY([feeId])
REFERENCES [dbo].[tblFees] ([feeId])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [FK_tblBillDetail_tblFees]
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBillDetail_tblRoom] FOREIGN KEY([roomId])
REFERENCES [dbo].[tblRoom] ([roomId])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [FK_tblBillDetail_tblRoom]
GO
ALTER TABLE [dbo].[tblBillDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBillDetail_tblService] FOREIGN KEY([serviceId])
REFERENCES [dbo].[tblService] ([serviceId])
GO
ALTER TABLE [dbo].[tblBillDetail] CHECK CONSTRAINT [FK_tblBillDetail_tblService]
GO
ALTER TABLE [dbo].[tblBooking]  WITH CHECK ADD  CONSTRAINT [FK_tblBooking_tblUser] FOREIGN KEY([username])
REFERENCES [dbo].[tblUser] ([username])
GO
ALTER TABLE [dbo].[tblBooking] CHECK CONSTRAINT [FK_tblBooking_tblUser]
GO
ALTER TABLE [dbo].[tblBookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBookingDetail_tblBooking] FOREIGN KEY([bookingId])
REFERENCES [dbo].[tblBooking] ([bookingId])
GO
ALTER TABLE [dbo].[tblBookingDetail] CHECK CONSTRAINT [FK_tblBookingDetail_tblBooking]
GO
ALTER TABLE [dbo].[tblBookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblBookingDetail_tblRoom] FOREIGN KEY([roomId])
REFERENCES [dbo].[tblRoom] ([roomId])
GO
ALTER TABLE [dbo].[tblBookingDetail] CHECK CONSTRAINT [FK_tblBookingDetail_tblRoom]
GO
ALTER TABLE [dbo].[tblFeedback]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedback_tblUser] FOREIGN KEY([username])
REFERENCES [dbo].[tblUser] ([username])
GO
ALTER TABLE [dbo].[tblFeedback] CHECK CONSTRAINT [FK_tblFeedback_tblUser]
GO
ALTER TABLE [dbo].[tblFeedbackReply]  WITH CHECK ADD  CONSTRAINT [FK_tblFeedbackReply_tblUser1] FOREIGN KEY([username])
REFERENCES [dbo].[tblUser] ([username])
GO
ALTER TABLE [dbo].[tblFeedbackReply] CHECK CONSTRAINT [FK_tblFeedbackReply_tblUser1]
GO
ALTER TABLE [dbo].[tblNotification]  WITH CHECK ADD  CONSTRAINT [FK_tblNotification_tblUser] FOREIGN KEY([username])
REFERENCES [dbo].[tblUser] ([username])
GO
ALTER TABLE [dbo].[tblNotification] CHECK CONSTRAINT [FK_tblNotification_tblUser]
GO
ALTER TABLE [dbo].[tblPayment]  WITH CHECK ADD  CONSTRAINT [FK_tblPayment_tblUser] FOREIGN KEY([username])
REFERENCES [dbo].[tblUser] ([username])
GO
ALTER TABLE [dbo].[tblPayment] CHECK CONSTRAINT [FK_tblPayment_tblUser]
GO
USE [master]
GO
ALTER DATABASE [HostelManagement] SET  READ_WRITE 
GO
