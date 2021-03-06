USE [master]
GO
/****** Object:  Database [HRMCore]    Script Date: 03/05/2015 21:26:47 ******/
CREATE DATABASE [HRMCore] ON  PRIMARY 
( NAME = N'HRMCore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\iHRP_VBL.mdf' , SIZE = 5120000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'HRMCore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\iHRP_VBL_1.ldf' , SIZE = 20096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HRMCore] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRMCore].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [HRMCore] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HRMCore] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HRMCore] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HRMCore] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HRMCore] SET ARITHABORT OFF
GO
ALTER DATABASE [HRMCore] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HRMCore] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HRMCore] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HRMCore] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HRMCore] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HRMCore] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HRMCore] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HRMCore] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HRMCore] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HRMCore] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HRMCore] SET  DISABLE_BROKER
GO
ALTER DATABASE [HRMCore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HRMCore] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HRMCore] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HRMCore] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HRMCore] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HRMCore] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [HRMCore] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HRMCore] SET  READ_WRITE
GO
ALTER DATABASE [HRMCore] SET RECOVERY SIMPLE
GO
ALTER DATABASE [HRMCore] SET  MULTI_USER
GO
ALTER DATABASE [HRMCore] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HRMCore] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'HRMCore', N'ON'
GO
USE [HRMCore]
GO
/****** Object:  User [traning]    Script Date: 03/05/2015 21:26:47 ******/
CREATE USER [traning] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [training]    Script Date: 03/05/2015 21:26:47 ******/
CREATE USER [training] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[tblLS_Language]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Language](
	[LSLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[LSLanguageCode] [nvarchar](12) NULL,
	[Name] [nvarchar](200) NULL,
	[VNName] [nvarchar](200) NULL,
	[Note] [nvarchar](200) NULL,
	[IsLanguage] [bit] NULL,
	[Rank] [int] NULL,
	[Used] [bit] NULL,
 CONSTRAINT [PK_tblLS_Language] PRIMARY KEY CLUSTERED 
(
	[LSLanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_JobTitle]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_JobTitle](
	[JobTitleID] [int] IDENTITY(1,1) NOT NULL,
	[JobTitleCode] [nvarchar](50) NULL,
	[JobTitleName] [nvarchar](500) NOT NULL,
	[JobTitleNameVN] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblLS_JobTitle] PRIMARY KEY CLUSTERED 
(
	[JobTitleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_JobTitle] ON [dbo].[tblLS_JobTitle] 
(
	[JobTitleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_JobLevel]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_JobLevel](
	[JobLevelID] [int] IDENTITY(1,1) NOT NULL,
	[JobLevelCode] [nvarchar](50) NULL,
	[JobLevelName] [nvarchar](200) NULL,
	[JobLevel] [int] NULL,
 CONSTRAINT [PK_tblLS_JobLevel] PRIMARY KEY CLUSTERED 
(
	[JobLevelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_tblLS_JobLevel] UNIQUE NONCLUSTERED 
(
	[JobLevelCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_JobLevel] ON [dbo].[tblLS_JobLevel] 
(
	[JobLevelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Gender]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Gender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderCode] [nvarchar](50) NOT NULL,
	[GenderName] [nvarchar](500) NOT NULL,
	[Rank] [int] NULL,
 CONSTRAINT [PK_tblLS_Gender] PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_CourseType]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_CourseType](
	[CourseTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CourseTypeName] [nvarchar](500) NOT NULL,
	[Rank] [int] NULL,
	[Used] [bit] NOT NULL,
 CONSTRAINT [PK_tblLS_CourseType] PRIMARY KEY CLUSTERED 
(
	[CourseTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_CourseType] ON [dbo].[tblLS_CourseType] 
(
	[CourseTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Provider]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLS_Provider](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderCode] [char](18) NOT NULL,
	[ProviderName] [nvarchar](500) NOT NULL,
	[Address] [nvarchar](1000) NULL,
	[Telephone] [char](18) NULL,
	[Email] [nvarchar](500) NULL,
	[Website] [nvarchar](50) NULL,
	[Remark] [nvarchar](1000) NULL,
	[Rank] [int] NULL,
	[Used] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_Provider] ON [dbo].[tblLS_Provider] 
(
	[ProviderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_ProEvalCategory]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_ProEvalCategory](
	[ProEvalCateID] [int] IDENTITY(1,1) NOT NULL,
	[ProEvalCateName] [nvarchar](500) NOT NULL,
	[Weight] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_ProEvalCategory] ON [dbo].[tblLS_ProEvalCategory] 
(
	[ProEvalCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_OverTrainEffCategory]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_OverTrainEffCategory](
	[OverTrainEffCateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](500) NOT NULL,
	[A_Weight] [int] NOT NULL,
	[B_Weight] [int] NOT NULL,
	[C_Weight] [int] NOT NULL,
	[A_Desc] [nvarchar](500) NULL,
	[B_Desc] [nvarchar](500) NULL,
	[C_Desc] [nvarchar](500) NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_OverTrainEffCategory] ON [dbo].[tblLS_OverTrainEffCategory] 
(
	[OverTrainEffCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Message]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Message](
	[MsgID] [int] IDENTITY(1,1) NOT NULL,
	[MsgCode] [int] NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[Used] [bit] NOT NULL,
 CONSTRAINT [PK_tblLS_Message] PRIMARY KEY CLUSTERED 
(
	[MsgID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblLS_Message] ON [dbo].[tblLS_Message] 
(
	[MsgCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_LossCategory]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_LossCategory](
	[LossCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[LossCategoryName] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tblLS_LossCategory] PRIMARY KEY CLUSTERED 
(
	[LossCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_LnEvalCateGroup]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_LnEvalCateGroup](
	[LnEvalCateGroupID] [int] IDENTITY(1,1) NOT NULL,
	[CateNo] [int] NOT NULL,
	[GroupName] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_LnEvalCateGroup] ON [dbo].[tblLS_LnEvalCateGroup] 
(
	[LnEvalCateGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_ChkLstCategoryGroup]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_ChkLstCategoryGroup](
	[ChkLstCateGroupID] [int] IDENTITY(1,1) NOT NULL,
	[ChkLstCateGroupName] [nvarchar](500) NOT NULL,
	[Rank] [int] NULL,
	[Used] [bit] NOT NULL,
 CONSTRAINT [PK_tblLS_ChkLstCategoryGroup] PRIMARY KEY CLUSTERED 
(
	[ChkLstCateGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Roles]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](500) NOT NULL,
	[Level] [int] NOT NULL,
 CONSTRAINT [PK_tblLS_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_ReviewAction]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_ReviewAction](
	[ReviewActionID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewActionName] [nvarchar](500) NOT NULL,
	[ReviewActionCode] [int] NULL,
 CONSTRAINT [PK_tblLS_RequestStatus] PRIMARY KEY CLUSTERED 
(
	[ReviewActionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_OverTrainEff]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_OverTrainEff](
	[OverTrainEff_ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[No] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [XPKtblTR_OverTrainEff] PRIMARY KEY NONCLUSTERED 
(
	[OverTrainEff_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_LearningEvalDetail]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_LearningEvalDetail](
	[LnEval_ID] [int] NOT NULL,
	[Value] [nvarchar](500) NULL,
	[LnEvalCateID] [int] NOT NULL,
 CONSTRAINT [PK_tblTR_LearningEvalDetail] PRIMARY KEY CLUSTERED 
(
	[LnEval_ID] ASC,
	[LnEvalCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_LearningEval]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_LearningEval](
	[LnEval_ID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [XPKtblTR_LearningEval] PRIMARY KEY NONCLUSTERED 
(
	[LnEval_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_BusImpEval]    Script Date: 03/05/2015 21:26:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_BusImpEval](
	[BusImpEval_ID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[Value1] [bit] NULL,
	[Value2] [int] NULL,
	[Value3] [nvarchar](500) NULL,
	[Value4] [nvarchar](500) NULL,
	[LineMgrEmpID] [int] NULL,
 CONSTRAINT [XPKtblTR_BusImpEval] PRIMARY KEY NONCLUSTERED 
(
	[BusImpEval_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblSYS_UserPermission]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  view [dbo].[tblSYS_UserPermission]
			as
select * from HRMCore_SYS..tblSYS_UserPermission
GO
/****** Object:  View [dbo].[tblSYS_UserGroup]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  view [dbo].[tblSYS_UserGroup]
			as
select * from HRMCore_SYS..tblSYS_UserGroup
GO
/****** Object:  View [dbo].[tblSYS_User]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  view [dbo].[tblSYS_User]
			as
			select * from HRMCore_SYS..tblSYS_User
GO
/****** Object:  View [dbo].[tblSYS_Menu]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  view [dbo].[tblSYS_Menu]
			as
select * from HRMCore_SYS..tblSYS_Menu
GO
/****** Object:  View [dbo].[tblSYS_GroupRight]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  view [dbo].[tblSYS_GroupRight]
			as
select * from HRMCore_SYS..tblSYS_GroupRight
GO
/****** Object:  View [dbo].[tblSYS_Group]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  view [dbo].[tblSYS_Group]
			as
select * from HRMCore_SYS..tblSYS_Group
GO
/****** Object:  Table [dbo].[tblMail_OTE_Evaluation_Daily]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMail_OTE_Evaluation_Daily](
	[OverTrainEff_ID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EffDate] [datetime] NULL,
 CONSTRAINT [PK_tblMail_OTE_Evaluation_Daily] PRIMARY KEY CLUSTERED 
(
	[OverTrainEff_ID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMail_LearningEvaluation]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMail_LearningEvaluation](
	[ResultID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EffDate] [datetime] NULL,
 CONSTRAINT [PK_tblMail_LearningEvaluation] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMail_BusImpEvaluation_Daily]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMail_BusImpEvaluation_Daily](
	[ResultID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EffDate] [datetime] NULL,
 CONSTRAINT [PK_tblMail_BusImpEvaluation_Daily] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMail_BusImpEvaluation_6Month]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMail_BusImpEvaluation_6Month](
	[ResultID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EffDate] [datetime] NULL,
 CONSTRAINT [PK_tblMail_BusImpEvaluation_6Month] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Skill]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Skill](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[SkillName] [nvarchar](500) NULL,
	[Level] [int] NOT NULL,
	[Rank] [int] NULL,
	[Used] [bit] NULL,
 CONSTRAINT [PK_tblLS_Skill] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_Skill] ON [dbo].[tblLS_Skill] 
(
	[SkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_TrainingStatus]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_TrainingStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
	[Rank] [int] NULL,
 CONSTRAINT [PK_tblLS_TrainingStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_OverTrainEffLM]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_OverTrainEffLM](
	[OverTrainEff_ID] [int] NOT NULL,
	[LineManager] [int] NOT NULL,
 CONSTRAINT [PK_tblTR_OverTrainEffLM] PRIMARY KEY CLUSTERED 
(
	[OverTrainEff_ID] ASC,
	[LineManager] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Table]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Table](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[TableHeader] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tblLS_Table] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_SystemParam]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_SystemParam](
	[ParamID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
	[Unit] [nvarchar](500) NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_SystemParam] ON [dbo].[tblLS_SystemParam] 
(
	[ParamID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Status]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](500) NOT NULL,
	[Rank] [int] NULL,
 CONSTRAINT [PK_vLS_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_ReactionEval]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_ReactionEval](
	[ReactionEval_ID] [int] IDENTITY(1,1) NOT NULL,
	[Filename] [nvarchar](255) NULL,
	[FileLink] [nvarchar](500) NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [XPKtblTR_ReactionEval] PRIMARY KEY NONCLUSTERED 
(
	[ReactionEval_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_TrainingRequest]    Script Date: 03/05/2015 21:26:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_TrainingRequest](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[Year] [int] NULL,
	[OtherCourse] [nvarchar](500) NULL,
	[IsTeam] [bit] NULL,
	[Reason] [nvarchar](500) NULL,
	[MailNotify] [bit] NOT NULL,
	[EmployeeID] [int] NULL,
	[CourseType] [int] NULL,
	[Comment] [nvarchar](500) NULL,
	[UpdateEmployeeID] [int] NULL,
 CONSTRAINT [XPKtblTR_TrainingRequest] PRIMARY KEY NONCLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetDataCombo]    Script Date: 03/05/2015 21:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[sp_GetDataCombo]
@TableName nvarchar(4000) = '', -- PhuongDK sua tang len 4000
@Fields nvarchar(4000) = null,
@Where nvarchar(500)= ' and 1 = 1 ',-- ' and isnull(used,0) = 1 ',
@Sort nvarchar(50) = ' Name ',
@Sql nvarchar(50) = ''
AS
declare @Exesql as nvarchar(4000)

if @Sql <> ''
	exec (@sql)
else
begin
	print @Fields
	/*if CHARINDEX('VNName',@Fields)>0
		set @Fields= replace(@Fields,'VNName','VNName +  case used when 0 then ''<KSD>'' else '''' end')
	if CHARINDEX('Name as',@Fields)>0
		set @Fields= replace(@Fields,'Name as','Name +  case used when 0 then ''<NotUsed>'' else '''' end as')	
*/
	set @Exesql = 'Select ' + isnull(@Fields,'*') + ' from ' + @TableName + ' Where 1 = 1 ' + isnull(@Where,'') 
	if IsNull(@Sort,'') <> ''
	begin
		set @Exesql = @Exesql +  ' order by ' + @Sort
	end

	exec (@Exesql)
	-- sp_GetDataCombo @TableName='vLS_CourseType', @Fields='CourseTypeID as ID, CourseTypeName as Name', @Sort=''
	
	print @Exesql
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Common]    Script Date: 03/05/2015 21:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- sp_Common @ObjName=N'LS_sptblWelfare'  
-- sp_Common @ObjName=N'LS_tblWelfare'  
CREATE  PROCEDURE [dbo].[sp_Common]  
@ObjName nvarchar(500) = ''  
as  
SELECT syscolumns.name columnname,  
systypes.name datatype, syscolumns.length, syscolumns.prec as [size] 
,case systypes.type when 39 then 'IN' else 'OUT' end as IN_OUT 
from SysObjects JOIN syscolumns ON SysObjects.id = SysColumns.id  
JOIN systypes ON syscolumns.xtype = sysTypes.xtype  
Where systypes.name <> 'sysname' and SysObjects.name = @ObjName
GO
/****** Object:  Table [dbo].[SkillImport]    Script Date: 03/05/2015 21:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillImport](
	[MaNV] [float] NULL,
	[EmpID] [nvarchar](50) NULL,
	[Họ Tên] [nvarchar](255) NULL,
	[Per] [nvarchar](255) NULL,
	[SkillIDA] [int] NULL,
	[SkillA] [nvarchar](255) NULL,
	[SkillIDB] [int] NULL,
	[SkillB] [nvarchar](255) NULL,
	[SkillIDC] [int] NULL,
	[SkillC] [nvarchar](255) NULL,
	[SkillIDD] [int] NULL,
	[SkillD] [nvarchar](255) NULL,
	[Start] [float] NULL,
	[Actual] [float] NULL,
	[Target] [float] NULL,
	[Gap] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 03/05/2015 21:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[SkillName] [nvarchar](500) NULL,
	[Level] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertGenerator]    Script Date: 03/05/2015 21:26:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROC [dbo].[InsertGenerator]
(@tableName varchar(100)) as

--Declare a cursor to retrieve column specific information for the specified table
DECLARE cursCol CURSOR FAST_FORWARD FOR 
SELECT column_name,data_type FROM information_schema.columns WHERE table_name = @tableName
OPEN cursCol
DECLARE @string nvarchar(3000) --for storing the first half of INSERT statement
DECLARE @stringData nvarchar(3000) --for storing the data (VALUES) related statement
DECLARE @dataType nvarchar(1000) --data types returned for respective columns
SET @string='INSERT '+@tableName+'('
SET @stringData=''

DECLARE @colName nvarchar(50)

FETCH NEXT FROM cursCol INTO @colName,@dataType

IF @@fetch_status<>0
	begin
	print 'Table '+@tableName+' not found, processing skipped.'
	close curscol
	deallocate curscol
	return
END

WHILE @@FETCH_STATUS=0
BEGIN
IF @dataType in ('varchar','char','nchar','nvarchar')
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull('+@colName+','''')+'''''',''+'
	SET @stringData=@stringData+''''+'''+isnull(''N'''+'''''+'+@colName+'+'''''+''''',''NULL'')+'',''+'
END
ELSE
if @dataType in ('text','ntext') --if the datatype is text or something else 
BEGIN
	SET @stringData=@stringData+'''''''''+isnull(cast('+@colName+' as varchar(2000)),'''')+'''''',''+'
END
ELSE
IF @dataType = 'money' --because money doesn't get converted from varchar implicitly
BEGIN
	SET @stringData=@stringData+'''convert(money,''''''+isnull(cast('+@colName+' as varchar(200)),''0.0000'')+''''''),''+'
END
ELSE 
IF @dataType='datetime'
BEGIN
	--SET @stringData=@stringData+'''convert(datetime,''''''+isnull(cast('+@colName+' as varchar(200)),''0'')+''''''),''+'
	--SELECT 'INSERT Authorizations(StatusDate) VALUES('+'convert(datetime,'+isnull(''''+convert(varchar(200),StatusDate,121)+'''','NULL')+',121),)' FROM Authorizations
	--SET @stringData=@stringData+'''convert(money,''''''+isnull(cast('+@colName+' as varchar(200)),''0.0000'')+''''''),''+'
	SET @stringData=@stringData+'''convert(datetime,'+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+',121)+'''''+''''',''NULL'')+'',121),''+'
  --                             'convert(datetime,'+isnull(''''+convert(varchar(200),StatusDate,121)+'''','NULL')+',121),)' FROM Authorizations
END
ELSE 
IF @dataType='image' 
BEGIN
	SET @stringData=@stringData+'''''''''+isnull(cast(convert(varbinary,'+@colName+') as varchar(6)),''0'')+'''''',''+'
END
ELSE --presuming the data type is int,bit,numeric,decimal 
BEGIN
	--SET @stringData=@stringData+'''''''''+isnull(cast('+@colName+' as varchar(200)),''0'')+'''''',''+'
	--SET @stringData=@stringData+'''convert(datetime,'+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+',121)+'''''+''''',''NULL'')+'',121),''+'
	SET @stringData=@stringData+''''+'''+isnull('''''+'''''+convert(varchar(200),'+@colName+')+'''''+''''',''NULL'')+'',''+'
END

SET @string=@string+@colName+','

FETCH NEXT FROM cursCol INTO @colName,@dataType
END
DECLARE @Query nvarchar(4000)

SET @query ='SELECT '''+substring(@string,0,len(@string)) + ') VALUES(''+ ' + substring(@stringData,0,len(@stringData)-2)+'''+'')'' as result FROM '+@tableName
exec sp_executesql @query
--select @query

CLOSE cursCol
DEALLOCATE cursCol
GO
/****** Object:  UserDefinedFunction [dbo].[GetTableFromList]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetTableFromList]
                 (@list      nvarchar(MAX),
                  @delimiter nchar(1) = N'@')
      RETURNS @tbl TABLE (listNo int IDENTITY(1, 1) NOT NULL,
                          listValue     nvarchar(4000)      NOT NULL) AS
-- PhuongDK: 27/02/2009
BEGIN
	IF @list = ''
	BEGIN
		INSERT @tbl(listValue)
		  VALUES ('')
		RETURN;
	END
	
	-----------
   DECLARE @endpos   int,
           @startpos int,
           @textpos  int,
           @chunklen smallint,
           @tmpstr   nvarchar(4000),
           @leftover nvarchar(4000),
           @tmpval   nvarchar(4000)

   SET @textpos = 1
   SET @leftover = ''
   WHILE @textpos <= datalength(@list) / 2
   BEGIN
      SET @chunklen = 4000 - datalength(@leftover) / 2
      SET @tmpstr = @leftover + substring(@list, @textpos, @chunklen)
      SET @textpos = @textpos + @chunklen

      SET @startpos = 0
      SET @endpos = charindex(@delimiter COLLATE Slovenian_BIN2, @tmpstr)

      WHILE @endpos > 0
      BEGIN
         SET @tmpval = ltrim(rtrim(substring(@tmpstr, @startpos + 1,
                                             @endpos - @startpos - 1)))
         INSERT @tbl (listValue) VALUES(@tmpval)
         SET @startpos = @endpos
         SET @endpos = charindex(@delimiter COLLATE Slovenian_BIN2,
                                 @tmpstr, @startpos + 1)
      END

      SET @leftover = right(@tmpstr, datalength(@tmpstr) / 2 - @startpos)
   END

   INSERT @tbl(listValue)
      VALUES (ltrim(rtrim(@leftover)))
   RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnToDate]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnToDate]
(
	@strDate	nvarchar(10)
)
RETURNS datetime
AS
BEGIN
	DECLARE @DATE datetime	

	IF ISNULL(@strDate,'') = ''
	BEGIN
		SET @DATE = NULL
	END
	ELSE
	BEGIN
		SET @DATE= Convert(datetime,@strDate,103)
	END

	RETURN @DATE
END
GO
/****** Object:  StoredProcedure [dbo].[get_company_names_iter]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_company_names_iter] @customers nvarchar(2000) AS
       SELECT C.CustomerID, C.CompanyName
       FROM   Northwind.Customers C
       JOIN   iter_charlist_to_tbl(@customers, DEFAULT) s
         ON   C.CustomerID = s.nstr
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetDateOnly]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetDateOnly] ( @pInputDate    DATETIME )
RETURNS DATETIME
BEGIN
	-- PhuongDK: 04/06/2009 --> chi lay date, khong lay time
    --RETURN CAST(CONVERT(VARCHAR(10), @pInputDate, 111) AS DATETIME)
	 RETURN CONVERT(VARCHAR(10), @pInputDate, 111)


END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetDateOfMonth]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetDateOfMonth]
	(@intMonth	int,
	@intYear	int,
	@intType	int)
RETURNS varchar(20)
AS  
BEGIN 
	Declare @strDateOfMonth		varchar(20)
	if(@intType = 0) --First date of month
	begin
		Set @strDateOfMonth = DATEADD(mm,DATEDIFF(mm,0,Convert(DateTime, '01/'+RTRIM(LTRIM(STR(@intMonth)))+'/'+RTRIM(LTRIM(STR(@intYear))), 103)),0) 
	end
	else if(@intType = 1) --Last date of month
	begin
		Set @strDateOfMonth = DATEADD(ms,-3,DATEADD(mm,DATEDIFF(mm,0,Convert(DateTime, '01/'+RTRIM(LTRIM(STR(@intMonth)))+'/'+RTRIM(LTRIM(STR(@intYear))), 103))+1,0))
	end
	return @strDateOfMonth
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnConvertNumber]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    FUNCTION [dbo].[fnConvertNumber] (@ValueIn money)  
RETURNS nvarchar(100) AS  
BEGIN 
	DECLARE @DecimalNumber smallint
	DECLARE @DecimalChar varchar(5)
	DECLARE @SeperateChar varchar(5)
	DECLARE @ValueString nvarchar(100)
	DECLARE @ValueStringAfterDecimal nvarchar(100)
	DECLARE @ValueStringNew nvarchar(100)
	SET @DecimalNumber = 0
	SET @DecimalChar = '.'
	SET @SeperateChar = ','	
--	IF IsNull(@ValueIn, 0) = 0 RETURN '<p align=right>0</p>'
	IF IsNull(@ValueIn, 0) = 0 RETURN '0'
	SET @ValueString = Convert(nvarchar(100), @ValueIn)
	IF @ValueIn < 0 SET @ValueString = Substring(@ValueString, 2, Len(@ValueString) - 1) -- Bo dau tru

	SET @ValueStringAfterDecimal = SubString(@ValueString, CharIndex(@DecimalChar, @ValueString), @DecimalNumber + 3) -- Tinh luon dau cham
	IF @ValueStringAfterDecimal='.00' 
		set @DecimalNumber=0
	ELSE
		set @DecimalNumber=1
	SET @ValueString = SubString(@ValueString, 1, CharIndex(@DecimalChar, @ValueString) - 1)
	SET @ValueStringNew =''
	WHILE (Len(@ValueString) >3)
	BEGIN
		SET @ValueStringNew = @SeperateChar + RIGHT(@ValueString, 3) + @ValueStringNew
		SET @ValueString = SUBSTRING(@ValueString, 1, LEN(@ValueString) - 3)
	END
	IF @DecimalNumber <> 0 
		SET @ValueStringNew = @ValueString + @ValueStringNew + @ValueStringAfterDecimal
	ELSE
		SET @ValueStringNew = @ValueString + @ValueStringNew 
	
	IF @ValueIn < 0 SET @ValueStringNew = '-' + @ValueStringNew
--	SET @ValueStringNew = '<p align=right>' + @ValueStringNew + '</p>'
	SET @ValueStringNew = '' +  @ValueStringNew  + ''
	
	RETURN @ValueStringNew
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_SplitTwoCol]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_SplitTwoCol]
(
	@Text nvarchar(max),
	@delimiter nchar(1) = N'@'
)
returns table
as
return	

--DECLARE @FullName        VARCHAR(100)
--SET @FullName = '15@1'

SELECT SUBSTRING(@Text, 1, CHARINDEX('@', @Text) - 1) AS [Col1],
       SUBSTRING(@Text, CHARINDEX('@', @Text) + 1, LEN(@Text)) AS [Col2]

--select col1, col2 from fn_SplitTwoCol('15@1', default)
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetSkillPath]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetSkillPath]
(
@SkillID	int
)
RETURNS nvarchar(2000)
AS
BEGIN
 Declare @Result nvarchar(2000)


	RETURN ''

END
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_RequestStatus]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_RequestStatus]
( 
/*
Procedure: spfrmLS_RequestStatus
Desc:
	 Procedure for table: tblLS_RequestStatus
Author:
	...
Create date:
	18-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@StatusID	int = null,
@StatusName	nvarchar(500) = null,
@Rank	int = null,
@GroupCode	int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblLS_RequestStatus where StatusID = @StatusID)
	BEGIN
	 UPDATE tblLS_RequestStatus SET
		 [StatusName]  = @StatusName,
		 [Rank]  = @Rank
	 WHERE
		[StatusID] = @StatusID
	END
	ELSE
	BEGIN
		 INSERT INTO tblLS_RequestStatus ( [StatusName] , [Rank]  )
		 VALUES 
		( @StatusName, @Rank ) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_RequestStatus
	 WHERE
		[StatusID] = @StatusID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		StatusID,
		StatusName,
		Rank
	 FROM tblLS_RequestStatus
	 WHERE
		[StatusID] = @StatusID
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		StatusID,
		StatusName,
		Rank
	 FROM tblLS_RequestStatus
	 WHERE 1=1
		AND (IsNull([StatusName],'')  like N'%' + Isnull(@StatusName,'') + '%')
		AND ([Rank]  = @Rank or isnull( @Rank,'')='')
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		StatusID,
		StatusName,
		Rank
	 FROM tblLS_RequestStatus
	 ORDER BY Rank
END

ELSE IF @Activity ='GetByLineManager'
BEGIN
	 SELECT 
		StatusID,
		StatusName,
		Rank
	 FROM tblLS_RequestStatus
	 WHERE StatusID in (1,2,3)
	 ORDER BY Rank
END

ELSE IF @Activity ='GetByTraining'
BEGIN
	 SELECT 
		StatusID,
		StatusName,
		Rank
	 FROM tblLS_RequestStatus
	 WHERE StatusID in (2,4,5)
	 ORDER BY Rank
END

-- spfrmLS_RequestStatus @Activity ='GetByTraining'

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'

select * from tblLS_RequestStatus
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_Field]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[spfrmLS_Field]
@Activity			varchar(50),
@ID			int = null,
@FormDomainID	int = null,
@ReturnMess			nvarchar(500) = null out
AS

if @Activity = 'GetFieldByFormDomain'
	BEGIN
		select A.FieldID ID,A.[NameVN] [Name] 
		from tblLS_Field A
		join tblLS_FormField B On A.FieldID = B.FieldID
		where B.FormDomainID = @FormDomainID
		order by A.[Name]
	END

if @@Error <> 0
	BEGIN
		set	@ID = -1
		set	@ReturnMess = ''
	END
GO
/****** Object:  StoredProcedure [dbo].[spfrmHR_OriginFile]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmHR_OriginFile]
@Activity			varchar(50) = 'Delete',
@WorkingRecordID		int = null,
@EmployeeID int= null

,@User	nvarchar(255)=null
,@ReturnMess			nvarchar(500) = null out
AS
	declare @FromDateBefore datetime
	declare @FromDateAfter datetime
	

if @Activity = 'GetDataAll'
	BEGIN

		select * from tblLS_OriginFile
	END
GO
/****** Object:  Table [dbo].[tblASS_AssessEmp_Temp]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblASS_AssessEmp_Temp](
	[UserID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[AssID] [int] NULL,
 CONSTRAINT [PK_tblASS_AssessEmp_Temp] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblASS_CheckList]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblASS_CheckList](
	[CheckListID] [int] IDENTITY(1,1) NOT NULL,
	[Level] [int] NULL,
	[CheckListTempID] [int] NULL,
 CONSTRAINT [XPKtblASS_CheckList] PRIMARY KEY NONCLUSTERED 
(
	[CheckListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblASS_Assessment]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblASS_Assessment](
	[AssID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[No] [nvarchar](500) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[CompanyID] [int] NULL,
	[DeptID] [int] NULL,
 CONSTRAINT [XPKtblASS_Assessment] PRIMARY KEY NONCLUSTERED 
(
	[AssID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Company]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [nvarchar](12) NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[Rank] [int] NULL,
	[Used] [bit] NULL,
 CONSTRAINT [PK_tblLS_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_DocType]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_DocType](
	[DocTypeID] [int] IDENTITY(1,1) NOT NULL,
	[DocTypeName] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_DocType] ON [dbo].[tblLS_DocType] 
(
	[DocTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_DocDomain]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_DocDomain](
	[DocDomainID] [int] IDENTITY(1,1) NOT NULL,
	[DocDomainName] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_DocDomain] ON [dbo].[tblLS_DocDomain] 
(
	[DocDomainID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIMP_ErrorLog]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIMP_ErrorLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodeID] [int] NULL,
	[FileName] [nvarchar](50) NULL,
	[Rows] [int] NULL,
	[DateID] [datetime] NULL,
	[Status] [bit] NULL,
	[Error] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblIMP_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIMP_ConfigMapExcelStored]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIMP_ConfigMapExcelStored](
	[CodeID] [int] NOT NULL,
	[ColumnIndex] [int] NOT NULL,
	[ParamExcel] [nvarchar](50) NULL,
	[ParamStored] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblIMP_ConfigMapExcelStored] PRIMARY KEY CLUSTERED 
(
	[CodeID] ASC,
	[ColumnIndex] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblIMP_Config]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblIMP_Config](
	[CodeID] [int] NOT NULL,
	[Stored] [nvarchar](50) NULL,
	[Activity] [nvarchar](50) NULL,
	[fileTemplate] [nvarchar](100) NULL,
	[Note] [nchar](100) NULL,
 CONSTRAINT [PK_tblIMP_Config] PRIMARY KEY CLUSTERED 
(
	[CodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_AssRoles]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_AssRoles](
	[AssRoleID] [int] IDENTITY(1,1) NOT NULL,
	[AssRoleName] [nvarchar](500) NOT NULL,
	[Level] [int] NOT NULL,
 CONSTRAINT [PK_tblLS_AssRoles] PRIMARY KEY CLUSTERED 
(
	[AssRoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHR_EmployeeCourse]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHR_EmployeeCourse](
	[EmployeeID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_tblHR_EmployeeCourse] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDataTraineesList]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDataTraineesList](
	[ActiveCode] [bigint] NOT NULL,
	[EmployeeMaster] [nvarchar](20) NOT NULL,
	[Range] [nvarchar](20) NULL,
	[Department] [nvarchar](255) NULL,
	[Section] [nvarchar](255) NULL,
	[Level3] [bit] NULL,
	[DepartmentCode] [varchar](50) NULL,
	[SectionCode] [varchar](50) NULL,
 CONSTRAINT [PK_tblDataTraineesList] PRIMARY KEY CLUSTERED 
(
	[ActiveCode] ASC,
	[EmployeeMaster] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDataActiveCourse]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDataActiveCourse](
	[ActiveCode] [bigint] IDENTITY(1,1) NOT NULL,
	[CodeCourse] [nvarchar](20) NULL,
	[Month] [datetime] NULL,
	[CodeInstitute] [varchar](6) NULL,
	[CodeReason] [varchar](4) NULL,
	[CodeExperience] [varchar](10) NULL,
	[CodeGroup] [varchar](4) NULL,
	[CodeAccount] [varchar](10) NULL,
	[CodeSubType] [varchar](5) NULL,
	[DateStart] [datetime] NULL,
	[DateEnd] [datetime] NULL,
	[Cost] [float] NULL,
	[Rate] [float] NULL,
	[Amount] [float] NULL,
	[AmountNTe] [float] NULL,
	[AlreadyPaid] [float] NULL,
	[Hours] [float] NULL,
	[HourPerDay] [float] NULL,
	[Comment] [nvarchar](500) NULL,
	[Status] [varchar](20) NULL,
	[FeeOnPerson] [float] NULL,
	[FeeOnPersonNTe] [float] NULL,
	[ActionBy] [nvarchar](500) NULL,
	[NoDay] [int] NULL,
	[NoParticipant] [int] NULL,
	[DirectoryFile] [varchar](1000) NULL,
	[FollowUp] [bit] NULL,
	[DateFollowUp] [datetime] NULL,
 CONSTRAINT [PK_tblDataActiveCourse] PRIMARY KEY CLUSTERED 
(
	[ActiveCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCodeCourse]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCodeCourse](
	[Code] [nvarchar](20) NOT NULL,
	[Text] [nvarchar](60) NOT NULL,
	[Abbreviation] [varchar](10) NULL,
	[TextLocal] [nvarchar](100) NULL,
	[AbbreviationLocal] [varchar](10) NULL,
	[CategoryCode] [varchar](50) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_tblCodeCourse] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[zTest]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zTest](
	[TestDate] [datetime] NULL,
	[TestData] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_TrainingRequestWait]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_TrainingRequestWait](
	[RequestID] [int] NULL,
	[ReviewID] [int] NULL,
	[DelegateID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_TrainingRequestReview]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_TrainingRequestReview](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[ReviewActionCode] [int] NULL,
	[Comment] [nvarchar](500) NULL,
	[ReviewDate] [datetime] NULL,
	[DelegateID] [int] NULL,
 CONSTRAINT [PK_tblTR_TrainingRequestReview_1] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vLS_Status]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Status]
AS
SELECT     TOP (100) PERCENT StatusID, StatusName, Rank
FROM         dbo.tblLS_Status
ORDER BY Rank
GO
/****** Object:  View [dbo].[vLS_Skill]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Skill]
AS
SELECT     TOP (100) PERCENT SkillID, ParentID, SkillName, [Level], Rank, Used
FROM         dbo.tblLS_Skill
WHERE     (Used = 1)
ORDER BY [Level], Rank
GO
/****** Object:  View [dbo].[vLS_Provider]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Provider]
AS
SELECT     TOP (100) PERCENT ProviderID, ProviderCode, ProviderName, Address, Telephone, Email, Remark, Rank, Used
FROM         dbo.tblLS_Provider
WHERE     (Used = 1)
ORDER BY Rank, ProviderName
GO
/****** Object:  View [dbo].[vLS_JobTitle]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_JobTitle]
AS
SELECT     TOP (100) PERCENT JobTitleID, JobTitleName
FROM         dbo.tblLS_JobTitle
ORDER BY JobTitleName
GO
/****** Object:  View [dbo].[vLS_JobLevel]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_JobLevel]
AS
SELECT     TOP (100) PERCENT JobLevelID, JobLevelCode, JobLevelName, JobLevel
FROM         dbo.tblLS_JobLevel
ORDER BY JobLevelCode
GO
/****** Object:  View [dbo].[vLS_Company]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Company]
AS
SELECT     TOP (100) PERCENT CompanyID, CompanyCode, CompanyName, Rank
FROM         dbo.tblLS_Company
WHERE     (Used = 1)
ORDER BY Rank
GO
/****** Object:  View [dbo].[vLS_CourseType]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_CourseType]
AS
SELECT     TOP (100) PERCENT CourseTypeID, CourseTypeName, Rank, Used
FROM         dbo.tblLS_CourseType
WHERE     (Used = 1)
ORDER BY Rank, CourseTypeName
GO
/****** Object:  Table [dbo].[tblASS_ChkLstDetail]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblASS_ChkLstDetail](
	[Value] [bit] NOT NULL,
	[CheckListID] [int] NOT NULL,
	[ChkLstCateID] [int] NULL,
 CONSTRAINT [XPKtblASS_ChkLstDetail] PRIMARY KEY NONCLUSTERED 
(
	[CheckListID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_OverTrainEffCategory]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmTR_OverTrainEffCategory]
( 
/*
Procedure: spfrmTR_OverTrainEff
Desc:
	 Procedure for table: tblLS_OverTrainEffCategory
Author:
	 NgocLD
Create date:
	01-04-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@OverTrainEffCateID int = null,
@CateName nvarchar(500) = null,
@A_Weight int = null,
@B_Weight int = null,
@C_Weight int = null,


@OverTrainEff_ID	int = null,
@Year	int = null,
@Date	nvarchar(10) = null,
@No	int = null,
@Description	nvarchar(500) = null
) 
AS

IF @Activity ='GetDataAll'
BEGIN
	SELECT
		ROW_NUMBER() OVER (ORDER BY OverTrainEffCateID) AS STT,
		OverTrainEffCateID, 
		CateName,
		A_Weight,
		B_Weight,
		C_Weight,
		A_Desc,
		B_Desc,
		C_Desc
	FROM
		tblLS_OverTrainEffCategory
END


IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  Table [dbo].[tblLS_Dept]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Dept](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[DeptCode] [nvarchar](15) NOT NULL,
	[DeptName] [nvarchar](150) NOT NULL,
	[Rank] [smallint] NULL,
	[Remark] [nvarchar](255) NULL,
	[Used] [bit] NULL,
 CONSTRAINT [PK_tblLS_Dept] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblASS_AssessEmpSkill]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblASS_AssessEmpSkill](
	[AssID] [int] NOT NULL,
	[CheckListID] [int] NULL,
	[Start] [int] NULL,
	[Current] [int] NULL,
	[Target] [int] NULL,
	[EffDate] [datetime] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[UserID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblASS_AssessEmp]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblASS_AssessEmp](
	[AssID] [int] NOT NULL,
	[LineMgrEmpID] [int] NULL,
	[EmployeeID] [int] NOT NULL,
	[EmpStatus] [bit] NULL,
 CONSTRAINT [PK_tblASS_AssessEmp] PRIMARY KEY CLUSTERED 
(
	[AssID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spfrmIMP_Config]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmIMP_Config]
@Activity nvarchar(30) = null,  
@Language nvarchar(2) = 'EN',  
@CodeID	int = null,

@Note	nvarchar(200)=null

AS  
Begin
	if (@Activity = 'GetConfigID')
	begin
		select * from tblIMP_Config where CodeID = @CodeID
	end
	else if (@Activity = 'GetConfigMapID')
	begin
		select * from tblIMP_ConfigMapExcelStored where CodeID = @CodeID order by ColumnIndex
	end
	
End


--IMP_clsConfig @Activity = 'GetConfigMapID', @CodeID=1
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_Alert]    Script Date: 03/05/2015 21:26:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sendmail_Alert] 

AS

declare @body1 varchar(100)
set @body1 = 'Server :'+@@servername+ ' My First Database Email ' + cast(getdate() as nvarchar(100))
EXEC msdb.dbo.sp_send_dbmail @recipients='tanldt@fpt.com.vn',
    @subject = N'My Mail Test ms sql thử lại coi ',
    @body = @body1,
    @body_format = 'HTML' ;
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_SystemParam]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_SystemParam]
( 
/*
Procedure: spfrmLS_SystemParam
Desc:
	 Procedure for table: tblLS_SystemParam
Author:
	 PhuongDK
Create date:
	19-05-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@ParamID	int = null,
@Name	nvarchar(500) = null,
@Value	nvarchar(50) = null,
@Unit	nvarchar(500) = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblLS_SystemParam where ParamID = @ParamID)
	BEGIN
	 UPDATE tblLS_SystemParam SET
		 [Name]  = @Name,
		 [Value]  = @Value,
		 [Unit]  = @Unit
	END
	ELSE
	BEGIN
		 INSERT INTO tblLS_SystemParam ( [Name] , [Value] , [Unit]  )
		 VALUES 
		( @Name, @Value, @Unit ) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_SystemParam
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		ParamID,
		Name,
		Value,
		Unit
	 FROM tblLS_SystemParam
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		ParamID,
		Name,
		Value,
		Unit
	 FROM tblLS_SystemParam
	 WHERE 1=1
		AND (IsNull([Name],'')  like N'%' + Isnull(@Name,'') + '%')
		AND (IsNull([Value],'')  like N'%' + Isnull(@Value,'') + '%')
		AND (IsNull([Unit],'')  like N'%' + Isnull(@Unit,'') + '%')
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		ParamID,
		Name,
		Value,
		Unit
	 FROM tblLS_SystemParam
END
ELSE IF @Activity ='GetValueByName'
BEGIN
	 SELECT [Value], [Unit]
	 FROM tblLS_SystemParam
	 WHERE [Name] = @Name
	 
	 -- spfrmLS_SystemParam @Activity ='GetValueByName', @Name='ChecklistPercent'
END
	

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_LANGUAGE]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[spfrmLS_LANGUAGE]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'EN',
@ReturnMess			nvarchar(500) = null out,
@LSLanguageID			int = null,
@LSLanguageCode			nvarchar(15) = null,
@Name			nvarchar(50) = null,
@VNName			nvarchar(50) = null,
@Note			nvarchar(100) = null,
@IsLanguage			bit = 1,
@Rank			Int = null,
@Used			bit = 1
,@where	nvarchar(1000)=null
AS

if @Activity = 'GetDataAll'
	BEGIN
		EXEC ('select LSLanguageID,LSLanguageCode,Name,VNName,Note,case IsLanguage when 1 then ''X'' else '''' end as IsLanguage,Rank, case Used when 1 then ''X'' else '''' end as Used from TBLLS_LANGUAGE WHERE 1=1 ' + @Where + ' Order by 2') 
		
	END

else if @Activity = 'GetDataCombo'
	BEGIN
		select LSLANGUAGEID Ma,[Name] Ten from TBLLS_LANGUAGE union select '','' order by LSLANGUAGEID
	END

else If @Activity ='Save'
	BEGIN

		INSERT INTO TBLLS_LANGUAGE
(
LSLanguageCode,Name,VNName,Note,IsLanguage,Rank,Used
)
		VALUES
(
@LSLanguageCode,@Name,@VNName,@Note,@IsLanguage,@Rank,@Used
)

		
	
	END


else If @Activity = 'Update'
	BEGIN
		if exists (select * from TBLLS_LANGUAGE WHERE LSLanguageID <> @LSLanguageID)
		BEGIN
		if @LanguageID='VN'
		set @ReturnMess=N'Mã này đã tồn tại. Xin nhập vào mã khác.'
		else if @LanguageID='EN'
		set @ReturnMess=N'This code was existed. Please check again.'Return
		END
		UPDATE TBLLS_LANGUAGE
		SET
			LSLanguageCode = @LSLanguageCode,
			Name = @Name,
			VNName = @VNName,
			Note = @Note,
			IsLanguage = @IsLanguage,
			Rank = @Rank,
			Used = @Used

		WHERE LSLanguageID = @LSLanguageID

		
	END


else If @Activity = 'Delete'
	BEGIN
		DELETE FROM TBLLS_LANGUAGE
		WHERE LSLanguageID = @LSLanguageID

		
	END

else If @Activity = 'GetDataByID'
	BEGIN
		SELECT
LSLanguageID, LSLanguageCode, Name, VNName, Note, IsLanguage, Rank, Used
		FROM TBLLS_LANGUAGE
		WHERE LSLanguageID = @LSLanguageID
	END

if @@Error <> 0
	BEGIN
		set	@LSLanguageID = -1
		set	@ReturnMess = ''
	END
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_SupplierList_08]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmRPT_SupplierList_08]

		/*
		Procedure: [spfrmRPT_SupplierList_08]
		Desc:
			 Procedure for table: tblLS_Provider
		Author:
			 QuanBM
		Create date:
			03-04-2009
		History:
			...
		*/

AS
BEGIN	
	SELECT 		
		ROW_NUMBER() OVER (ORDER BY Rank) AS [No],
		ProviderID,		
		ProviderName,
--		Address+' - '+Telephone+' - '+Email as Description,
		isnull(Address,'')
		+ case when ISNULL('-' + Telephone, '') = '-' then '' else ISNULL('-' + Telephone, '') end
		+ case when ISNULL('-' + Email, '') = '-' then '' else ISNULL('-' + Email, '') end
		Description,
		Website,
		'' as Remark
	FROM tblLS_Provider
	Order By ProviderName
END

--GO
--[spfrmRPT_SupplierList_08]
GO
/****** Object:  Table [dbo].[tblTR_TrainingPlan]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_TrainingPlan](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[CourseDesc] [nvarchar](500) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Duration] [int] NULL,
	[IsAddition] [bit] NULL,
	[Method] [nvarchar](50) NULL,
	[LearningEval] [bit] NULL,
	[BusImpEval] [bit] NULL,
	[ReactionEval] [bit] NULL,
	[StatusID] [int] NULL,
	[ReasonID] [int] NULL,
	[CompanyID] [int] NULL,
	[DeptID] [int] NULL,
	[CourseID] [int] NULL,
	[ProviderID] [int] NULL,
	[TeacherID] [int] NULL,
	[IsNoOfPart] [bit] NULL,
	[IsOther] [bit] NULL,
	[IsImport] [bit] NULL,
	[Amount] [money] NULL,
	[LossCategoryID] [int] NULL,
	[TrainLocation] [nvarchar](50) NULL,
 CONSTRAINT [XPKtblTR_TrainingPlan] PRIMARY KEY NONCLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_SkillCourse]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_SkillCourse](
	[SkillID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_tblLS_SkillCourse] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Trainer]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Trainer](
	[TrainerID] [int] IDENTITY(1,1) NOT NULL,
	[TrainerCode] [nvarchar](50) NOT NULL,
	[TrainerName] [nvarchar](500) NOT NULL,
	[FromSource] [int] NOT NULL,
	[Address] [nvarchar](1000) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Email] [nvarchar](500) NULL,
	[ProviderID] [int] NULL,
	[Rank] [int] NULL,
	[Used] [bit] NULL,
	[OtherName] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblLS_Trainer] PRIMARY KEY CLUSTERED 
(
	[TrainerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_Teacher] ON [dbo].[tblLS_Trainer] 
(
	[TrainerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_TableField]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_TableField](
	[TableFieldID] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](100) NULL,
	[NameVN] [nvarchar](200) NOT NULL,
	[NameEN] [nvarchar](200) NOT NULL,
	[DataType] [nvarchar](50) NOT NULL,
	[ControlType] [nvarchar](50) NOT NULL,
	[Width] [int] NOT NULL,
	[MaxLength] [int] NOT NULL,
	[DataSource] [nvarchar](100) NULL,
	[DefaultValue] [nvarchar](200) NULL,
	[Visible] [bit] NULL,
	[Enable] [bit] NULL,
	[IsKey] [bit] NULL,
	[CssClass] [nvarchar](50) NULL,
	[FieldNo] [int] NOT NULL,
	[TableID] [int] NOT NULL,
	[IsRequire] [bit] NOT NULL,
	[DataSourceDisplayField] [nvarchar](100) NULL,
	[Align] [nvarchar](50) NULL,
	[DataCellServerTemplateId] [nvarchar](50) NULL,
	[IsCode] [bit] NULL,
	[IsMultiLine] [bit] NULL,
 CONSTRAINT [PK_tblLS_TableField] PRIMARY KEY CLUSTERED 
(
	[TableFieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_OverTrainEffDetail]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_OverTrainEffDetail](
	[OverTrainEff_ID] [int] NOT NULL,
	[A_Value] [bit] NULL,
	[B_Value] [bit] NULL,
	[C_Value] [bit] NULL,
	[EmployeeID] [int] NOT NULL,
	[OverTrainEffCateID] [int] NOT NULL,
	[A_Suggestion] [nvarchar](500) NULL,
	[B_Suggestion] [nvarchar](500) NULL,
	[C_Suggestion] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblTR_OverTrainEffDetail] PRIMARY KEY CLUSTERED 
(
	[OverTrainEff_ID] ASC,
	[EmployeeID] ASC,
	[OverTrainEffCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_TrainingStatusReason]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_TrainingStatusReason](
	[ReasonID] [int] IDENTITY(1,1) NOT NULL,
	[ReasonName] [nvarchar](500) NOT NULL,
	[TrainingStatusID] [int] NOT NULL,
 CONSTRAINT [PK_tblLS_TrainingStatusReason] PRIMARY KEY CLUSTERED 
(
	[ReasonID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_ProviderEval]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_ProviderEval](
	[ProviderID] [int] NOT NULL,
	[ProEvalCateID] [int] NOT NULL,
	[Mark] [int] NULL,
	[TotalMark] [int] NULL,
	[Observation] [nvarchar](500) NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_ProviderEval] ON [dbo].[tblLS_ProviderEval] 
(
	[ProviderID] ASC,
	[ProEvalCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_ChkLstCategory]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_ChkLstCategory](
	[ChkLstCateID] [int] IDENTITY(1,1) NOT NULL,
	[ChkLstCateName] [nvarchar](500) NOT NULL,
	[Level] [int] NOT NULL,
	[Rank] [int] NULL,
	[Used] [bit] NOT NULL,
	[ChkLstCateGroupID] [int] NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_ChkLstCategory] ON [dbo].[tblLS_ChkLstCategory] 
(
	[ChkLstCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_CheckListTemp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_CheckListTemp](
	[CheckListTempID] [int] IDENTITY(1,1) NOT NULL,
	[CheckListTitle] [nvarchar](500) NOT NULL,
	[CheckListDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[SkillID] [int] NOT NULL,
 CONSTRAINT [PK_tblLS_CheckListTemp] PRIMARY KEY CLUSTERED 
(
	[CheckListTempID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_CheckListTemp] ON [dbo].[tblLS_CheckListTemp] 
(
	[CheckListTempID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_LnEvalCategory]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_LnEvalCategory](
	[LnEvalCateID] [int] IDENTITY(1,1) NOT NULL,
	[LnEvalCateName] [nvarchar](500) NOT NULL,
	[LnEvalCateGroupID] [int] NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_LnEvalCategory] ON [dbo].[tblLS_LnEvalCategory] 
(
	[LnEvalCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Course]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[CourseTypeID] [int] NULL,
	[CourseCode] [nvarchar](50) NULL,
	[CourseName] [nvarchar](500) NOT NULL,
	[ContentRemark] [nvarchar](500) NULL,
	[Remark] [nvarchar](1000) NULL,
	[Rank] [int] NULL,
	[Used] [bit] NOT NULL,
 CONSTRAINT [PK_tblLS_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_Course] ON [dbo].[tblLS_Course] 
(
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Document]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Document](
	[DocumentID] [int] IDENTITY(1,1) NOT NULL,
	[DocumentCode] [nvarchar](500) NULL,
	[DocumentName] [nvarchar](500) NOT NULL,
	[DocTypeID] [int] NOT NULL,
	[DocDomainID] [int] NOT NULL,
	[SkillID] [int] NULL,
	[CourseID] [int] NULL,
	[BriefInfo] [nvarchar](500) NULL,
	[Author] [nvarchar](500) NULL,
	[FileAttach] [nvarchar](500) NULL,
	[Link] [nvarchar](500) NULL,
	[Remark] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_Document] ON [dbo].[tblLS_Document] 
(
	[DocumentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_Section]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Section](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[DeptID] [int] NOT NULL,
	[SectionCode] [nvarchar](50) NULL,
	[SectionName] [nvarchar](500) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[Rank] [int] NULL,
	[Used] [bit] NOT NULL,
 CONSTRAINT [PK_tblLS_Section] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_Section] ON [dbo].[tblLS_Section] 
(
	[SectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_TrainerCourse]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_TrainerCourse](
	[TrainerID] [int] NOT NULL,
	[CourseID] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_TeacherCourse] ON [dbo].[tblLS_TrainerCourse] 
(
	[TrainerID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_AccountCode]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_AccountCode](
	[AccountCodeID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[DeptID] [int] NULL,
	[CompCode] [nvarchar](50) NULL,
	[ACode] [nvarchar](50) NOT NULL,
	[BCode] [nvarchar](50) NOT NULL,
	[TRCode] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[IsCourseFee] [bit] NOT NULL,
	[Used] [bit] NOT NULL,
 CONSTRAINT [XPKtblLS_AccountCode] PRIMARY KEY NONCLUSTERED 
(
	[AccountCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_PlanEmp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_PlanEmp](
	[PlanID] [int] NOT NULL,
	[EmpID] [int] NOT NULL,
 CONSTRAINT [PK_tblTR_PlanEmp] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC,
	[EmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_PlanDept]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_PlanDept](
	[PlanID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[DeptID] [int] NOT NULL,
 CONSTRAINT [PK_tblTR_PlanDept] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC,
	[DeptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_PlanBudget]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_PlanBudget](
	[PlanID] [int] NOT NULL,
	[PlanCost] [numeric](18, 0) NULL,
	[AccountCodeID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_TrainingResult]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTR_TrainingResult](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[CourseDesc] [nvarchar](500) NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Duration] [int] NULL,
	[Method] [char](18) NULL,
	[CertName] [nvarchar](500) NULL,
	[CertEffDate] [datetime] NULL,
	[CertExpDate] [datetime] NULL,
	[PlanID] [int] NOT NULL,
	[ProviderID] [int] NULL,
	[TeacherID] [int] NULL,
	[ReactionEval] [nvarchar](500) NULL,
	[IsNoOfPart] [bit] NULL,
	[Amount] [money] NULL,
	[IsImport] [bit] NULL,
	[TrainLocation] [nvarchar](50) NULL,
 CONSTRAINT [XPKtblTR_TrainingResult] PRIMARY KEY NONCLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetSkillAssPercent]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetSkillAssPercent]
(
@AssID	int
)
RETURNS nvarchar(500)
AS
-- PhuongDK: 25/05/2009
BEGIN

	Declare @Result nvarchar(500)
	Declare @Complete int
	Declare @All int

	Set @Complete = (SELECT Count(*) FROM tblASS_AssessEmp	WHERE AssID = @AssID and EmpStatus = 1)
	Set @All = (SELECT Count(*) FROM tblASS_AssessEmp	WHERE AssID = @AssID)

	IF @All = 0
	BEGIN
		SET @All = 1
	END
	
	Set @Result = Convert(nvarchar,cast((@Complete*100) as float)/cast(@All as float)) + '%'

	RETURN @Result
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetSumaryReportModulesCarriedOut]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetSumaryReportModulesCarriedOut]
(
@CompanyID int,
@Month int,
@Year int
)
RETURNS float
AS
-- PhuongDK: 25/05/2009
BEGIN

	Declare @Date datetime
	Declare @lastDate datetime	

	-- Ngay dau tien theo nam tai chinh: vd 01/10/2009
	set @Date = dbo.fnGetDateOfMonth(@Month, @Year-1, 0)
	-- Ngay cuoi cung cua thang can tinh
	set @lastDate = dbo.fnGetDateOfMonth(@Month, @Year, 1)

	-------
	Declare @Plan int
	Declare @Finish int
	Declare @Cancel int
	Declare @Change int

	Set @Plan =
	(
		Select Count(PlanID) from tblTR_TrainingPlan 
		where FromDate between @Date and @lastDate 
		and	(StatusID = 1 or StatusID = 5)
	)

	Set @Finish =
	(
		Select Count(PlanID) from tblTR_TrainingPlan 
		where FromDate between @Date and @lastDate 
		and	StatusID = 4
	)

	Set @Cancel =
	(
		Select Count(PlanID) from tblTR_TrainingPlan 
		where FromDate between @Date and @lastDate 
		and	StatusID = 3
	)

	Set @Change =
	(
		Select Count(PlanID) from tblTR_TrainingPlan 
		where FromDate between @Date and @lastDate 
		and	StatusID = 2
	)

	-------
	Declare @Result float
	SET @Result = round(cast(@Finish as float)/cast((@Plan-@Cancel-@Change) as float),2)

	IF @Result = 0
	BEGIN
		SET @Result = null
	END

	RETURN @Result

	-- select dbo.fnGetSumaryReportModulesCarriedOut(1,4,2009)
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_CourseList_01]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmRPT_CourseList_01]

		/*
		Procedure: [spfrmRPT_CourseList_01]
		Desc:
			 Procedure for table: tblLS_Course
		Author:
			 QuanBM
		Create date:
			03-04-2009
		History:
			...
		*/
@CompanyID	 int = null,
@CourseTypeID int = null
AS
BEGIN	
	SELECT 		
		ROW_NUMBER() OVER (ORDER BY a.CourseID) AS [No],
		a.CourseID,
		a.CourseTypeID,
		a.CourseName,
		c.CompanyID,
		c.CompanyName,
		b.CourseTypeName
	FROM tblLS_Course a left join tblLS_CourseType b on a.CourseTypeID = b.CourseTypeID
						left join tblLS_Company c on c.CompanyID = a.CompanyID
	WHERE		
		 a.CompanyID = @CompanyID
	AND (a.CourseTypeID  = @CourseTypeID or isnull( @CourseTypeID,'')='')
	ORDER BY a.CourseName--, b.DeptName
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_Provider]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_Provider]
( 
/*
Procedure: spfrmTR_OverTrainEff
Desc:
	 Procedure for table: [spfrmLS_Provider]
Author:
	 PhuongDK
Create date:
	01-04-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@ProviderID int = null,
@ProEvalCateID int = null,
@Mark int = null,
@TotalMark int = null,
@Observation nvarchar(500) = null,
@ProviderCode char(18) = null,
@ProviderName nvarchar(500) = null,
@MarkFrom int = null,
@MarkTo int = null


) 
AS
IF @Activity ='GetDataProvider'
BEGIN
	SELECT 
		ROW_NUMBER() over (order by ProviderID) as STT,
		ProviderID,
		ProviderCode,
		ProviderName,
		Address,
		Telephone,
		--Email,
		--Website,
		--Remark,
		Rank,
		Used
	FROM tblLS_Provider
END


ELSE IF @Activity ='GetDataProEvaByID'
BEGIN
	SELECT 
		b.ProviderName,
		--c.ProEvalCateName,
		--c.Weight,
		a.Mark,
		a.Observation,
		a.TotalMark
	FROM tblLS_ProEvalCategory c
	left join tblLS_ProviderEval a on a.ProEvalCateID = c.ProEvalCateID and (a.ProviderID = @ProviderID or isnull (@ProviderID,'')='')
	left join tblLS_Provider b on a.ProviderID = b.ProviderID
	
--	
--	WHERE 1=1
--		and	a.ProviderID = b.ProviderID
--		and  a.ProEvalCateID = c.ProEvalCateID
		
		
		--   [spfrmLS_Provider] @Activity ='GetDataProEvaByID', @ProviderID=1
END

ELSE IF @Activity ='GetDataProviderEval'
BEGIN
	/*
	SELECT 
		ROW_NUMBER() over (order by a.ProviderID) as [No]
		,a.ProviderID
		,a.ProviderCode
		,a.ProviderName
		,sum(b.TotalMark) as TotalScore
	FROM tblLS_Provider a left join tblLS_ProviderEval b on a.ProviderID = b.ProviderID
	WHERE 1=1
		and (a.ProviderCode = @ProviderCode or isnull (@ProviderCode,'')='')
		and ((IsNull(a.ProviderName,'') like N'%' + IsNull(@ProviderName,'')+'%'))	
	GROUP BY a.ProviderID, a.ProviderCode, a.ProviderName
	*/

	SELECT
			ROW_NUMBER() OVER (ORDER BY RS.Rank, RS.ProviderName) AS [No],
			RS.ProviderID,
			RS.Rank,
			RS.ProviderCode,
			RS.ProviderName,
			RS.TotalScore,
			EvalStatus = (CASE RS.TotalScore WHEN 0 THEN 'No' ELSE 'Yes' END)
		FROM
			(
				SELECT 
						a.ProviderID,
						a.Rank,
						a.ProviderCode,
						a.ProviderName,
						TotalScore= SUM(IsNull(b.TotalMark,0))

				FROM tblLS_Provider a left join tblLS_ProviderEval b on a.ProviderID = b.ProviderID
				GROUP BY a.ProviderID, a.Rank, a.ProviderCode, a.ProviderName
			) RS

		WHERE 1=1
		and (RS.ProviderCode = @ProviderCode or isnull (@ProviderCode,'')='')
		and ((IsNull(RS.ProviderName,'') like N'%' + IsNull(@ProviderName,'')+'%'))
		and ((RS.TotalScore between @MarkFrom and @MarkTo) or (@MarkFrom = 0 and @MarkTo = 0))

		ORDER BY RS.Rank, RS.ProviderName
		
		--   [spfrmLS_Provider] @Activity ='GetDataProviderEval', @MarkFrom = 10, @MarkTo = 1000
END

ELSE IF @Activity ='GetDataProviderEvalView'
BEGIN
	SELECT 
		ROW_NUMBER() over (order by c.ProEvalCateName) as [No]
		,c.ProEvalCateName
		,isnull(c.Weight,1) * isnull(b.Mark,0) as TotalMark
		--,b.TotalMark
		,b.Observation
		,a.ProviderCode
		,a.ProviderName

	FROM tblLS_Provider a
	left join tblLS_ProviderEval b on a.ProviderID = b.ProviderID
	left join tblLS_ProEvalCategory c on b.ProEvalCateID = c.ProEvalCateID

	WHERE 1=1
		AND a.ProviderID = @ProviderID
	
	ORDER BY b.ProEvalCateID
		--   [spfrmLS_Provider] @Activity ='GetDataProviderEvalView', @ProviderID = 10

--select * from tblLS_ProEvalCategory
--select * from tblLS_ProviderEval
END



ELSE IF @Activity ='DeleteProEval'
BEGIN
	
	DELETE FROM tblLS_ProviderEval
	WHERE
		[ProviderID] = @ProviderID

		--   [spfrmLS_Provider] @Activity ='DeleteProEval', @ProviderID = 4
END

ELSE IF @Activity ='GetProEval'
BEGIN
	SELECT 
		ROW_NUMBER() over (order by ProEvalCateID) as [No],
		ProEvalCateName,
		Weight,
		ProEvalCateID

	FROM tblLS_ProEvalCategory

	order By ProEvalCateID 

		--   [spfrmLS_Provider] @Activity ='GetProEval'
END

ELSE IF @Activity ='GetProEvaByID'
BEGIN
	/*
	SELECT 
		--ROW_NUMBER() over (order by a.ProEvalCateID) as [No],
		--b.ProviderName,
		a.ProEvalCateID,
		c.ProEvalCateName,
		c.Weight,
		--b.ProviderName,
		a.Mark,
		a.Observation
		--a.TotalMark
	FROM tblLS_ProEvalCategory c 
			left join tblLS_ProviderEval a on c.ProEvalCateID = a.ProEvalCateID
			left join tblLS_Provider b on a.ProviderID = b.ProviderID
	WHERE 1=1
		and a.ProviderID = @ProviderID
	order by a.ProEvalCateID
	*/
	----------------------------------------------
	SELECT 
		ROW_NUMBER() over (order by a.ProEvalCateID) as [No],
		a.ProEvalCateID,
		a.ProEvalCateName,
		a.Weight,
		b.Mark,
		b.Observation
	FROM tblLS_ProEvalCategory a 
			left join tblLS_ProviderEval b on a.ProEvalCateID = b.ProEvalCateID
			left join tblLS_Provider c on b.ProviderID = c.ProviderID
	WHERE 1=1
		and (c.ProviderID = @ProviderID or c.ProviderID is null)
	order By a.ProEvalCateID
		
		--   [spfrmLS_Provider] @Activity ='GetProEvaByID', @ProviderID=1
END

ELSE IF @Activity ='SaveProEval'
BEGIN
	IF Exists(Select * from tblLS_ProviderEval 
					   where ProviderID = @ProviderID and ProEvalCateID = @ProEvalCateID)
	BEGIN
	 UPDATE tblLS_ProviderEval SET
		 [Mark]  = @Mark,
		 [TotalMark] = @TotalMark,
		 [Observation]  = @Observation
	 WHERE
		ProviderID = @ProviderID and ProEvalCateID = @ProEvalCateID
	END

	ELSE
	BEGIN
		 INSERT INTO tblLS_ProviderEval ([ProviderID],[ProEvalCateID],[Mark],[TotalMark],[Observation])
		 VALUES 
		( @ProviderID, @ProEvalCateID, @Mark, @TotalMark, @Observation) 
	END

--   [spfrmLS_Provider] @Activity ='SaveProEval'
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_MasterList]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_MasterList]
-- PhuongDK: 11/12/2008, Danh muc dong
@Activity		varchar(50),
@ReturnMess		nvarchar(500) = null out,

@TableID		int = null,
@TableName		nvarchar(200) = null,
@Fields			nvarchar(4000) = null,
@Values			nvarchar(4000) = null,
@Where			nvarchar(200) = null,
-------------------------------------
@FieldName		nvarchar(100) = null,
@NameVN			nvarchar(200) = null,
@NameEN			nvarchar(200) = null,
@DataType		nvarchar(50) = null,
@ControlType	nvarchar(50) = null,
@Width			int = null,
@MaxLength		int = null,
@Visible		bit = null,
@IsKey			bit = null,
@FieldNo		int = null,
@IsRequire		bit = null,
-- FOR MORE
@UserID			int = null,
@Page			nvarchar(500) = null
AS

if @Activity = 'GetTableByID'
	BEGIN
		SELECT TableID, TableName, TableHeader 
		FROM   dbo.tblLS_Table
        WHERE
         		TableID = @TableID;
	END
    --spfrmLS_MasterList @Activity = 'GetTableByID', @TableID = 1;

else if @Activity = 'GetTableFieldByID'
	BEGIN
		SELECT 
            TableFieldID,
            FieldName,
            NameVN,
            NameEN,
            DataType,
            ControlType,
            Width,
            MaxLength,
            DataSource,
            DefaultValue,
            Visible,
            [Enable],
            IsKey,
            CssClass,
            FieldNo,
            TableID,
            IsRequire,
			DataSourceDisplayField,
			Align,
			DataCellServerTemplateId,
			IsCode,
			IsMultiLine
          FROM 
            dbo.tblLS_TableField
          WHERE
         		TableID = @TableID
          ORDER BY FieldNo;
	END
    --spfrmLS_MasterList @Activity = 'GetTableFieldByID', @TableID = 2;

else if @Activity='GetDataByCode'
	BEGIN
		exec ('select * from ' + @TableName + ' where ' + @Fields + '=' +''''+ @Values +'''');
	END

else if @Activity = 'Insert'
	BEGIN
		exec ('Insert into ' + @TableName + '(' + @Fields + ') values (' + @Values + ')');
	END

else if @Activity = 'Update'
	BEGIN
		exec ('Update ' + @TableName + ' Set ' + @Fields + ' WHERE ' + @Where);
	END

else if @Activity = 'Delete'
	BEGIN
		exec ('Delete from ' + @TableName + ' WHERE ' + @Where);
	END

-------------------------------------------------------------------------------------------
-- Generate info to tblLS_Table and tblLS_TableField

else if @Activity = 'IsReady'
	BEGIN
		If Exists(Select * from tblLS_TableField where [TableID] = @TableID)
		BEGIN
			select 'true' as [IsReady]
		END
		Else
		BEGIN
			select 'false' as [IsReady]
		END
	END
	-- spfrmLS_MasterList @Activity = 'IsReady', @TableID = '5';

else if @Activity = 'InsertNewTable'
	BEGIN
		If Not Exists(Select * from tblLS_Table where UPPER([TableName]) = UPPER(@TableName))
		BEGIN
			INSERT INTO tblLS_Table
			   ([TableName]
			   ,[TableHeader])
			VALUES
			   (@TableName
			   , @TableName + ' Header')

			SELECT @TableName + ' --> TableID: ' + convert(nvarchar, SCOPE_IDENTITY(), 101)
		END
		ELSE
		BEGIN
			Select @TableName + ' --> TableID: ' + convert(nvarchar, TableID, 101) from tblLS_Table where UPPER([TableName]) = UPPER(@TableName)
		END
	END
	-- spfrmLS_MasterList @Activity = 'InsertNewTable', @TableName = 'tblLS_District';

else if @Activity = 'GetTableField'
	BEGIN
		exec ('sp_columns @table_name = ' + @TableName)
	END
	-- spfrmLS_MasterList @Activity = 'GetTableField', @TableName = 'tblLS_Company';

else if @Activity = 'InsertTableField'
	BEGIN
		If Not Exists(Select * from tblLS_TableField where [FieldName] = @FieldName and [TableID] = @TableID)
		BEGIN
			INSERT INTO tblLS_TableField
			   ([FieldName]
			   ,[NameVN]
			   ,[NameEN]
			   ,[DataType]
			   ,[ControlType]
			   ,[Width]
			   ,[MaxLength]
			   ,[Visible]
			   ,[IsKey]
			   ,[FieldNo]
			   ,[TableID]
			   ,[IsRequire])
		 VALUES
			   (@FieldName
			   ,@NameVN
			   ,@NameEN
			   ,@DataType
			   ,@ControlType
			   ,@Width
			   ,@MaxLength
			   ,@Visible
			   ,@IsKey
			   ,@FieldNo
			   ,@TableID
			   ,@IsRequire)
		END
	END

-- FOR OTHERS
else if @Activity = 'GetMessageAll'
	BEGIN
		Select * from tblLS_Message order by MsgCode
		-- spfrmLS_MasterList @Activity = 'GetMessageAll'
	END

-- GET Group Info of UserID

else if @Activity = 'GetSysRole'
	BEGIN
		SELECT IsNull(Max(b.GroupCode),0) as GroupCode
		  FROM tblSYS_UserGroup a inner join tblSYS_Group b on a.GroupID = b.GroupID
		 WHERE a.UserID = @UserID

		-- spfrmLS_MasterList @Activity = 'GetSysRole', @UserID=2
	END

else if @Activity = 'GetFunctionList'
	BEGIN
		SELECT MenuID, NavigateURL, FunctionNameE as FunctionName
		  FROM tblSYS_Menu
		 WHERE NavigateURL is not null
		 
		-- spfrmLS_MasterList @Activity = 'GetFunctionList'
	END

else if @Activity = 'GetLeftMenu'
	BEGIN
		DECLARE @ParentID int
		SET @ParentID = (SELECT TOP 1 Parent
						  FROM  tblSYS_Menu
						 WHERE  NavigateURL like '%' + @Page + '%')

		
		SELECT A.* 
		FROM   (
				SELECT FunctionNameE as FunctionName, NavigateURL, FunctionType = 1, Rank = 0
				FROM tblSYS_Menu
				WHERE 1 = 1
				AND	MenuID = @ParentID

				UNION ALL
				SELECT FunctionNameE as FunctionName, 'M' + ModuleID + '/' + NavigateURL, FunctionType = 2, Rank
				FROM tblSYS_Menu
				WHERE 1 = 1
				AND Display = 1
				AND	Parent = @ParentID
				) A
		ORDER BY A.Rank

		-- spfrmLS_MasterList @Activity = 'GetLeftMenu', @Page='EmpInfoManagement.aspx'
	END

else if @Activity = 'GetModuleList'
BEGIN
			SELECT FunctionNameE as FunctionName, NavigateURL
			FROM tblSYS_Menu
			WHERE Parent is null
			ORDER BY RANK
	-- spfrmLS_MasterList @Activity = 'GetModuleList'
END

if @@Error <> 0
	BEGIN
		set	@ReturnMess = ''
	END
else
	begin
		set @ReturnMess = 'Has Error'
	end
GO
/****** Object:  Table [dbo].[tblLS_ChkLstTempDetail]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_ChkLstTempDetail](
	[CheckListTempID] [int] NOT NULL,
	[ChkLstCateID] [int] NOT NULL,
	[ItemNo] [int] NOT NULL,
 CONSTRAINT [PK_tblLS_ChkLstTempDetail] PRIMARY KEY CLUSTERED 
(
	[CheckListTempID] ASC,
	[ChkLstCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_ChkLstTempDetail] ON [dbo].[tblLS_ChkLstTempDetail] 
(
	[CheckListTempID] ASC,
	[ChkLstCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHR_Employee_OLD]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblHR_Employee_OLD](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[NickName] [nvarchar](50) NULL,
	[JoinDate] [smalldatetime] NOT NULL,
	[Sex] [bit] NULL,
	[BirthDay] [smalldatetime] NOT NULL,
	[AddressBorn] [nvarchar](300) NULL,
	[AddressPopulation] [nvarchar](300) NULL,
	[AddressNativePlace] [nvarchar](300) NULL,
	[Address] [nvarchar](300) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](30) NULL,
	[IDCard] [varchar](20) NULL,
	[IDIssueDate] [smalldatetime] NULL,
	[IssuePlaceID] [tinyint] NULL,
	[NationalID] [smallint] NULL,
	[ReligionID] [smallint] NULL,
	[CompanyID] [int] NULL,
	[DeptID] [int] NULL,
	[LSGroupID] [int] NULL,
	[JobTitleID] [tinyint] NULL,
	[PositionID] [tinyint] NULL,
	[CultureLevelID] [tinyint] NULL,
	[RecuitTypeID] [tinyint] NULL,
	[ProfessionalLevelID] [tinyint] NULL,
	[ImageEmp] [nvarchar](50) NULL,
	[Image] [image] NULL,
	[PartyMember] [bit] NULL,
	[Soldier] [bit] NULL,
	[WoundedSoldier] [bit] NULL,
	[Revolutionary] [bit] NULL,
	[EmployeeStatusID] [smallint] NULL,
	[Note] [nvarchar](500) NULL,
	[Creater] [varchar](20) NULL,
	[UpdateDate] [smalldatetime] NULL,
 CONSTRAINT [PK_tblHR_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nơi sinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'AddressBorn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ hộ khẩu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'AddressPopulation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguyên quán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'AddressNativePlace'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ hiện tại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quốc tịch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'NationalID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tôn giáo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'ReligionID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'DeptID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'LSGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chức danh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'JobTitleID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loại thuyển dụng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'RecuitTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chuyên môn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'ProfessionalLevelID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đảng viên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'PartyMember'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quân đội' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'Soldier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thương binh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'WoundedSoldier'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Liệt sỹ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'Revolutionary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Người tạo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblHR_Employee_OLD', @level2type=N'COLUMN',@level2name=N'Creater'
GO
/****** Object:  View [dbo].[vLS_Course]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Course]
AS
SELECT     TOP (100) PERCENT CourseID, CourseTypeID, CourseName, ContentRemark, CompanyID, Remark, Rank, Used
FROM         dbo.tblLS_Course
WHERE     (Used = 1)
ORDER BY Rank, CourseName
GO
/****** Object:  View [dbo].[vLS_Trainer]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Trainer]
AS
SELECT     TOP (100) PERCENT TrainerID, TrainerCode, TrainerName, FromSource, Address, Telephone, Email, ProviderID, Rank, Used, OtherName
FROM         dbo.tblLS_Trainer
WHERE     (Used = 1)
ORDER BY Rank, TrainerName
GO
/****** Object:  View [dbo].[vLS_ChkLstCategory]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_ChkLstCategory]
AS
SELECT     TOP (100) PERCENT ChkLstCateID, ChkLstCateName, [Level], Rank, Used, ChkLstCateGroupID
FROM         dbo.tblLS_ChkLstCategory
WHERE     (Used = 1)
ORDER BY Rank
GO
/****** Object:  View [dbo].[vLS_CheckListTemp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_CheckListTemp]
AS
SELECT     CheckListTempID, CheckListTitle, CheckListDate, Status, SkillID
FROM         dbo.tblLS_CheckListTemp
GO
/****** Object:  View [dbo].[vLS_Dept]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Dept]
AS
SELECT     TOP (100) PERCENT DeptID, DeptCode, DeptName, Rank, Remark, CompanyID
FROM         dbo.tblLS_Dept
WHERE     (Used = 1)
ORDER BY CompanyID, Rank
GO
/****** Object:  View [dbo].[vLS_Section]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Section]
AS
SELECT     TOP (100) PERCENT SectionID, SectionCode, SectionName, Remark, Rank, Used, DeptID
FROM         dbo.tblLS_Section
WHERE     (Used = 1)
ORDER BY DeptID, Rank, SectionName
GO
/****** Object:  View [dbo].[vLS_AccountCode]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_AccountCode]
AS
SELECT     TOP (100) PERCENT a.AccountCodeID, a.CompCode, a.ACode, a.BCode, a.TRCode, 
                      a.CompCode + '.' + a.ACode + '.' + a.BCode + '.' + a.TRCode AS AccountCode, a.Description, a.IsCourseFee, a.Used, b.CompanyID, b.CompanyName, 
                      b.Rank AS CompanyRank, c.DeptID, c.DeptName, c.Rank AS DeptRank, 
                      a.CompCode + '.' + a.ACode + '.' + a.BCode + '.' + a.TRCode + ' - ' + ISNULL(a.Description, '') AS AccountCodeDesc
FROM         dbo.tblLS_AccountCode AS a LEFT OUTER JOIN
                      dbo.tblLS_Company AS b ON a.CompanyID = b.CompanyID LEFT OUTER JOIN
                      dbo.tblLS_Dept AS c ON a.DeptID = c.DeptID
ORDER BY CompanyRank, DeptRank, a.CompCode, a.ACode, a.BCode, a.TRCode
GO
/****** Object:  Table [dbo].[tblLS_Area]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_Area](
	[AreaID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[DeptID] [int] NULL,
	[SectionID] [int] NULL,
	[AreaCode] [nchar](50) NULL,
	[AreaName] [nvarchar](500) NOT NULL,
	[Remark] [nvarchar](500) NULL,
	[Rank] [int] NULL,
	[Used] [bit] NOT NULL,
 CONSTRAINT [PK_tblLS_Area] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_Area] ON [dbo].[tblLS_Area] 
(
	[AreaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHR_Employee]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHR_Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](500) NOT NULL,
	[LastName] [nvarchar](500) NOT NULL,
	[GenderCode] [bit] NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[BirthPlace] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[HomeAddress] [nvarchar](500) NULL,
	[DateOfHire] [datetime] NULL,
	[DateOfTermination] [datetime] NULL,
	[Telephone] [nvarchar](50) NULL,
	[Email] [nvarchar](500) NULL,
	[Remark] [nvarchar](500) NULL,
	[EmployeeStatusID] [int] NULL,
	[JobTitleID] [int] NULL,
	[JobLevelID] [int] NULL,
	[CompanyID] [int] NULL,
	[DeptID] [int] NULL,
	[SectionID] [int] NULL,
	[InsertUserID] [int] NULL,
	[InsertDate] [datetime] NULL,
	[UpdateUserID] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_tblHR_Employee_1] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_Document]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_Document]
( 
/*
Procedure: spfrmLS_Document
Desc:
	 Procedure for table: spfrmLS_Document
Author:
	 QuanBM
Create date:
	20-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@DocumentID	int = null,
@DocumentCode	nvarchar(500) = null,
@DocumentName	nvarchar(500) = null,
@DocTypeID	int = null,
@DocDomainID	int = null,
@SkillID	int = null,
@CourseID	int = null,
@BriefInfo	nvarchar(500) = null,
@Author	nvarchar(500) = null,
@FileAttach	nvarchar(500) = null,
@Link nvarchar(500) = null,
@Remark	nvarchar(1000) = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblLS_Document where DocumentID = @DocumentID)
	BEGIN
	 UPDATE tblLS_Document SET
		  DocumentCode = @DocumentCode,
		  DocumentName = @DocumentName,
		  DocTypeID = @DocTypeID,
		  DocDomainID = @DocDomainID,
		  SkillID = @SkillID,
		  CourseID = @CourseID,
		  BriefInfo = @BriefInfo,
		 Author = @Author,
		 FileAttach = @FileAttach,
		 Link = @Link,
		 Remark = @Remark		 
	 WHERE
		DocumentID = @DocumentID
	END
	ELSE
	BEGIN
		 INSERT INTO tblLS_Document ( DocumentCode , DocumentName , DocTypeID , DocDomainID , SkillID , CourseID , BriefInfo , Author , FileAttach , Link , Remark)
		 VALUES						( @DocumentCode , @DocumentName, @DocTypeID, @DocDomainID, @SkillID, @CourseID, @BriefInfo, @Author, @FileAttach, @Link, @Remark) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_Document
	 WHERE
		DocumentID = @DocumentID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		ROW_NUMBER() OVER (ORDER BY a.DocumentID) AS STT, 
		a.DocumentID,
		a.DocumentCode,
		a.DocumentName,
		a.BriefInfo,
		a.Author,
		a.FileAttach,
		a.Link,
		a.Remark,
		a.DocTypeID,
		c.DocTypeName,
		a.DocDomainID,
		b.DocDomainName,
		a.SkillID,
		d.SkillName,
		a.CourseID	
	 FROM tblLS_Document a inner join tblLS_DocDomain b on a.DocDomainID = b.DocDomainID
							left join tblLS_DocType c on a.DocTypeID = c.DocTypeID
							left join tblLS_Skill d on a.SkillID = d.SkillID
	 WHERE
		a.[DocumentID] = @DocumentID
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		ROW_NUMBER() OVER (ORDER BY a.DocumentID) AS STT, 
		a.DocumentID,
		a.DocumentCode,
		a.DocumentName,
		a.BriefInfo,
		a.Author,
		a.FileAttach,
		a.Link,
		a.Remark,
		a.DocTypeID,
		c.DocTypeName,
		a.DocDomainID,
		b.DocDomainName,
		a.SkillID,
		d.SkillName,
		a.CourseID	
	 FROM tblLS_Document a inner join tblLS_DocDomain b on a.DocDomainID = b.DocDomainID
							left join tblLS_DocType c on a.DocTypeID = c.DocTypeID
							left join tblLS_Skill d on a.SkillID = d.SkillID
END	
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		ROW_NUMBER() OVER (ORDER BY a.DocumentID) AS STT, 
		a.DocumentID,
		a.DocumentCode,
		a.DocumentName,
		a.BriefInfo,
		a.Author,
		a.FileAttach,
		a.Link,
		a.Remark,
		a.DocTypeID,
		c.DocTypeName,
		a.DocDomainID,
		b.DocDomainName,
		a.SkillID,
		d.SkillName,
		a.CourseID	
	 FROM tblLS_Document a inner join tblLS_DocDomain b on a.DocDomainID = b.DocDomainID
							left join tblLS_DocType c on a.DocTypeID = c.DocTypeID
							left join tblLS_Skill d on a.SkillID = d.SkillID
	where 1=1
		AND (IsNull(a.DocumentCode,'')  like N'%' + Isnull(@DocumentCode,'') + '%')
		AND (IsNull(a.DocumentName,'')  like N'%' + Isnull(@DocumentName,'') + '%')
		AND (IsNull(a.BriefInfo,'')  like N'%' + Isnull(@BriefInfo,'') + '%')
		AND (IsNull(a.Author,'')  like N'%' + Isnull(@Author,'') + '%')
		AND (IsNull(a.Link,'')  like N'%' + Isnull(@Link,'') + '%')		

		AND (a.DocumentID  = @DocumentID or isnull( @DocumentID,'')='')		
		AND (a.DocTypeID  = @DocTypeID or isnull( @DocTypeID,'')='')
		AND (a.DocDomainID  = @DocDomainID or isnull( @DocDomainID,'')='')		

END
ELSE IF @Activity ='GetMaxID'
BEGIN
	 SELECT Ident_Current ('tblLS_Document')
	 
END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_Course]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_Course]
( 
/*
Procedure: spfrmLS_Course
Desc:
	 Procedure for table: tblLS_Course
Author:
	 PhuongDK
Create date:
	26-02-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@CourseID	int = null,
@CourseTypeID	int = null,
@CourseCode	nvarchar(50) = null,
@CourseName	nvarchar(500) = null,
@ContentRemark	nvarchar(500) = null,
--@CompanyID	int = null,
--@DeptID	int = null,
@Remark	nvarchar(1000) = null,
@Rank	int = null,
@Used	int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblLS_Course where CourseID = @CourseID)
	BEGIN
	 UPDATE tblLS_Course SET
		 [CourseTypeID]  = @CourseTypeID,
		 [CourseCode]=@CourseCode,
		 [CourseName]  = @CourseName,
		 [ContentRemark]  = @ContentRemark,
		 --[CompanyID] = @CompanyID,
		 --[DeptID]  = @DeptID,
		 [Remark]  = @Remark,
		 [Rank]  = @Rank,
		 [Used]  = @Used
	 WHERE
		[CourseID] = @CourseID
	END
	ELSE
	BEGIN
		 INSERT INTO tblLS_Course ( [CourseTypeID] , [CourseCode], [CourseName] , [ContentRemark] , [Remark] , [Rank] , [Used]  )
		 VALUES 
		( @CourseTypeID,@CourseCode, @CourseName, @ContentRemark, @Remark, @Rank, @Used ) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_Course
	 WHERE
		[CourseID] = @CourseID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		a.CourseID,
		a.CourseTypeID,
		a.CourseName,
		a.CourseCode,
		a.ContentRemark,
		a.Remark,
		a.Rank,
		a.Used,
		c.CompanyID,
		c.CompanyName
	 FROM 
		tblLS_Course a left join vLS_Company c on a.CompanyID = c.CompanyID
	 WHERE
		a.[CourseID] = @CourseID

END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		a.CourseID,
		a.CourseTypeID,
		a.CourseCode,
		a.CourseName,
		a.ContentRemark,
		a.Remark,
		a.Rank,
		(Case when a.[Used] = 1 then 'X' else '' end) Used,
		--c.CompanyID,
		--c.CompanyName,
	    d.CourseTypeName
	 FROM 
			tblLS_Course a --left join vLS_Company c on a.CompanyID = c.CompanyID
					       left join vLS_CourseType d on a.CourseTypeID = d.CourseTypeID
	 WHERE 1=1
		AND (a.[CourseTypeID]  = @CourseTypeID or isnull( @CourseTypeID,'')='')
		AND (a.[CourseName]  like N'%' + Isnull(@CourseName,'') + '%')
		AND (isnull(a.[ContentRemark],'')  like N'%' + Isnull(@ContentRemark,'') + '%')
		AND (isnull(a.[Remark],'')  like N'%' + Isnull(@Remark,'') + '%')
		AND (a.[Rank]  = @Rank or isnull( @Rank,'')='')
		AND (a.[Used]  = @Used or isnull(@Used,-1)=-1)

		--AND (c.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		--AND (b.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		a.CourseID,
		a.CourseTypeID,
		a.CourseCode,
		a.CourseName,
		a.ContentRemark,
		a.Remark,
		a.Rank,
		(Case when a.[Used] = 1 then 'X' else '' end) Used,
		c.CompanyID,
		c.CompanyName,
		d.CourseTypeName
	 FROM 
			tblLS_Course a left join vLS_Company c on a.CompanyID = c.CompanyID
					       left join vLS_CourseType d on a.CourseTypeID = d.CourseTypeID
END

/*
ELSE IF @Activity ='GetCourseDetail'
BEGIN

	SELECT  b.CourseTypeName 
	FROM	tblLS_Course a left join tblLS_CourseType b on a.CourseTypeID = b.CourseTypeID
	WHERE 
			a.CourseID = @CourseID
		
	-- spfrmLS_Course @Activity ='GetCourseDetail', @CourseID=34
END
*/

ELSE IF @Activity ='GetCourseByType'
BEGIN

	SELECT RS.*
	FROM
		(
			SELECT  CourseID, CourseName, Rank
			FROM	vLS_Course
			WHERE 	(CourseTypeID = @CourseTypeID or @CourseTypeID = -1)

		) RS

	Order by RS.CourseName	
	-- spfrmLS_Course @Activity ='GetCourseByType', @CourseTypeID=1
END

ELSE IF @Activity ='GetCourseByCompany'
BEGIN

	SELECT RS.*
	FROM
		(
--			SELECT  CourseID, CourseName + ' (Company Wide)' as CourseName, Rank
--			FROM	vLS_Course
--			WHERE 
--					DeptID Is Null
--			AND		CourseTypeID = @CourseTypeID
--
--			UNION ALL	
			SELECT  CourseID, CourseName, Rank
			FROM	vLS_Course
			WHERE 
--					CompanyID = @CompanyID
			CourseTypeID = @CourseTypeID

		) RS

	Order by RS.Rank, RS.CourseName	
	-- spfrmLS_Course @Activity ='GetCourseByDept', @DeptID=1
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_Section]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_Section]
( 
/*
Procedure: spfrmLS_Section
Desc:
	 Procedure for table: tblLS_Section
Author:
	...
Create date:
	25-02-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@SectionID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@SectionCode	nvarchar(50) = null,
@SectionName	nvarchar(500) = null,
@Remark	nvarchar(500) = null,
@Rank	int = null,
@Used	int = null
) 
AS
IF @Activity ='Save'
BEGIN

	IF Exists(Select * from tblLS_Section where SectionID = @SectionID)
		IF Exists(Select * from tblLS_Section where DeptID=@DeptID and
			SectionCode = @SectionCode and  SectionID <> @SectionID)
			begin 
				set @ReturnMess='Code was Existed, please check again!'
			end
		else
			BEGIN
			 UPDATE tblLS_Section SET
				 [DeptID]  = @DeptID,
				 [SectionCode]  = @SectionCode,
				 [SectionName]  = @SectionName,
				 [Remark]  = @Remark,
				 [Rank]  = @Rank,
				 [Used]  = @Used
			 WHERE
				[SectionID] = @SectionID
			END
	ELSE
		IF Exists(Select * from tblLS_Section where DeptID=@DeptID and SectionCode = @SectionCode)
			begin 
				set @ReturnMess='Code was Existed, please check again!'
			end
		else
			BEGIN
				 INSERT INTO tblLS_Section ( [DeptID], [SectionCode] , [SectionName] , [Remark] , [Rank] , [Used]  )
				 VALUES 
				( @DeptID, @SectionCode, @SectionName, @Remark, @Rank, @Used ) 
			END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_Section
	 WHERE
		[SectionID] = @SectionID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	  SELECT 
		a.SectionID,
		a.SectionCode,
		a.SectionName,
		a.Remark,
		a.Rank,
		a.Used,
		c.CompanyID,
		c.CompanyName,
		b.DeptID,
		b.DeptName
	 FROM tblLS_Section a inner join tblLS_Dept b on a.DeptID = b.DeptID
						inner join tblLS_Company c on b.CompanyID = c.CompanyID
	 WHERE
		a.[SectionID] = @SectionID
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		a.SectionID,
		a.DeptID,
		a.SectionCode,
		a.SectionName,
		a.Remark,
		a.Rank,
		(Case when [Used] = 1 then 'X' else '' end) Used,
		c.CompanyName,
		b.DeptName
	 FROM tblLS_Section a inner join vLS_Dept b on a.DeptID = b.DeptID
						inner join vLS_Company c on b.CompanyID = c.CompanyID
	 WHERE 1=1
		AND (a.[SectionName]  like N'%' + Isnull(@SectionName,'') + '%')
		AND (isnull(a.[Remark],'')  like N'%' + Isnull(@Remark,'') + '%')
		AND (a.[Rank]  = @Rank or isnull(@Rank, '')='')
		AND (a.[Used]  = @Used or isnull(@Used,-1)=-1)

		AND (c.[CompanyID]  = @CompanyID or isnull(@CompanyID,'') = '')
		AND (b.[DeptID]  = @DeptID or isnull(@DeptID,'')='')

		-- spfrmLS_Section @Activity='GetData',@CompanyID=''

END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		a.SectionID,
		a.DeptID,
		a.SectionCode,
		a.SectionName,
		a.Remark,
		a.Rank,
		(Case when [Used] = 1 then 'X' else '' end) Used,
		c.CompanyName,
		b.DeptName
	 FROM tblLS_Section a inner join vLS_Dept b on a.DeptID = b.DeptID
						inner join vLS_Company c on b.CompanyID = c.CompanyID
END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_CheckListTemp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_CheckListTemp]
( 
/*
Procedure: spfrmLS_CheckListTemp
Desc:
	 Procedure for table: tblLS_CheckListTemp
Author:
	...
Create date:
	04-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@CheckListTempID	int = null,
@CheckListTitle	nvarchar(500) = null,
@CheckListDate	nvarchar(10) = null,
@Status			int = null,
@SkillID		int = null,
@ListCate2		nvarchar(2000) = null,
@ListCate3		nvarchar(2000) = null,
@ListCate4		nvarchar(2000) = null,
@ListCate5		nvarchar(2000) = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblLS_CheckListTemp where [SkillID]  = @SkillID)
	BEGIN
	 UPDATE tblLS_CheckListTemp SET
		 [CheckListTitle]  = @CheckListTitle,
		 [CheckListDate]  = Convert(datetime,@CheckListDate,103),
		 [Status]  = @Status
	 WHERE
		[SkillID]  = @SkillID
		select @CheckListTempID = CheckListTempID from tblLS_CheckListTemp WHERE [SkillID]  = @SkillID

		DELETE FROM tblLS_ChkLstTempDetail WHERE CheckListTempID = @CheckListTempID
		if (@ListCate2 is not null)
		begin
			INSERT INTO tblLS_ChkLstTempDetail(CheckListTempID,ChkLstCateID,ItemNo)
			SELECT @CheckListTempID, listValue, listNo from GetTableFromList(@ListCate2, DEFAULT)
		end
		if (@ListCate3 is not null)
		begin
			INSERT INTO tblLS_ChkLstTempDetail(CheckListTempID,ChkLstCateID,ItemNo)
			SELECT @CheckListTempID, listValue, listNo from GetTableFromList(@ListCate3, DEFAULT)
		end
		if (@ListCate4 is not null)
		begin
			INSERT INTO tblLS_ChkLstTempDetail(CheckListTempID,ChkLstCateID,ItemNo)
			SELECT @CheckListTempID, listValue, listNo from GetTableFromList(@ListCate4, DEFAULT)
		end
		if (@ListCate5 is not null)
		begin
			INSERT INTO tblLS_ChkLstTempDetail(CheckListTempID,ChkLstCateID,ItemNo)
			SELECT @CheckListTempID, listValue, listNo from GetTableFromList(@ListCate5, DEFAULT)
		end

	END
	ELSE
	BEGIN
		 INSERT INTO tblLS_CheckListTemp ( [CheckListTitle] , [CheckListDate] , [Status] , [SkillID]  )
		 VALUES ( @CheckListTitle, Convert(datetime,@CheckListDate,103), @Status, @SkillID ) 

		select @CheckListTempID = CheckListTempID from tblLS_CheckListTemp WHERE [SkillID]  = @SkillID

		DELETE FROM tblLS_ChkLstTempDetail WHERE CheckListTempID = @CheckListTempID
		if (@ListCate2 is not null)
		begin
			INSERT INTO tblLS_ChkLstTempDetail(CheckListTempID,ChkLstCateID,ItemNo)
			SELECT @CheckListTempID, listValue, listNo from GetTableFromList(@ListCate2, DEFAULT)
		end
		if (@ListCate3 is not null)
		begin
			INSERT INTO tblLS_ChkLstTempDetail(CheckListTempID,ChkLstCateID,ItemNo)
			SELECT @CheckListTempID, listValue, listNo from GetTableFromList(@ListCate3, DEFAULT)
		end
		if (@ListCate4 is not null)
		begin
			INSERT INTO tblLS_ChkLstTempDetail(CheckListTempID,ChkLstCateID,ItemNo)
			SELECT @CheckListTempID, listValue, listNo from GetTableFromList(@ListCate4, DEFAULT)
		end
		if (@ListCate5 is not null)
		begin
			INSERT INTO tblLS_ChkLstTempDetail(CheckListTempID,ChkLstCateID,ItemNo)
			SELECT @CheckListTempID, listValue, listNo from GetTableFromList(@ListCate5, DEFAULT)
		end
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_CheckListTemp
	 WHERE
		[CheckListTempID] = @CheckListTempID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		CheckListTempID,
		CheckListTitle,
		Convert(nvarchar,CheckListDate,103) as CheckListDate,
		Status,
		SkillID
	 FROM vLS_CheckListTemp
	 WHERE
		( [CheckListTempID] = @CheckListTempID or SkillID = @SkillID)

	 -- spfrmLS_CheckListTemp @Activity ='GetDataByID', @SkillID=38
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		CheckListTempID,
		CheckListTitle,
		CheckListDate,
		Status,
		SkillID
	 FROM vLS_CheckListTemp
	 WHERE 1=1
		AND (IsNull([CheckListTitle],'')  like N'%' + Isnull(@CheckListTitle,'') + '%')
		AND (Convert(datetime,[CheckListDate],103) like @CheckListDate)
		AND ([Status]  = @Status or isnull(@Status,-1)=-1)
		AND ([SkillID]  = @SkillID or isnull( @SkillID,'')='')
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		CheckListTempID,
		CheckListTitle,
		CheckListDate,
		Status,
		SkillID
	 FROM vLS_CheckListTemp
END
ELSE IF @Activity ='GetCategoryForCheklist'
BEGIN
	 
    SELECT c.ChkLstCateID, c.ChkLstCateName, c.[Level]
	FROM vLS_CheckListTemp a inner join tblLS_ChkLstTempDetail b on a.CheckListTempID = b.CheckListTempID
							 left join tblLS_ChkLstCategory c on b.ChkLstCateID = c.ChkLstCateID
	WHERE a.SkillID = @SkillID
	ORDER BY c.[Level], b.ItemNo

	-- spfrmLS_CheckListTemp @Activity ='GetCategoryForCheklist', @SkillID=38
END
ELSE IF @Activity ='DeleteCheckList'
BEGIN
	 DELETE A
	FROM tblLS_ChkLstTempDetail A
	inner join tblLS_CheckListTemp B on A.CheckListTempID = B.CheckListTempID
	WHERE [SkillID] = @SkillID
	
	DELETE FROM tblLS_CheckListTemp WHERE [SkillID] = @SkillID


END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmASS_Assessment]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmASS_Assessment]
( 
/*
Procedure: [spfrmASS_Assessment]
Desc:
	 Procedure for table: tblASS_Assessment
Author:
	 QuanBM
Create date:
	30-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@AssID	int = null,
@Year	int = null,
@No		nvarchar(500) = null,
@Date	nvarchar(10) = null,
@Remark	nvarchar(500) = null,
@Status	int = null,
@CompanyID	int = null,
@DeptID	int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblASS_Assessment where AssID = @AssID)
	BEGIN
	 UPDATE tblASS_Assessment SET		 
		  [Year] = @Year,
		  [No] = @No,
		  Date =  convert(datetime , @Date, 103),
		  Remark = @Remark,
		  Status = @Status,
		  CompanyID = @CompanyID,
		  DeptID = @DeptID		 
	 WHERE
		AssID = @AssID
	END
	ELSE
	BEGIN
		 INSERT INTO tblASS_Assessment ( [Year] , [No] , Date , Remark , Status , CompanyID , DeptID)
		 VALUES						   ( @Year , @No, convert(datetime , @Date,103) , @Remark, @Status, @CompanyID, @DeptID) 
	END
END
ELSE IF @Activity ='UpdateStatus'
BEGIN
	 UPDATE tblASS_Assessment SET		 
		 Status  = @Status,
		 Remark = @Remark
	 WHERE
		AssID = @AssID
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblASS_Assessment
	 WHERE
		AssID = @AssID

	DELETE FROM tblASS_AssessEmp
	 WHERE
		AssID = @AssID
	DELETE FROM tblASS_AssessEmpSkill
	 WHERE
		AssID = @AssID


END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 		
		ROW_NUMBER() OVER (ORDER BY a.AssID) AS STT, 
		a.AssID,
		a.[Year],
		a.[No],
		convert(nvarchar, a.Date, 103) as Date, 
		--a.Date,
		a.Remark,
		a.Status,
		a.CompanyID,
		c.CompanyName,
		a.DeptID,
		b.DeptName
	 FROM tblASS_Assessment a inner join tblLS_Dept b on a.DeptID = b.DeptID
								inner join tblLS_Company c on a.CompanyID = c.CompanyID
	 WHERE
		a.AssID = @AssID
	ORDER BY a.[Year] desc,a.[No] desc
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		ROW_NUMBER() OVER (ORDER BY a.AssID) AS STT, 
		a.AssID,
		a.[Year],
		a.[No],
		convert(nvarchar, a.Date, 103) as Date, 
		--a.Date,
		a.Remark,
		a.Status,
		a.CompanyID,
		c.CompanyName,
		a.DeptID,
		b.DeptName
	 FROM tblASS_Assessment a inner join tblLS_Dept b on a.DeptID = b.DeptID
								inner join tblLS_Company c on a.CompanyID = c.CompanyID
	ORDER BY a.[Year] desc,a.[No] desc
END	
ELSE IF @Activity ='GetData'
BEGIN
SET DATEFORMAT dmy;
	 SELECT 
		c.CompanyName,
		b.DeptName,
		ROW_NUMBER() OVER (ORDER BY a.AssID) AS STT, 
		a.AssID,
		a.[Year],
		a.[No],
		convert(nvarchar, a.Date, 103) as Date, 
		a.Remark,
		a.Status,
		a.CompanyID,
		a.DeptID,
		-- for report
		[AssNo] = a.[No],
		[Percent] = dbo.fnGetSkillAssPercent(a.AssID),
		[StatusName] = (Case when a.Status = 1 then 'Add New' else 'Complete' end)
	 FROM tblASS_Assessment a left join tblLS_Dept b on a.DeptID = b.DeptID
								left join tblLS_Company c on a.CompanyID = c.CompanyID
	where 1=1
		AND (a.AssID  = @AssID or isnull( @AssID,'')='')		
		AND (a.[Year]  = @Year or isnull( @Year,'')='')
		AND (a.[No]  = @No or isnull( @No,'')='')
		AND (a.Date  = convert(datetime ,@Date, 103)  or isnull( @Date,'')='')
		AND (a.CompanyID  = @CompanyID or isnull( @CompanyID,'')='')
		AND (a.DeptID  = @DeptID or isnull( @DeptID,'')='')
		AND (a.Status  = @Status or isnull( @Status,'')='')		
	ORDER BY a.[Year] desc,a.[No] desc
END
ELSE IF @Activity ='GetMaxID'
BEGIN
	 SELECT Ident_Current ('tblASS_Assessment')
	 
END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  Table [dbo].[tblTR_TrainResultEmp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_TrainResultEmp](
	[ResultID] [int] NOT NULL,
	[ResultFail] [bit] NULL,
	[EndLearningContract] [datetime] NULL,
	[Notes] [nvarchar](500) NULL,
	[LnEval_ID] [int] NULL,
	[BusImpEval_ID] [int] NULL,
	[ReactionEval_ID] [int] NULL,
	[EmpID] [int] NOT NULL,
	[TrainingCost] [int] NULL,
	[LineManager] [int] NULL,
 CONSTRAINT [PK_tblTR_TrainResultEmp] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC,
	[EmpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_TrainResultDept]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_TrainResultDept](
	[ResultID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[DeptID] [int] NOT NULL,
 CONSTRAINT [PK_tblTR_TrainResultDept_1] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC,
	[DeptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTR_TrainResultCost]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_TrainResultCost](
	[ResultID] [int] NOT NULL,
	[ActualCost] [numeric](18, 0) NULL,
	[AccountCodeID] [int] NOT NULL,
 CONSTRAINT [PK_tblTR_TrainResultCost] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC,
	[AccountCodeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLS_SkillArea]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLS_SkillArea](
	[AreaID] [int] NOT NULL,
	[SkillID] [int] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [XPKtblLS_SkillArea] ON [dbo].[tblLS_SkillArea] 
(
	[AreaID] ASC,
	[SkillID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_sysGetEmpIDPermission]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         function [dbo].[fn_sysGetEmpIDPermission](@UserID int)
returns table
as
return	
select distinct EmployeeID,UserID from
(
select EmployeeID, UserID
		from tblSYS_UserPermission where UserID = @UserID
	union all
		select EmployeeID, 0 UserID
		from tblHR_Employee
	union all
		select EmployeeID, UserID
		from tblSYS_User where UserID = @UserID
) as AA where UserID = @UserID
GO
/****** Object:  StoredProcedure [dbo].[spfrmASS_AssessEmp_Temp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmASS_AssessEmp_Temp]
( 
/*
Procedure: [spfrmASS_AssessEmp_Temp]
Desc:
	 Procedure for table: tblASS_AssessEmp_Temp
Author:
	 QuanBM
Create date:
	02-04-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@AssID	int = null,
@LineMgrEmpID	int = null,
@EmployeeID	int = null,

@Year	int = null,
@No		nvarchar(500) = null,
@Date	nvarchar(10) = null,
@CompanyID	int = null,
@DeptID	int = null,

@UserID int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblASS_AssessEmp_Temp where UserID = @UserID And EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblASS_AssessEmp_Temp SET		 
			AssID = @AssID		  
	 WHERE
			UserID = @UserID 
		And EmployeeID = @EmployeeID
	END
	ELSE
	BEGIN
		 INSERT INTO tblASS_AssessEmp_Temp ( UserID , EmployeeID , AssID )
		 VALUES						   ( @UserID , @EmployeeID, @AssID) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblASS_AssessEmp_Temp
	 WHERE
		UserID = @UserID 
		And EmployeeID = @EmployeeID
END
ELSE IF @Activity ='DeleteByUserID'
BEGIN
	 DELETE FROM tblASS_AssessEmp_Temp
	 WHERE
		UserID = @UserID 
END
ELSE IF @Activity ='GetDataByUserID'
BEGIN
	SET DATEFORMAT dmy;
	 SELECT * FROM tblASS_AssessEmp_Temp WHERE UserID = @UserID 		
END
ELSE IF @Activity ='GetData'
BEGIN

	SET DATEFORMAT dmy;

select @AssID = AssID from tblASS_Assessment where [Year]  = @Year and [No] = @No and CompanyID = @CompanyID and DeptID = @DeptID
--select * from tblASS_Assessment
	 SELECT 
		--ROW_NUMBER() OVER (ORDER BY a.AssID) AS STT, 
		@AssID as AssID,
		@Year as [Year], @No as [No],
		c.EmployeeID,
		c.EmployeeCode,
		(c.FirstName + ' ' +c.LastName) as EmployeeName,
		c.CompanyID,
		d.CompanyName,
		c.DeptID,
		e.DeptName,
		c.SectionID,
		f.SectionName
	 FROM tblHR_Employee c
		inner join (
			--select EmployeeID from (
				select EmployeeID 
					from tblASS_AssessEmp_Temp where UserID  = @UserID  and AssID = @AssID
				--union all
				--select EmployeeID 
				--	from tblASS_AssessEmp AE
				--	where AssID = @AssID
			--) AA group by EmployeeID
		) M On M.EmployeeID = c.EmployeeID
		--left join tblASS_AssessEmp Ass on Ass.EmployeeID = c.EmployeeID and 
		left join tblLS_Company d on c.CompanyID = d.CompanyID
		left join tblLS_Dept e on c.DeptID = e.DeptID
		left join tblLS_Section f on c.SectionID = f.SectionID		

END



IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmASS_AssessEmp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmASS_AssessEmp]
( 
/*
Procedure: [spfrmASS_Assessment]
Desc:
	 Procedure for table: tblASS_Assessment
Author:
	 QuanBM
Create date:
	30-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,
@UserID	int = null,
@AssID	int = null,
@LineMgrEmpID	int = null,
@EmployeeID	int = null,
@EmpStatus	bit = null,

@Year	int = null,
@No		nvarchar(500) = null,
@Date	nvarchar(10) = null,
@CompanyID	int = null,
@DeptID	int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblASS_AssessEmp where AssID = @AssID And EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblASS_AssessEmp SET		 
			LineMgrEmpID = @LineMgrEmpID,		  
			EmpStatus = @EmpStatus	
	 WHERE
		AssID = @AssID
		And EmployeeID = @EmployeeID
	END
	ELSE
	BEGIN
		 INSERT INTO tblASS_AssessEmp ( AssID , LineMgrEmpID , EmployeeID, EmpStatus )
		 VALUES						   ( @AssID , @LineMgrEmpID, @EmployeeID, @EmpStatus) 
	END
END
else IF @Activity ='SaveEmpStatus'
BEGIN
	IF Exists(Select * from tblASS_AssessEmp where AssID = @AssID And EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblASS_AssessEmp SET		 
			EmpStatus = 1	
	 WHERE
		AssID = @AssID
		And EmployeeID = @EmployeeID
	END
END

else IF @Activity ='SaveEmpAssID'
BEGIN
	delete C
	from tblASS_AssessEmpSkill C
	inner join tblASS_AssessEmp A on A.ASSID = C.ASSID and A.EmployeeID = C.EmployeeID
	left join tblASS_AssessEmp_Temp B on A.ASSID = B.ASSID and A.EmployeeID = B.EmployeeID and B.UserID = @UserID
	where A.ASSID = @AssID and B.EmployeeID is null

	delete A
	from tblASS_AssessEmp A
	left join tblASS_AssessEmp_Temp B on A.ASSID = B.ASSID and A.EmployeeID = B.EmployeeID  and B.UserID = @UserID
	where A.ASSID = @AssID and B.EmployeeID is null

	insert into tblASS_AssessEmp (AssID,LineMgrEmpID, EmployeeID, EmpStatus)
	select B.ASSID, null, B.EmployeeID, 0
	from tblASS_AssessEmp_Temp B
	left join tblASS_AssessEmp A on A.ASSID = B.ASSID and A.EmployeeID = B.EmployeeID 
	where B.ASSID = @AssID and A.EmployeeID is null
		 and B.UserID = @UserID

--select * from tblASS_AssessEmp_Temp where AssID = 59
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblASS_AssessEmp
	 WHERE
		AssID = @AssID 
	And EmployeeID = @EmployeeID

	DELETE FROM tblASS_AssessEmpSkill
	 WHERE
		AssID = @AssID 
	And EmployeeID = @EmployeeID
END
ELSE IF @Activity ='DeleteByAssID'
BEGIN
	 DELETE FROM tblASS_AssessEmp
	 WHERE
		AssID = @AssID 	

	DELETE FROM tblASS_AssessEmpSkill
	 WHERE
		AssID = @AssID 
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	SET DATEFORMAT dmy;
	 SELECT 		
		ROW_NUMBER() OVER (ORDER BY a.AssID) AS STT, 
		a.AssID,
		a.LineMgrEmpID,
		a.EmployeeID,
		c.EmployeeCode,
		(c.FirstName + ' ' +c.LastName) as EmployeeName,
		b.CompanyID,
		d.CompanyName,
		b.DeptID,
		e.DeptName,
		c.SectionID,
		f.SectionName
	 FROM tblASS_AssessEmp a inner join tblASS_Assessment b on a.AssID = b.AssID
							inner join tblHR_Employee c on a.EmployeeID = c.EmployeeID
							left join tblLS_Company d on b.CompanyID = d.CompanyID
							left join tblLS_Dept e on b.DeptID = e.DeptID
							left join tblLS_Section f on c.SectionID = f.SectionID	
	 WHERE
		a.AssID = @AssID
	And a.EmployeeID = @EmployeeID
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	SET DATEFORMAT dmy;
	 SELECT 
		ROW_NUMBER() OVER (ORDER BY a.AssID) AS STT, 
		a.AssID,
		a.LineMgrEmpID,
		a.EmployeeID,
		c.EmployeeCode,
		(c.FirstName + ' ' +c.LastName) as EmployeeName,
		b.CompanyID,
		d.CompanyName,
		b.DeptID,
		e.DeptName,
		c.SectionID,
		f.SectionName
	 FROM tblASS_AssessEmp a inner join tblASS_Assessment b on a.AssID = b.AssID
							inner join tblHR_Employee c on a.EmployeeID = c.EmployeeID
							left join tblLS_Company d on b.CompanyID = d.CompanyID
							left join tblLS_Dept e on b.DeptID = e.DeptID
							left join tblLS_Section f on c.SectionID = f.SectionID	
END	
ELSE IF @Activity ='GetData'
BEGIN
	SET DATEFORMAT dmy;
	 SELECT 
		ROW_NUMBER() OVER (ORDER BY a.AssID) AS STT, 
c.EmployeeID,
		b.AssID,
		b.LineMgrEmpID,
		b.EmployeeID,
		c.EmployeeCode,
		(c.FirstName + ' ' +c.LastName) as EmployeeName,
		a.CompanyID,
		d.CompanyName,
		a.DeptID,
		e.DeptName,
		c.SectionID,
		f.SectionName
	 FROM tblASS_Assessment a left join tblASS_AssessEmp b on a.AssID = b.AssID
							inner join tblHR_Employee c on b.EmployeeID = c.EmployeeID
							left join tblLS_Company d on a.CompanyID = d.CompanyID
							left join tblLS_Dept e on a.DeptID = e.DeptID
							left join tblLS_Section f on c.SectionID = f.SectionID		
	where 1=1
		--AND (a.AssID  = @AssID or isnull( @AssID,'')='')		
		--AND (a.LineMgrEmpID  = @LineMgrEmpID or isnull( @LineMgrEmpID,'')='')
		--AND (a.EmployeeID  = @EmployeeID or isnull( @EmployeeID,'')='')

		AND (a.[Year]  = @Year or isnull( @Year,'')='')
		AND (a.[No]  = @No or isnull( @No,'')='')
--		AND (a.Date  = convert(datetime ,@Date) or isnull( @Date,'')='')
		AND (a.CompanyID  = @CompanyID or isnull( @CompanyID,'')='')
		AND (a.DeptID  = @DeptID or isnull( @DeptID,'')='')
END
ELSE IF @Activity ='AddDataTemp'
BEGIN
	SET DATEFORMAT dmy;
	delete from tblASS_AssessEmp_Temp where UserID = @UserID --and AssID = @AssID
	insert into tblASS_AssessEmp_Temp (UserID, EmployeeID, AssID)
	 SELECT 
		@UserID,
		EmployeeID,AssID 
	FROM tblASS_AssessEmp
							
	where 1=1
		and AssID = @AssID
END
ELSE IF @Activity ='GetMaxID'
BEGIN
	 SELECT Ident_Current ('tblASS_Assessment')	 
END
ELSE IF @Activity ='GetDataByAssID'
BEGIN
	 SELECT * FROM tblASS_AssessEmp
	 WHERE
		AssID = @AssID	
END
ELSE IF @Activity ='GetDataByEmpStatus'
BEGIN
	 SELECT * FROM tblASS_AssessEmp
	 WHERE
		AssID = @AssID
	and EmpStatus = 1
END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'




--go
--select * from tblLS_AccountCode
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_OTE]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored procedure
CREATE PROCEDURE [dbo].[sp_sendmail_OTE] 
AS

declare @recipients1 varchar(max)
declare @subject1 nvarchar(255)
declare @body1 nvarchar(max)

declare @Year	nvarchar(500)
declare @No		nvarchar(500)
declare @Date	nvarchar(500)
declare @Desc	nvarchar(500)
declare @Email	nvarchar(500)
-----
declare @AppAddress	nvarchar(500) , @CCMail nvarchar(40)
set @AppAddress = (select [Value] from tblLS_SystemParam where [Name] = 'AppAddress')
set @CCMail = (select [Value] from tblLS_SystemParam where [Name] = 'CCMail')

declare curResult CURSOR FOR 
	select a.[Year], a.[No], a.[Date], a.[Description], c.Email
	from tblTR_OverTrainEff a inner join tblMail_OTE_Evaluation_Daily b on a.OverTrainEff_ID = b.OverTrainEff_ID
							  inner join tblHR_Employee c on b.EmployeeID = c.EmployeeID
	where 1=1
	and	convert(nvarchar,b.EffDate,103) = convert(nvarchar,getdate(),103)

OPEN curResult

FETCH NEXT FROM curResult 
INTO @Year, @No, @Date, @Desc, @Email

WHILE @@FETCH_STATUS = 0
BEGIN
	----------------------------------------------------------------------------------------------------
	set @recipients1 = @Email
	--set @recipients1 = (select Email from vHR_Employee where EmployeeCode = (select [Value] from tblLS_SystemParam where [Name] = 'TrainingManager'))
	set @subject1 = N'OVERALL TRAINING EFFECTIVENESS EVALUATION REMIND'
	set @body1 = N'
	Year: ' + @Year + '
	<br />No: ' + @No + '
	<br />Date: ' + @Date + '
	<br />Desc: ' + @Desc + '
	<br /><a href=''' + @AppAddress + 'MTR/OverTrainEffManagement.aspx''>Link here...</a>'

	IF IsNull(@recipients1,'') <> ''
	BEGIN

		EXEC msdb.dbo.sp_send_dbmail @recipients=@recipients1, @copy_recopients = @CCMail,
									 @subject = @subject1,
									 @body = @body1,
									 @body_format = 'HTML' ;
	END
	----------------------------------------------------------------------------------------------------
	FETCH NEXT FROM curResult 
	INTO @Year, @No, @Date, @Desc, @Email
END

CLOSE curResult
DEALLOCATE curResult

-- exec sp_sendmail_OTE
GO
/****** Object:  StoredProcedure [dbo].[spfrmHR_EmployeeImport]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmHR_EmployeeImport]
( 

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@EmployeeMaster	nvarchar(50) = null,
@NameFamily	nvarchar(500) = null,
@NameCommon	nvarchar(500) = null,
@GenderCode	nvarchar(10) = null,
@JobTitleCode	nvarchar(50) = null,
@CompanyCode	nvarchar(50) = null,
@DeptCode		nvarchar(50) = null,
@SectionCode	nvarchar(50) = null,
@JobLevelCode	nvarchar(50) = null,
@OldEmployeeCode	nvarchar(50) = null,

@DateBirth		datetime = null,
@BirthPlace		nvarchar(500) = null,
@Address	nvarchar(500) = null,
@HomeAddress	nvarchar(500) = null,
@DateOfHire		datetime = null,
@DateOfTermination	datetime = null,
@EmployeeStatusID	int = null,
@Telephone	nvarchar(50) = null,
@Email	nvarchar(50) = null,
@InsertUserID	int = null,
@InsertDate	nvarchar(10) = null,
@UpdateUserID	int = null,
@UpdateDate	nvarchar(10) = null,
-- More
@UserID		int = null,
@JobTitleID	int = null,
@CompanyID	int = null,
@DeptID		int = null,
@SectionID	int = null,
@JobLevelID	int = null,

@FullName	nvarchar(500) = null
) 
AS
set @Address = @HomeAddress
if (isnull(@EmployeeMaster,'') = '' or isnull(@NameFamily,'') = '' or isnull(@NameCommon,'') = ''
	 or isnull(@CompanyCode,'') = '' or  isnull(@DeptCode,'') = '' or  isnull(@DateOfHire,'') = '' or  isnull(@GenderCode,'') = '')
		begin
			set @ReturnMess = N'Check again EmployeeMaster, NameFamily, NameCommon, CompanyCode,DeptCode, DateOfHire, GenderCode'
			return 
		end
if (isnull(@GenderCode,'') = 'M')
	set @GenderCode = 1
else
	set @GenderCode = 0

	declare		@flag		 int	

	select @CompanyID = CompanyID
	from [tblLS_Company] where upper(CompanyCode) = rtrim(ltrim(upper(@CompanyCode)))
	if @CompanyID is null -- chua co thong tin Corp trong DB
		begin
			set @ReturnMess = N'Not find Company in system'
			return
		end
	
	select @DeptID = DeptID
	from [tblLS_Dept] 
	where upper(DeptCode) = rtrim(ltrim(upper(@DeptCode))) and upper(CompanyID) = rtrim(ltrim(upper(@CompanyID)))
	if @DeptID is null
		begin
			set @ReturnMess = N'Not find Department in system'
			return
		end

	if (@SectionCode != '')
	begin
		select @SectionID = SectionID
		from [tblLS_Section] 
		where upper(SectionCode) = rtrim(ltrim(upper(@SectionCode))) 
			and upper(DeptID) = rtrim(ltrim(upper(@DeptID)))
		if @SectionID is null
			begin
				set @ReturnMess = N'Not find Section in system'
				return
			end


	end
	if (@JobTitleCode != '')
	begin
		select @JobTitleID = JobTitleID
		from [tblLS_JobTitle] 
		where upper(JobTitleCode) = rtrim(ltrim(upper(@JobTitleCode))) 
		if @JobTitleID is null
			begin
				set @ReturnMess = N'Not find Jobtitle in system'
				return
			end
	end

	if (@JobLevelCode != '')
	begin
		select @JobLevelID = JobLevelID
		from [tblLS_JobLevel] 
		where upper(JobLevelCode) = rtrim(ltrim(upper(@JobLevelCode))) 
		if @JobLevelID is null
			begin
				set @ReturnMess = N'Wanring: Not find JobLevel in system!'
				--return
			end
	end

	if @DateOfTermination != ''
		set @EmployeeStatusID = 2
	else
		set @EmployeeStatusID = 1

IF @Activity ='Imports'
BEGIN
-- Update mã cũ
--Update A set [EmployeeCode] = @EmployeeMaster
--from tblHR_Employee A where [EmployeeCode] = @OldEmployeeCode and [CompanyID]  = @CompanyID


	IF Exists(Select * from tblHR_Employee where [EmployeeCode] = @EmployeeMaster and [CompanyID]  = @CompanyID)
	BEGIN
	 UPDATE tblHR_Employee SET
		 [FirstName]  = @NameFamily,
		 [LastName]  = @NameCommon,
		 [GenderCode]  = @GenderCode,
		 [DateOfBirth]  =@DateBirth,
		 [BirthPlace]  = @BirthPlace,
		 [Address]  = @Address,
		 [HomeAddress]  = @HomeAddress,
		 [DateOfHire]  = @DateOfHire,
		 [DateOfTermination]  = @DateOfTermination,
--select * from		 tblHR_Employee
		 [EmployeeStatusID]  = @EmployeeStatusID,
		 [JobTitleID]  = @JobTitleID,
		 [JobLevelID]  = @JobLevelID,
		 [CompanyID]  = @CompanyID,
		 [DeptID]  = @DeptID,
		 [SectionID]  = @SectionID,
		Telephone = @Telephone,
		Email = @Email,
		 [InsertUserID]  = @InsertUserID,
		 [InsertDate]  = getdate()
	 WHERE
		[EmployeeCode] = @EmployeeMaster  and [CompanyID]  = @CompanyID
	END
	ELSE
	BEGIN
		 INSERT INTO tblHR_Employee ( [EmployeeCode] , [FirstName] , [LastName] , [GenderCode] , [DateOfBirth] 
	, [BirthPlace] , [Address] , [HomeAddress] , [DateOfHire] , [DateOfTermination] 
	, [EmployeeStatusID] 
	, [JobTitleID] , [JobLevelID] , [CompanyID] , [DeptID] , [SectionID] 
	, [InsertUserID] , [InsertDate] ,Telephone, Email)
		 VALUES 
		( @EmployeeMaster, @NameFamily, @NameCommon, @GenderCode,@DateBirth, @BirthPlace, @Address
, @HomeAddress,@DateOfHire, @DateOfTermination, @EmployeeStatusID
, @JobTitleID, @JobLevelID, @CompanyID, @DeptID, @SectionID, @InsertUserID, getdate(),@Telephone, @Email) 
	END

	
END


IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_SumaryReport]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmRPT_SumaryReport]
/*
Procedure: spfrmRPT_SumaryReport
Desc:
	 
Author:
	 QuanBM
Create date:
	25/05/2009
History:
	...
*/
(
	@Activity nvarchar(20) = null,
	@Year int = null,
	@CompanyID int = null,
	@UserID int = null
)
AS
BEGIN

declare @GroupCode int, @DeptID int
select @GroupCode = GroupCode
from tblSYS_UserGroup A
inner join tblSYS_Group B On A.GroupID = B.GroupID
where A.UserID = @UserID

if (@GroupCode = 2)
begin
	select @CompanyID = A.CompanyID,@DeptID = A.DeptID 
	from tblHR_Employee A
	inner join tblSYS_User B On A.EmployeeID = B.EmployeeID
	where B.UserID = @UserID
end


Declare @FromDate nvarchar(10),@ToDate nvarchar(10)
set @FromDate = '01/10/'+ cast ((@Year - 1) as nvarchar(4))
set @ToDate = '30/09/'+ cast ((@Year) as nvarchar(4))
if (@Activity = 'GetData')
begin
select --A.CompanyName,
 B.DeptName
,isnull(C.SectionName, '') as SectionName
,THours10 as OCT
,THours11 as NOV
,THours12 as [DEC]
,THours01 as JAN
,THours02 as FEB
,THours03 as MAR
,THours04 as APR
,THours05 as MAY
,THours06 as JUN
,THours07 as JUL
,THours08 as AUG
,THours09 as SEP
,THours as YTD
from tblLS_Company A
inner join tblLS_Dept B On A.CompanyID = B.CompanyID
inner join tblLS_Section C On B.DeptID = C.DeptID

-- Training Result Month Oct
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours10
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year - 1) and month(A.FromDate) = 10
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T10 on T10.CompanyID = A.CompanyID and T10.DeptID = B.DeptID and T10.SectionID = C.SectionID

-- Training Result Month Nov
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours11
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year - 1) and month(A.FromDate) = 11
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T11 on T11.CompanyID = A.CompanyID and T11.DeptID = B.DeptID and T11.SectionID = C.SectionID
-- Training Result Month Dec
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours12
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year - 1) and month(A.FromDate) = 12
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T12 on T12.CompanyID = A.CompanyID and T12.DeptID = B.DeptID and T12.SectionID = C.SectionID
-- Training Result Month Jan
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours01
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 01
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T01 on T01.CompanyID = A.CompanyID and T01.DeptID = B.DeptID and T01.SectionID = C.SectionID
-- Training Result Month Feb
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours02
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 02
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T02 on T02.CompanyID = A.CompanyID and T02.DeptID = B.DeptID and T02.SectionID = C.SectionID
-- Training Result Month Mar
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours03
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 03
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T03 on T03.CompanyID = A.CompanyID and T03.DeptID = B.DeptID and T03.SectionID = C.SectionID
-- Training Result Apr
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours04
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 04
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T04 on T04.CompanyID = A.CompanyID and T04.DeptID = B.DeptID and T04.SectionID = C.SectionID
-- Training Result May
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours05
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 05
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T05 on T05.CompanyID = A.CompanyID and T05.DeptID = B.DeptID and T05.SectionID = C.SectionID
-- Training Result 06
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours06
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 06
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T06 on T06.CompanyID = A.CompanyID and T06.DeptID = B.DeptID and T06.SectionID = C.SectionID
-- Training Result 07
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours07
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 07
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T07 on T07.CompanyID = A.CompanyID and T07.DeptID = B.DeptID and T07.SectionID = C.SectionID
-- Training Result 08
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours08
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 08
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T08 on T08.CompanyID = A.CompanyID and T08.DeptID = B.DeptID and T08.SectionID = C.SectionID
-- Training Result 09
left join (
	select E.CompanyID, E.DeptID, E.SectionID,
	count(*) * EmpHours as THours09
	from tblTR_TrainResultEmp A
	inner join (
		select A.ResultID
		, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
		from tblTR_TrainingResult A
		inner join (
			select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
		) B On A.ResultID = B.ResultID
		where year(A.FromDate) = (@Year) and month(A.FromDate) = 09
	) B On A.ResultID = B.ResultID
	inner join tblHR_Employee E On E.EmployeeID = A.EmpID
	group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	
) T09 on T09.CompanyID = A.CompanyID and T09.DeptID = B.DeptID and T09.SectionID = C.SectionID
-- Training Result YTD
left join (
	select A.CompanyID, A.DeptID, A.SectionID,
	sum(THours) as THours
	from
	(
		select E.CompanyID, E.DeptID, E.SectionID,
		count(*) * EmpHours as THours
		from tblTR_TrainResultEmp A
		inner join (
			select A.ResultID
			, (A.Duration  / case when isnull(TEmpCount,1) = 0 then 1 else isnull(TEmpCount,1) end ) as EmpHours
			from tblTR_TrainingResult A
			inner join (
				select ResultID, count(*) as TEmpCount from tblTR_TrainResultEmp group by ResultID
			) B On A.ResultID = B.ResultID
			where A.FromDate between convert(datetime,@FromDate,103) and convert(datetime,@ToDate,103)
		) B On A.ResultID = B.ResultID
		inner join tblHR_Employee E On E.EmployeeID = A.EmpID
		group by E.CompanyID, E.DeptID, E.SectionID, B.EmpHours
	) A
	group by A.CompanyID, A.DeptID, A.SectionID
) YTD on YTD.CompanyID = A.CompanyID and YTD.DeptID = B.DeptID and YTD.SectionID = C.SectionID

where A.CompanyID = @CompanyID
AND (B.DeptID = @DeptID or isnull( @DeptID,'')='')
Order by A.CompanyName,  B.DeptName, C.SectionName
end
else if @Activity = 'Sum'
begin
	
DECLARE @iMonth int,@SumEmpCom int,@WorkHours int,@No1 numeric(18,4), @TotalThucHien numeric(18,4), @TotalPlan numeric(18,4), @TotalCancel numeric(18,4)
DECLARE @iYear int
DECLARE @DateYTD	nvarchar(10),@ToDateYTD	nvarchar(10)

SET @DateYTD = '01/10/' + convert(nvarchar(4),@Year - 1)
SET @ToDateYTD = '30/09/' + convert(nvarchar(4),@Year)

	
Select @SumEmpCom = count(*) from tblHR_Employee where EmployeeStatusID = 1 and CompanyID = @CompanyID
--Select count(*) from tblHR_Employee where EmployeeStatusID = 1 and CompanyID = @CompanyID
set @WorkHours = @SumEmpCom * 191

SELECT @TotalThucHien = count(*)
		 FROM tblTR_TrainingResult a 
		inner join tblTR_TrainingPlan b on a.PlanID = b.PlanID		
		WHERE 1=1
			and ((a.FromDate between convert(datetime,@DateYTD, 103) and convert(datetime,@ToDateYTD, 103)))		
			AND (b.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
			AND (b.DeptID = @DeptID or isnull( @DeptID,'')='')
			and (b.StatusID = 4 or b.StatusID = 5) -- Khóa Finish
			and isnull(IsOther,0) = 0 -- Không tính Other

SELECT @TotalPlan = count(*)
		 FROM tblTR_TrainingPlan b
		WHERE 1=1
			and ((b.FromDate between convert(datetime,@DateYTD, 103) and convert(datetime,@ToDateYTD, 103)))		
			AND (b.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
			AND (b.DeptID = @DeptID or isnull( @DeptID,'')='')
			and b.StatusID = 1 -- Khóa Finish
			and isnull(IsOther,0) = 0 -- Không tính Other

SELECT @TotalCancel = count(*)
		 FROM tblTR_TrainingPlan b
		WHERE 1=1
			and ((b.FromDate between convert(datetime,@DateYTD, 103) and convert(datetime,@ToDateYTD, 103)))		
			AND (b.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
			AND (b.DeptID = @DeptID or isnull( @DeptID,'')='')
			and (b.StatusID = 2 or b.StatusID = 3) -- Khóa Finish
			and isnull(IsOther,0) = 0 -- Không tính Other

set @No1 = (
		@TotalThucHien / case when isnull(@TotalPlan,0) +@TotalThucHien - isnull(@TotalCancel,0) = 0 then 1 
						else isnull(@TotalPlan,0) +@TotalThucHien - isnull(@TotalCancel,0) end
		 )

select @SumEmpCom as TotalEmp, @WorkHours as WorkHours, @TotalThucHien as ThucHien, isnull(@TotalPlan,0) +@TotalThucHien as [Plan]
, isnull(@TotalCancel,0) as Cancel, @No1 as Carried

end



END
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_LearningEvaluation]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmTR_LearningEvaluation]
( 
/*
Procedure:[spfrmTR_LearningEvaluation]
Desc:
	 Procedure for table: [spfrmTR_LearningEvaluation]
Author:
	...
Create date:
	04-03-2009
History:
	...
*/
@Activity	varchar(50),
@EvalCateGroupID int = null,
@CateNo int = null,
@GroupName varchar(500) = null,
@LnEvalCateID int = null,
@LnEvalCateName varchar(500) = null,
@Value varchar(500) = null,

@ResultID int = null,
@LnEval_ID	int = null,
@CreateDate	nvarchar(10) = null,
@EmployeeID	int = null,

@ListEvalCateID nvarchar(2000) = null,
@ListValue nvarchar(4000) = null
) 
AS
IF @Activity ='GetGroup'
BEGIN
	 SELECT 
		a.LnEvalCateGroupID,
		a.GroupName,
		b.LnEvalCateName,
		a.CateNo,
		b.LnEvalCateID,
		'' as [Value]
	 FROM tblLS_LnEvalCateGroup a inner join tblLS_LnEvalCategory b on a.LnEvalCateGroupID =b.LnEvalCateGroupID
--	WHERE
--		a.LnEvalCateGroupID = @EvalCateGroupID

	-- spfrmTR_LearningEvaluation @Activity ='GetGroup'
END

ELSE IF @Activity ='GetGroupByLnEval_ID'
BEGIN
	 SELECT 
		a.LnEvalCateGroupID,
		a.GroupName,
		b.LnEvalCateName,
		a.CateNo,
		b.LnEvalCateID,
		c.[Value]
	FROM tblLS_LnEvalCateGroup a inner join tblLS_LnEvalCategory b on a.LnEvalCateGroupID = b.LnEvalCateGroupID
								 left join tblTR_LearningEvalDetail c on b.LnEvalCateID = c.LnEvalCateID
	WHERE
			c.LnEval_ID = @LnEval_ID
	
-- spfrmTR_LearningEvaluation @Activity ='GetGroupByLnEval_ID', @LnEval_ID=9
END


ELSE IF @Activity ='Save'
BEGIN
--		INSERT INTO tblTR_LearningEval(CreateDate)
--		VALUES	(convert(datetime,@CreateDate))
--		
--		INSERT INTO tblTR_LearningEvalDetail([Value],LnEvalCateID)
--		VALUES  (@Value,@LnEvalCateID)

		IF Exists(Select * from tblTR_LearningEval where LnEval_ID = @LnEval_ID)
		BEGIN
		 UPDATE tblTR_LearningEval SET
			 [CreateDate]  = Convert(datetime,@CreateDate,103)
		 WHERE
			[LnEval_ID] = @LnEval_ID

		 DELETE FROM tblTR_LearningEvalDetail WHERE [LnEval_ID] = @LnEval_ID

		 INSERT INTO tblTR_LearningEvalDetail([LnEval_ID],[Value],[LnEvalCateID])
		 SELECT @LnEval_ID, a.listValue, b.listValue 
		 FROM GetTableFromList(@ListValue, DEFAULT) a, GetTableFromList(@ListEvalCateID, DEFAULT) b
		 WHERE a.listNo = b.listNo
			
		END
		ELSE
		BEGIN
			 INSERT INTO tblTR_LearningEval (CreateDate) VALUES (GETDATE()) 

			 SET @LnEval_ID = SCOPE_IDENTITY()

			 INSERT INTO tblTR_LearningEvalDetail([LnEval_ID],[Value],[LnEvalCateID])
			 SELECT @LnEval_ID, a.listValue, b.listValue 
			 FROM GetTableFromList(@ListValue, DEFAULT) a, GetTableFromList(@ListEvalCateID, DEFAULT) b
			 WHERE a.listNo = b.listNo

			 -- Update Training Result
			 UPDATE tblTR_TrainResultEmp
			   SET LnEval_ID = @LnEval_ID
			 WHERE ResultID = @ResultID
			 AND   EmpID = @EmployeeID
			
			-- Remove Remind
			Delete from tblMail_LearningEvaluation
			where ResultID = @ResultID
			and	  EmployeeID = @EmployeeID
			
		END
END		

ELSE IF @Activity ='GetInfoByTrainingResult'
BEGIN
		select a.ResultID,
			   a.CourseDesc,
			   a.Duration,
			   c.CompanyName
		from tblTR_TrainingResult a left join tblTR_TrainingPlan b on a.PlanID = b.PlanID
						    left join tblLS_Company c on b.CompanyID = c.CompanyID
		where a.ResultID = @ResultID

	-- spfrmTR_LearningEvaluation @Activity ='GetInfoByTrainingResult', @ResultID=14
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_Budgetcontrol_04_Old]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmRPT_Budgetcontrol_04_Old]
(
		/*
		Procedure: [spfrmRPT_Budgetcontrol_04]
		Desc:
			 Procedure for table: 
		Author:
			 NgocLD
		Create date:
		08-04-2009
		History:
			...
		*/
@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@CompanyID	int = null,
@DeptID	int = null,
@Year	int = null,

@UserID	int = null

)
AS

declare @GroupCode int

IF @Activity ='GetData'
BEGIN	

select @GroupCode = GroupCode
from tblSYS_UserGroup A
inner join tblSYS_Group B On A.GroupID = B.GroupID
where A.UserID = @UserID

if (@GroupCode = 2)
begin
	select @CompanyID = A.CompanyID,@DeptID = A.DeptID 
	from tblHR_Employee A
	inner join tblSYS_User B On A.EmployeeID = B.EmployeeID
	where B.UserID = @UserID
end
select * from (
	SELECT distinct
		ROW_NUMBER() over (order by de.DeptName)as [No],
		isnull(de.DeptName, 'Company wide') DeptName,
		ac.AccountCode,

		[dbo].[fnConvertNumber](sum(bu.PlanCost)) as TotalPlanCost,sum(bu.PlanCost) as PlanCost,
		[dbo].[fnConvertNumber](sum(rc.ActualCost)) as TotalActualCost, sum(rc.ActualCost) as ActualCost,
		Variance = [dbo].[fnConvertNumber](sum(bu.PlanCost) - sum(rc.ActualCost)),
		ac.Description

	FROM 
		vLS_AccountCode ac	left join tblTR_PlanBudget bu		on bu.AccountCodeID = ac.AccountCodeID
							left join tblLS_Dept de				on de.DeptID = ac.DeptID
							left join tblLS_Company co			on co.CompanyID = de.CompanyID
							left join tblTR_TrainingPlan pl		on bu.PlanID = pl.PlanID and pl.[Year] = @Year
							left join tblTR_TrainingResult tr	on tr.PlanID = pl.PlanID
							left join tblTR_TrainResultCost rc	on tr.ResultID = rc.ResultID and rc.AccountCodeID = ac.AccountCodeID

	WHERE 1=1
	and ac.CompanyID = @CompanyID
	and (de.DeptID = @DeptID or isnull(@DeptID,'')='')

	group by de.DeptName, ac.AccountCode,ac.Description
) aa
order by aa.DeptName, AccountCode
--select * from tblSYS_UserGroup

		--    spfrmRPT_Budgetcontrol_04 @Activity ='GetData', @Year = 2009, @CompanyID=2 
END

IF @Activity ='Demo'
BEGIN	
	SELECT distinct
		ROW_NUMBER() over (order by de.DeptName)as [No],
		de.DeptName,
		ac.AccountCode,

		[dbo].[fnConvertNumber](sum(bu.PlanCost)) as TotalPlanCost,

		TotalActualCost = [dbo].[fnConvertNumber]((
			select sum(rs.ActualCost) 
			from tblTR_TrainResultCost rs, vLS_AccountCode acc 
			where 1=1
				and rs.AccountCodeID = acc.AccountCodeID
				and acc.AccountCode = ac.AccountCode
			group by rs.AccountCodeID)),
		
		Variance = [dbo].[fnConvertNumber](sum(bu.PlanCost) - (select sum(rs.ActualCost) 
			from tblTR_TrainResultCost rs, vLS_AccountCode acc 
			where 1=1
				and rs.AccountCodeID = acc.AccountCodeID
				and acc.AccountCode = ac.AccountCode
			group by rs.AccountCodeID)),

		Description = (select Description from vLS_AccountCode code where code.AccountCode = ac.AccountCode)
		

	FROM 
		vLS_AccountCode ac	left join tblTR_PlanBudget bu	on bu.AccountCodeID = ac.AccountCodeID
							left join tblLS_Dept de			on de.DeptID = ac.DeptID
							left join tblLS_Company co		on co.CompanyID = de.CompanyID
							left join tblTR_TrainingPlan pl	on bu.PlanID = pl.PlanID

	WHERE 1=1
	and co.CompanyID = @CompanyID
	and pl.[Year] = @Year
	and (de.DeptID = @DeptID or isnull(@DeptID,'')='')

	group by de.DeptName, ac.AccountCode

		--    spfrmRPT_Budgetcontrol_04 @Activity ='GetData', @Year = 2009, @CompanyID=2 
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_Budgetcontrol_04]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmRPT_Budgetcontrol_04]
(
		/*
		Procedure: [spfrmRPT_Budgetcontrol_04]
		Desc:
			 Procedure for table: 
		Author:
			 NgocLD
		Create date:
		08-04-2009
		History:
			...
		*/
@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@CompanyID	int = null,
@DeptID	int = null,
@Year	int = null,

@UserID	int = null

)
AS

declare @GroupCode int

IF @Activity ='GetData'
BEGIN	

select @GroupCode = GroupCode
from tblSYS_UserGroup A
inner join tblSYS_Group B On A.GroupID = B.GroupID
where A.UserID = @UserID

if (@GroupCode = 2)
begin
	select @CompanyID = A.CompanyID,@DeptID = A.DeptID 
	from tblHR_Employee A
	inner join tblSYS_User B On A.EmployeeID = B.EmployeeID
	where B.UserID = @UserID
end

select * from (
	SELECT distinct
		ROW_NUMBER() over (order by de.DeptName)as [No],
		isnull(de.DeptName, 'Company wide') DeptName,
		C.CourseName,

		[dbo].[fnConvertNumber](sum(bu.PlanCost)) as TotalPlanCost,sum(bu.PlanCost) as PlanCost,
		[dbo].[fnConvertNumber](sum(rc.ActualCost)) as TotalActualCost, sum(rc.ActualCost) as ActualCost,
		Variance = [dbo].[fnConvertNumber](sum(bu.PlanCost) - sum(rc.ActualCost))


	FROM 
		vLS_AccountCode ac	inner join tblTR_PlanBudget bu		on bu.AccountCodeID = ac.AccountCodeID
							left join tblLS_Dept de				on de.DeptID = ac.DeptID
							left join tblLS_Company co			on co.CompanyID = de.CompanyID
							inner join tblTR_TrainingPlan pl		on bu.PlanID = pl.PlanID and pl.[Year] = @Year
							inner join tblTR_TrainingResult tr	on tr.PlanID = pl.PlanID
							left join tblTR_TrainResultCost rc	on tr.ResultID = rc.ResultID and rc.AccountCodeID = ac.AccountCodeID
							left join tblLS_Course C	on pl.CourseID = C.CourseID

	WHERE 1=1
	and ac.CompanyID = @CompanyID
	and (de.DeptID = @DeptID or isnull(@DeptID,'')='')

	group by de.DeptName, C.CourseName
) aa
order by aa.DeptName, aa.CourseName
--select * from tblSYS_UserGroup

		--    spfrmRPT_Budgetcontrol_04 @Activity ='GetData', @Year = 2009, @CompanyID=2 
END

IF @Activity ='Demo'
BEGIN	
	SELECT distinct
		ROW_NUMBER() over (order by de.DeptName)as [No],
		de.DeptName,
		ac.AccountCode,

		[dbo].[fnConvertNumber](sum(bu.PlanCost)) as TotalPlanCost,

		TotalActualCost = [dbo].[fnConvertNumber]((
			select sum(rs.ActualCost) 
			from tblTR_TrainResultCost rs, vLS_AccountCode acc 
			where 1=1
				and rs.AccountCodeID = acc.AccountCodeID
				and acc.AccountCode = ac.AccountCode
			group by rs.AccountCodeID)),
		
		Variance = [dbo].[fnConvertNumber](sum(bu.PlanCost) - (select sum(rs.ActualCost) 
			from tblTR_TrainResultCost rs, vLS_AccountCode acc 
			where 1=1
				and rs.AccountCodeID = acc.AccountCodeID
				and acc.AccountCode = ac.AccountCode
			group by rs.AccountCodeID)),

		Description = (select Description from vLS_AccountCode code where code.AccountCode = ac.AccountCode)
		

	FROM 
		vLS_AccountCode ac	left join tblTR_PlanBudget bu	on bu.AccountCodeID = ac.AccountCodeID
							left join tblLS_Dept de			on de.DeptID = ac.DeptID
							left join tblLS_Company co		on co.CompanyID = de.CompanyID
							left join tblTR_TrainingPlan pl	on bu.PlanID = pl.PlanID

	WHERE 1=1
	and co.CompanyID = @CompanyID
	and pl.[Year] = @Year
	and (de.DeptID = @DeptID or isnull(@DeptID,'')='')

	group by de.DeptName, ac.AccountCode

		--    spfrmRPT_Budgetcontrol_04 @Activity ='GetData', @Year = 2009, @CompanyID=2 
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_EmpSkillProfile_12]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmRPT_EmpSkillProfile_12]

@Activity	varchar(50) = null,
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID       int= null,
@CompanyID       int= null,
@DeptID		int = null,
@SectionID		int = null,
@AreaID		int = null,

@AssID		int = null,

@UserID       int= null

AS
BEGIN	

--select @AssID = AssID, @Status = Status from tblASS_Assessment where [Year] =@Year and [No] = @PerfNo
--	SELECT 		
--		ROW_NUMBER() OVER (ORDER BY EmployeeID) AS [No],
--		a.EmployeeID,		
--		a.EmployeeCode,
	SELECT '' as AreaName, S1.SkillName as LevelA,S2.SkillName as LevelB,S3.SkillName as LevelC
		,S4.SkillName as LevelD
		,AES.*
		,case when ( AES.Target - AES.[Current]) < 0 then 0 else ( AES.Target - AES.[Current]) end as Gap
		,isnull(CL.CheckListTempID,-1) as CheckListTempID, CL.CheckListTitle
		, e.FirstName + ' ' + e.LastName as UserAssessment
		, AES.EffDate as LastUpdate
	 FROM [tblASS_AssessEmpSkill] as AES
		inner join tblLS_Skill S4 on S4.SkillID = AES.SkillID
		inner join tblLS_Skill S3 on S3.SkillID = S4.ParentID and S3.Level = 3
		inner join tblLS_Skill S2 on S2.SkillID = S3.ParentID and S2.Level = 2
		inner join tblLS_Skill S1 on S1.SkillID = S2.ParentID and S1.Level = 1
		--left join tblLS_Area Ar on Ar.AreaID = AES.AreaID
		left join tblLS_CheckListTemp CL on CL.SkillID = AES.SkillID and CL.Status = 1
		left join tblSYS_User Users On Users.UserID = AES.UserID
		left join tblHR_Employee e On e.EmployeeID = Users.EmployeeID
		--left join tblASS_CheckList ECL on ECL.CheckListID = AES.SkillID and CL.Status = 1
--select * from tblASS_CheckList
	 WHERE 1=1
		AND (@EmployeeID = AES.EmployeeID) and @AssID = AES.AssID
		--AND (isnull( @AreaID,'')='' or @AreaID = AES.AreaID)

		
--select * from [tblASS_AssessEmpSkill]
	order by S1.SkillName,S2.SkillName,S3.SkillName,S4.SkillName--S1.Rank,S2.Rank,S3.Rank,S4.Rank

END
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_MonthlyTraining_02]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmRPT_MonthlyTraining_02]
/*
Procedure: [spfrmRPT_MonthlyTraining_02]
Desc:
	 Procedure for table: tblTR_TrainingResult
Author:
	 QuanBM
Create date:
	06-04-2009
History:
	...
*/
@Activity	varchar(50),
@FromDate	nvarchar(10) = null,
@ToDate		nvarchar(10) = null,
@CompanyID	int = null,
@UserID	int = null

AS


declare @GroupCode int, @DeptID int
select @GroupCode = GroupCode
from tblSYS_UserGroup A
inner join tblSYS_Group B On A.GroupID = B.GroupID
where A.UserID = @UserID

if (@GroupCode = 2)
begin
	select @CompanyID = A.CompanyID,@DeptID = A.DeptID 
	from tblHR_Employee A
	inner join tblSYS_User B On A.EmployeeID = B.EmployeeID
	where B.UserID = @UserID
end

IF @Activity = 'GetDetail'
BEGIN		
	SELECT 
		IsNull(e.DeptName, 'Company Wide') as DeptName,
		ROW_NUMBER() OVER (ORDER BY f.Rank, e.Rank, a.[Year], b.CourseName) AS [No]
		,d.PlanID	
		,b.CourseName
		,convert(nvarchar,d.[FromDate],103) +'-'+convert(nvarchar,d.[ToDate],103) as FromDate
		,d.Duration
		,NoOfPart = (select count(*) from tblTR_TrainResultEmp where tblTR_TrainResultEmp.ResultID = d.ResultID)						
		,(d.Duration * (select count(*) from tblTR_TrainResultEmp where tblTR_TrainResultEmp.ResultID = d.ResultID)) as TotalHr
		,d.Method
		--,h.ProviderName
		,ProviderName = IsNull(h.ProviderName, i.TrainerName)
, LossCategoryName as TrainingObject
		
	 FROM tblTR_TrainingResult d 
			inner join tblTR_TrainingPlan a on d.PlanID = a.PlanID
			left join tblLS_LossCategory LC On LC.LossCategoryID = a.LossCategoryID
			left join dbo.tblLS_Course b on a.CourseID = b.CourseID
			left join (select PlanID,sum(PlanCost) as PlanCost from dbo.tblTR_PlanBudget group by PlanID
					   ) c on a.PlanID = c.PlanID
			left join tblLS_Company f on a.CompanyID = f.CompanyID
			left join tblLS_Dept e on a.DeptID = e.DeptID
			left join tblLS_Provider h on d.ProviderID = h.ProviderID
			left join tblLS_Trainer i on d.TeacherID = i.TrainerID
			inner join (
				select CompanyID from tblHR_Employee E
				inner join tblSYS_UserPermission Per on Per.EmployeeID = E.EmployeeID
				where Per.UserID = @UserID-- Phan quyen du lieu
				group by CompanyID
			) Perc on Perc.CompanyID = a.CompanyID
	where 1=1
		and ((d.FromDate between convert(datetime,@FromDate, 103) and convert(datetime,@ToDate, 103))or isnull( @FromDate,'')='')		
		AND (a.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
		AND (a.DeptID = @DeptID or isnull( @DeptID,'')='')

		and a.StatusID = 4 -- Khóa Finish
	Order by DeptName,f.Rank, e.Rank, a.[Year], b.CourseName

	-- spfrmRPT_MonthlyTraining_02 @Activity = 'GetDetail', @FromDate='01/01/2009', @ToDate='31/12/2009', @CompanyID=1
END

ELSE IF @Activity = 'GetSum'
BEGIN

DECLARE @iMonth int,@SumEmpCom int,@WorkHours int,@No1 numeric(18,4), @TotalThucHien numeric(18,4), @TotalPlan numeric(18,4), @TotalCancel numeric(18,4)
DECLARE @iYear int
DECLARE @DateYTD	nvarchar(10),@ToDateYTD	nvarchar(10)

SET @iMonth = convert(int,(select DATEPART(MM, convert(datetime, @FromDate, 103))))
SET @iYear = convert(int,(select DATEPART(yyyy, convert(datetime, @FromDate, 103))))
SET @DateYTD = '01/10/' + convert(nvarchar(4),@iYear)

IF @iMonth < 10
BEGIN
	SET @iYear = @iYear - 1
	SET @DateYTD = '01/10/' + convert(nvarchar(4),@iYear)
	SET @ToDateYTD = '30/09/' + convert(nvarchar(4),@iYear + 1)
END
	
Select @SumEmpCom = count(*) from tblHR_Employee where EmployeeStatusID = 1 and CompanyID = @CompanyID


SELECT @TotalThucHien = count(*)
		 FROM tblTR_TrainingResult a 
		inner join tblTR_TrainingPlan b on a.PlanID = b.PlanID		
		WHERE 1=1
			and ((a.FromDate between convert(datetime,@DateYTD, 103) and convert(datetime,@ToDateYTD, 103)))		
			AND (b.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
			AND (b.DeptID = @DeptID or isnull( @DeptID,'')='')
			and (b.StatusID = 4 or b.StatusID = 5) -- Khóa Finish
			and isnull(IsOther,0) = 0 -- Không tính Other

SELECT @TotalPlan = count(*)
		 FROM tblTR_TrainingPlan b
		WHERE 1=1
			and ((b.FromDate between convert(datetime,@DateYTD, 103) and convert(datetime,@ToDateYTD, 103)))		
			AND (b.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
			AND (b.DeptID = @DeptID or isnull( @DeptID,'')='')
			and b.StatusID = 1 -- Khóa Finish
			and isnull(IsOther,0) = 0 -- Không tính Other

SELECT @TotalCancel = count(*)
		 FROM tblTR_TrainingPlan b
		WHERE 1=1
			and ((b.FromDate between convert(datetime,@DateYTD, 103) and convert(datetime,@ToDateYTD, 103)))		
			AND (b.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
			AND (b.DeptID = @DeptID or isnull( @DeptID,'')='')
			and (b.StatusID = 2 or b.StatusID = 3) -- Khóa Finish
			and isnull(IsOther,0) = 0 -- Không tính Other

set @WorkHours = @SumEmpCom * 191

set @No1 = (
		@TotalThucHien / case when (isnull(@TotalPlan,0) +@TotalThucHien) - isnull(@TotalCancel,0) = 0 then 1 else
					(isnull(@TotalPlan,0) +@TotalThucHien) - isnull(@TotalCancel,0) end
		 )
	SELECT
	SumTrHr = Sum(SumTrHr),
	--SumNoOfPart = Sum(NoOfPart),
SumNoOfPart = @SumEmpCom,
	TrhrEmp = round(cast(Sum(SumTrHr) as Numeric(18,2)) /@SumEmpCom,1)
	,WorkHours = @WorkHours,No1 = @No1, No2 = cast( Sum(SumTrHr) as Numeric(18,2))  / @WorkHours
	,No3 = null
FROM(
		SELECT 
			 TrHr = b.Duration,
			 NoOfPart = (select count(*) from tblTR_TrainResultEmp where tblTR_TrainResultEmp.ResultID = a.ResultID)
			,SumTrHr = (select count(*) from tblTR_TrainResultEmp where tblTR_TrainResultEmp.ResultID = a.ResultID) * b.Duration
		 FROM tblTR_TrainingResult a inner join tblTR_TrainingPlan b on a.PlanID = b.PlanID		
		WHERE 1=1
			and ((a.FromDate between convert(datetime,@FromDate, 103) and convert(datetime,@ToDate, 103))or isnull( @FromDate,'')='')		
			AND (b.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
			AND (b.DeptID = @DeptID or isnull( @DeptID,'')='')
			and b.StatusID = 4 -- Khóa Finish
		Group By b.Duration, a.ResultID	
	) RS

UNION ALL
SELECT
	SumTrHr = Sum(SumTrHr),
	SumNoOfPart = @SumEmpCom,
	TrhrEmp = round(cast(Sum(SumTrHr) as Numeric(18,2)) /@SumEmpCom,1)
	,WorkHours = @WorkHours
	,No1 = null,No2 =  null, No3 = cast(Sum(SumTrHr) as Numeric(18,2)) / @WorkHours
FROM(
		SELECT
			 iType = 1,
			 TrHr = b.Duration,
			 NoOfPart = (select count(*) from tblTR_TrainResultEmp where tblTR_TrainResultEmp.ResultID = a.ResultID)
			,SumTrHr = (select count(*) from tblTR_TrainResultEmp where tblTR_TrainResultEmp.ResultID = a.ResultID) * b.Duration
		 FROM tblTR_TrainingResult a inner join tblTR_TrainingPlan b on a.PlanID = b.PlanID		
		WHERE 1=1
			and ((a.FromDate between convert(datetime,@DateYTD, 103) and convert(datetime,@ToDateYTD, 103)))		
			AND (b.[CompanyID] = @CompanyID)
			and b.StatusID = 4 -- Khóa Finish
		Group By b.Duration, a.ResultID	
	) RS1

	-- spfrmRPT_MonthlyTraining_02 @Activity = 'GetSum', @FromDate='01/05/2009', @ToDate='23/05/2009', @CompanyID=1
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_Area]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmLS_Area]
( 
/*
Procedure: spfrmLS_Area
Desc:
	 Procedure for table: tblLS_Area
Author:
	...
Create date:
	26-02-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@AreaID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@SectionID	int = null,
@AreaName	nvarchar(500) = null,
@AreaCode	nvarchar(50) = null,
@Remark	nvarchar(500) = null,
@Rank	int = null,
@Used	int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblLS_Area where AreaID = @AreaID)
	BEGIN
		 IF Exists(Select * from tblLS_Area where AreaID <> @AreaID and AreaCode=@AreaCode)
			begin
				set @ReturnMess='Code was Existed, please input other Code'
			end
		else
			 begin
				 UPDATE tblLS_Area SET
					 CompanyID  = @CompanyID,
					DeptID  = @DeptID,
					[SectionID]  = @SectionID,
					 [AreaName]  = @AreaName,
					 [AreaCode] =@AreaCode,
					 [Remark]  = @Remark,
					 [Rank]  = @Rank,
					 [Used]  = @Used
				 WHERE
					[AreaID] = @AreaID
			end
	END
	ELSE
		IF Exists(Select * from tblLS_Area where AreaCode=@AreaCode)
			begin
				set @ReturnMess='Code was Existed, please input other Code'
			end
		else
			BEGIN
				 INSERT INTO tblLS_Area ( CompanyID ,DeptID ,[SectionID] , [AreaName] ,[AreaCode], [Remark] , [Rank] , [Used]  )
				 VALUES 
				( @CompanyID, @DeptID, @SectionID, @AreaName, @AreaCode, @Remark, @Rank, @Used ) 
			END
END

ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_Area
	 WHERE
		[AreaID] = @AreaID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		a.AreaID,
		a.AreaName,
		a.AreaCode,
		a.Remark,
		a.Rank,
		a.Used,		
		b.SectionID,
		b.SectionName,
		c.DeptID,
		c.DeptName,
		d.CompanyID,
		d.CompanyName
	 FROM tblLS_Area a 
		inner join vLS_Dept c on a.DeptID = c.DeptID
		inner join vLS_Company d on a.CompanyID = d.CompanyID
		left join vLS_Section b on a.SectionID = b.SectionID
					 
	 WHERE
		a.[AreaID] = @AreaID
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		a.AreaID,
		a.AreaName,
		a.AreaCode,
		a.Remark,
		a.Rank,
		--a.Used,
		(Case when a.[Used] = 1 then 'X' else '' end) Used,
		b.SectionID,
		b.SectionName,
		c.DeptID,
		c.DeptName,
		d.CompanyID,
		d.CompanyName
	 FROM tblLS_Area a 
		inner join vLS_Dept c on a.DeptID = c.DeptID
		inner join vLS_Company d on a.CompanyID = d.CompanyID
		left join vLS_Section b on a.SectionID = b.SectionID
	 WHERE 1=1
		AND (isnull(a.[AreaName],'')  like N'%' + Isnull(@AreaName,'') + '%')
		AND (isnull(a.[Remark],'')  like N'%' + Isnull(@Remark,'') + '%')
		AND (isnull(a.[Rank],'')  = @Rank or isnull( @Rank,'')='')
		AND (a.[Used]  = @Used or isnull(@Used,-1)=-1)
		
		AND (d.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (b.[SectionID]  = @SectionID or isnull( @SectionID,'')='')

END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		a.AreaID,
		a.AreaName,
		a.AreaCode,
		a.Remark,
		a.Rank,
		--a.Used,
		(Case when a.[Used] = 1 then 'X' else '' end) Used,
		b.SectionID,
		b.SectionName,
		c.DeptID,
		c.DeptName,
		d.CompanyID,
		d.CompanyName
	 FROM tblLS_Area a 
		inner join vLS_Dept c on a.DeptID = c.DeptID
		inner join vLS_Company d on a.CompanyID = d.CompanyID
		left join vLS_Section b on a.SectionID = b.SectionID
END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_AccountCode]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_AccountCode]
( 
/*
Procedure: spfrmLS_AccountCode
Desc:
	 Procedure for table: tblLS_AccountCode
Author:
	PhuongDK
Create date:
	19-02-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@AccountCodeID	int = null,
@ACode	nvarchar(5) = null,
@BCode	nvarchar(3) = null,
@TRCode	nvarchar(5) = null,
@Description	nvarchar(500) = null,
@IsCourseFee	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@Used	int = null,
--
@CourseID	int = null,
@CompCode nvarchar(50) = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblLS_AccountCode where [AccountCodeID] = @AccountCodeID)
	BEGIN
		IF Exists(Select * from tblLS_AccountCode where [CompCode] = @CompCode
		and ACode = @ACode and BCode = @BCode and TRCode = @TRCode and [AccountCodeID] <> @AccountCodeID)
		BEGIN
			set @ReturnMess = 'AccountCode is exists.'
			return 
		end
	 UPDATE tblLS_AccountCode SET
		 [CompCode] = @CompCode,
		 [ACode]  = @ACode,
		 [BCode]  = @BCode,
		 [TRCode]  = @TRCode,
		 [Description]  = @Description,
		 [IsCourseFee]  = @IsCourseFee,
		 [CompanyID] = @CompanyID,
		 [DeptID]  = @DeptID,
		 [Used]  = @Used
	 WHERE
		[AccountCodeID] = @AccountCodeID
	END
	ELSE
	BEGIN
		IF Exists(Select * from tblLS_AccountCode where [CompCode] = @CompCode
		and ACode = @ACode and BCode = @BCode and TRCode = @TRCode)
		BEGIN
			set @ReturnMess = 'AccountCode is exists.'
			return 
		end

		 INSERT INTO tblLS_AccountCode ([CompCode], [ACode] , [BCode] , [TRCode] , [Description] , [IsCourseFee] , [CompanyID] , [DeptID], [Used]  )
		 VALUES 
		(@CompCode, @ACode, @BCode, @TRCode, @Description, @IsCourseFee, @CompanyID, @DeptID, @Used) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_AccountCode
	 WHERE
		[AccountCodeID] = @AccountCodeID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		AccountCodeID,
		CompCode,
		ACode,
		BCode,
		TRCode,
		Description,
		IsCourseFee,
		Used,
		DeptID,
		CompanyID,
		AccountCode
	 FROM vLS_AccountCode
	 WHERE
		[AccountCodeID] = @AccountCodeID
END


ELSE IF @Activity ='GetData'
BEGIN
	 SELECT [AccountCodeID]
			,AccountCode
			,[Description]
			,(Case when [IsCourseFee] = 1 then 'X' else '' end) [IsCourseFee]
			,(Case when [Used] = 1 then 'X' else '' end) Used
			,[CompanyName]
			,[DeptName]
			,[DeptID]
	 FROM vLS_AccountCode
	 WHERE 1 =1 

		AND (ACode Like N'%' + isnull(@ACode,'') + '%')
		AND (BCode Like N'%' + isnull(@BCode,'')  + '%')
		AND (TRCode Like N'%' + isnull(@TRCode,'') + '%')
		AND (Description Like N'%' + isnull(@Description,'') + '%')

		AND (IsCourseFee = @IsCourseFee OR isnull(@IsCourseFee,-1)=-1)
		AND (Used = @Used OR isnull(@Used,-1)=-1)
		AND (CompanyID = @CompanyID OR isnull(@CompanyID,'')='')
		AND (DeptID = @DeptID OR isnull(@DeptID,'')='')
		ORDER BY CompanyRank, CompanyName, DeptRank, DeptName, AccountCode
--select * from tblLS_AccountCode
		/* spfrmLS_AccountCode @Activity ='GetData', @IsCourseFee=-1 */
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT [AccountCodeID]
		  ,AccountCode
		  ,[Description]
		  ,(Case when [IsCourseFee] = 1 then 'X' else '' end) [IsCourseFee]
		  ,(Case when [Used] = 1 then 'X' else '' end) Used
		  ,[CompanyName]
		  ,[DeptName]
	  FROM vLS_AccountCode
	  ORDER BY CompanyRank, CompanyName, DeptRank, DeptName, AccountCode

	--spfrmLS_AccountCode @Activity ='GetDataAll'
END
ELSE IF @Activity ='GetDataByDept'
BEGIN
	 SELECT [AccountCodeID]
		  ,AccountCode
		  ,[Description]
		  ,(Case when [IsCourseFee] = 1 then 'X' else '' end) [IsCourseFee]
		  ,(Case when a.[Used] = 1 then 'X' else '' end) Used
		  ,[CompanyName]
		  ,[DeptName]
		  ,'' as Cost
	  FROM vLS_AccountCode a
	  WHERE 
			a.CompanyID = @CompanyID
		AND a.DeptID = @DeptID
		AND a.Used = 1

	-- spfrmLS_AccountCode @Activity ='GetDataByCourse', @CourseID=34
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  Table [dbo].[tblHR_EmpDelegateTo]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHR_EmpDelegateTo](
	[DelegateID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EmpDelegateID] [int] NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblHR_EmpDelegateTo] PRIMARY KEY CLUSTERED 
(
	[DelegateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHR_CertificationHistory]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHR_CertificationHistory](
	[CertHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Year] [int] NULL,
	[CertName] [nvarchar](500) NULL,
	[CertTypeName] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHR_AssEmpReportTo]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHR_AssEmpReportTo](
	[EmployeeID] [int] NOT NULL,
	[ReportToID] [int] NULL,
	[AssRoleID] [int] NOT NULL,
 CONSTRAINT [PK_tblHR_AssEmpReportTo] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHR_WorkingHistory]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHR_WorkingHistory](
	[WorkingHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[CompanyID] [int] NULL,
	[DeptID] [int] NULL,
	[SectionID] [int] NULL,
	[JobTitleID] [int] NULL,
	[JobLevelID] [int] NULL,
	[Type] [nvarchar](500) NULL,
	[EffDate] [datetime] NULL,
 CONSTRAINT [PK_tblHR_WorkingHistory] PRIMARY KEY CLUSTERED 
(
	[WorkingHistoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHR_EmpReportTo]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHR_EmpReportTo](
	[EmployeeID] [int] NOT NULL,
	[ReportToID] [int] NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_tblHR_EmpReportTo_1] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHR_EmployeeArea]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHR_EmployeeArea](
	[EmployeeID] [int] NOT NULL,
	[AreaID] [int] NOT NULL,
 CONSTRAINT [PK_tblLS_EmpArea] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC,
	[AreaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_TR_EffLearning_06]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmRPT_TR_EffLearning_06]

		/*
		Procedure: [spfrmRPT_TR_EffLearning_06]
		Desc:
			 Procedure for table: tblTR_TrainResultEmp
		Author:
			 QuanBM
		Create date:
			06-04-2009
		History:
			...
		*/
@FromDate	nvarchar(10) = null
AS
BEGIN		
	SELECT 		
		ROW_NUMBER() OVER (ORDER BY a.ResultID) AS [No]
		,a.ResultID
		,b.EmployeeCode
		,FirstName+' '+LastName as EmployeeName
		,f.JobTitleName
		,e.CourseName
		,convert(nvarchar(10),a.EndLearningContract,103) LearningContractBy
	 FROM tblTR_TrainResultEmp a 
				inner join tblHR_Employee b on a.EmpID = b.EmployeeID
				inner join tblTR_TrainingResult c on c.ResultID = a.ResultID
				inner join tblTR_TrainingPlan d on d.PlanID = c.PlanID
				inner join tblLS_Course e on e.CourseID = d.CourseID
				inner join tblLS_JobTitle f on f.JobTitleID = b.JobTitleID
	where 1=1
		and (a.EndLearningContract > convert(datetime,@FromDate,103))		
	order by LastName
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_CourseName_10]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmRPT_CourseName_10]
( 
/*
Procedure: [spfrmRPT_CourseName_10]
Desc:
	 Procedure for table: tblTR_TrainResultEmp
Author:
	 QuanBM
Create date:
	07-04-2009
History:
	...

*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,
---
@Year int = null,
@FromDate nvarchar(10) = null,
@ToDate nvarchar(10) = null,
@CompanyID int = null,
@DeptID int = null,
@CourseID int = null,
@ResultID int = null,
@EmployeeCode nvarchar(50) = null,
@EmployeeName nvarchar(1000) = null,

@EmpID int = null,
@UserID int = null
) 
AS
IF @Activity ='GetData'
BEGIN
	 SELECT 
		ROW_NUMBER() OVER (ORDER BY b.FromDate) AS [No]
		, b.ResultID
		,@FromDate as Fromdate
		,@ToDate as ToDate
		,b.FromDate as OrFromDate
		,d.CourseID
		,d.CourseName
		,convert(nvarchar,b.FromDate,103) + isnull('-'+convert(nvarchar,b.ToDate,103),'') as TrainingDate
		,[dbo].[fnConvertNumber](b.Duration) as Duration
		,Cost = [dbo].[fnConvertNumber]( (select sum(ActualCost) 
					from tblTR_TrainResultCost cost
						inner join tblLS_AccountCode acc on acc.AccountCodeID = cost.AccountCodeID
						
					where b.ResultID = cost.ResultID -- and acc.IsCourseFee = 0
					))
--select * from tblTR_TrainResultCost where ResultID = 33
		,b.Method, c.CompanyID
	 FROM tblTR_TrainingResult b
			inner join tblTR_TrainingPlan c on b.PlanID = c.PlanID and c.StatusID = 4 --and c.[Year] = @Year
			left join tblLS_Course d on c.CourseID = d.CourseID			
			inner join (
				select CompanyID from tblHR_Employee E
				inner join tblSYS_UserPermission Per on Per.EmployeeID = E.EmployeeID
				where Per.UserID = @UserID-- Phan quyen du lieu
				group by CompanyID
			) Perc on Perc.CompanyID = c.CompanyID
	where 1=1	
		and ((b.FromDate between convert(datetime,@FromDate, 103) and convert(datetime,@ToDate, 103))or isnull( @FromDate,'')='')			
		AND (c.CompanyID  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.DeptID  = @DeptID or isnull( @DeptID,'')='')
		AND (c.CourseID  = @CourseID or isnull( @CourseID,'')='')
		
	Order by b.FromDate

--select * from tblTR_TrainingResult
END
Else IF @Activity ='GetCourse'
BEGIN
	 SELECT 		
			a.EmpID,			
			b.FirstName + ' ' + b.LastName as EmpName,
			convert(nvarchar,h.FromDate,103) + isnull('-'+convert(nvarchar,h.ToDate,103),'') as TrainingDate,
			d.DeptName,
			e.SectionName,
			h.Duration,
	cast( cost.Cost / CountEmp.CountEmp as numeric(18,0)) as Cost,
--			Cost = (select sum(ActualCost) 
--						from tblTR_TrainResultCost cost
--							inner join tblLS_AccountCode acc on acc.AccountCodeID = cost.AccountCodeID
--						where emp.EmpID = a.EmpID and cost.ResultID = a.ResultID and acc.IsCourseFee = 0
--						),
			f.ProviderName,
			isnull( f.ProviderName,'Internal') as Remark
	 FROM tblTR_TrainResultEmp a
			inner join tblTR_TrainingResult h on a.ResultID = h.ResultID
			inner join tblTR_TrainingPlan c on h.PlanID = c.PlanID
			inner join tblHR_Employee b on a.EmpID = b.EmployeeID
			left join (
				select cost.ResultID, sum(ActualCost) Cost 
					from tblTR_TrainResultCost cost 
						inner join tblLS_AccountCode acc on acc.AccountCodeID = cost.AccountCodeID
					--where acc.IsCourseFee = 0
				group by cost.ResultID
			) cost on Cost.ResultID = a.ResultID
			left join (
				select emp.ResultID, Count(Emp.EmpID) as CountEmp
					from tblTR_TrainResultEmp emp 
				group by emp.ResultID
			) CountEmp on CountEmp.ResultID = a.ResultID
			left join tblLS_Dept d on b.DeptID = d.DeptID
			left join tblLS_Section e on b.SectionID = e.SectionID
			left join tblLS_Provider f on h.ProviderID = f.ProviderID
	 WHERE 1=1
			AND h.ResultID = @ResultID
END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'


--go
--exec spfrmRPT_CourseName_10 @Activity=N'GetCourse',@CourseID=N'15'
GO
/****** Object:  View [dbo].[vLS_Area]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_Area]
AS
SELECT     TOP (100) PERCENT AreaID, SectionID, AreaName, Remark, Rank, Used
FROM         dbo.tblLS_Area
WHERE     (Used = 1)
ORDER BY SectionID, Rank, AreaName
GO
/****** Object:  View [dbo].[vHR_Employee]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vHR_Employee]
AS
SELECT     EmployeeID, EmployeeCode, FirstName, LastName, FirstName + ' ' + LastName AS FullName, GenderCode, BirthPlace, Address, HomeAddress, 
                      CONVERT(Nvarchar, DateOfBirth, 103) AS DateOfBirth, CONVERT(Nvarchar, DateOfHire, 103) AS DateOfHire, CONVERT(Nvarchar, DateOfTermination, 
                      103) AS DateOfTermination, Telephone, Email, Remark, EmployeeStatusID, JobTitleID, JobLevelID, CompanyID, DeptID, SectionID, InsertUserID, 
                      UpdateUserID, CONVERT(Nvarchar, InsertDate, 103) AS InsertDate, CONVERT(Nvarchar, UpdateDate, 103) AS UpdateDate
FROM         dbo.tblHR_Employee
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_ReactionEval]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmTR_ReactionEval]
( 
/*
Procedure: spfrmTR_ReactionEval
Desc:
	 Procedure for table: tblTR_ReactionEval
Author:
	 PhuongDK
Create date:
	14-04-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@ReactionEval_ID	int = null,
@Filename	nvarchar(255) = null,
@FileLink	nvarchar(500) = null,
@Remark	nvarchar(500) = null,
@ResultID int = null,
@EmployeeID int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblTR_ReactionEval where ReactionEval_ID = @ReactionEval_ID)
	BEGIN
	 UPDATE tblTR_ReactionEval SET
		 [Filename]  = @Filename,
		 [FileLink]  = @FileLink,
		 [Remark]  = @Remark
	 WHERE
		[ReactionEval_ID] = @ReactionEval_ID
	END
	ELSE
	BEGIN
		 INSERT INTO tblTR_ReactionEval ( [Filename] , [FileLink] , [Remark]  )
		 VALUES ( @Filename, @FileLink, @Remark ) 

		 -- Update Training Result
		update tblTR_TrainResultEmp
		set	ReactionEval_ID = SCOPE_IDENTITY()
		where 
			ResultID = @ResultID
		and	EmpID = @EmployeeID
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblTR_ReactionEval
	 WHERE
		[ReactionEval_ID] = @ReactionEval_ID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		ReactionEval_ID,
		Filename,
		FileLink,
		Remark
	 FROM tblTR_ReactionEval
	 WHERE
		[ReactionEval_ID] = @ReactionEval_ID
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		ReactionEval_ID,
		Filename,
		FileLink,
		Remark
	 FROM tblTR_ReactionEval
	 WHERE 1=1
		AND (IsNull([Filename],'')  like N'%' + Isnull(@Filename,'') + '%')
		AND (IsNull([FileLink],'')  like N'%' + Isnull(@FileLink,'') + '%')
		AND (IsNull([Remark],'')  like N'%' + Isnull(@Remark,'') + '%')
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		ReactionEval_ID,
		Filename,
		FileLink,
		Remark
	 FROM tblTR_ReactionEval
END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  View [dbo].[vLS_CompDeptSec]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLS_CompDeptSec]
AS
SELECT     a.CompanyID, a.CompanyName, b.DeptID, b.DeptName, c.SectionID, c.SectionName
FROM         dbo.vLS_Company AS a LEFT OUTER JOIN
                      dbo.vLS_Dept AS b ON a.CompanyID = b.CompanyID LEFT OUTER JOIN
                      dbo.vLS_Section AS c ON b.DeptID = c.DeptID
GO
/****** Object:  Table [dbo].[tblTR_TrainingRequestEmp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTR_TrainingRequestEmp](
	[RequestID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_tblTR_TrainingRequestEmp] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vTR_TrainingResultEmp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTR_TrainingResultEmp]
AS
SELECT     c.EmployeeCode, c.FullName, e.CompanyName, f.DeptName, d.Year, g.CourseName, CONVERT(nvarchar, a.FromDate, 103) AS FromDate, 
                      CONVERT(nvarchar, a.ToDate, 103) AS ToDate, a.ResultID, c.Email, d.LearningEval, d.BusImpEval, c.EmployeeID, b.LineManager
FROM         dbo.tblTR_TrainingResult AS a INNER JOIN
                      dbo.tblTR_TrainResultEmp AS b ON a.ResultID = b.ResultID LEFT OUTER JOIN
                      dbo.vHR_Employee AS c ON b.EmpID = c.EmployeeID INNER JOIN
                      dbo.tblTR_TrainingPlan AS d ON a.PlanID = d.PlanID LEFT OUTER JOIN
                      dbo.tblLS_Company AS e ON d.CompanyID = e.CompanyID LEFT OUTER JOIN
                      dbo.tblLS_Dept AS f ON d.DeptID = f.DeptID LEFT OUTER JOIN
                      dbo.tblLS_Course AS g ON d.CourseID = g.CourseID
GO
/****** Object:  View [dbo].[vTR_TrainingRequestReview]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[vTR_TrainingRequestReview] 
as
select '' as ReviewID,
	   tr.RequestID,
	   tr.EmployeeID,
	   c.RoleName,
	   '' as ReviewActionCode,
	   '' as ReviewDate,
	   '' as Comment,
	   b.ReportToID,
	   '' as DelegateID
from tblTR_TrainingRequest tr left join tblHR_EmpReportTo b on tr.EmployeeID = b.EmployeeID
							  left join tblLS_Roles c on b.RoleID = c.RoleID
UNION ALL
select a.ReviewID,
	   a.RequestID,
	   a.EmployeeID,
	   c.RoleName,
	   a.ReviewActionCode,
	   a.ReviewDate,
	   a.Comment,
	   d.ReportToID,
	   a.DelegateID
from tblTR_TrainingRequest tr inner join 
	 tblTR_TrainingRequestReview a on tr.RequestID = a.RequestID
								   left join tblHR_EmpReportTo b on a.EmployeeID = b.EmployeeID
								   left join tblLS_Roles c on b.RoleID = c.RoleID
								   left join tblHR_EmpReportTo d on a.EmployeeID = d.EmployeeID
GO
/****** Object:  View [dbo].[vTR_TrainingRequest]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTR_TrainingRequest]
AS
SELECT  a.RequestID, c.CompanyID, c.CompanyName, d.DeptID, d.DeptName, a.EmployeeID, b.EmployeeCode, b.FullName, a.Year, a.CourseID, a.OtherCourse, 
        a.IsTeam, a.Reason, a.MailNotify, a.CourseType, a.UpdateEmployeeID, b.Email,
		CourseName = (CASE WHEN a.CourseType = 0 THEN a.OtherCourse ELSE e.CourseName END), 
		IsMailNotify = (CASE WHEN a.MailNotify = 1 THEN 'X' ELSE '' END), 
		Status = (select top 1 ReviewActionCode from tblTR_TrainingRequestReview where RequestID = a.RequestID order by ReviewID desc),
		Comment = (select top 1 Comment from tblTR_TrainingRequestReview where RequestID = a.RequestID  order by ReviewID desc),
		[RoleID] = (select top 1 b1.RoleID
				  from tblTR_TrainingRequestReview a1 left join tblHR_EmpReportTo b1 on a1.EmployeeID = b1.EmployeeID
				  where RequestID = a.RequestID
				   order by ReviewID desc),
		[Role] = (select top 1 c1.RoleName 
				  from tblTR_TrainingRequestReview a1 left join tblHR_EmpReportTo b1 on a1.EmployeeID = b1.EmployeeID
													  left join tblLS_Roles c1 on b1.RoleID = c1.RoleID
				  where RequestID = a.RequestID
				   order by ReviewID desc)
		
FROM         dbo.tblTR_TrainingRequest AS a LEFT OUTER JOIN
                      dbo.vHR_Employee AS b ON a.EmployeeID = b.EmployeeID LEFT OUTER JOIN
                      dbo.tblLS_Company AS c ON b.CompanyID = c.CompanyID LEFT OUTER JOIN
                      dbo.tblLS_Dept AS d ON b.DeptID = d.DeptID LEFT OUTER JOIN
                      dbo.tblLS_Course AS e ON a.CourseID = e.CourseID
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_OverTrainEff]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmTR_OverTrainEff]
( 
/*
Procedure: spfrmTR_OverTrainEff
Desc:
	 Procedure for table: tblTR_OverTrainEff
Author:
	 PhuongDK
Create date:
	01-04-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@OverTrainEff_ID	int = null,
@Year	int = null,
@Date	nvarchar(10) = null,
@No	int = null,
@Description	nvarchar(500) = null,

@A_Value bit = null,
@B_Value bit = null,
@C_Value bit = null,
@A_Suggestion nvarchar(500) = null,
@B_Suggestion nvarchar(500) = null,
@C_Suggestion nvarchar(500) = null,
@EmployeeID int = null, 
@OverTrainEffCateID int = null,
-- More
@ListLM nvarchar(2000) = null,
@CurrEmployeeID int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblTR_OverTrainEff where OverTrainEff_ID = @OverTrainEff_ID)
	BEGIN
		 UPDATE tblTR_OverTrainEff SET
			 [Year]  = @Year,
			 [No]  = @No,
			 [Date] = convert(datetime,@Date,103),
			 [Description]  = @Description
		 WHERE
			[OverTrainEff_ID] = @OverTrainEff_ID

		 DELETE FROM tblTR_OverTrainEffLM WHERE OverTrainEff_ID = @OverTrainEff_ID

		 IF @ListLM <> ''
		 BEGIN
			INSERT INTO tblTR_OverTrainEffLM([OverTrainEff_ID],[LineManager])
			SELECT @OverTrainEff_ID, a.listValue
			FROM GetTableFromList(@ListLM, DEFAULT) a
		 END

	END
	ELSE
	BEGIN
		 INSERT INTO tblTR_OverTrainEff ( [Year] , [No] , [Description] , [Date]  )
		 VALUES ( @Year, @No, @Description , convert(datetime,@Date,103)) 

		 SET @OverTrainEff_ID = SCOPE_IDENTITY()

		if (@OverTrainEff_ID is not null)
		begin
print @OverTrainEff_ID
--			 IF @ListLM <> ''
--			 BEGIN
--				INSERT INTO tblTR_OverTrainEffLM([OverTrainEff_ID],[LineManager])
--				SELECT @OverTrainEff_ID, a.listValue
--				FROM GetTableFromList(@ListLM, DEFAULT) a
--			 END
--
--			 -- END MAIL REMIND
--			exec sp_sendmail_OTE @OverTrainEff_ID = @OverTrainEff_ID
--			
--			INSERT INTO tblMail_OTE_Evaluation_Daily([OverTrainEff_ID],[EmployeeID],[EffDate])
--			SELECT @OverTrainEff_ID, a.listValue, GetDate() + convert(int, (select [value] from tblLS_SystemParam where [Name]='OTE_DailyRemind'))
--			FROM GetTableFromList(@ListLM, DEFAULT) a
		end
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	
	IF IsNull(@EmployeeID,'') = ''
	BEGIN
		DELETE FROM tblTR_OverTrainEff
		WHERE
			[OverTrainEff_ID] = @OverTrainEff_ID
	END
	ELSE
	BEGIN
		DELETE FROM tblTR_OverTrainEffDetail
		WHERE
			[OverTrainEff_ID] = @OverTrainEff_ID
		AND [EmployeeID] = @EmployeeID
	END

END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		OverTrainEff_ID,
		Year,
		No,
		Convert(nvarchar,Date,103) AS Date,
		Description,
		'' as ListLM
	 FROM tblTR_OverTrainEff
	 WHERE
		[OverTrainEff_ID] = @OverTrainEff_ID
END
ELSE IF @Activity ='GetDataByID_LM'
BEGIN
	 SELECT a.OverTrainEff_ID,
		    b.EmployeeID,
		    b.FullName
	 FROM tblTR_OverTrainEffLM a left join vHR_Employee b on a.LineManager = b.EmployeeID
	 WHERE
		[OverTrainEff_ID] = @OverTrainEff_ID

	-- spfrmTR_OverTrainEff @Activity ='GetDataByID_LM', @OverTrainEff_ID=74
END
ELSE IF @Activity ='GetData'
BEGIN
	SELECT ROW_NUMBER() OVER (ORDER BY RS.Year, RS.No) AS STT,
		   RS.*
	FROM
	(
	 SELECT DISTINCT
		a.OverTrainEff_ID,
		a.[Year],
		a.[No],
		Convert(nvarchar(10),a.[Date],103) as Date,
		a.Description,
		LineManager = c.FullName,
		b.EmployeeID
	 FROM tblTR_OverTrainEff a inner join tblTR_OverTrainEffDetail b on a.OverTrainEff_ID = b.OverTrainEff_ID
							   inner join vHR_Employee c on b.EmployeeID = c.EmployeeID
	 WHERE --1=1
		(a.[Year]  = @Year or isnull( @Year,'')='')
		AND (a.[No]  = @No or isnull( @No,'')='')
		AND (IsNull(a.[Description],'')  like N'%' + Isnull(@Description,'') + '%')
		AND (a.Date  = convert(datetime,@Date,103) or isnull( @Date,'')='')
		AND (c.EmployeeID = @EmployeeID or isnull (@EmployeeID,'')='')

	-- Lay OTE moi tao (chua co LM nao danh gia)
	UNION ALL
	SELECT DISTINCT
		a.OverTrainEff_ID,
		a.[Year],
		a.[No],
		Convert(nvarchar,a.[Date],103) as Date,
		a.Description,
		LineManager = c.FullName,
		'' as EmployeeID
	 FROM tblTR_OverTrainEff a left join tblTR_OverTrainEffDetail b on a.OverTrainEff_ID = b.OverTrainEff_ID
							   left join vHR_Employee c on b.EmployeeID = c.EmployeeID
	 WHERE --1=1
		(a.[Year]  = @Year or isnull( @Year,'')='')
		AND (a.[No]  = @No or isnull( @No,'')='')
		AND (IsNull(a.[Description],'')  like N'%' + Isnull(@Description,'') + '%')
		AND (a.Date  = convert(datetime,@Date,103) or isnull( @Date,'')='')
		AND (b.EmployeeID is null)
		and (@CurrEmployeeID in (Select LineManager from dbo.tblTR_OverTrainEffLM where OverTrainEff_ID = a.OverTrainEff_ID)
             or @CurrEmployeeID=-1)
	
	-- Lay OTE da co LM khac danh gia, nhung minh chua danh gia
	UNION ALL
	SELECT DISTINCT
		a.OverTrainEff_ID,
		a.[Year],
		a.[No],
		Convert(nvarchar,a.[Date],103) as Date,
		a.Description,
		LineManager = '',
		'' as EmployeeID
	 FROM tblTR_OverTrainEff a 
							   
	 WHERE --1=1
		(a.[Year]  = @Year or isnull( @Year,'')='')
		AND (a.[No]  = @No or isnull( @No,'')='')
		AND (IsNull(a.[Description],'')  like N'%' + Isnull(@Description,'') + '%')
		AND (a.Date  = convert(datetime,@Date,103) or isnull( @Date,'')='')
		AND OverTrainEff_ID in (SELECT DISTINCT	OverTrainEff_ID 
								FROM tblTR_OverTrainEffDetail  
								WHERE EmployeeID <> @EmployeeID
								EXCEPT
								SELECT DISTINCT	OverTrainEff_ID 
								FROM tblTR_OverTrainEffDetail  
								WHERE EmployeeID = @EmployeeID
								)

		) RS
	
	ORDER BY RS.Year, RS.No

	-- spfrmTR_OverTrainEff @Activity ='GetData', @EmployeeID = 3

END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		OverTrainEff_ID,
		Year,
		No,
		Date,
		Description
	 FROM tblTR_OverTrainEff
END

ELSE IF @Activity ='SaveDetail'
BEGIN
	--DELETE FROM tblTR_OverTrainEffDetail WHERE OverTrainEff_ID = @OverTrainEff_ID
	IF Exists(Select * from tblTR_OverTrainEffDetail where 
							OverTrainEff_ID = @OverTrainEff_ID
							and EmployeeID = @EmployeeID
							and OverTrainEffCateID = @OverTrainEffCateID)
	BEGIN
		UPDATE tblTR_OverTrainEffDetail SET
			A_Value = @A_Value, 
			B_Value = @B_Value , 
			C_Value = @C_Value, 
			A_Suggestion = @A_Suggestion,
			B_Suggestion = @B_Suggestion,
			C_Suggestion = @C_Suggestion
		WHERE
			[OverTrainEff_ID] = @OverTrainEff_ID 
			and OverTrainEff_ID = @OverTrainEff_ID
			and OverTrainEffCateID = @OverTrainEffCateID

	END

	ELSE
	BEGIN
		INSERT INTO tblTR_OverTrainEffDetail ( [OverTrainEff_ID] , [A_Value] , [B_Value] , [C_Value], [A_Suggestion] , [B_Suggestion] , [C_Suggestion] , [EmployeeID] , [OverTrainEffCateID])
		VALUES 
			( @OverTrainEff_ID, @A_Value, @B_Value , @C_Value, @A_Suggestion, @B_Suggestion, @C_Suggestion, @EmployeeID, @OverTrainEffCateID)

		-- 
		delete from tblMail_OTE_Evaluation_Daily 
		where 1 = 1
		and OverTrainEff_ID = @OverTrainEff_ID
		and EmployeeID = @EmployeeID

	END
END

ELSE IF @Activity = 'GetDataDetail'
BEGIN
	SELECT
		ROW_NUMBER() OVER (ORDER BY a.OverTrainEffCateID) AS STT,
		a.OverTrainEffCateID,
		a.CateName,
		a.A_Weight,
		a.B_Weight,
		a.C_Weight,
		a.A_Desc,
		a.B_Desc,
		a.C_Desc,
		b.OverTrainEff_ID,
		b.A_Value,
		b.B_Value,
		b.C_Value,
		b.A_Suggestion,
		b.B_Suggestion,
		b.C_Suggestion,
		b.EmployeeID
		 
	FROM tblLS_OverTrainEffCategory a left join tblTR_OverTrainEffDetail b on a.OverTrainEffCateID = b.OverTrainEffCateID

	WHERE
		b.OverTrainEff_ID = @OverTrainEff_ID
	AND b.EmployeeID = @EmployeeID

END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_Skill]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmLS_Skill]
( 
/*
Procedure: spfrmLS_Skill
Desc:
	 Procedure for table: tblLS_Skill
Author:
	...
Create date:
	28-02-2009
History: Tanldt sua lai
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@SkillID	int = null,
@ParentID	int = null,
@SkillName	nvarchar(500) = null,
@Level	int = null,
@Rank	int = null,
@Used	int = null,
@AreaID	int = null,
@CourseID	int = null,
@ListAreas	nvarchar(2000) = null,
@ListCourses	nvarchar(2000) = null
) 
AS
IF @Activity ='Save'
BEGIN
if (@ParentID = -1)
	set @ParentID = null

	IF Exists(Select * from tblLS_Skill where SkillID = @SkillID)
	BEGIN
	 UPDATE tblLS_Skill SET
		 [ParentID]  = @ParentID,
		 [SkillName]  = @SkillName,
		 [Level]  = @Level,
		 [Rank]  = @Rank,
		 [Used]  = 1
	 WHERE
		[SkillID] = @SkillID

	END
	ELSE
	BEGIN
		 INSERT INTO tblLS_Skill ( [ParentID] , [SkillName] , [Level] , [Rank] , [Used]  )
		 VALUES (@ParentID, @SkillName, @Level, @Rank, 1) 

		 SET @SkillID = SCOPE_IDENTITY()
		
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_SkillArea WHERE [SkillID] = @SkillID
	 DELETE FROM tblLS_SkillCourse WHERE [SkillID] = @SkillID
	 DELETE FROM tblLS_CheckListTemp WHERE [SkillID] = @SkillID
	 DELETE FROM tblASS_AssessEmpSkill WHERE [SkillID] = @SkillID

	-- Delete Cap D
	DELETE D
	FROM tblLS_Skill D
	inner join tblLS_Skill C On C.SkillID = D.ParentID
	inner join tblLS_Skill B On B.SkillID = C.ParentID
	inner join tblLS_Skill A On A.SkillID = B.ParentID
	WHERE A.[SkillID] = @SkillID
	-- Delete Cap C
	DELETE C
	FROM tblLS_Skill C
	inner join tblLS_Skill B On B.SkillID = C.ParentID
	inner join tblLS_Skill A On A.SkillID = B.ParentID
	WHERE A.[SkillID] = @SkillID

	-- Delete Cap B
	DELETE B
	FROM tblLS_Skill B
	inner join tblLS_Skill A On A.SkillID = B.ParentID
	WHERE A.[SkillID] = @SkillID
	-- Delete Cap A
	 DELETE FROM tblLS_Skill WHERE [SkillID] = @SkillID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		a.SkillID,
		a.ParentID,
		a.SkillName,
		a.[Level],
		a.Rank,
		a.Used,
		CheckListTitle = (Case when ISnull(b.CheckListTitle, '')='' then 'Create Checklist' else b.CheckListTitle end )
	 FROM tblLS_Skill a left join vLS_CheckListTemp b on a.SkillID = b.SkillID
	 WHERE
		a.[SkillID] = @SkillID

	-- spfrmLS_Skill @Activity='GetDataByID', @SkillID ='35'
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		SkillID,
		ParentID,
		SkillName,
		Level,
		Rank,
		Used
	 FROM tblLS_Skill
	 WHERE 1=1
		AND ([ParentID]  = @ParentID or isnull( @ParentID,'')='')
		AND (IsNull([SkillName],'')  like N'%' + Isnull(@SkillName,'') + '%')
		AND ([Level]  = @Level or isnull( @Level,'')='')
		AND ([Rank]  = @Rank or isnull( @Rank,'')='')
		AND ([Used]  = @Used or isnull(@Used,-1)=-1)
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		SkillID,
		ParentID,
		SkillName,
		[Level],
		Rank,
		Used
	 FROM tblLS_Skill
	 ORDER BY [Level], Rank, SkillName
	-- spfrmLS_Skill @Activity ='GetDataAll'
END
ELSE IF @Activity ='GetAreaOfSkill'
BEGIN
	select a.* , isnull(b.SkillID,-1) SkillID
	from tblLS_Area a
	left join tblLS_SkillArea b on a.AreaID = b.AreaID and b.SkillID = @SkillID
	 order by a.AreaName 
END
ELSE IF @Activity ='GetCourseOfSkill'
BEGIN
	select a.* , isnull(b.SkillID,-1) SkillID
	from tblLS_Course a
	left join tblLS_SkillCourse b on a.CourseID = b.CourseID and b.SkillID = @SkillID
	order by a.CourseName
END
ELSE IF @Activity ='DeleteAllArea'
BEGIN
	 DELETE FROM tblLS_SkillArea WHERE [SkillID] = @SkillID
END
ELSE IF @Activity ='InsSkillArea'
BEGIN
	 insert into tblLS_SkillArea ([AreaID],[SkillID] )
		values( @AreaID,@SkillID)
END
ELSE IF @Activity ='DeleteAllCourse'
BEGIN
	 DELETE FROM tblLS_SkillCourse WHERE [SkillID] = @SkillID
END
ELSE IF @Activity ='InsSkillCourse'
BEGIN
	 insert into tblLS_SkillCourse ([CourseID],[SkillID] )
		values( @CourseID,@SkillID)
END
ELSE IF @Activity ='DeleteCheckList'
BEGIN
	 DELETE A
	FROM tblLS_ChkLstTempDetail A
	inner join tblLS_CheckListTemp B on A.CheckListTempID = B.CheckListTempID
	WHERE [SkillID] = @SkillID
	
	DELETE FROM tblLS_CheckListTemp WHERE [SkillID] = @SkillID


END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_CompanyDeptGroup]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[spfrmLS_CompanyDeptGroup]
@Activity			varchar(50),
@ReturnMess			nvarchar(500) = null out,
@CompanyID			int = null,
@DeptID				int = null,
@GroupID			int = null,
@SectionID			int = null,
@AreaID			int = null,
@UserID			int = null
AS

if @Activity = 'GetComboCompany'
	BEGIN

		SELECT A.CompanyID AS ID, A.CompanyName  AS [Name] 
        FROM vLS_Company A 
		/*inner join (
			select E.CompanyID from tblHR_Employee E 
				inner join tblSYS_UserPermission u on u.EmployeeID = E.EmployeeID
			group by E.CompanyID
		) E On A.CompanyID = E.CompanyID*/
		ORDER BY Rank
	END
else if @Activity = 'GetDeptByCompany'
	BEGIN

		select DeptID as ID, DeptName as [Name]
		from vLS_Dept
		where CompanyID = @CompanyID
		order by Rank
	END
else if @Activity = 'GetSectionByDept'
	BEGIN

		select SectionID as ID, SectionName as [Name]
		from vLS_Section
		where DeptID = @DeptID
		order by Rank
	END
else if @Activity = 'GetAreaBySection'
	BEGIN

		select AreaID as ID, AreaName as [Name]
		from vLS_Area
		where SectionID = @SectionID
		order by Rank
	END


-- spfrmLS_CompanyDeptGroup @Activity = 'GetSectionByDept', @DeptID = 1
if @@Error <> 0
	BEGIN
		set	@CompanyID = -1
		set	@ReturnMess = ''
	END
GO
/****** Object:  StoredProcedure [dbo].[spfrmHR_EmpReportTo]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmHR_EmpReportTo]
( 
/*
Procedure: spfrmHR_EmpReportTo
Desc:
	 Procedure for table: tblHR_EmpReportTo
Author:
	...
Create date:
	29-05-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@ReportToID	int = null,
@RoleID	int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblHR_EmpReportTo where EmployeeID = @EmployeeID)
	BEGIN
	
		 IF ISNULL(@ReportToID,'') = '' and ISNULL(@RoleID,'') = ''
		 BEGIN
			 DELETE FROM tblHR_EmpReportTo 
			 WHERE
				[EmployeeID] = @EmployeeID
		 END
		 ELSE
		 BEGIN
			 UPDATE tblHR_EmpReportTo SET
				 [ReportToID]  = @ReportToID,
				 [RoleID]  = @RoleID
			 WHERE
				 [EmployeeID] = @EmployeeID
		 END
	END
	ELSE
	BEGIN
		 INSERT INTO tblHR_EmpReportTo ([EmployeeID], [ReportToID], [RoleID])
		 VALUES (@EmployeeID, @ReportToID, @RoleID) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblHR_EmpReportTo
	 WHERE
		[EmployeeID] = @EmployeeID
	  AND [ReportToID] = @ReportToID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		EmployeeID,
		ReportToID,
		RoleID
	 FROM tblHR_EmpReportTo
	 WHERE
		[EmployeeID] = @EmployeeID
	  AND [ReportToID] = @ReportToID
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		EmployeeID,
		ReportToID,
		RoleID
	 FROM tblHR_EmpReportTo
	 WHERE 1=1
		AND ([ReportToID]  = @ReportToID or isnull( @ReportToID,'')='')
		AND ([RoleID]  = @RoleID or isnull( @RoleID,'')='')
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		EmployeeID,
		ReportToID,
		RoleID
	 FROM tblHR_EmpReportTo
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_InternalList]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmRPT_InternalList]

		/*
		Procedure: [spfrmRPT_SupplierList_08]
		Desc:
			 Procedure for table: tblLS_Provider
		Author:
			 QuanBM
		Create date:
			03-04-2009
		History:
			...
		*/

AS
BEGIN	
	SELECT DISTINCT
		   RS.EmployeeID, RS.FullName, RS.Code, RS.Section, RS.Department, RS.LastName
	FROM
		(
			select a.EmployeeID, a.FullName, a.Employeecode as Code
			, S.SectionName as Section, D.DeptName as Department
			, a.LastName
			--, a.JobLevelID, b.JobLevelName
			from vHR_Employee a 
			inner join tblHR_EmployeeCourse B On a.EmployeeID = b.EmployeeID-- and b.CourseID = @CourseID
			left join tblLS_Dept D on D.DeptID = a.DeptID
			left join tblLS_Section S on S.SectionID = a.SectionID
			where a.DateOfTermination is null

		) RS
	group by RS.EmployeeID, RS.FullName, RS.Code, RS.Section, RS.Department, RS.LastName
	 ORDER BY RS.Department,RS.Section, RS.LastName
END

--GO
--[spfrmRPT_SupplierList_08]
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_EmpSkillProfile_13]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmRPT_EmpSkillProfile_13]

@Activity	varchar(50) = null,
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID       int= null,
@EmployeeCode	nvarchar(50) = null,
@FullName	nvarchar(500) = null,
@CompanyID       int= null,
@DeptID		int = null,
@SectionID		int = null,
@AreaID		int = null,

@SkillIDA		int = null,
@SkillIDB		int = null,
@SkillIDC		int = null,
@SkillIDD		int = null,
@Year		int = null,
@No		nvarchar(50) = null,

@UserID       int= null

AS
BEGIN	

	SELECT 
		
		--case when ( AES.Target - AES.[Current]) < 0 then 0 else ( AES.Target - AES.[Current]) end as Gap
		e.EmployeeCode,
		e.FirstName,
		e.LastName,
		e.FullName,
		b.CompanyName,
		c.DeptName,
		d.SectionName,
		t.JobTitleName
		,avg(cast(AES.Start as numeric(5,2))) Start
		,avg(cast(AES.[Current] as numeric(5,2))) [Current]
		,avg(cast(AES.Target as numeric(5,2))) Target
		,avg(
			cast(case when ( AES.Target - AES.[Current]) < 0 then 0 else ( AES.Target - AES.[Current]) end as numeric(5,2))
			) as Gap
	 FROM [tblASS_AssessEmpSkill] as AES
		inner join tblLS_Skill S4 on S4.SkillID = AES.SkillID -- LevelD
		inner join tblLS_Skill S3 on S3.SkillID = S4.ParentID and S3.Level = 3 -- LevelC
		inner join tblLS_Skill S2 on S2.SkillID = S3.ParentID and S2.Level = 2 -- LevelB
		inner join tblLS_Skill S1 on S1.SkillID = S2.ParentID and S1.Level = 1 -- LevelA

		inner join [tblASS_Assessment] ass on ass.AssID = AES.AssID and ass.[Year] = @Year and ass.[No] = @No

		left join tblLS_CheckListTemp CL on CL.SkillID = AES.SkillID and CL.Status = 1
		left join tblSYS_User Users On Users.UserID = AES.UserID
		inner join vHR_Employee e On e.EmployeeID = AES.EmployeeID
		left join tblLS_Company b on e.CompanyID = b.CompanyID
		left join tblLS_Dept	c on e.DeptID = c.DeptID
		left join tblLS_Section d on e.SectionID = d.SectionID
		left join tblLS_JobTitle t on e.JobTitleID = t.JobTitleID
		--left join tblHR_EmployeeArea Ar on Ar.EmployeeID = e.EmployeeID and Ar.AreaID = AES.AreaID-- <== Riêng report này phải join kiểu này.
		--left join tblLS_Area area on area.AreaID = Ar.AreaID
--		left join (
--							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
--						) Ar on Ar.EmployeeID = e.EmployeeID
		inner join tblSYS_UserPermission Per on Per.EmployeeID = e.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		
		AND (isnull( @SkillIDA,'')='' or @SkillIDA = S1.SkillID)
		AND (isnull( @SkillIDB,'')='' or @SkillIDB = S2.SkillID)
		AND (isnull( @SkillIDC,'')='' or @SkillIDC = S3.SkillID)
		AND (isnull( @SkillIDD,'')='' or @SkillIDD = S4.SkillID)
		AND (IsNull(e.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(e.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (e.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		--AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		
--select * from tblLS_JobTitle
	group by e.EmployeeCode,e.FirstName,e.LastName,e.FullName,b.CompanyName,c.DeptName,d.SectionName,t.JobTitleName
	order by e.LastName

END
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_Coverage]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmRPT_Coverage]
( 
/*
Procedure: [spfrmRPT_TrainingInfo_07]
Desc:
	 Procedure for table: tblTR_TrainResultEmp
Author:
	 QuanBM
Create date:
	07-04-2009
History:
	...

*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,
---
@Year int = null,
@FromDate nvarchar(10) = null,
@ToDate nvarchar(10) = null,
@EmployeeCode nvarchar(50) = null,
@EmployeeName nvarchar(1000) = null,
@CompanyID int = null,
@DeptID int = null,
@SectionID int = null,
@AreaID int = null,
@EmployeeStatusID	int = null,
@JobTitleID	int = null,
@JobLevelID	int = null,

@EmpID int = null,
@UserID int = null
) 
AS

set @FromDate = '01/10/' + cast((@Year - 1) as nvarchar(4))
set @ToDate = '30/09/' + cast((@Year) as nvarchar(4))

IF @Activity ='GetData'
BEGIN

	 SELECT a.EmpID,
			
			convert(nvarchar(10),b.DateOfHire,103) as DateJoin,
--			a.ResultID,
						
			b.EmployeeCode,
			b.FirstName + ' ' + b.LastName as FullName,
			b.CompanyID,
			c.CompanyName,
			b.DeptID,
			d.DeptName as Dept,
			b.SectionID,
			e.SectionName as Section,
			g.AreaID,
			g.AreaName,
			k.JobTitleID,
			k.JobTitleName,
			convert(nvarchar(15),a.FirstDate,106) as FirstDate
	 FROM tblHR_Employee b
			
			inner join (
				select EmpID , min(h.FromDate) as FirstDate
				from tblTR_TrainResultEmp a
				inner join tblTR_TrainingResult h on a.ResultID = h.ResultID
				where ((h.FromDate between convert(datetime,@FromDate, 103) and convert(datetime,@ToDate, 103))or isnull( @FromDate,'')='')		
					
				group by EmpID
			)a on a.EmpID = b.EmployeeID
	
			
			left join tblLS_Company c on b.CompanyID = c.CompanyID
			left join tblLS_Dept d on b.DeptID = d.DeptID
			left join tblLS_Section e on b.SectionID = e.SectionID
			left join tblLS_JobTitle k on b.JobTitleID = k.JobTitleID
			left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						) f on f.EmployeeID = b.EmployeeID
			left join tblLS_Area g on f.AreaID = g.AreaID
			inner join tblSYS_UserPermission Per on Per.EmployeeID = b.EmployeeID and Per.UserID = @UserID --phan quyen du lieu
	 WHERE 1=1
		
		AND (IsNull(b.EmployeeCode,'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(b.FirstName,'') + ' ' + IsNull(b.LastName,'') like N'%' + Isnull(@EmployeeName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (b.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (b.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (g.AreaID  = @AreaID or isnull( @AreaID,'')='')	
		AND (b.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (b.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND (b.[EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')
	order by d.DeptName,e.SectionName, b.LastName

END
else IF @Activity ='Sum'
BEGIN
Declare @Sum int, @TotalEmpCom int, @Coverage numeric(18,4)
	 SELECT @Sum = Count(*)
	 FROM tblHR_Employee b
			
			inner join (
				select EmpID , min(h.FromDate) as FirstDate
				from tblTR_TrainResultEmp a
				inner join tblTR_TrainingResult h on a.ResultID = h.ResultID
				where ((h.FromDate between convert(datetime,@FromDate, 103) and convert(datetime,@ToDate, 103))or isnull( @FromDate,'')='')		
					
				group by EmpID
			)a on a.EmpID = b.EmployeeID
	
			
			left join tblLS_Company c on b.CompanyID = c.CompanyID
			left join tblLS_Dept d on b.DeptID = d.DeptID
			left join tblLS_Section e on b.SectionID = e.SectionID
			left join tblLS_JobTitle k on b.JobTitleID = k.JobTitleID
			left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						) f on f.EmployeeID = b.EmployeeID
			left join tblLS_Area g on f.AreaID = g.AreaID
			inner join tblSYS_UserPermission Per on Per.EmployeeID = b.EmployeeID and Per.UserID = @UserID --phan quyen du lieu
	 WHERE 1=1
		
		
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (b.[EmployeeStatusID]  = 1)
	
SELECT @TotalEmpCom = Count(*)
	 FROM tblHR_Employee b
	 WHERE 1=1
		
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (b.[EmployeeStatusID]  = 1)
set @Coverage = cast(@Sum as numeric(18,4)) /  cast(@TotalEmpCom as numeric(18,4))
select @Sum as [Sum], @TotalEmpCom as TotalEmp, @Coverage as Coverage

END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmLS_Trainer]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmLS_Trainer]
( 
/*
Procedure: spfrmLS_Trainer
Desc:
	 Procedure for table: tblLS_Trainer
Author:
	...
Create date:
	26-02-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@TrainerID	int = null,
@TrainerCode	nvarchar(50) = null,
@TrainerName	nvarchar(500) = null,
@FromSource	int = null,
@Address	nvarchar(1000) = null,
@Telephone	nvarchar(50) = null,
@Email	nvarchar(500) = null,
@ProviderID	int = null,
@CourseID 	int = null,
@Rank	int = null,
@Used	int = 0,
--@EmployeeID int = null,
@OtherName	nvarchar(500) = null,
@FromName	nvarchar(500) = null,
@ListCourses	nvarchar(2000) = null
) 
AS
IF @Activity ='Save'
BEGIN	
	IF Exists(Select * from tblLS_Trainer where TrainerID = @TrainerID)
		BEGIN
			IF Exists(Select * from tblLS_Trainer where TrainerID <> @TrainerID and TrainerCode=@TrainerCode)
				BEGIN
					SET @ReturnMess = 'Trainer Code was Existed, Please input other Code!'
					return
				END
			ELSE
				BEGIN
					 UPDATE tblLS_Trainer SET
						 [TrainerCode]  = @TrainerCode,
						 [TrainerName]  = @TrainerName,
						 [FromSource]  = @FromSource,
						 [Address]  = @Address,
						 [Telephone]  = @Telephone,
						 [Email]  = @Email,
						 [ProviderID]  = @ProviderID,
						 [Rank]  = @Rank,
						 [Used]  = @Used,
						 [OtherName] = @OtherName
					 WHERE
						[TrainerID] = @TrainerID
					
					 --Delete detail TrainerCourse
					 DELETE FROM tblLS_TrainerCourse where [TrainerID] = @TrainerID
					
					 IF ISNULL(@ListCourses, '') <> ''--insert Detail
						 BEGIN
							 Insert into tblLS_TrainerCourse(TrainerID, CourseID)
							 Select @TrainerID, listValue from GetTableFromList(@ListCourses, DEFAULT)
						 END	
				END
		END
	ELSE
		IF Exists(Select * from tblLS_Trainer where TrainerCode=@TrainerCode)
			BEGIN
				SET @ReturnMess = 'Trainer Code was Existed, Please input other Code!!'
				return
			END
		ELSE
			BEGIN
				 INSERT INTO tblLS_Trainer ( [TrainerCode] , [TrainerName] , [FromSource] , [Address] , [Telephone] , [Email] , [ProviderID] , [Rank] , [OtherName], [Used])
				 VALUES 
					   ( @TrainerCode, @TrainerName, @FromSource, @Address, @Telephone, @Email, @ProviderID, @Rank, @OtherName, @Used) 

				 IF ISNULL(@ListCourses, '') <> ''
				 BEGIN
					 Insert into tblLS_TrainerCourse(TrainerID, CourseID)
					 Select SCOPE_IDENTITY(), listValue from GetTableFromList(@ListCourses, DEFAULT)
				 END
			END

END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblLS_TrainerCourse where [TrainerID] = @TrainerID

	 DELETE FROM tblLS_Trainer WHERE [TrainerID] = @TrainerID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		a.TrainerID,
		a.TrainerCode,
		a.TrainerName,
		a.Address,
		a.Telephone,
		a.Email,		
		a.Rank,
		a.OtherName,
		b.ProviderID,
		FromSource = (Case when a.FromSource=1 then 'External'
						when a.FromSource=2 then  'Other'
					End),
		FromName = (Case when a.FromSource=1 then b.ProviderName
						when a.FromSource=2 then  a.OtherName
					End),
		a.Used,
		'' as ListCourses
	 FROM tblLS_Trainer a left join vLS_Provider b on a.ProviderID = b.ProviderID
	 WHERE
		[TrainerID] = @TrainerID

	-- spfrmLS_Trainer @Activity ='GetDataByID', @TrainerID=2
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		a.TrainerID,
		a.TrainerCode,
		a.TrainerName,
		a.Address,
		a.Telephone,
		a.Email,		
		a.Rank,
		b.ProviderID,
		FromSource = (Case when a.FromSource=1 then 'External'
						when a.FromSource=2 then  'Other'
					End),
		FromName = (Case when a.FromSource=1 then b.ProviderName
						when a.FromSource=2 then  a.OtherName
					End),
		(Case when a.[Used] = 1 then 'X' else '' end) Used
	 FROM tblLS_Trainer a left join vLS_Provider b on a.ProviderID = b.ProviderID

	 WHERE 1=1

		AND (IsNull(a.[TrainerCode],'')  like N'%' + Isnull(@TrainerCode,'') + '%')
		AND (IsNull(a.[TrainerName],'')  like N'%' + Isnull(@TrainerName,'') + '%')
		AND (IsNull(a.[Address],'')  like N'%' + Isnull(@Address,'') + '%')
		AND (IsNull(a.[Telephone],'')  like N'%' + Isnull(@Telephone,'') + '%')
		AND (IsNull(a.[Email],'')  like N'%' + Isnull(@Email,'') + '%')
		AND (isnull(a.[Rank],'')  = @Rank or isnull( @Rank,'')='')
		AND (a.[Used]  = @Used or isnull(@Used,-1)=-1 or @Used=-1)
		
		AND (a.[ProviderID]  = @ProviderID or isnull( @ProviderID,'')='')
		AND (IsNull(a.[OtherName],'')  like N'%' + Isnull(@OtherName,'') + '%')
		

		/*
		AND ([FromSource]  = @FromSource or isnull( @FromSource,'')='')
		AND ([FromName]  = @FromName or isnull( @FromName,'')='')
		AND ([ProviderID]  = @ProviderID or isnull( @ProviderID,'')='')
		*/
		-- spfrmLS_Trainer @Activity ='GetData', @OtherName='Te'
	
END
ELSE IF @Activity ='GetDataExport'
BEGIN
	 SELECT 
		FromSource = (Case when a.FromSource=1 then 'External'
						when a.FromSource=2 then  'Other'
					End),
		FromName = (Case when a.FromSource=1 then b.ProviderName
						when a.FromSource=2 then  a.OtherName
					End),
		a.TrainerID,
		a.TrainerCode,
		a.TrainerName,
		a.Address,
		a.Telephone,
		a.Email,		
		a.Rank,
		b.ProviderID,	
		Used = (Case when a.[Used] = 1 then 'X' else '' end),
		StatusName = (Case when a.[Used] = 1 then 'Active' else 'Un-Active' end)
	 FROM tblLS_Trainer a left join vLS_Provider b on a.ProviderID = b.ProviderID

	 WHERE 1=1

		AND (IsNull(a.[TrainerCode],'')  like N'%' + Isnull(@TrainerCode,'') + '%')
		AND (IsNull(a.[TrainerName],'')  like N'%' + Isnull(@TrainerName,'') + '%')
		AND (IsNull(a.[Address],'')  like N'%' + Isnull(@Address,'') + '%')
		AND (IsNull(a.[Telephone],'')  like N'%' + Isnull(@Telephone,'') + '%')
		AND (IsNull(a.[Email],'')  like N'%' + Isnull(@Email,'') + '%')
		AND (isnull(a.[Rank],'')  = @Rank or isnull( @Rank,'')='')
		AND (a.[Used]  = @Used or isnull(@Used,-1)=-1 or @Used=-1)
		
		AND (a.[ProviderID]  = @ProviderID or isnull( @ProviderID,'')='')
		AND (IsNull(a.[OtherName],'')  like N'%' + Isnull(@OtherName,'') + '%')
		

		/*
		AND ([FromSource]  = @FromSource or isnull( @FromSource,'')='')
		AND ([FromName]  = @FromName or isnull( @FromName,'')='')
		AND ([ProviderID]  = @ProviderID or isnull( @ProviderID,'')='')
		*/
		-- spfrmLS_Trainer @Activity ='GetDataExport', @OtherName='Te'
	
END

ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		a.TrainerID,
		a.TrainerCode,
		a.TrainerName,
		a.Address,
		a.Telephone,
		a.Email,		
		a.Rank,
		b.ProviderID,
		FromSource = (Case when a.FromSource=1 then 'External'
						when a.FromSource=2 then  'Other'
					End),
		FromName = (Case when a.FromSource=1 then b.ProviderName
						when a.FromSource=2 then  a.OtherName
					End),
		(Case when a.[Used] = 1 then 'X' else '' end) Used
	 FROM tblLS_Trainer a left join vLS_Provider b on a.ProviderID = b.ProviderID

	 WHERE 1=1
END
ELSE IF @Activity ='GetCoursesOfTrainer'
BEGIN
	 SELECT b.CourseID, b.CourseName
	 FROM	tblLS_TrainerCourse a left join vLS_Course b on a.CourseID = b.CourseID
	 WHERE	a.[TrainerID] = @TrainerID

	-- spfrmLS_Trainer @Activity ='GetCoursesOfTrainer', @TrainerID=3
END

/*
ELSE IF @Activity ='GetTrainerByProvider'
BEGIN
	 SELECT TrainerID, TrainerName
	 FROM	tblLS_Trainer
	 WHERE  ProviderID = @ProviderID
END
*/

ELSE IF @Activity ='GetTrainerByFromSource'
BEGIN
	 SELECT 
		a.TrainerID,
		a.TrainerCode,
		a.TrainerName,
		a.Address,
		a.Telephone,
		a.Email,		
		a.Rank,
		b.ProviderID,
		FromSource = (Case when a.FromSource=1 then 'External'
						when a.FromSource=2 then  'Other'
					End),
		FromName = (Case when a.FromSource=1 then b.ProviderName
						when a.FromSource=2 then  a.OtherName
					End),
		(Case when a.[Used] = 1 then 'X' else '' end) Used
	 FROM tblLS_Trainer a left join vLS_Provider b on a.ProviderID = b.ProviderID

	 WHERE 1=1
		AND	a.FromSource = @FromSource
		AND (a.[ProviderID] = @ProviderID or isnull( @ProviderID,'')='')
		AND a.Used = 1
	order by  a.TrainerName
	-- spfrmLS_Trainer @Activity ='GetTrainerByFromSource', @FromSource=2
END

ELSE IF @Activity ='GetTrainerByInternal'
BEGIN
/*
Bỏ phần này.
	SELECT DISTINCT
		   RS.EmployeeID, RS.FullName, RS.Code, RS.Section, RS.Department
	FROM
		(
			select a.EmployeeID, a.FullName, a.Employeecode as Code
			, S.SectionName as Section, D.DeptName as Department
			--, a.JobLevelID, b.JobLevelName
			from vHR_Employee a inner join tblLS_JobLevel b on a.JobLevelID = b.JobLevelID
			left join tblLS_Dept D on D.DeptID = a.DeptID
			left join tblLS_Section S on S.SectionID = a.SectionID
			where b.JobLevel >= 15
			and a.DateOfTermination is null

			UNION ALL
			select Distinct b.EmployeeID, b.FullName, b.Employeecode as Code
			, S.SectionName as Section, D.DeptName as Department
			from tblASS_AssessEmpSkill a inner join vHR_Employee b on a.EmployeeID = b.EmployeeID
			left join tblLS_Dept D on D.DeptID = b.DeptID
			left join tblLS_Section S on S.SectionID = b.SectionID
			where 1=1
			and a.[Current] = 5
			and b.DateOfTermination is null
		) RS
	 ORDER BY RS.FullName
*/
select a.EmployeeID, a.FullName, a.Employeecode as Code
			, S.SectionName as Section, D.DeptName as Department
			--, a.JobLevelID, b.JobLevelName
			from vHR_Employee a 
			inner join tblHR_EmployeeCourse B On a.EmployeeID = b.EmployeeID and b.CourseID = @CourseID
			left join tblLS_Dept D on D.DeptID = a.DeptID
			left join tblLS_Section S on S.SectionID = a.SectionID
			where a.DateOfTermination is null

-- select * from tblHR_EmployeeCourse
	-- spfrmLS_Trainer @Activity ='GetTrainerByInternal'
END


IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_EmployeeTraining]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmTR_EmployeeTraining]
( 
/*
Procedure: spfrmTR_EmployeeTraining
Desc:
	 Procedure for table: tblTR_EmployeeTraining
Author:
	 NgocLD
Create date:
	03-04-2009

*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@PlanID	int = null,
@Year	int = null,
@CourseDesc	nvarchar(500) = null,
@FromDate	nvarchar(10) = null,
@ToDate	nvarchar(10) = null,
@Duration	int = null,
@DurationFT	nvarchar(50) = null,
@IsAddition	int = null,
@Method	nvarchar(50) = null,
@LearningEval	int = null,
@BusImpEval	int = null,
@ReactionEval	int = null,
@StatusID	int = null,
@ReasonID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@CourseID	int = null,
@ProviderID	int = null,
@TeacherID	int = null,

-- More
@CompanyName varchar(50)= null,
@DeptName varchar(50)=null,
@CourseName varchar(50)= null,
@StatusName varchar(50)= null,
@ListAccountCode nvarchar(2000) = null,
@ListPlanCost nvarchar(2000) = null,
@ListEmp nvarchar(2000) = null,
@ListDept nvarchar(2000) = null,
@ListDeptQuantity nvarchar(2000) = null,

@SectionID int = null,
@AreaID int = null,
@EmployeeCode nvarchar(50) = null,
@FullName nvarchar(500) = null,
@CourseNameID int = null,
@UserID	int = null
) 
AS

IF @Activity ='GetData'
BEGIN
	/*
	SELECT distinct
		ROW_NUMBER() over (order by em.EmployeeCode) as STT, 
		em.EmployeeCode,
		em.FullName,
		tp.[Year],
		tp.CourseID,
		convert(nvarchar, tp.[FromDate], 103) + ' - ' +  convert(nvarchar, tp.[ToDate], 103) as Duration,
		cr.CourseName,
		bg.PlanCost,
		re.Certified
	FROM
		vHR_Employee em inner join tblTR_PlanEmp pe on em.EmployeeID = pe.EmpID
						inner join tblTR_TrainingPlan tp on pe.PlanID = tp.PlanID
						inner join tblTR_PlanBudget bg on tp.PlanID = bg.PlanID
						inner join tblLS_Course cr on tp.CourseID = cr.CourseID
						inner join tblLS_Dept de on de.CompanyID = tp.CompanyID
						inner join tblLS_Section se on de.DeptID = se.DeptID
						inner join tblLS_Area ar on ar.SectionID = se.SectionID
						left join tblTR_TrainResultEmp re on re.EmpID = em.EmployeeID
	WHERE 1=1
		and ((IsNull(em.EmployeeCode,'') like N'%' + IsNull(@EmployeeCode,'')+'%'))
		and ((IsNull(em.FullName,'') like N'%' + IsNull(@FullName,'')+'%'))
		and (tp.CompanyID = @CompanyID or isnull( @CompanyID,'')='')	
		and (de.DeptID = @DeptID or isnull( @DeptID,'')='')	
		and (se.SectionID = @SectionID or isnull( @SectionID,'')='')	
		and (ar.AreaID = @AreaID or isnull( @AreaID,'')='')
		and (convert(nvarchar,tr.FromDate,103) = @FromDate or isnull( @FromDate,'')='')
		and (convert(nvarchar,tp.ToDate,103) = @ToDate or isnull( @ToDate,'')='')
		and (tp.[Year] = @Year or isnull( @Year,'')='')
		and (tp.CourseID = @CourseID or isnull( @CourseID,'')='')
		and (tp.CourseID = @CourseNameID or isnull(@CourseNameID,'')='')
	*/

	select 
			d.CompanyID,
			d.CompanyName,
			f.DeptID,
			f.DeptName,
			h.SectionID,
			h.SectionName,
			a.Year,
			e.CourseName,
			b.CourseDesc,
			g.EmployeeCode,
			g.FullName,
			c.TrainingCost,
			Duration = Convert(nvarchar,b.FromDate,103) + ' - ' + Convert(nvarchar,b.ToDate,103),
			Result = Case c.ResultFail when 1 then 'Fail' else 'Pass' end,
			b.ResultID,
			c.EmpID as EmployeeID
		from tblTR_TrainingPlan a inner join tblTR_TrainingResult b on a.PlanID = b.PlanID
								  inner join tblTR_TrainResultEmp c on b.ResultID = c.ResultID
								  inner join vHR_Employee g on c.EmpID = g.EmployeeID
								  left join tblLS_Company d on g.CompanyID = d.CompanyID
								  left join tblLS_Dept f on g.DeptID = f.DeptID								  
								  left join tblLS_Section h on g.SectionID = h.SectionID
								  left join (
										select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
								  ) Ar on Ar.EmployeeID = g.EmployeeID
								  left join tblLS_Course e on a.CourseID = e.CourseID
								  inner join tblSYS_UserPermission Per on Per.EmployeeID = c.EmpID and Per.UserID = @UserID-- Phan quyen du lieu
		WHERE 1=1
		and ((IsNull(g.EmployeeCode,'') like N'%' + IsNull(@EmployeeCode,'')+'%'))
		and ((IsNull(g.FullName,'') like N'%' + IsNull(@FullName,'')+'%'))
		
		AND (a.FromDate between convert(datetime,@FromDate,103) and convert(datetime,@ToDate,103))

		--and ((convert(datetime,@FromDate,103) between b.FromDate and b.ToDate) or isnull( @FromDate,'')='')
		--and (b.ToDate <= convert(datetime,@ToDate,103) or isnull( @ToDate,'')='')

		and (d.CompanyID = @CompanyID or isnull( @CompanyID,'')='')	
		and (f.DeptID = @DeptID or isnull( @DeptID,'')='')	
		and (h.SectionID = @SectionID or isnull( @SectionID,'')='')	
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		
		--and (a.[Year] = @Year or isnull( @Year,'')='')
		and (a.CourseID = @CourseID or isnull(@CourseID,'')='')
		and ((IsNull(b.CourseDesc,'') like N'%' + IsNull(@CourseDesc,'')+'%'))

		Order by a.PlanID Desc

		-- spfrmTR_EmployeeTraining @Activity='GetData', @UserID=2, @FromDate='01/01/2009', @ToDate='31/12/2009'
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_BusinessImpactEvaluation]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmTR_BusinessImpactEvaluation]
( 
/*
Procedure: spfrmTR_BusinessImpactEvaluation
Desc:
	 Procedure for table: tblTR_OverTrainEff
Author:
	 PhuongDK
Create date:
	01-04-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@BusImpEval_ID int = null,
@CreateDate nvarchar(10) = null,
@Value1 bit = null,
@Value2 int = null,
@Value3 nvarchar(500) = null,
@Value4 nvarchar(500) = null,
@LineMgrEmpID int = null,
-- More
@ResultID int = null,
@EmployeeID int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblTR_BusImpEval where BusImpEval_ID = @BusImpEval_ID)
	BEGIN
	 UPDATE tblTR_BusImpEval SET
		[CreateDate]  = GetDate(),
		[Value1] = @Value1,
		[Value2] = @Value2,
		[Value3] = @Value3,
		[Value4] = @Value4,
		[LineMgrEmpID] = @LineMgrEmpID
	 WHERE
		[BusImpEval_ID] = @BusImpEval_ID
	END

	ELSE
	BEGIN
		 INSERT INTO tblTR_BusImpEval ( [CreateDate] , [Value1] , [Value2] , [Value3] , [Value4] , [LineMgrEmpID] )
		 VALUES 
		( GetDate() , @Value1, @Value2 , @Value3, @Value4, @LineMgrEmpID) 

		-- Update Training Result
		update tblTR_TrainResultEmp
		set	BusImpEval_ID = SCOPE_IDENTITY()
		where 
			ResultID = @ResultID
		and	EmpID = @EmployeeID

		-- 
		delete from dbo.tblMail_BusImpEvaluation_Daily
		where 
			ResultID = @ResultID
		and	EmployeeID = @EmployeeID

	END

END

ELSE IF @Activity ='GetInfoByTrainingResult'
BEGIN
		select a.ResultID,
			   a.CourseDesc,
			   d.CourseName,
			   a.Duration,
			   c.CompanyName,
			   e.DeptName
				
		from tblTR_TrainingResult a left join tblTR_TrainingPlan b on a.PlanID = b.PlanID
						    left join tblLS_Company c on b.CompanyID = c.CompanyID
							left join tblLS_Course d on b.CourseID = d.CourseID
							left join tblLS_Dept e on b.DeptID = e.DeptID
		where a.ResultID = @ResultID

	-- spfrmTR_BusinessImpactEvaluation @Activity ='GetInfoByTrainingResult', @ResultID=14
END		

ELSE IF @Activity ='GetBusinessImpactEvaluation'
BEGIN
		select a.*, b.EmpID, c.EmployeeID, c.FullName 
		from dbo.tblTR_BusImpEval a left join tblTR_TrainResultEmp b on a.BusImpEval_ID = b.BusImpEval_ID
									left join vHR_Employee c on b.EmpID= c.EmployeeID
		where a.BusImpEval_ID = @BusImpEval_ID
	-- spfrmTR_BusinessImpactEvaluation @Activity ='GetBusinessImpactEvaluation', @BusImpEval_ID=16
END		

ELSE IF @Activity ='CheckBusinessImpactEvaluation'
BEGIN
		select * from tblTR_TrainResultEmp
		where 1=1
		and ResultID = @ResultID
		and LineManager = @EmployeeId
	-- spfrmTR_BusinessImpactEvaluation @Activity ='CheckBusinessImpactEvaluation', @ResultID=24, @EmployeeID=465
END


	
--IF @Activity ='Save'
--BEGIN
--	IF Exists(Select * from tblTR_OverTrainEff where OverTrainEff_ID = @OverTrainEff_ID)
--	BEGIN
--	 UPDATE tblTR_OverTrainEff SET
--		 [Year]  = @Year,
--		 [No]  = @No,
--		 [Date] = @Date,
--		 [Description]  = @Description
--	 WHERE
--		[OverTrainEff_ID] = @OverTrainEff_ID
--	END
--	ELSE
--	BEGIN
--		 INSERT INTO tblTR_OverTrainEff ( [Year] , [No] , [Description] , [Date]  )
--		 VALUES 
--		( @Year, @No, @Description , @Date) 
--	END
--END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_UserGroupAssign]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmSYS_UserGroupAssign]
( 
/*
Procedure: [spfrmSYS_EmpAccount]
Desc:
	 Procedure for table: [spfrmSYS_EmpAccount]
Author:
	 Tanldt
Create date:
	05-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@EmployeeCode	nvarchar(50) = null,
@FirstName	nvarchar(500) = null,
@LastName	nvarchar(500) = null,
@GenderCode	int = null,
@DateOfBirth	nvarchar(10) = null,
@BirthPlace	nvarchar(500) = null,
@Address	nvarchar(500) = null,
@HomeAddress	nvarchar(500) = null,
@DateOfHire	nvarchar(10) = null,
@DateOfTermination	nvarchar(10) = null,
@Telephone	nvarchar(50) = null,
@Email	nvarchar(500) = null,
@Remark	nvarchar(500) = null,
@EmployeeStatusID	int = null,
@JobTitleID	int = null,
@JobLevelID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@SectionID	int = null,
@AreaID	int = null,
@GroupID	int = null,
@InsertUserID	int = null,
@InsertDate	nvarchar(10) = null,
@UpdateUserID	int = null,
@UpdateDate	nvarchar(10) = null,
-- More
@UserID	int = null,
@FullName	nvarchar(500) = null
) 
AS
IF @Activity ='GetData'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,--a.SectionID,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevel,
			g.StatusName,
			'' AS AreaName,
			'' AS SkillProfile
			, u.UserID, u.sUserName, u.sPassword, u.UserDomain,ugg.GroupName 
			,ug.GroupID
	 FROM vHR_Employee a 
			inner join tblSYS_User u on u.EmployeeID = a.EmployeeID

			left join tblLS_Company b on a.CompanyID = b.CompanyID
			left join tblLS_Dept	c on a.DeptID = c.DeptID
			left join tblLS_Section d on a.SectionID = d.SectionID
			left join tblLS_JobTitle e on a.JobTitleID = e.JobTitleID
			left join tblLS_JobLevel f on a.JobLevelID = f.JobLevelID
			left join tblLS_Status g on a.EmployeeStatusID = g.StatusID
			left join tblSYS_UserGroup ug on ug.UserID = u.UserID
			left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
			left join (
				select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
			) Ar on Ar.EmployeeID = a.EmployeeID
	
	inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
-- select * from vLS_Section
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')

		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (Ar.[AreaID]  = @AreaID or isnull( @AreaID,'')='')
		AND (e.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (f.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND ([EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')
		AND (isnull(ug.GroupID,-1)  = @GroupID or isnull( @GroupID,'')='')
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''

END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevel,
			g.StatusName,
			'' AS AreaName,
			'' AS SkillProfile
			, u.UserID, u.sUserName, u.sPassword, u.UserDomain, ug.GroupID
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
				left join tblSYS_User u on u.EmployeeID = a.EmployeeID
				left join tblSYS_UserGroup ug on ug.UserID = u.UserID
	 -- spfrmHR_Employee @Activity ='GetDataAll'

END


IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_EmpAccount]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmSYS_EmpAccount]
( 
/*
Procedure: [spfrmSYS_EmpAccount]
Desc:
	 Procedure for table: [spfrmSYS_EmpAccount]
Author:
	 Tanldt
Create date:
	05-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@EmployeeCode	nvarchar(50) = null,
@FirstName	nvarchar(500) = null,
@LastName	nvarchar(500) = null,
@GenderCode	int = null,
@DateOfBirth	nvarchar(10) = null,
@BirthPlace	nvarchar(500) = null,
@Address	nvarchar(500) = null,
@HomeAddress	nvarchar(500) = null,
@DateOfHire	nvarchar(10) = null,
@DateOfTermination	nvarchar(10) = null,
@Telephone	nvarchar(50) = null,
@Email	nvarchar(500) = null,
@Remark	nvarchar(500) = null,
@EmployeeStatusID	int = null,
@JobTitleID	int = null,
@JobLevelID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@SectionID	int = null,
@InsertUserID	int = null,
@InsertDate	nvarchar(10) = null,
@UpdateUserID	int = null,
@UpdateDate	nvarchar(10) = null,
-- More
@FullName	nvarchar(500) = null
) 
AS
IF @Activity ='GetData'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevel,
			g.StatusName,
			'' AS AreaName,
			'' AS SkillProfile
			, u.UserID, u.sUserName, u.sPassword, u.UserDomain
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						left join tblSYS_User u on u.EmployeeID = a.EmployeeID
-- select * from tblSYS_User
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')

		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (e.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (f.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND ([EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')

		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''

END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevel,
			g.StatusName,
			'' AS AreaName,
			'' AS SkillProfile
			, u.UserID, u.sUserName, u.sPassword, u.UserDomain
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
				left join tblSYS_User u on u.EmployeeID = a.EmployeeID
	 -- spfrmHR_Employee @Activity ='GetDataAll'

END


IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_TrainingInfo_07]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmRPT_TrainingInfo_07]
( 
/*
Procedure: [spfrmRPT_TrainingInfo_07]
Desc:
	 Procedure for table: tblTR_TrainResultEmp
Author:
	 QuanBM
Create date:
	07-04-2009
History:
	...

*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,
---
@FromDate nvarchar(10) = null,
@ToDate nvarchar(10) = null,
@EmployeeCode nvarchar(50) = null,
@EmployeeName nvarchar(1000) = null,
@CompanyID int = null,
@DeptID int = null,
@SectionID int = null,
@AreaID int = null,
@EmployeeStatusID	int = null,
@JobTitleID	int = null,
@JobLevelID	int = null,

@EmpID int = null,
@UserID int = null
) 
AS
IF @Activity ='GetData'
BEGIN
	 SELECT a.EmpID,
			@FromDate as FromDate,
			@ToDate as ToDate,
			convert(nvarchar(10),b.DateOfHire,103) as DateJoin,
--			a.ResultID,
						
			b.EmployeeCode,
			b.FirstName + ' ' + b.LastName as EmployeeName,
			b.CompanyID,
			c.CompanyName,
			b.DeptID,
			d.DeptName,
			b.SectionID,
			e.SectionName,
			g.AreaID,
			g.AreaName,
			k.JobTitleID,
			k.JobTitleName
	 FROM tblHR_Employee b
			
			inner join (
				select EmpID 
				from tblTR_TrainResultEmp a
				inner join tblTR_TrainingResult h on a.ResultID = h.ResultID
				where ((h.FromDate between convert(datetime,@FromDate, 103) and convert(datetime,@ToDate, 103))or isnull( @FromDate,'')='')		
				group by EmpID
			)a on a.EmpID = b.EmployeeID
	
			
			left join tblLS_Company c on b.CompanyID = c.CompanyID
			left join tblLS_Dept d on b.DeptID = d.DeptID
			left join tblLS_Section e on b.SectionID = e.SectionID
			left join tblLS_JobTitle k on b.JobTitleID = k.JobTitleID
			left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						) f on f.EmployeeID = b.EmployeeID
			left join tblLS_Area g on f.AreaID = g.AreaID
			inner join tblSYS_UserPermission Per on Per.EmployeeID = b.EmployeeID and Per.UserID = @UserID --phan quyen du lieu
	 WHERE 1=1
		
		AND (IsNull(b.EmployeeCode,'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(b.FirstName,'') + ' ' + IsNull(b.LastName,'') like N'%' + Isnull(@EmployeeName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (b.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (b.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (g.AreaID  = @AreaID or isnull( @AreaID,'')='')	
		AND (b.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (b.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND (b.[EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')
	order by b.LastName
--GROUP BY
--			b.DateOfHire,
--			a.ResultID,
--			a.EmpID,			
--			b.EmployeeCode,			
--			b.CompanyID,
--			b.FirstName,b.LastName,
--			c.CompanyName,
--			b.DeptID,
--			d.DeptName,
--			b.SectionID,
--			e.SectionName,
--			g.AreaID,
--			g.AreaName,
--			k.JobTitleID,
--			k.JobTitleName
END
else IF @Activity ='GetEmpInfo'
BEGIN
	 SELECT 
		ROW_NUMBER() OVER (ORDER BY b.FromDate) AS [No]
		,d.CourseName
		,convert(nvarchar,b.FromDate,103) + isnull('-'+convert(nvarchar,b.ToDate,103),'') as TrainingDate
		,b.Duration
--		,Cost = (
--					)
		, cast( cost.Cost / CountEmp.CountEmp as numeric(18,0)) as Cost
--,cost.Cost , CountEmp
--, cast( cost.Cost / CountEmp as numeric(18,0)) as Cost
--				select emp.ResultID, Count(Emp.EmpID) as CountEmp
--					from tblTR_TrainResultEmp emp 

		,b.Method
		,b.TrainLocation as Location
, b.ResultID
--,a.ResultID
	 FROM tblTR_TrainResultEmp a
			inner join tblTR_TrainingResult b on a.ResultID = b.ResultID
			inner join tblTR_TrainingPlan c on b.PlanID = c.PlanID
			left join (
				select cost.ResultID, sum(ActualCost) Cost 
					from tblTR_TrainResultCost cost 
						inner join tblLS_AccountCode acc on acc.AccountCodeID = cost.AccountCodeID
					--where acc.IsCourseFee = 0
				group by cost.ResultID
			) cost on Cost.ResultID = a.ResultID
			left join (
				select emp.ResultID, Count(Emp.EmpID) as CountEmp
					from tblTR_TrainResultEmp emp 
				group by emp.ResultID
			) CountEmp on CountEmp.ResultID = a.ResultID
			inner join tblLS_Course d on c.CourseID = d.CourseID		
			inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmpID and Per.UserID = @UserID --phan quyen du lieu
	where 1=1
		and ((b.FromDate between convert(datetime,@FromDate, 103) and convert(datetime,@ToDate, 103))or isnull( @FromDate,'')='')		
		AND a.EmpID = @EmpID
	Order by b.FromDate



END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_MonthlyTrainingPlan_03]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmRPT_MonthlyTrainingPlan_03]

		/*
		Procedure: [spfrmRPT_MonthlyTrainingPlan_03]
		Desc:
			 Procedure for table: tblTR_TrainingPlan
		Author:
			 QuanBM
		Create date:
			06-04-2009
		History:
			...
		*/
@FromDate	nvarchar(10) = null,
@ToDate		nvarchar(10) = null,
@CompanyID	int = null,
@UserID	int = null
AS
BEGIN		
declare @GroupCode int, @DeptID int
select @GroupCode = GroupCode
from tblSYS_UserGroup A
inner join tblSYS_Group B On A.GroupID = B.GroupID
where A.UserID = @UserID

if (@GroupCode = 2)
begin
	select @CompanyID = A.CompanyID,@DeptID = A.DeptID 
	from tblHR_Employee A
	inner join tblSYS_User B On A.EmployeeID = B.EmployeeID
	where B.UserID = @UserID
end

	SELECT 
		isnull(e.DeptName,'Company wide') DeptName,
		ROW_NUMBER() OVER (ORDER BY f.Rank, e.Rank, a.[Year], b.CourseName) AS [No]
		,a.PlanID
		,b.CourseName
		,a.DeptID
		,a.[CourseDesc]
		,c.PlanCost 
		,a.Duration
		,a.Method
--		,a.IsNoOfPart
		,NoOfPart = case IsNoOfPart 
						when 'False' then (select count(*) from tblTR_PlanEmp where tblTR_PlanEmp.PlanID = a.PlanID)
						when 'true' then (select sum(Quantity) from tblTR_PlanDept where tblTR_PlanDept.PlanID = a.PlanID)
					end
		,(a.Duration * case IsNoOfPart 
							when 'False' then (select count(*) from tblTR_PlanEmp where tblTR_PlanEmp.PlanID = a.PlanID)
							when 'true' then (select sum(Quantity) from tblTR_PlanDept where tblTR_PlanDept.PlanID = a.PlanID)
						end) as TotalHr
		,convert(nvarchar,a.[FromDate],103) +'-'+ convert(nvarchar,a.[ToDate],103) as FromDate
		,a.CompanyID
		,f.CompanyName	
		--,h.ProviderName
		,ProviderName = IsNull(h.ProviderName, i.FullName)
	 FROM [tblTR_TrainingPlan] a 
			left join dbo.tblLS_Course b on a.CourseID = b.CourseID
			left join (select PlanID,sum(PlanCost) as PlanCost from dbo.tblTR_PlanBudget group by PlanID
					   ) c on a.PlanID = c.PlanID
			left join tblLS_Company f on a.CompanyID = f.CompanyID
			left join tblLS_Dept e on a.DeptID = e.DeptID
			left join tblLS_Provider h on a.ProviderID = h.ProviderID
			left join vHR_Employee i on a.TeacherID = i.EmployeeID
			inner join (
				select CompanyID from tblHR_Employee E
				inner join tblSYS_UserPermission Per on Per.EmployeeID = E.EmployeeID
				where Per.UserID = @UserID-- Phan quyen du lieu
				group by CompanyID
			) Perc on Perc.CompanyID = a.CompanyID
	where 1=1
		and ((a.FromDate between convert(datetime,@FromDate, 103) and convert(datetime,@ToDate, 103))or isnull( @FromDate,'')='')		
		AND (a.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
		AND (a.DeptID = @DeptID or isnull( @DeptID,'')='')
	Order by f.Rank, e.Rank, a.[Year], b.CourseName
END

--go
--exec spfrmRPT_MonthlyTrainingPlan_03 @FromDate=N'01/01/2008',@ToDate=N'01/01/2009',@CompanyID=N'1'
GO
/****** Object:  StoredProcedure [dbo].[spfrmHR_EmpDelegateTo]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmHR_EmpDelegateTo]
( 
/*
Procedure: spfrmHR_EmpDelegateTo
Desc:
	 Procedure for table: tblHR_EmpDelegateTo
Author:
	 PhuongDK
Create date:
	29-05-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@DelegateID	int = null,
@EmployeeID	int = null,
@EmpDelegateID	int = null,
@FromDate	nvarchar(10) = null,
@ToDate	nvarchar(10) = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblHR_EmpDelegateTo where DelegateID = @DelegateID)
	BEGIN
	 UPDATE tblHR_EmpDelegateTo SET
		 [EmployeeID]  = @EmployeeID,
		 [EmpDelegateID]  = @EmpDelegateID,
		 [FromDate]  = Convert(datetime,@FromDate,103),
		 [ToDate]  = Convert(datetime,@ToDate,103)
	 WHERE
		[DelegateID] = @DelegateID
	END
	ELSE
	BEGIN
		 INSERT INTO tblHR_EmpDelegateTo ( [EmployeeID] , [EmpDelegateID] , [FromDate] , [ToDate]  )
		 VALUES 
		( @EmployeeID, @EmpDelegateID, Convert(datetime,@FromDate,103), Convert(datetime,@ToDate,103) ) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblHR_EmpDelegateTo
	 WHERE
		[DelegateID] = @DelegateID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		DelegateID,
		EmployeeID,
		EmpDelegateID,
		FromDate = Convert(nvarchar,FromDate,103),
		ToDate = Convert(nvarchar,ToDate,103)
	 FROM tblHR_EmpDelegateTo
	 WHERE
		[DelegateID] = @DelegateID
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		a.DelegateID,
		a.EmployeeID,
		b.FullName,
		FromDate = Convert(nvarchar,a.FromDate,103),
		ToDate = Convert(nvarchar,a.ToDate,103)
	 FROM tblHR_EmpDelegateTo a left join vHR_Employee b on a.EmpDelegateID = b.EmployeeID
	 WHERE 1=1
		AND a.EmployeeID = @EmployeeID
		
	-- spfrmHR_EmpDelegateTo @Activity ='GetData', @EmployeeID=29
END
ELSE IF @Activity ='GetDataCheck'
BEGIN
	declare @dateFrom datetime
	declare @dateTo datetime

	set @dateFrom = Convert(datetime, @FromDate, 103)
	set @dateTo = Convert(datetime, @ToDate, 103)

	 SELECT 
		a.DelegateID,
		a.EmployeeID,
		b.FullName,
		FromDate = Convert(nvarchar,a.FromDate,103),
		ToDate = Convert(nvarchar,a.ToDate,103)
	 FROM tblHR_EmpDelegateTo a left join vHR_Employee b on a.EmpDelegateID = b.EmployeeID
	 WHERE 1=1
		AND a.EmployeeID = @EmployeeID
		and (
			  ((FromDate between @dateFrom and @dateTo) or (ToDate between @dateFrom and @dateTo)) or
			  ((@dateFrom between FromDate and ToDate) or (@dateTo between FromDate and ToDate))
			)
	-- spfrmHR_EmpDelegateTo @Activity ='GetDataCheck', @EmployeeID=29, @FromDate='15/07/2009', @ToDate='31/07/2009'
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		DelegateID,
		EmployeeID,
		EmpDelegateID,
		FromDate,
		ToDate
	 FROM tblHR_EmpDelegateTo
END
IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmHR_AssEmpReportTo]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmHR_AssEmpReportTo]
( 
/*
Procedure: spfrmHR_EmpReportTo
Desc:
	 Procedure for table: tblHR_EmpReportTo
Author:
	...
Create date:
	29-05-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@ReportToID	int = null,
@AssRoleID	int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblHR_AssEmpReportTo where EmployeeID = @EmployeeID)
	BEGIN
	
		 IF ISNULL(@ReportToID,'') = '' and ISNULL(@AssRoleID,'') = ''
		 BEGIN
			 DELETE FROM tblHR_AssEmpReportTo 
			 WHERE
				[EmployeeID] = @EmployeeID
		 END
		 ELSE
		 BEGIN
			 UPDATE tblHR_AssEmpReportTo SET
				 [ReportToID]  = @ReportToID,
				 [AssRoleID]  = @AssRoleID
			 WHERE
				 [EmployeeID] = @EmployeeID
		 END
	END
	ELSE
	BEGIN
		 INSERT INTO tblHR_AssEmpReportTo ([EmployeeID], [ReportToID], [AssRoleID])
		 VALUES (@EmployeeID, @ReportToID, @AssRoleID) 
	END
END
ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblHR_AssEmpReportTo
	 WHERE
		[EmployeeID] = @EmployeeID
	  AND [ReportToID] = @ReportToID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		EmployeeID,
		ReportToID,
		AssRoleID
	 FROM tblHR_AssEmpReportTo
	 WHERE
		[EmployeeID] = @EmployeeID
	  AND [ReportToID] = @ReportToID
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		EmployeeID,
		ReportToID,
		AssRoleID
	 FROM tblHR_AssEmpReportTo
	 WHERE 1=1
		AND ([ReportToID]  = @ReportToID or isnull( @ReportToID,'')='')
		AND ([AssRoleID]  = @AssRoleID or isnull( @AssRoleID,'')='')
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		EmployeeID,
		ReportToID,
		AssRoleID
	 FROM tblHR_AssEmpReportTo
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmASS_Preview]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmASS_Preview]
( 
/*
Procedure: spfrmLS_Document
Desc:
	 Procedure for table: spfrmLS_Document
Author:
	 NguyenNga
Create date:
	20-03-2009
History:
	...


*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@EmployeeCode	nvarchar(50) = null,
@FirstName	nvarchar(500) = null,
@LastName	nvarchar(500) = null,
@GenderCode	int = null,
@DateOfBirth	nvarchar(10) = null,
@BirthPlace	nvarchar(500) = null,
@Address	nvarchar(500) = null,
@HomeAddress	nvarchar(500) = null,
@DateOfHire	nvarchar(10) = null,
@DateOfTermination	nvarchar(10) = null,
@Telephone	nvarchar(50) = null,
@Email	nvarchar(500) = null,
@Remark	nvarchar(500) = null,
@EmployeeStatusID	int = null,
@JobTitleID	int = null,
@JobLevelID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@SectionID	int = null,
@AreaID	int = null,
@InsertUserID	int = null,
@InsertDate	nvarchar(10) = null,
@UpdateUserID	int = null,
@UpdateDate	nvarchar(10) = null,
---
@Year	int =null,
@No		nvarchar(500) = null,
@Date	datetime = null,
@AssID int =null,
-- More
@UserID		int = null,
@GroupID		int = null,
@FullName	nvarchar(500) = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblHR_Employee where EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblHR_Employee SET
		 [EmployeeCode]  = @EmployeeCode,
		 [FirstName]  = @FirstName,
		 [LastName]  = @LastName,
		 [GenderCode]  = @GenderCode,
		 [DateOfBirth]  = Convert(datetime,@DateOfBirth,103),
		 [BirthPlace]  = @BirthPlace,
		 [Address]  = @Address,
		 [HomeAddress]  = @HomeAddress,
		 [DateOfHire]  = Convert(datetime,@DateOfHire,103),
		 [DateOfTermination]  = Convert(datetime,@DateOfTermination,103),
		 [Telephone]  = @Telephone,
		 [Email]  = @Email,
		 [Remark]  = @Remark,
		 [EmployeeStatusID]  = @EmployeeStatusID,
		 [JobTitleID]  = @JobTitleID,
		 [JobLevelID]  = @JobLevelID,
		 [CompanyID]  = @CompanyID,
		 [DeptID]  = @DeptID,
		 [SectionID]  = @SectionID,
		 [InsertUserID]  = @InsertUserID,
		 [InsertDate]  = Convert(datetime,@InsertDate,103),
		 [UpdateUserID]  = @UpdateUserID,
		 [UpdateDate]  = Convert(datetime,@UpdateDate,103)
	 WHERE
		[EmployeeID] = @EmployeeID
	END
	ELSE
	BEGIN
		 INSERT INTO tblHR_Employee ( [EmployeeCode] , [FirstName] , [LastName] , [GenderCode] , [DateOfBirth] , [BirthPlace] , [Address] , [HomeAddress] , [DateOfHire] , [DateOfTermination] , [Telephone] , [Email] , [Remark] , [EmployeeStatusID] 
, [JobTitleID] , [JobLevelID] , [CompanyID] , [DeptID] , [SectionID] , [InsertUserID] , [InsertDate] , [UpdateUserID] , [UpdateDate]  )
		 VALUES 
		( @EmployeeCode, @FirstName, @LastName, @GenderCode, Convert(datetime,@DateOfBirth,103), @BirthPlace, @Address, @HomeAddress, Convert(datetime,@DateOfHire,103), Convert(datetime,@DateOfTermination,103), @Telephone, @Email, @Remark, @EmployeeStatusID
, @JobTitleID, @JobLevelID, @CompanyID, @DeptID, @SectionID, @InsertUserID, Convert(datetime,@InsertDate,103), @UpdateUserID, Convert(datetime,@UpdateDate,103) ) 
	END
END

-----Hàm SaveEmployee
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblHR_Employee where EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblHR_Employee SET
		 [EmployeeCode]  = @EmployeeCode,
		 [FirstName]  = @FirstName,
		 [LastName]  = @LastName,
		 [GenderCode]  = @GenderCode,
		 [DateOfBirth]  = Convert(datetime,@DateOfBirth,103),
		 [BirthPlace]  = @BirthPlace,
		 [Address]  = @Address,
		 [HomeAddress]  = @HomeAddress,
		 [DateOfHire]  = Convert(datetime,@DateOfHire,103),
		 [DateOfTermination]  = Convert(datetime,@DateOfTermination,103),
		 [Telephone]  = @Telephone,
		 [Email]  = @Email,
		 [Remark]  = @Remark,
		 [EmployeeStatusID]  = @EmployeeStatusID,
		 [JobTitleID]  = @JobTitleID,
		 [JobLevelID]  = @JobLevelID,
		 [CompanyID]  = @CompanyID,
		 [DeptID]  = @DeptID,
		 [SectionID]  = @SectionID,
		 [InsertUserID]  = @InsertUserID,
		 [InsertDate]  = Convert(datetime,@InsertDate,103),
		 [UpdateUserID]  = @UpdateUserID,
		 [UpdateDate] = Convert(datetime,@UpdateDate,103)
	 WHERE
		[EmployeeID] = @EmployeeID
	END
	ELSE
	BEGIN
		 INSERT INTO tblHR_Employee ( [EmployeeCode] , [FirstName] , [LastName] , [GenderCode] , [DateOfBirth] , [BirthPlace] , [Address] , [HomeAddress] , [DateOfHire] , [DateOfTermination] , [Telephone] , [Email] , [Remark] , [EmployeeStatusID] 
, [JobTitleID]
 , [JobLevelID] , [CompanyID] , [DeptID] , [SectionID] , [InsertUserID] , [InsertDate] , [UpdateUserID] , [UpdateDate]  )
		 VALUES 
		( @EmployeeCode, @FirstName, @LastName, @GenderCode, Convert(datetime,@DateOfBirth,103), @BirthPlace, @Address, @HomeAddress, Convert(datetime,@DateOfHire,103), Convert(datetime,@DateOfTermination,103), @Telephone, @Email, @Remark, @EmployeeStatusID
, @JobTitleID, @JobLevelID, @CompanyID, @DeptID, @SectionID, @InsertUserID, Convert(datetime,@InsertDate,103), @UpdateUserID, Convert(datetime,@UpdateDate,103) ) 
	END
END
-----

ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblHR_Employee
	 WHERE
		[EmployeeID] = @EmployeeID
END
ELSE IF @Activity ='UpdateStatus'
BEGIN
	 UPDATE tblHR_Employee SET
		 
		 [EmployeeStatusID]  = @EmployeeStatusID
	 WHERE
		[EmployeeID] = @EmployeeID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
			
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,
			'' AS AreaName,
			'' AS SkillProfile,
			h.UserID,
			i.GroupID
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						 left join tblSYS_User h on a.EmployeeID = h.EmployeeID
					     left join tblSYS_UserGroup i on h.UserID = i.UserID
	 WHERE
		a.[EmployeeID] = @EmployeeID

	-- spfrmHR_Employee @Activity ='GetDataByID', @EmployeeID=1
END

ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,
			'' AS AreaName,
			'' AS SkillProfile,
			'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 -- spfrmHR_Employee @Activity ='GetDataAll'
END

ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
			asse.AssID,
			asss.Year,
			asss.No,
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,a.EmployeeStatusID,
			 u.UserID, u.sUserName, u.sPassword, u.UserDomain,ugg.GroupName ,ugg.GroupID,
			'' AS AreaName,
			'' AS SkillProfile,
			'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						left join tblHR_EmployeeArea Ar on Ar.EmployeeID = a.EmployeeID
						
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						left join tblSYS_User u on u.EmployeeID = a.EmployeeID
						left join tblASS_AssessEmp asse on asse.EmployeeID = a.EmployeeID
						left join tblASS_Assessment asss on asss.AssID = asse.AssID
						left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
			--inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (Ar.[AreaID]  = @AreaID or isnull( @AreaID,'')='')
		AND (e.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (f.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND ([EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')
		AND (isnull(ug.GroupID,-1)  = @GroupID or isnull( @GroupID,'')='')
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''

END


ELSE IF @Activity ='GetWorkingHistory'
BEGIN
	
	SELECT 
		a.WorkingHistoryID,
		EffDate  = Convert(nvarchar,a.EffDate,103),
		a.[Type],
		b.CompanyName,
		c.DeptName,
		d.SectionName,
		e.JobTitleName,
		f.JobLevelName
	FROM
		tblHR_WorkingHistory a left join vLS_Company b on a.CompanyID = b.CompanyID
							   left join vLS_Dept	c on a.DeptID = c.DeptID
							   left join vLS_Section d on a.SectionID = d.SectionID
						       left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						       left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID 

	WHERE
		a.[EmployeeID] = @EmployeeID
	Order by EffDate

	-- spfrmHR_Employee @Activity ='GetWorkingHistory', @EmployeeID = 1
END

--Lấy thông tin nhân viên
ELSE IF @Activity ='LayThongTinNhanVien'
BEGIN

	SELECT 
		ROW_NUMBER() OVER (ORDER BY a.EmployeeID) AS STT, 
		a.EmployeeID,
		a.EmployeeCode,
		a.FirstName,
		a.LastName,
		a.FirstName + ' ' + a.LastName AS FullName,
		b.CompanyName,
		c.DeptName,
		d.SectionName,
		e.JobTitleName,
		f.JobLevelName,
		a.DateOfBirth,
		a.Address,
		a.Telephone,
		g.StatusName
	FROM
		tblHR_Employee a	left join vLS_Company b on a.CompanyID = b.CompanyID
							left join vLS_Dept	c on a.DeptID = c.DeptID
							left join vLS_Section d on a.SectionID = d.SectionID
						    left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						    left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
							left join vLS_Status g on a.EmployeeStatusID = g.StatusID  
							


	-- spfrmHR_Employee @Activity ='GetWorkingHistory', @EmployeeID = 1
END


ELSE IF @Activity ='GetCertHistory'
BEGIN
	
	SELECT 
		a.CertHistoryID,
		a.CertName,
		a.CertTypeName,
		a.[Year]
	FROM
		tblHR_CertificationHistory a

	WHERE
		a.[EmployeeID] = @EmployeeID
	Order by a.[Year]

	-- spfrmHR_Employee @Activity ='GetCertHistory', @EmployeeID = 1
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmASS_Perfomance]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmASS_Perfomance]
( 
/*
Procedure: spfrmLS_Document
Desc:
	 Procedure for table: spfrmLS_Document
Author:
	 NguyenNga
Create date:
	20-03-2009
History:
	...


*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@EmployeeCode	nvarchar(50) = null,
@FirstName	nvarchar(500) = null,
@LastName	nvarchar(500) = null,
@GenderCode	int = null,
@DateOfBirth	nvarchar(10) = null,
@BirthPlace	nvarchar(500) = null,
@Address	nvarchar(500) = null,
@HomeAddress	nvarchar(500) = null,
@DateOfHire	nvarchar(10) = null,
@DateOfTermination	nvarchar(10) = null,
@Telephone	nvarchar(50) = null,
@Email	nvarchar(500) = null,
@Remark	nvarchar(500) = null,
@EmployeeStatusID	int = null,
@JobTitleID	int = null,
@JobLevelID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@SectionID	int = null,
@AreaID	int = null,
@InsertUserID	int = null,
@InsertDate	nvarchar(10) = null,
@UpdateUserID	int = null,
@UpdateDate	nvarchar(10) = null,
---
@Year	int =null,
@No		nvarchar(500) = null,
@Date nvarchar(10)=null,
@AssID int =null,
@LineMgrEmpID	int =null,
@EmpStatus	bit = null,
@SkillID	int =null,
-- More
@UserID		int = null,
@GroupID		int = null,
@FullName	nvarchar(500) = null
) 
AS
IF @Activity ='GetData'
BEGIN
	 SELECT distinct
			a.EmployeeID,
			a.EmployeeCode,
			--a.LastName + ', ' +a.FirstName as FullName,
			a.LastName,
			a.FullName,
			b.CompanyName,
			c.DeptName,
			d.SectionName,t.JobTitleName,
			g.StatusName, Ass.*, AssE.LineMgrEmpID,AssE.EmpStatus
			,Rep.ReporttoID, RepE.FullName as FullNameLine
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						left join tblLS_JobTitle t on a.JobTitleID = t.JobTitleID
						 left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
			inner join tblASS_AssessEmp AssE on  AssE.EmployeeID = a.EmployeeID --and (isnull( @EmpIDLine,'')='' or AssE.LineMgrEmpID = @EmpIDLine)
			inner join tblASS_Assessment Ass on AssE.AssID = Ass.AssID and Ass.[Year] = @Year and Ass.[No] = @No
			left join tblHR_AssEmpReportTo Rep On Rep.EmployeeID = a.EmployeeID
			left join vHR_Employee RepE on RepE.EmployeeID = Rep.ReporttoID
			inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull(a.[LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		And (Ass.Date = Convert(datetime,@Date,103) or isnull(@Date,'')='')
		--End
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''
--select * from tblASS_AssessEmp
END
else IF @Activity ='GetDataLM'
BEGIN
--select * from tblSYS_User
select @LineMgrEmpID = EmployeeID from tblSYS_User where UserID = @UserID
	 SELECT distinct
			a.EmployeeID,
			a.EmployeeCode,
			--a.LastName + ', ' +a.FirstName as FullName,
			a.LastName,
			a.FullName,
			b.CompanyName,
			c.DeptName,
			d.SectionName,t.JobTitleName,
			g.StatusName, Ass.*, AssE.LineMgrEmpID,AssE.EmpStatus
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						left join tblLS_JobTitle t on a.JobTitleID = t.JobTitleID
						 left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
			inner join tblASS_AssessEmp AssE on AssE.EmployeeID = a.EmployeeID --and (isnull( @EmpIDLine,'')='' or AssE.LineMgrEmpID = @EmpIDLine)
			inner join tblASS_Assessment Ass on AssE.AssID = Ass.AssID and Ass.[Year] = @Year and Ass.[No] = @No
			inner join tblHR_AssEmpReportTo R on R.EmployeeID = a.EmployeeID and R.ReportToID = @LineMgrEmpID
			--inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		And (Ass.Date = Convert(datetime,@Date,103) or isnull(@Date,'')='')
		--End
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''
--select * from tblASS_AssessEmp
END
else IF @Activity ='GetListLm'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.LastName + ', ' +a.FirstName as FullName,
			a.Email
	 FROM vHR_Employee a 
						inner join tblSYS_User u on u.EmployeeID = a.EmployeeID
						left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
	 WHERE 1=1
		AND ugg.GroupCode = 2
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''
	order by a.LastName
END
else IF @Activity ='SaveLm'
BEGIN
	  update tblASS_AssessEmp set 
				LineMgrEmpID = @LineMgrEmpID
--				EmpStatus = @EmpStatus	
		where EmployeeID = @EmployeeID and AssID  = @AssID 
END
else IF @Activity ='ReStatus'
BEGIN
	 IF Exists(Select * from tblASS_AssessEmp where AssID = @AssID And EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblASS_AssessEmp SET		 
			EmpStatus = 0	
	 WHERE
		AssID = @AssID
		And EmployeeID = @EmployeeID


--select * from tblASS_AssessEmp
	END
END
else IF @Activity ='GetMailByEmpID'
BEGIN
	 Select Email from tblHR_Employee where EmployeeID = @EmployeeID
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmASS_EmpSkillProfile]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmASS_EmpSkillProfile]
( 
/*
Procedure: spfrmASS_EmpSkillProfile
Desc:
	 Procedure for table: spfrmASS_EmpSkillProfile
Author:
	 Tanldt
Create date:
	31-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@AssID	int = null,
@Status	int = null,
@EmpStatus	int = null,
@Year	int = null,
@PerfNo	nvarchar(500) = null,
@AreaID	int = null,
@SkillIDA	int = null,
@SkillIDB	int = null,
@SkillIDC	int = null,
@SkillID	int = null,

@Gap	int = null,
@Start	int = null,
@Current	int = null,
@Target	int = null,
@EmpIDLine		int = null,

@InsertUserID	int = null,
@InsertDate	nvarchar(10) = null,
@UpdateUserID	int = null,
@UpdateDate	nvarchar(10) = null,
-- More
@Level		int = null,
@UserID		int = null,
@GroupID		int = null
) 
AS
Declare @GroupCode int

select @GroupCode = B.GroupCode 
from tblSYS_UserGroup A
inner join tblSYS_Group B On A.GroupID = B.GroupID
where A.UserID = @UserID

IF @Activity ='GetEmplist'
BEGIN

	if (@GroupCode > 2)
	begin

	 SELECT distinct
			a.EmployeeID,
			a.EmployeeCode,
			a.LastName + ', ' +a.FirstName as FullName,
			a.LastName,
			--a.FullName,
			b.CompanyName,
			c.DeptName,
			d.SectionName,
			g.StatusName
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
--						 left join (
--							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
--						) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
			inner join tblASS_AssessEmp AssE on  AssE.EmployeeID = a.EmployeeID --and (isnull( @EmpIDLine,'')='' or AssE.LineMgrEmpID = @EmpIDLine)
			inner join tblASS_Assessment Ass on AssE.AssID = Ass.AssID and Ass.[Year] = @Year and Ass.[No] = @PerfNo
			--inner join tblHR_AssEmpReportTo R on R.EmployeeID = a.EmployeeID and R.ReportToID = @EmpIDLine
			inner join (
				select distinct * from (
					select EmployeeID, UserID from tblSYS_UserPermission 
					union all
					select AssE.EmployeeID,AssE.LineMgrEmpID as UserID 
					from tblASS_AssessEmp AssE 
						inner join tblASS_Assessment Ass on AssE.AssID = Ass.AssID and Ass.[Year] = @Year and Ass.[No] = @PerfNo	
					where (isnull( @EmpIDLine,'')='' or AssE.LineMgrEmpID = @EmpIDLine)
				) AA
			) Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 order by a.LastName
		
--		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''
	end
	else
	begin
		SELECT distinct
			a.EmployeeID,
			a.EmployeeCode,
			a.LastName + ', ' +a.FirstName as FullName,
			a.LastName,
			--a.FullName,
			b.CompanyName,
			c.DeptName,
			d.SectionName,
			g.StatusName
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
--						 left join (
--							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
--						) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
			inner join tblASS_AssessEmp AssE on  AssE.EmployeeID = a.EmployeeID --and (isnull( @EmpIDLine,'')='' or AssE.LineMgrEmpID = @EmpIDLine)
			inner join tblASS_Assessment Ass on AssE.AssID = Ass.AssID and Ass.[Year] = @Year and Ass.[No] = @PerfNo
			inner join tblHR_AssEmpReportTo R on R.EmployeeID = a.EmployeeID and R.ReportToID = @EmpIDLine
--			inner join (
--				select distinct * from (
--					select EmployeeID, UserID from tblSYS_UserPermission 
--					union all
--					select AssE.EmployeeID,AssE.LineMgrEmpID as UserID 
--					from tblASS_AssessEmp AssE 
--						inner join tblASS_Assessment Ass on AssE.AssID = Ass.AssID and Ass.[Year] = @Year and Ass.[No] = @PerfNo	
--					where (isnull( @EmpIDLine,'')='' or AssE.LineMgrEmpID = @EmpIDLine)
--				) AA
--			) Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 order by a.LastName
	end

END
else IF @Activity ='EmpInfo'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.LastName + ', ' +a.FirstName as FullName,
			a.LastName,
			--a.FullName,
			b.CompanyName,
			c.DeptID,c.DeptName,
			d.SectionName,d.SectionID,
			g.StatusName
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
--						 left join (
--							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
--						) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
--			inner join tblASS_AssessEmp AssE on  AssE.EmployeeID = a.EmployeeID and (isnull( @EmpIDLine,'')='' or AssE.LineMgrEmpID = @EmpIDLine)
--			inner join tblASS_Assessment Ass on AssE.AssID = Ass.AssID and Ass.[Year] = @Year and Ass.[No] = @PerfNo
--			inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		
		AND (@EmployeeID = a.EmployeeID)
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''

END
else IF @Activity ='EmpInfoByAreaID'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.LastName,
			a.FullName,
			b.CompanyName,
			c.DeptName,
			d.SectionName,d.SectionID,
			g.StatusName, l.AreaName
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
--						 left join (
--							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
--						) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						inner join tblLS_Area l on l.[AreaID] = @AreaID
--			inner join tblASS_AssessEmp AssE on  AssE.EmployeeID = a.EmployeeID and (isnull( @EmpIDLine,'')='' or AssE.LineMgrEmpID = @EmpIDLine)
--			inner join tblASS_Assessment Ass on AssE.AssID = Ass.AssID and Ass.[Year] = @Year and Ass.[No] = @PerfNo
--			inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		
		AND (@EmployeeID = a.EmployeeID) AND (@AreaID = l.AreaID)
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''

END
else IF @Activity ='GetDataEmpSkill'
BEGIN
Declare @Deadline datetime
select @AssID = A.AssID, @Status = A.Status , @EmpStatus = AE.EmpStatus, @Deadline = A.Date
from tblASS_Assessment A
inner join tblASS_AssessEmp AE on AE.AssID = A.AssID and AE.EmployeeID = @EmployeeID
where A.[Year] =@Year and A.[No] = @PerfNo
set @Status = isnull(@Status,1)
set @EmpStatus = isnull(@EmpStatus,0)

select @Deadline = A.Date
from tblASS_Assessment A
where A.[Year] =@Year and A.[No] = @PerfNo
--select @Deadline
--select * from tblASS_Assessment where [Year] =@Year and [No] = @PerfNo
 --delete from [tblASS_AssessEmpSkill]
--select *  from tblASS_AssessEmp
--select *  from [tblASS_AssessEmpSkill]
--select *  from tblASS_Assessment

--select @EmpStatus
--select @Status


	if (@Status = 1 and @EmpStatus = 0)
	begin
			-------------------------------------------------
			-- Đẩy dữ liệu history vào
			INSERT INTO [dbo].[tblASS_AssessEmpSkill]
           ([AssID] ,[CheckListID] ,[Start] ,[Current] ,[Target] ,[EffDate] ,[EmployeeID] ,[SkillID], UserID)

           SELECT distinct @AssID,null,isnull(His.[Current],1) ,isnull(His.[Current],1) ,isnull(His.[Target],1) ,getdate(),@EmployeeID,His.SkillID, @UserID
			FROM [tblASS_AssessEmpSkill] His
			left join [tblASS_AssessEmpSkill] Cur On Cur.SkillID = His.SkillID and Cur.[AssID] = @AssID and Cur.[EmployeeID] = @EmployeeID
			where His.[AssID] = (Select top 1 P.[AssID] From [tblASS_AssessEmpSkill] P 
										inner join tblASS_Assessment A on A.AssID = P.AssID
										Where His.EmployeeID = P.EmployeeID	
										  --and His.AreaID = P.AreaID 
										  and His.SkillID = P.SkillID
										and A.Date < @Deadline
										-- and A.[Year] <= @Year 
										Order By A.Date desc)
			and His.EmployeeID = @EmployeeID
			-------------------------------------------------
			and Cur.SkillID is null

--
			INSERT INTO [dbo].[tblASS_AssessEmpSkill]
           ([AssID] ,[CheckListID] ,[Start] ,[Current] ,[Target] ,[EffDate] ,[EmployeeID] ,[SkillID], UserID)

           SELECT distinct @AssID,null,1 ,1 ,1 ,getdate(),@EmployeeID,S4.SkillID, @UserID
			FROM tblLS_Skill S4
			inner join tblLS_SkillArea SA on SA.SkillID = S4.SkillID
			inner join tblHR_EmployeeArea EA on EA.AreaID = SA.AreaID
			left join [tblASS_AssessEmpSkill] AE on AE.[AssID] = @AssID 
												and AE.EmployeeID = EA.EmployeeID
												--and AE.AreaID = EA.AreaID 
												and AE.SkillID = S4.SkillID

			where S4.Level = 4 AND (@EmployeeID = EA.EmployeeID) and AE.[AssID] is null and S4.Used = 1


	end

	 SELECT @Status as Status, @EmpStatus as EmpStatus, @Year as [Year], @PerfNo PerfNo, 
			S1.SkillName as SkillName1, S2.SkillName as SkillName2, S3.SkillName as SkillName3, S4.SkillName as SkillName4
			,AES.*
			,case when ( AES.Target - AES.[Current]) < 0 then 0 else ( AES.Target - AES.[Current]) end as GAP
			,isnull(CL.CheckListTempID,-1) as CheckListTempID, CL.CheckListTitle
			, e.FirstName + ' ' + e.LastName as UserAssessment
			, AES.EffDate as LastUpdate
	 FROM [tblASS_AssessEmpSkill] as AES
		inner join tblLS_Skill S4 on S4.SkillID = AES.SkillID
		inner join tblLS_Skill S3 on S3.SkillID = S4.ParentID and S3.Level = 3
		inner join tblLS_Skill S2 on S2.SkillID = S3.ParentID and S2.Level = 2
		inner join tblLS_Skill S1 on S1.SkillID = S2.ParentID and S1.Level = 1
		inner join (
			select EmployeeID,SkillID 
			from tblHR_EmployeeArea ea
			inner join tblLS_SkillArea sa on ea.AreaID = sa.AreaID
			group by EmployeeID,SkillID 
		) aa on aa.SkillID = S4.SkillID and aa.EmployeeID = AES.EmployeeID
--		inner join tblHR_EmployeeArea ea On ea.EmployeeID = AES.EmployeeID
--		inner join tblLS_SkillArea sa on ea.AreaID = sa.AreaID and sa.SkillID = S4.SkillID

		--left join tblLS_Area Ar on Ar.AreaID = AES.AreaID
		left join tblLS_CheckListTemp CL on CL.SkillID = AES.SkillID and CL.Status = 1
		left join tblSYS_User Users On Users.UserID = AES.UserID
		left join tblHR_Employee e On e.EmployeeID = Users.EmployeeID 
		--inner join tblHR_EmployeeArea ea On ea.EmployeeID = AES.EmployeeID and ea.AreaID = AES.AreaID
		--left join tblASS_CheckList ECL on ECL.CheckListID = AES.SkillID and CL.Status = 1
--select * from tblHR_Employee
	 WHERE 1=1
		AND (@EmployeeID = AES.EmployeeID) and @AssID = AES.AssID
		--AND (isnull( @AreaID,'')='' or @AreaID = AES.AreaID)
		AND (isnull( @SkillIDA,'')='' or @SkillIDA = S1.SkillID)
		AND (isnull( @SkillIDB,'')='' or @SkillIDB = S2.SkillID)
		AND (isnull( @SkillIDC,'')='' or @SkillIDC = S3.SkillID)
		AND (isnull( @SkillID,'')='' or @SkillID = S4.SkillID)
		AND (isnull( @Gap,'-1')='-1' or @Gap = case when ( AES.Target - AES.[Current]) < 0 then 0 else ( AES.Target - AES.[Current]) end)
		AND (isnull( @Start,'-1')='-1' or @Start = AES.Start)
		AND (isnull( @Target,'-1')='-1' or @Target = AES.Target)
		AND (isnull( @Current,'-1')='-1' or @Current = AES.[Current])
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''

--select * from [tblASS_AssessEmpSkill]
	order by S1.SkillName,S2.SkillName,S3.SkillName,S4.SkillName

--select @Start
END

ELSE IF @Activity ='UpdateEmpSkill'
BEGIN

update [dbo].[tblASS_AssessEmpSkill]
set
           [Start] = @Start ,[Current] =@Current ,[Target] = @Target
		,[EffDate] = getdate() ,UserID = @UserID
where 
	[AssID] = @AssID 
and [EmployeeID] = @EmployeeID 
and [SkillID] = @SkillID
END

ELSE IF @Activity ='UpdateEmpSkillLevel'
BEGIN

update [dbo].[tblASS_AssessEmpSkill]
set
         [Current] =@Current,
		 [EffDate] = getdate(),
		 UserID = @UserID
where 
	[AssID] = @AssID 
and [EmployeeID] = @EmployeeID 
and [SkillID] = @SkillID

END

ELSE IF @Activity ='GetCategoryForCheklist'
BEGIN
	 
    SELECT c.ChkLstCateID as ID, c.ChkLstCateName as [Name], c.[Level]
	FROM vLS_CheckListTemp a inner join tblLS_ChkLstTempDetail b on a.CheckListTempID = b.CheckListTempID
							 left join tblLS_ChkLstCategory c on b.ChkLstCateID = c.ChkLstCateID
	WHERE a.SkillID = @SkillID and c.[Level] = @Level
	ORDER BY c.[Level], b.ItemNo

	-- spfrmLS_CheckListTemp @Activity ='GetCategoryForCheklist', @SkillID=44
END




IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_Skill_First]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sendmail_Skill_First] 

AS

declare @recipients1 varchar(max)
declare @subject1 nvarchar(255)
declare @body1 nvarchar(max)

declare @pYear int,@pNo int,@pLineMgrEmpID int,@Date Nvarchar(15)
,@FullName nvarchar(500), @Gender bit, @GenderName nvarchar(40)

declare @AppAddress	nvarchar(500) , @CCMail nvarchar(40)
set @AppAddress = (select [Value] from tblLS_SystemParam where [Name] = 'AppAddress')
set @CCMail = (select [Value] from tblLS_SystemParam where [Name] = 'CCMail')


	DECLARE vCurID CURSOR FOR 
			select A.[Year], A.No,C.ReportToID LineMgrEmpID, convert(nvarchar(15),A.Date,106) Date
			from tblASS_Assessment A
				inner join tblASS_AssessEmp B On A.AssID = B.AssID
				inner join tblHR_AssEmpReportTo C On B.EmployeeID = C.EmployeeID
			where A.Status = 1 -- Trạng thái chưa kết thúc
				and B.EmpStatus = 0-- Trạng thái Emp chưa complete
				--and isnull(LineMgrEmpID,-1) != -1
				and C.ReportToID is not null
				and dateadd(d,-7,A.Date) = getdate()

			group by A.[Year], A.No, C.ReportToID,A.Date

	OPEN vCurID
	FETCH NEXT FROM vCurID INTO @pYear , @pNo ,@pLineMgrEmpID , @Date
	WHILE @@FETCH_STATUS = 0
			BEGIN
				select @recipients1 = Email, @FullName = FirstName + ' ' + LastName
				,@Gender = GenderCode
				from tblHR_Employee where EmployeeID = @pLineMgrEmpID
if @Gender = 1
	set @GenderName = N'Mr.'
else
	set @GenderName = N'Ms.'

				
--set @recipients1 = 'tanldt@fpt.com.vn'
set @subject1 = N'Mail Remind about skill checklist from Training System'
set @body1 = N'
Dear '+isnull(@GenderName,'')+N' '+ isnull(@FullName,'') +N'
<br />
Please assess your staff'' skills in the training system with deadline at '+@Date+'
<br />
Year: '+isnull(cast(@pYear as nvarchar(40)),'')+N'
<br />
<b>Employee List:</b>

<br /><table boder="1"><tr><th>No.</th><th>Employee Master</th><th>Full Name</th></tr>'

set @body1 = @body1 +  cast(
(
	select td = ROW_NUMBER() OVER (ORDER BY isnull(E.LastName,'')),'',
			td = isnull(E.EmployeeCode,''),'',
			td = isnull(E.FirstName,'') + ' '+ isnull(E.LastName,'')
		from tblASS_Assessment A
			inner join tblASS_AssessEmp B On A.AssID = B.AssID
			inner join tblHR_Employee E on E.EmployeeID = B.EmployeeID
			inner join tblHR_AssEmpReportTo C On B.EmployeeID = C.EmployeeID
		where A.Status = 1 -- Trạng thái chưa kết thúc
			and B.EmpStatus = 0-- Trạng thái Emp chưa complete
			and C.ReportToID = @pLineMgrEmpID
			and A.[Year] = @pYear and A.No = @pNo
		order by E.LastName
	for XML PATH('tr'), TYPE
)
 as nvarchar(max))

set @body1 = @body1 +  N'</table>
<br />
<a href="'+@AppAddress+'MASS/EmpSkillprofile.aspx">'+@AppAddress+'MASS/EmpSkillprofile.aspx</a>
<br /> Thank you '+isnull(@GenderName,'')+N'.
<br />
Training System

'
--print @body1
-- select * from tblASS_AssessEmp
EXEC msdb.dbo.sp_send_dbmail @recipients=@recipients1, @copy_recopients = @CCMail,
    @subject = @subject1,
    @body = @body1,
    @body_format = 'HTML' ;

				FETCH NEXT FROM vCurID INTO @pYear , @pNo ,@pLineMgrEmpID,@Date
			END		
	
	CLOSE vCurID
	DEALLOCATE vCurID
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_Skill]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_sendmail_Skill] 

AS

declare @recipients1 varchar(max)
declare @subject1 nvarchar(255)
declare @body1 nvarchar(max)

declare @pYear int,@pNo int,@pLineMgrEmpID int,@Date Nvarchar(15)
,@FullName nvarchar(500), @Gender bit, @GenderName nvarchar(40)
 , @CCMail nvarchar(40)
declare @AppAddress	nvarchar(500)
set @AppAddress = (select [Value] from tblLS_SystemParam where [Name] = 'AppAddress')
set @CCMail = (select [Value] from tblLS_SystemParam where [Name] = 'CCMail')
set @AppAddress = isnull(@AppAddress,'http://ServerIIS/APP/')
	DECLARE vCurID CURSOR FOR 
			select A.[Year], A.No,C.ReportToID LineMgrEmpID, convert(nvarchar(15),A.Date,106) Date
			from tblASS_Assessment A
				inner join tblASS_AssessEmp B On A.AssID = B.AssID
				inner join tblHR_AssEmpReportTo C On B.EmployeeID = C.EmployeeID
			where A.Status = 1 -- Trạng thái chưa kết thúc
				and B.EmpStatus = 0-- Trạng thái Emp chưa complete
				--and isnull(LineMgrEmpID,-1) != -1
				and C.ReportToID is not null
				and A.Date <= getdate()

			group by A.[Year], A.No, C.ReportToID,A.Date

	OPEN vCurID
	FETCH NEXT FROM vCurID INTO @pYear , @pNo ,@pLineMgrEmpID ,@Date
	WHILE @@FETCH_STATUS = 0
			BEGIN
				select @recipients1 = Email, @FullName = FirstName + ' ' + LastName
				,@Gender = GenderCode
				from tblHR_Employee where EmployeeID = @pLineMgrEmpID
if @Gender = 1
	set @GenderName = N'Mr.'
else
	set @GenderName = N'Ms.'

				
--set @recipients1 = 'tanldt@fpt.com.vn'
set @subject1 = N'Mail Remind about skill checklist from Training System'
set @body1 = N'
Dear '+isnull(@GenderName,'')+N' '+ isnull(@FullName,'') +N'
<br />
Please assess your staff'' skills in the training system with deadline at '+@Date+'
<br />
Year: '+isnull(cast(@pYear as nvarchar(40)),'')+N'
<br />
<b>Employee List:</b>

<br /><table boder="1"><tr><th>No.</th><th>Employee Master</th><th>Full Name</th></tr>'

set @body1 = @body1 +  cast(
(
	select td = ROW_NUMBER() OVER (ORDER BY isnull(E.LastName,'')),'',
			td = isnull(E.EmployeeCode,''),'',
			td = isnull(E.FirstName,'') + ' '+ isnull(E.LastName,'')
		from tblASS_Assessment A
			inner join tblASS_AssessEmp B On A.AssID = B.AssID
			inner join tblHR_Employee E on E.EmployeeID = B.EmployeeID
			inner join tblHR_AssEmpReportTo C On B.EmployeeID = C.EmployeeID
		where A.Status = 1 -- Trạng thái chưa kết thúc
			and B.EmpStatus = 0-- Trạng thái Emp chưa complete
			and C.ReportToID = @pLineMgrEmpID
			and A.[Year] = @pYear and A.No = @pNo
		order by E.LastName
	for XML PATH('tr'), TYPE
)
 as nvarchar(max))

set @body1 = @body1 +  N'</table>
<br />
<b>Link:</b> <a href="'+@AppAddress+'MASS/EmpSkillprofile.aspx"'+@AppAddress+'MASS/EmpSkillprofile.aspx</a>
<br /> Thank you '+isnull(@GenderName,'')+N'.
<br />
Training System

'
--print @body1
-- select * from tblASS_AssessEmp
EXEC msdb.dbo.sp_send_dbmail @recipients=@recipients1,@copy_recopients = @CCMail,
    @subject = @subject1, 
    @body = @body1,
    @body_format = 'HTML' ;

				FETCH NEXT FROM vCurID INTO @pYear , @pNo ,@pLineMgrEmpID
			END		
	
	CLOSE vCurID
	DEALLOCATE vCurID
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetTrHrByDeptSectionMonthYear]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetTrHrByDeptSectionMonthYear]
(
@CompanyID int,
@DeptID	int,
@SectionID int,
@Month int,
@Year int
)
RETURNS int
AS
-- PhuongDK: 25/05/2009
BEGIN

	Declare @Result int
	SET @Result = 
	(
		SELECT SumTrHr = Sum(RS.TrHr)
		FROM
		(
			select  TrHR = Sum(b.Duration)	
			from tblTR_TrainResultEmp a inner join tblTR_TrainingResult b on a.ResultID = b.ResultID
										left join vHR_Employee d on a.EmpID = d.EmployeeID
			where 1 = 1
			and d.CompanyID = @CompanyID
			and (d.DeptID = @DeptID or IsNull(@DeptID,'')='')
			and (d.SectionID = @SectionID or IsNull(@SectionID,'')='')
			and Datepart(MM,b.FromDate) = @Month
			and Datepart(yyyy,b.FromDate) = @Year
		) RS
	)
	-- select dbo.fnGetTrHrByDeptSectionMonthYear(1,1,3,4,2009)
	RETURN @Result
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetEmpNoByYTD]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetEmpNoByYTD]
(
@CompanyID int,
@Month int,
@Year int
)
RETURNS int
AS
-- PhuongDK: 25/05/2009
BEGIN
	Declare @Date datetime
	Declare @lastDate datetime	

	-- Ngay dau tien theo nam tai chinh: vd 01/10/2009
	set @Date = dbo.fnGetDateOfMonth(@Month, @Year-1, 0)
	-- Ngay cuoi cung cua thang can tinh
	set @lastDate = dbo.fnGetDateOfMonth(@Month, @Year, 1)

	Declare @Result int
	SET @Result = 
	(
			select Count(distinct a.EmpID)
			from tblTR_TrainResultEmp a inner join tblTR_TrainingResult b on a.ResultID = b.ResultID
										left join vHR_Employee d on a.EmpID = d.EmployeeID
			where 1 = 1
			and d.CompanyID = @CompanyID
			and b.FromDate between @Date and @lastDate
	)
	-- select dbo.fnGetEmpNoByYTD(1,5,2009)
	
	IF @Result = 0
	BEGIN
		SET @Result = null
	END

	RETURN @Result
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetEmpNoByMonthYear]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetEmpNoByMonthYear]
(
@CompanyID int,
@Month int,
@Year int
)
RETURNS int
AS
-- PhuongDK: 25/05/2009
BEGIN

	Declare @Result int
	SET @Result = 
	(
			select Count(a.EmpID)
			from tblTR_TrainResultEmp a inner join tblTR_TrainingResult b on a.ResultID = b.ResultID
										left join vHR_Employee d on a.EmpID = d.EmployeeID
			where 1 = 1
			and d.CompanyID = @CompanyID
			and Datepart(MM,b.FromDate) = @Month
			and Datepart(yyyy,b.FromDate) = @Year
	)
	-- select dbo.fnGetEmpNoByMonthYear(1,4,2009)
	
	IF @Result = 0
	BEGIN
		SET @Result = null
	END

	RETURN @Result
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetEmpArea]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetEmpArea]
(
	@EmployeeID	int
)
RETURNS nvarchar(2000)
AS
BEGIN
	DECLARE @Areas nvarchar(2000)
	SET 	@Areas = ''

	SELECT 	@Areas = @Areas + b.AreaName + '; '
	from tblHR_EmployeeArea a left join tblLS_Area b on a.AreaID = b.AreaID
	where a.EmployeeID = @EmployeeID

	RETURN (case when isnull(@Areas, '') = '' then '' else LEFT(@Areas, LEN(@Areas)-1) end) 
END

--  select [dbo].[fnGetEmpArea]('13')
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetDelegateID]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetDelegateID]
(
	@EmployeeID int = null
)
RETURNS nvarchar(max)
AS
BEGIN
/*
PhuongDK: 04/06/2009, lay EmpID duoc uy thac
*/
	Declare @Result nvarchar(max)
	Declare @EmpDelegateID int 	

	IF Exists(select IsNull(EmpDelegateID,-1) as EmpDelegateID 
			  from tblHR_EmpDelegateTo 
			  where dbo.fnGetDateOnly(getdate()) between dbo.fnGetDateOnly(FromDate) and dbo.fnGetDateOnly(ToDate) 
			  and EmployeeID = @EmployeeID)
	BEGIN
		select @EmpDelegateID = IsNull(EmpDelegateID,'-1')
		from tblHR_EmpDelegateTo 
		where dbo.fnGetDateOnly(getdate()) between dbo.fnGetDateOnly(FromDate) and dbo.fnGetDateOnly(ToDate) 
		and EmployeeID = @EmployeeID

		-- Neu Emp ko uy thac lai cho ai --> Pass
		IF @EmpDelegateID = '-1'
		BEGIN
			SET @Result = '-1'
		END
		ELSE
		BEGIN
			SET @Result = @EmpDelegateID
		END
	END
	ELSE
	BEGIN
		-- Neu ko co Uy thac
		SET @Result = '-2'
	END

	RETURN @Result
END

--select dbo.fnGetDelegateID(15)
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetSumaryTotal]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetSumaryTotal]
(
	@CompanyID int,
	@Year int
)
returns table
as
return	

	select  
			'zzzzzz' as DeptName,
			'1. Training Hrs' as SectionName,
			OCT = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,10,@Year-1),
			NOV = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,11,@Year-1),
			DEC = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,12,@Year-1),
			JAN = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,1,@Year),
			FEB = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,2,@Year),
			MAR = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,3,@Year),
			APR = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,4,@Year),
			MAY = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,5,@Year),
			JUN = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,6,@Year),
			JUL = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,7,@Year),
			AUG = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,8,@Year),
			SEP = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,9,@Year)
		-- Total: No of Employees
		Union all
		select 
			'zzzzzz' as DeptName,
			'2. No of Employees' as SectionName,
			OCT = dbo.fnGetEmpNoByMonthYear(@CompanyID,10,@Year-1),
			NOV = dbo.fnGetEmpNoByMonthYear(@CompanyID,11,@Year-1),
			DEC = dbo.fnGetEmpNoByMonthYear(@CompanyID,12,@Year-1),
			JAN = dbo.fnGetEmpNoByMonthYear(@CompanyID,1,@Year),
			FEB = dbo.fnGetEmpNoByMonthYear(@CompanyID,2,@Year),
			MAR = dbo.fnGetEmpNoByMonthYear(@CompanyID,3,@Year),
			APR = dbo.fnGetEmpNoByMonthYear(@CompanyID,4,@Year),
			MAY = dbo.fnGetEmpNoByMonthYear(@CompanyID,5,@Year),
			JUN = dbo.fnGetEmpNoByMonthYear(@CompanyID,6,@Year),
			JUL = dbo.fnGetEmpNoByMonthYear(@CompanyID,7,@Year),
			AUG = dbo.fnGetEmpNoByMonthYear(@CompanyID,8,@Year),
			SEP = dbo.fnGetEmpNoByMonthYear(@CompanyID,9,@Year)
		-- Total: Trhr/Employee
		Union all
		select 
			'zzzzzz' as DeptName,
			'3. Trhr/Employee' as SectionName,
			OCT = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,10,@Year-1) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,10,@Year-1) as float),2),
			NOV = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,11,@Year-1) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,11,@Year-1) as float),2),
			DEC = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,12,@Year-1) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,12,@Year-1) as float),2),
			JAN = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,1,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,1,@Year) as float),2),
			FEB = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,2,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,2,@Year) as float),2),
			MAR = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,3,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,3,@Year) as float),2),
			APR = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,4,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,4,@Year) as float),2),
			MAY = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,5,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,5,@Year) as float),2),
			JUN = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,6,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,6,@Year) as float),2),
			JUL = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,7,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,7,@Year) as float),2),
			AUG = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,8,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,8,@Year) as float),2),
			SEP = Round(cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,9,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,9,@Year) as float),2)
		-- Total: No of Employees trained
		Union all
		select 
			'zzzzzz' as DeptName,
			'4. No of Employees trained' as SectionName,
			OCT = dbo.fnGetEmpNoByYTD(@CompanyID,10,@Year-1),
			NOV = dbo.fnGetEmpNoByYTD(@CompanyID,11,@Year-1),
			DEC = dbo.fnGetEmpNoByYTD(@CompanyID,12,@Year-1),
			JAN = dbo.fnGetEmpNoByYTD(@CompanyID,1,@Year),
			FEB = dbo.fnGetEmpNoByYTD(@CompanyID,2,@Year),
			MAR = dbo.fnGetEmpNoByYTD(@CompanyID,3,@Year),
			APR = dbo.fnGetEmpNoByYTD(@CompanyID,4,@Year),
			MAY = dbo.fnGetEmpNoByYTD(@CompanyID,5,@Year),
			JUN = dbo.fnGetEmpNoByYTD(@CompanyID,6,@Year),
			JUL = dbo.fnGetEmpNoByYTD(@CompanyID,7,@Year),
			AUG = dbo.fnGetEmpNoByYTD(@CompanyID,8,@Year),
			SEP = dbo.fnGetEmpNoByYTD(@CompanyID,9,@Year)
		-- Total: Training Coverage
		Union all
		select 
			'zzzzzz' as DeptName,
			'5. Training Coverage' as SectionName,
			OCT = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,10,@Year-1) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,10,@Year-1) as float)*100),2),
			NOV = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,11,@Year-1) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,11,@Year-1) as float)*100),2),
			DEC = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,12,@Year-1) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,12,@Year-1) as float)*100),2),
			JAN = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,1,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,1,@Year) as float)*100),2),
			FEB = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,2,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,2,@Year) as float)*100),2),
			MAR = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,3,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,3,@Year) as float)*100),2),
			APR = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,4,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,4,@Year) as float)*100),2),
			MAY = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,5,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,5,@Year) as float)*100),2),
			JUN = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,6,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,6,@Year) as float)*100),2),
			JUL = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,7,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,7,@Year) as float)*100),2),
			AUG = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,8,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,8,@Year) as float)*100),2),
			SEP = Round((cast(dbo.fnGetEmpNoByYTD(@CompanyID,9,@Year) as float)/cast(dbo.fnGetEmpNoByMonthYear(@CompanyID,9,@Year) as float)*100),2)
		-- Total: Working Hrs
		Union all
		select 
			'zzzzzz' as DeptName,
			'6. Working Hrs' as SectionName,
			OCT = dbo.fnGetEmpNoByMonthYear(@CompanyID,10,@Year-1)*191,
			NOV = dbo.fnGetEmpNoByMonthYear(@CompanyID,11,@Year-1)*191,
			DEC = dbo.fnGetEmpNoByMonthYear(@CompanyID,12,@Year-1)*191,
			JAN = dbo.fnGetEmpNoByMonthYear(@CompanyID,1,@Year)*191,
			FEB = dbo.fnGetEmpNoByMonthYear(@CompanyID,2,@Year)*191,
			MAR = dbo.fnGetEmpNoByMonthYear(@CompanyID,3,@Year)*191,
			APR = dbo.fnGetEmpNoByMonthYear(@CompanyID,4,@Year)*191,
			MAY = dbo.fnGetEmpNoByMonthYear(@CompanyID,5,@Year)*191,
			JUN = dbo.fnGetEmpNoByMonthYear(@CompanyID,6,@Year)*191,
			JUL = dbo.fnGetEmpNoByMonthYear(@CompanyID,7,@Year)*191,
			AUG = dbo.fnGetEmpNoByMonthYear(@CompanyID,8,@Year)*191,
			SEP = dbo.fnGetEmpNoByMonthYear(@CompanyID,9,@Year)*191
		-- Total: Trhr/Working Hrs
		Union all
		select 
			'zzzzzz' as DeptName,
			'7. Trhr/Working Hrs' as SectionName,
			OCT = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,10,@Year-1) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,10,@Year-1)*191) as float)*100),2),
			NOV = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,11,@Year-1) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,10,@Year-1)*191) as float)*100),2),
			DEC = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,12,@Year-1) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,10,@Year-1)*191) as float)*100),2),
			JAN = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,1,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,1,@Year)*191) as float)*100),2),
			FEB = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,2,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,2,@Year)*191) as float)*100),2),
			MAR = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,3,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,3,@Year)*191) as float)*100),2),
			APR = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,4,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,4,@Year)*191) as float)*100),2),
			MAY = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,5,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,5,@Year)*191) as float)*100),2),
			JUN = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,6,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,6,@Year)*191) as float)*100),2),
			JUL = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,7,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,7,@Year)*191) as float)*100),2),
			AUG = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,8,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,8,@Year)*191) as float)*100),2),
			SEP = Round((cast(dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,null,null,9,@Year) as float)/cast((dbo.fnGetEmpNoByMonthYear(@CompanyID,9,@Year)*191) as float)*100),2)
		-- Total: % modules carried out
		Union all
		select 
			'zzzzzz' as DeptName,
			'8. % modules carried out' as SectionName,
			OCT = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,10,@Year-1),
			NOV = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,11,@Year-1),
			DEC = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,12,@Year-1),
			JAN = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,1,@Year),
			FEB = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,2,@Year),
			MAR = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,3,@Year),
			APR = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,4,@Year),
			MAY = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,5,@Year),
			JUN = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,6,@Year),
			JUL = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,7,@Year),
			AUG = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,8,@Year),
			SEP = dbo.fnGetSumaryReportModulesCarriedOut(@CompanyID,9,@Year)

-- select * from dbo.fn_GetSumaryTotal(1,2009)
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetReportToID]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetReportToID]
(
	@EmployeeID int = null
)
RETURNS nvarchar(max)
AS
BEGIN
/*
PhuongDK: 04/06/2009, lay EmpID de Approved
*/
	Declare @Result nvarchar(max)
	Declare @EmpReportToID int 	
	Declare @EmpDelegateID int 	

	IF Exists(select ReportToID from tblHR_EmpReportTo where EmployeeID = @EmployeeID)
	BEGIN
		select @EmpReportToID = ReportToID from tblHR_EmpReportTo where EmployeeID = @EmployeeID

		set @EmpDelegateID = dbo.fnGetDelegateID(@EmpReportToID)
		
		-- Neu ko co Uy thac
		if @EmpDelegateID = '-2'
		begin 
				Set @Result = convert(nvarchar,@EmpReportToID) + '@'
		end
		-- Neu Uy thac la Pass
		else if @EmpDelegateID = '-1'
		begin
                set @Result =  dbo.fnGetReportToID(@EmpReportToID)
		end
        else
		begin
                set @Result = Convert(nvarchar,@EmpReportToID) + '@' + Convert(nvarchar,@EmpDelegateID)
		end

	END
	ELSE
	BEGIN
		-- Neu da di den Emp cuoi cung, ko con Emp de Approved
		SET @Result = '@'
	END

	RETURN @Result
END

-- select dbo.fnGetReportToID(17)
-- select dbo.fnGetDelegateID(13)

-- select col1,col2 from dbo.fn_SplitTwoCol(dbo.fnGetReportToID(17),default)
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetTrainingRequestLastReview]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGetTrainingRequestLastReview] 
(
	@Activity varchar(50),
	@RequestID	int = null,
	@EmployeeID int = null
)
RETURNS nvarchar(max)
AS
BEGIN
	Declare @Result nvarchar(max)
	
	/*
	select top 1 ReviewID, RequestID, EmployeeID, RoleName, Approved, ReviewDate, Comment, ReportToID 
	from vTR_TrainingRequestReview
	where RequestID = 53
	order by ReviewID desc
	*/

IF @Activity ='ReportToID'
BEGIN
	/*
	Return:
		-1: ko tim thay Emp de ReportTo 
			(gom 2 truong hop chua set ReportTo hoac Delegate cho den khi ko co Emp nao de ReportTo)
		
	*/
		--> tam thoi ko su dung nua
	/*
	Declare @EmpReportToID int 	

	select top 1 
			@EmpReportToID = convert(nvarchar,EmployeeID)
	from vTR_TrainingRequestReview
	where RequestID = @RequestID
	order by ReviewID desc

	Set @Result = dbo.fnGetReportToID(@EmpReportToID)
	*/
	Set @Result = ''
END
ELSE IF @Activity ='StatusName'
BEGIN
	select top 1 
			@Result = (Case when IsNull(f.ReviewActionName,'')= '' then 'Request' else f.ReviewActionName + ' by ' + a.RoleName end)
	from vTR_TrainingRequestReview a left join tblLS_ReviewAction f on a.ReviewActionCode = f.ReviewActionCode
	where RequestID = @RequestID
	order by ReviewID desc
END
ELSE IF @Activity ='Comment'
BEGIN
	select top 1 
			@Result = Comment
	from vTR_TrainingRequestReview
	where RequestID = @RequestID
	order by ReviewID desc
END
--ELSE IF @Activity ='Approved'
--BEGIN
--	select top 1 
--			@Result = Approved
--	from vTR_TrainingRequestReview
--	where RequestID = @RequestID
--	order by ReviewID desc
--END
--ELSE IF @Activity ='StatusByEmpID'
--BEGIN
--	select @Result = Convert(nvarchar,Approved)
--	from vTR_TrainingRequestReview
--	where RequestID = @RequestID 
--	and	  EmployeeID = @EmployeeID
--
--END
--ELSE IF @Activity ='CommentByEmpID'
--BEGIN
--	select @Result = Comment
--	from vTR_TrainingRequestReview
--	where RequestID = @RequestID 
--	and	  EmployeeID = @EmployeeID
--END

	RETURN @Result

	-- select * from vTR_TrainingRequestReview where RequestID = 53
	-- select dbo.fnGetTrainingRequestLastReview('Comment',53)
	-- select dbo.fnGetTrainingRequestLastReview('ReportToID', 490,null) 
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmHR_Employee]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmHR_Employee]
( 
/*
Procedure: spfrmHR_Employee
Desc:
	 Procedure for table: tblHR_Employee
Author:
	 PhuongDK
Create date:
	05-03-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@EmployeeCode	nvarchar(50) = null,
@FirstName	nvarchar(500) = null,
@LastName	nvarchar(500) = null,
@GenderCode	int = null,
@DateOfBirth	nvarchar(10) = null,
@BirthPlace	nvarchar(500) = null,
@Address	nvarchar(500) = null,
@HomeAddress	nvarchar(500) = null,
@DateOfHire	nvarchar(10) = null,
@DateOfTermination	nvarchar(10) = null,
@Telephone	nvarchar(50) = null,
@Email	nvarchar(500) = null,
@Remark	nvarchar(500) = null,
@EmployeeStatusID	int = null,
@JobTitleID	int = null,
@JobLevelID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@SectionID	int = null,
@AreaID	int = null,
@CourseID 	int = null,
@InsertUserID	int = null,
@InsertDate	nvarchar(10) = null,
@UpdateUserID	int = null,
@UpdateDate	nvarchar(10) = null,
-- More
@UserID		int = null,
@GroupID		int = null,
@FullName	nvarchar(500) = null,
@EffDate	nvarchar(10) = null,
@RoleID		int = null,
@ReportToID int = null,
@AssRoleID		int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblHR_Employee where EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblHR_Employee SET
		 [EmployeeCode]  = @EmployeeCode,
		 [FirstName]  = @FirstName,
		 [LastName]  = @LastName,
		 [GenderCode]  = @GenderCode,
		 [DateOfBirth]  = Convert(datetime,@DateOfBirth,103),
		 [BirthPlace]  = @BirthPlace,
		 [Address]  = @Address,
		 [HomeAddress]  = @HomeAddress,
		 [DateOfHire]  = Convert(datetime,@DateOfHire,103),
		 [DateOfTermination]  = Convert(datetime,@DateOfTermination,103),
		 [Telephone]  = @Telephone,
		 [Email]  = @Email,
		 [Remark]  = @Remark,
		 [EmployeeStatusID]  = @EmployeeStatusID,
		 [JobTitleID]  = @JobTitleID,
		 [JobLevelID]  = @JobLevelID,
		 [CompanyID]  = @CompanyID,
		 [DeptID]  = @DeptID,
		 [SectionID]  = @SectionID,
		 [InsertUserID]  = @InsertUserID,
		 [InsertDate]  = Convert(datetime,@InsertDate,103),
		 [UpdateUserID]  = @UpdateUserID,
		 [UpdateDate]  = Convert(datetime,@UpdateDate,103)
	 WHERE
		[EmployeeID] = @EmployeeID
	END
	ELSE
	BEGIN
		 INSERT INTO tblHR_Employee ( [EmployeeCode] , [FirstName] , [LastName] , [GenderCode] , [DateOfBirth] , [BirthPlace] , [Address] , [HomeAddress] , [DateOfHire] , [DateOfTermination] , [Telephone] , [Email] , [Remark] , [EmployeeStatusID] 
, [JobTitleID] , [JobLevelID] , [CompanyID] , [DeptID] , [SectionID] , [InsertUserID] , [InsertDate] , [UpdateUserID] , [UpdateDate]  )
		 VALUES 
		( @EmployeeCode, @FirstName, @LastName, @GenderCode, Convert(datetime,@DateOfBirth,103), @BirthPlace, @Address, @HomeAddress, Convert(datetime,@DateOfHire,103), Convert(datetime,@DateOfTermination,103), @Telephone, @Email, @Remark, @EmployeeStatusID
, @JobTitleID, @JobLevelID, @CompanyID, @DeptID, @SectionID, @InsertUserID, Convert(datetime,@InsertDate,103), @UpdateUserID, Convert(datetime,@UpdateDate,103) ) 
	END
END
else IF @Activity ='SaveInfo'
BEGIN
	if (isnull(@SectionID,'') = '')
	begin
		
		set @SectionID = null
	end

	IF Exists(Select * from tblHR_Employee where [EmployeeCode]  = @EmployeeCode and EmployeeID <> @EmployeeID and [CompanyID]  = @CompanyID)
	begin
		set @ReturnMess = 'Employee Master is exist'
		return
	end
	

	IF Exists(Select * from tblHR_Employee where EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblHR_Employee SET
		 [EmployeeCode]  = @EmployeeCode,
		 [FirstName]  = @FirstName,
		 [LastName]  = @LastName,
--		 [GenderCode]  = @GenderCode,
		 [DateOfBirth]  = Convert(datetime,@DateOfBirth,103),
		 --[BirthPlace]  = @BirthPlace,
		 [Address]  = @HomeAddress,
		 [HomeAddress]  = @HomeAddress,
		 --[DateOfHire]  = Convert(datetime,@DateOfHire,103),
		 --[DateOfTermination]  = Convert(datetime,@DateOfTermination,103),
		 [Telephone]  = @Telephone,
		 [Email]  = @Email,
		 --[Remark]  = @Remark,
		 [EmployeeStatusID]  = @EmployeeStatusID,
		 [JobTitleID]  = @JobTitleID,
		 [JobLevelID]  = @JobLevelID,
		 [CompanyID]  = @CompanyID,
		 [DeptID]  = @DeptID,
		 [SectionID]  = @SectionID,
		 [InsertUserID]  = @InsertUserID,
		 [InsertDate]  = Convert(datetime,@InsertDate,103),
		 [UpdateUserID]  = @UpdateUserID,
		 [UpdateDate] = Convert(datetime,@UpdateDate,103)
	 WHERE
		[EmployeeID] = @EmployeeID
		if (isnull(@SectionID,'') = '')
		begin
			
			delete from tblHR_EmployeeArea where EmployeeID = @EmployeeID
		end
		
	END
	
END
-----Hàm SaveEmployee
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblHR_Employee where EmployeeID = @EmployeeID)
	BEGIN
	 UPDATE tblHR_Employee SET
		 [EmployeeCode]  = @EmployeeCode,
		 [FirstName]  = @FirstName,
		 [LastName]  = @LastName,
		 [GenderCode]  = @GenderCode,
		 [DateOfBirth]  = Convert(datetime,@DateOfBirth,103),
		 [BirthPlace]  = @BirthPlace,
		 [Address]  = @Address,
		 [HomeAddress]  = @HomeAddress,
		 [DateOfHire]  = Convert(datetime,@DateOfHire,103),
		 [DateOfTermination]  = Convert(datetime,@DateOfTermination,103),
		 [Telephone]  = @Telephone,
		 [Email]  = @Email,
		 [Remark]  = @Remark,
		 [EmployeeStatusID]  = @EmployeeStatusID,
		 [JobTitleID]  = @JobTitleID,
		 [JobLevelID]  = @JobLevelID,
		 [CompanyID]  = @CompanyID,
		 [DeptID]  = @DeptID,
		 [SectionID]  = @SectionID,
		 [InsertUserID]  = @InsertUserID,
		 [InsertDate]  = Convert(datetime,@InsertDate,103),
		 [UpdateUserID]  = @UpdateUserID,
		 [UpdateDate] = Convert(datetime,@UpdateDate,103)
	 WHERE
		[EmployeeID] = @EmployeeID
	END
	ELSE
	BEGIN
		 INSERT INTO tblHR_Employee ( [EmployeeCode] , [FirstName] , [LastName] , [GenderCode] , [DateOfBirth] , [BirthPlace] , [Address] , [HomeAddress] , [DateOfHire] , [DateOfTermination] , [Telephone] , [Email] , [Remark] , [EmployeeStatusID] 
, [JobTitleID]
 , [JobLevelID] , [CompanyID] , [DeptID] , [SectionID] , [InsertUserID] , [InsertDate] , [UpdateUserID] , [UpdateDate]  )
		 VALUES 
		( @EmployeeCode, @FirstName, @LastName, @GenderCode, Convert(datetime,@DateOfBirth,103), @BirthPlace, @Address, @HomeAddress, Convert(datetime,@DateOfHire,103), Convert(datetime,@DateOfTermination,103), @Telephone, @Email, @Remark, @EmployeeStatusID
, @JobTitleID, @JobLevelID, @CompanyID, @DeptID, @SectionID, @InsertUserID, Convert(datetime,@InsertDate,103), @UpdateUserID, Convert(datetime,@UpdateDate,103) ) 
	END
END
-----

ELSE IF @Activity ='Delete'
BEGIN
	 DELETE FROM tblHR_Employee
	 WHERE
		[EmployeeID] = @EmployeeID
END
ELSE IF @Activity ='UpdateStatus'
BEGIN
	 UPDATE tblHR_Employee SET
		 
		 [EmployeeStatusID]  = @EmployeeStatusID
	 WHERE
		[EmployeeID] = @EmployeeID
END
ELSE IF @Activity ='EmpArea'
BEGIN
	Select A.*, isnull(EA.EmployeeID,0) as EmployeeID
	from 
		(
		select A.* from tblLS_Area A where A.DeptID =@DeptID and isnull(A.SectionID,0) = 0
		union
		select A.* from tblLS_Area A where A.DeptID =@DeptID and A.SectionID =@SectionID
	)A
		left join tblHR_EmployeeArea EA On EA.AreaID = A.AreaID and EA.EmployeeID = @EmployeeID
	
END
ELSE IF @Activity ='SaveEmpArea'
BEGIN
	insert into tblHR_EmployeeArea (EmployeeID, AreaID)
		values (@EmployeeID, @AreaID)
END
ELSE IF @Activity ='DeleteAllEmpArea'
BEGIN
	Delete from tblHR_EmployeeArea where EmployeeID = @EmployeeID
END
ELSE IF @Activity ='EmpCourse'
BEGIN
	Select A.*, isnull(EA.EmployeeID,0) as EmployeeID
	from tblLS_Course A
		left join tblHR_EmployeeCourse EA On EA.CourseID = A.CourseID and EA.EmployeeID = @EmployeeID
	order by A.CourseName


END
ELSE IF @Activity ='SaveEmpCourse'
BEGIN
	insert into tblHR_EmployeeCourse (EmployeeID, CourseID)
		values (@EmployeeID, @CourseID)
END
ELSE IF @Activity ='DeleteAllEmpCourse'
BEGIN
	Delete from tblHR_EmployeeCourse where EmployeeID = @EmployeeID
END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			IsNull(c.DeptID, -1) as DeptID,
			c.DeptName,
			IsNull(d.SectionID, -1) as SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,
			AreaName = dbo.fnGetEmpArea(a.EmployeeID),
			'' AS SkillProfile,
			h.UserID,
			i.GroupID
	 FROM vHR_Employee a left join tblLS_Company b on a.CompanyID = b.CompanyID
						 left join tblLS_Dept	c on a.DeptID = c.DeptID
						 left join tblLS_Section d on a.SectionID = d.SectionID
						 left join tblLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join tblLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join tblLS_Status g on a.EmployeeStatusID = g.StatusID
						 left join dbo.tblSYS_User h on a.EmployeeID = h.EmployeeID
					     left join dbo.tblSYS_UserGroup i on h.UserID = i.UserID
	 WHERE
		a.[EmployeeID] = @EmployeeID

	-- spfrmHR_Employee @Activity ='GetDataByID', @EmployeeID=5
END
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
			b.CompanyName,
			c.DeptName,
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			
			b.CompanyID,
			
			c.DeptID,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,a.EmployeeStatusID,
			 u.UserID, u.sUserName, u.sPassword, u.UserDomain,ugg.GroupName ,ugg.GroupID,
			AreaName = dbo.fnGetEmpArea(a.EmployeeID),
			'' AS SkillProfile,
			'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						left join tblSYS_User u on u.EmployeeID = a.EmployeeID
						left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
			inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		AND (e.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (f.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND ([EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')
		AND (isnull(ug.GroupID,-1)  = @GroupID or isnull( @GroupID,'')='')
		-- spfrmHR_Employee @Activity ='GetData', @CompanyID=2, @DeptID=2, @UserID=1
	order by [LastName]
END

-- PhuongDK
ELSE IF @Activity ='EmpArea-GetData'
BEGIN
	 SELECT ROW_NUMBER() OVER (ORDER BY a.EmployeeID) AS STT,
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			--Ar.AreaID,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,a.EmployeeStatusID,
			 u.UserID, u.sUserName, u.sPassword, u.UserDomain,ugg.GroupName ,ugg.GroupID,
			AreaName = dbo.fnGetEmpArea(a.EmployeeID),
			'' AS SkillProfile,
			'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						 left join tblSYS_User u on u.EmployeeID = a.EmployeeID
						 left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						 left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
						 inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
						 left join (select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)) Ar on Ar.EmployeeID = a.EmployeeID
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (Ar.[AreaID]  = @AreaID or isnull( @AreaID,'')='')

		-- spfrmHR_Employee @Activity ='EmpArea-GetData', @UserID = 1, @AreaID = 7

END

ELSE IF @Activity ='GetEmpByDept'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,a.EmployeeStatusID,
			 u.UserID, u.sUserName, u.sPassword, u.UserDomain,ugg.GroupName ,ugg.GroupID,
			AreaName = dbo.fnGetEmpArea(a.EmployeeID),
			'' AS SkillProfile,
			'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						 ) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						 left join tblSYS_User u on u.EmployeeID = a.EmployeeID
						 left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						 left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
						 inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		AND (e.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (f.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND ([EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')
		AND (isnull(ug.GroupID,-1)  = @GroupID or isnull( @GroupID,'')='')
		
		-- spfrmHR_Employee @Activity ='GetEmpByDept', @CompanyID=2, @DeptID=2

END
-- End of PhuongDK


ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,
			AreaName = dbo.fnGetEmpArea(a.EmployeeID),
			'' AS SkillProfile,
			'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 -- spfrmHR_Employee @Activity ='GetDataAll'
END

/*
ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			b.CompanyID,
			b.CompanyName,
			c.DeptID,
			c.DeptName,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,a.EmployeeStatusID,
			 u.UserID, u.sUserName, u.sPassword, u.UserDomain,ugg.GroupName ,ugg.GroupID,
			'' AS AreaName,
			'' AS SkillProfile,
			'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						left join tblHR_EmployeeArea Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						left join tblSYS_User u on u.EmployeeID = a.EmployeeID
						left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
			inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull([LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (Ar.[AreaID]  = @AreaID or isnull( @AreaID,'')='')
		AND (e.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (f.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND ([EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')
		AND (isnull(ug.GroupID,-1)  = @GroupID or isnull( @GroupID,'')='')
		-- spfrmHR_Employee @Activity ='GetData', @EmployeeStatusID=''

END
*/

ELSE IF @Activity ='GetWorkingHistory'
BEGIN
	
	SELECT 
		a.WorkingHistoryID,
		EffDate  = Convert(nvarchar,a.EffDate,103),
		a.[Type],
		b.CompanyName,
		c.DeptName,
		d.SectionName,
		e.JobTitleName,
		f.JobLevelName
	FROM
		tblHR_WorkingHistory a left join vLS_Company b on a.CompanyID = b.CompanyID
							   left join vLS_Dept	c on a.DeptID = c.DeptID
							   left join vLS_Section d on a.SectionID = d.SectionID
						       left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						       left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID 

	WHERE
		a.[EmployeeID] = @EmployeeID
	Order by EffDate

	-- spfrmHR_Employee @Activity ='GetWorkingHistory', @EmployeeID = 1
END

--Lấy thông tin nhân viên
ELSE IF @Activity ='LayThongTinNhanVien'
BEGIN

	SELECT 
		ROW_NUMBER() OVER (ORDER BY a.EmployeeID) AS STT, 
		a.EmployeeID,
		a.EmployeeCode,
		a.FirstName,
		a.LastName,
		a.FirstName + ' ' + a.LastName AS FullName,
		b.CompanyName,
		c.DeptName,
		d.SectionName,
		e.JobTitleName,
		f.JobLevelName,
		a.DateOfBirth,
		a.Address,
		a.Telephone,
		g.StatusName
	FROM
		tblHR_Employee a	left join vLS_Company b on a.CompanyID = b.CompanyID
							left join vLS_Dept	c on a.DeptID = c.DeptID
							left join vLS_Section d on a.SectionID = d.SectionID
						    left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						    left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
							left join vLS_Status g on a.EmployeeStatusID = g.StatusID  
							


	-- spfrmHR_Employee @Activity ='GetWorkingHistory', @EmployeeID = 1
END


ELSE IF @Activity ='GetCertHistory'
BEGIN
	
	SELECT 
		a.CertHistoryID,
		a.CertName,
		a.CertTypeName,
		a.[Year]
	FROM
		tblHR_CertificationHistory a

	WHERE
		a.[EmployeeID] = @EmployeeID
	Order by a.[Year]

	-- spfrmHR_Employee @Activity ='GetCertHistory', @EmployeeID = 1
END

-- PhuongDK
ELSE IF @Activity ='GetListLineManager'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.FullName,
			a.Email
	 FROM vHR_Employee a inner join tblSYS_User u on u.EmployeeID = a.EmployeeID
						 left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						 left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
	 WHERE 1=1
	   AND ugg.GroupCode = 2
	   AND a.DeptID = @DeptID
	ORDER BY a.FullName

	-- spfrmHR_Employee @Activity ='GetListLineManager'
END

ELSE IF @Activity ='GetListTraining'
BEGIN
	 SELECT 
			a.EmployeeID,
			a.LastName + ', ' +a.FirstName as FullName,
			a.Email
	 FROM vHR_Employee a 
						inner join tblSYS_User u on u.EmployeeID = a.EmployeeID
						left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
	 WHERE 1=1
		AND ugg.GroupCode = 3
		-- spfrmHR_Employee @Activity ='GetListTraining'
	order by a.LastName
END

ELSE IF @Activity ='GetDataReportTo'
BEGIN
	 SELECT 
			b.CompanyName,
			c.DeptName,
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			
			b.CompanyID,
			
			c.DeptID,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,a.EmployeeStatusID,
			 u.UserID, u.sUserName, u.sPassword, u.UserDomain,ugg.GroupName ,ugg.GroupID,
			AreaName = dbo.fnGetEmpArea(a.EmployeeID),
			'' AS SkillProfile,
			'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL,
			rt.RoleID,
			rt.ReportToID,
			k.FullName as ReportToName
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						 ) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						 left join tblSYS_User u on u.EmployeeID = a.EmployeeID
						 left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						 left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
						 left join tblHR_EmpReportTo rt on a.EmployeeID = rt.EmployeeID
						 left join vHR_Employee k on rt.ReportToID = k.EmployeeID
			inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull(a.[LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		AND (e.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (f.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND (a.[EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')

		AND	(IsNull(rt.RoleID,'') = @RoleID or @RoleID=-1)
		AND	(IsNull(rt.ReportToID,'') = @ReportToID or @ReportToID=-1)

		-- spfrmHR_Employee @Activity ='GetDataReportTo', @UserID=2, @RoleID=-1, @
	order by [LastName]
END

ELSE IF @Activity ='GetDataReportToFlow'
BEGIN
	 select a.EmployeeID,
			a.FullName As Level1, 
			a.EmployeeCode,
			bb.CompanyName,
			cc.DeptName,
			dd.SectionName,

			case when b2.RoleID = 2 then b1.FullName else null end  As Level2
			,case when b2.RoleID = 3 then b1.FullName else 
					case when c2.RoleID = 3 then c1.FullName else 
						case when d2.RoleID = 3 then d1.FullName else 
							case when e2.RoleID = 3 then e1.FullName else null end 
						end 
					end 
				 end  As Level3
			,case when b2.RoleID = 4 then b1.FullName else 
				case when c2.RoleID = 4 then c1.FullName else 
					case when d2.RoleID = 4 then d1.FullName else 
						case when e2.RoleID = 4 then e1.FullName else null end
					end
				end 
				
			 end  As Level4

			,case when b2.RoleID = 5 then b1.FullName else 
				case when c2.RoleID = 5 then c1.FullName else 
					case when d2.RoleID = 5 then d1.FullName else 
						case when e2.RoleID = 5 then e1.FullName else null end
					end
				end 
				
			 end  As Level5

from vHR_Employee a 
					left join tblHR_EmpReportTo b on a.EmployeeID = b.EmployeeID

					left join vHR_Employee b1 on b.ReportToID = b1.EmployeeID
					left join tblHR_EmpReportTo b2 on b.ReportToID = b2.EmployeeID

					left join tblHR_EmpReportTo c on b.ReportToID = c.EmployeeID-- and c.RoleID = 3
					left join vHR_Employee c1 on c.ReportToID = c1.EmployeeID
					left join tblHR_EmpReportTo c2 on c.ReportToID = c2.EmployeeID

					left join tblHR_EmpReportTo d on c.ReportToID = d.EmployeeID --and d.RoleID = 4
					left join vHR_Employee d1 on d.ReportToID = d1.EmployeeID
					left join tblHR_EmpReportTo d2 on d.ReportToID = d2.EmployeeID

					left join tblHR_EmpReportTo e on d.ReportToID = e.EmployeeID --and e.RoleID = 4
					left join vHR_Employee e1 on e.ReportToID = e1.EmployeeID
					left join tblHR_EmpReportTo e2 on e.ReportToID = e2.EmployeeID
	--------------------------------------------------------------------------
	 left join vLS_Company bb on a.CompanyID = bb.CompanyID
	 left join vLS_Dept	cc on a.DeptID = cc.DeptID
	 left join vLS_Section dd on a.SectionID = dd.SectionID
	 left join (
		select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
	 ) Ar on Ar.EmployeeID = a.EmployeeID
	 left join vLS_JobTitle ee on a.JobTitleID = ee.JobTitleID
	 left join vLS_JobLevel ff on a.JobLevelID = ff.JobLevelID
	 left join vLS_Status gg on a.EmployeeStatusID = gg.StatusID
	 left join tblSYS_User uu on uu.EmployeeID = a.EmployeeID
	 left join tblSYS_UserGroup ug on ug.UserID = uu.UserID
	 left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
	 inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull(a.[LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (bb.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (cc.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (dd.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		AND (ee.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (ff.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND (a.[EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')

		 -- spfrmHR_Employee @Activity ='GetDataReportToFlow', @UserID=2
	order by a.[LastName]
END

-- ASSESSMENT REPORT TO
ELSE IF @Activity ='GetDataAssReportTo'
BEGIN
	 SELECT 
			b.CompanyName,
			c.DeptName,
			a.EmployeeID,
			a.EmployeeCode,
			a.FirstName,
			a.LastName,
			a.FullName,
			a.GenderCode,
			a.DateOfBirth,
			a.BirthPlace,
			a.Address,
			a.HomeAddress,
			a.DateOfHire,
			a.DateOfTermination,
			a.Telephone,
			a.Email,
			a.Remark,
			a.EmployeeStatusID,
			a.InsertUserID,
			a.InsertDate,
			a.UpdateUserID,
			a.UpdateDate,
			
			b.CompanyID,
			
			c.DeptID,
			d.SectionID,
			d.SectionName,
			e.JobTitleID,
			e.JobTitleName,
			f.JobLevelID,
			f.JobLevelName,
			g.StatusName,a.EmployeeStatusID,
			 u.UserID, u.sUserName, u.sPassword, u.UserDomain,ugg.GroupName ,ugg.GroupID,
			--AreaName = dbo.fnGetEmpArea(a.EmployeeID),
			--'' AS SkillProfile,
			--'EmpInfo.aspx?ID=' + convert(nvarchar,(a.EmployeeID)) as URL,
			rt.AssRoleID,
			rt.ReportToID,
			k.FullName as ReportToName
	 FROM vHR_Employee a left join vLS_Company b on a.CompanyID = b.CompanyID
						 left join vLS_Dept	c on a.DeptID = c.DeptID
						 left join vLS_Section d on a.SectionID = d.SectionID
						 left join (
							select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
						 ) Ar on Ar.EmployeeID = a.EmployeeID
						 left join vLS_JobTitle e on a.JobTitleID = e.JobTitleID
						 left join vLS_JobLevel f on a.JobLevelID = f.JobLevelID
						 left join vLS_Status g on a.EmployeeStatusID = g.StatusID
						 left join tblSYS_User u on u.EmployeeID = a.EmployeeID
						 left join tblSYS_UserGroup ug on ug.UserID = u.UserID
						 left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
						 left join tblHR_AssEmpReportTo rt on a.EmployeeID = rt.EmployeeID
						 left join vHR_Employee k on rt.ReportToID = k.EmployeeID
			inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull(a.[LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (b.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (c.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (d.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		AND (e.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (f.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND (a.[EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')

		AND	(IsNull(rt.AssRoleID,'') = @AssRoleID or @AssRoleID=-1)
		AND	(IsNull(rt.ReportToID,'') = @ReportToID or @ReportToID=-1)

		-- spfrmHR_Employee @Activity ='GetAssDataReportTo', @UserID=2, @AssRoleID=-1
	order by [LastName]
END

ELSE IF @Activity ='GetDataAssReportToFlow'
BEGIN
	 select a.EmployeeID,
			a.FullName As Level1, 
			a.EmployeeCode,
			bb.CompanyName,
			cc.DeptName,
			dd.SectionName,

			case when b2.AssRoleID = 2 then b1.FullName else null end  As Level2
			,case when b2.AssRoleID = 3 then b1.FullName else 
					case when c2.AssRoleID = 3 then c1.FullName else 
						case when d2.AssRoleID = 3 then d1.FullName else 
							case when e2.AssRoleID = 3 then e1.FullName else null end 
						end 
					end 
				 end  As Level3
			,case when b2.AssRoleID = 4 then b1.FullName else 
				case when c2.AssRoleID = 4 then c1.FullName else 
					case when d2.AssRoleID = 4 then d1.FullName else 
						case when e2.AssRoleID = 4 then e1.FullName else null end
					end
				end 
				
			 end  As Level4

			,case when b2.AssRoleID = 5 then b1.FullName else 
				case when c2.AssRoleID = 5 then c1.FullName else 
					case when d2.AssRoleID = 5 then d1.FullName else 
						case when e2.AssRoleID = 5 then e1.FullName else null end
					end
				end 
				
			 end  As Level5

from vHR_Employee a 
					left join tblHR_AssEmpReportTo b on a.EmployeeID = b.EmployeeID

					left join vHR_Employee b1 on b.ReportToID = b1.EmployeeID
					left join tblHR_AssEmpReportTo b2 on b.ReportToID = b2.EmployeeID

					left join tblHR_AssEmpReportTo c on b.ReportToID = c.EmployeeID-- and c.RoleID = 3
					left join vHR_Employee c1 on c.ReportToID = c1.EmployeeID
					left join tblHR_AssEmpReportTo c2 on c.ReportToID = c2.EmployeeID

					left join tblHR_AssEmpReportTo d on c.ReportToID = d.EmployeeID --and d.RoleID = 4
					left join vHR_Employee d1 on d.ReportToID = d1.EmployeeID
					left join tblHR_AssEmpReportTo d2 on d.ReportToID = d2.EmployeeID

					left join tblHR_AssEmpReportTo e on d.ReportToID = e.EmployeeID --and e.RoleID = 4
					left join vHR_Employee e1 on e.ReportToID = e1.EmployeeID
					left join tblHR_AssEmpReportTo e2 on e.ReportToID = e2.EmployeeID
	--------------------------------------------------------------------------
	 left join vLS_Company bb on a.CompanyID = bb.CompanyID
	 left join vLS_Dept	cc on a.DeptID = cc.DeptID
	 left join vLS_Section dd on a.SectionID = dd.SectionID
	 left join (
		select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
	 ) Ar on Ar.EmployeeID = a.EmployeeID
	 left join vLS_JobTitle ee on a.JobTitleID = ee.JobTitleID
	 left join vLS_JobLevel ff on a.JobLevelID = ff.JobLevelID
	 left join vLS_Status gg on a.EmployeeStatusID = gg.StatusID
	 left join tblSYS_User uu on uu.EmployeeID = a.EmployeeID
	 left join tblSYS_UserGroup ug on ug.UserID = uu.UserID
	 left join tblSYS_Group ugg on ugg.GroupID = ug.GroupID
	 inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(a.[EmployeeCode],'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(a.[FirstName],'') + ' ' + IsNull(a.[LastName],'') like N'%' + Isnull(@FullName,'') + '%')
		AND (bb.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
		AND (cc.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
		AND (dd.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
		AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
		AND (ee.[JobTitleID]  = @JobTitleID or isnull( @JobTitleID,'')='')
		AND (ff.[JobLevelID]  = @JobLevelID or isnull( @JobLevelID,'')='')
		AND (a.[EmployeeStatusID]  = @EmployeeStatusID or isnull( @EmployeeStatusID,'')='')

		 -- spfrmHR_Employee @Activity ='GetDataReportToFlow', @UserID=2
	order by a.[LastName]
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_LearningEvaluationEmp]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored procedure
-- Stored procedure
CREATE PROCEDURE [dbo].[sp_sendmail_LearningEvaluationEmp] 
AS

declare @recipients1 varchar(max)
declare @subject1 nvarchar(255)
declare @body1 nvarchar(max)

declare @EmployeeCode	nvarchar(50)
declare @FullName	nvarchar(500)
declare @CompanyName	nvarchar(500)
declare @DeptName	nvarchar(500)
declare @CourseName	nvarchar(500)
declare @Year	nvarchar(500)
declare @FromDate	nvarchar(500)
declare @ToDate	nvarchar(500)
declare @Email	nvarchar(500)
-----
declare @AppAddress	nvarchar(500) , @CCMail nvarchar(40)
set @AppAddress = (select [Value] from tblLS_SystemParam where [Name] = 'AppAddress')
set @CCMail = (select [Value] from tblLS_SystemParam where [Name] = 'CCMail')

declare curResult CURSOR FOR 
	select a.EmployeeCode, a.FullName, a.CompanyName, a.DeptName, a.[Year], a.CourseName, a.FromDate, a.ToDate, a.Email
	from vTR_TrainingResultEmp a inner join tblMail_LearningEvaluation b 
								 on a.ResultID = b.ResultID and a.EmployeeID = b.EmployeeID

OPEN curResult

FETCH NEXT FROM curResult 
INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @FromDate, @ToDate, @Email

WHILE @@FETCH_STATUS = 0
BEGIN
	----------------------------------------------------------------------------------------------------
	set @recipients1 = /*'phuongdk@fpt.com.vn'*/ @Email
	set @subject1 = N'LEARNING EVALUATION REMIND'
	set @body1 = N'
	Employee Code: ' + @EmployeeCode + '
	<br />Leagal Name: ' + @FullName + '
	<br />Company: ' + @CompanyName + '
	<br />Department: ' + @DeptName + '
	<br />Year: ' + @Year + '
	<br />Course Name: ' + @CourseName + '
	<br />Date: ' + @FromDate + ' - ' + @ToDate + '
	<br /><a href=''' + @AppAddress + 'MTR/LearnEvalManagement.aspx''>Link here...</a>'

	IF IsNull(@recipients1,'') <> ''
	BEGIN

		EXEC msdb.dbo.sp_send_dbmail @recipients=@recipients1, @copy_recopients = @CCMail,
									 @subject = @subject1,
									 @body = @body1,
									 @body_format = 'HTML' ;
	END
	----------------------------------------------------------------------------------------------------
	FETCH NEXT FROM curResult 
	INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @FromDate, @ToDate, @Email


END

CLOSE curResult
DEALLOCATE curResult

-- sp_sendmail_LearningEvaluation @ResultID = 41
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_LearningEvaluation]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored procedure
CREATE PROCEDURE [dbo].[sp_sendmail_LearningEvaluation] 
(
	@ResultID	int = null
)
AS

declare @recipients1 varchar(max)
declare @subject1 nvarchar(255)
declare @body1 nvarchar(max)

declare @EmployeeCode	nvarchar(50)
declare @FullName	nvarchar(500)
declare @CompanyName	nvarchar(500)
declare @DeptName	nvarchar(500)
declare @CourseName	nvarchar(500)
declare @Year	nvarchar(500)
declare @FromDate	nvarchar(500)
declare @ToDate	nvarchar(500)
declare @Email	nvarchar(500)
-----
declare @AppAddress	nvarchar(500) , @CCMail nvarchar(40)
set @AppAddress = (select [Value] from tblLS_SystemParam where [Name] = 'AppAddress')
set @CCMail = (select [Value] from tblLS_SystemParam where [Name] = 'CCMail')


declare curResult CURSOR FOR 
	select EmployeeCode, FullName, CompanyName, DeptName, [Year], CourseName, FromDate, ToDate, Email
	from vTR_TrainingResultEmp
	where ResultID = @ResultID
	and LearningEval = 1

OPEN curResult

FETCH NEXT FROM curResult 
INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @FromDate, @ToDate, @Email

WHILE @@FETCH_STATUS = 0
BEGIN
	----------------------------------------------------------------------------------------------------
	set @recipients1 = @Email
	--set @recipients1 = (select Email from vHR_Employee where EmployeeCode = (select [Value] from tblLS_SystemParam where [Name] = 'TrainingManager'))
	set @subject1 = N'LEARNING EVALUATION REMIND'
	set @body1 = N'
	Employee Code: ' + @EmployeeCode + '
	<br />Leagal Name: ' + @FullName + '
	<br />Company: ' + @CompanyName + '
	<br />Department: ' + @DeptName + '
	<br />Year: ' + @Year + '
	<br />Course Name: ' + @CourseName + '
	<br />Date: ' + @FromDate + ' - ' + @ToDate + '
	<br /><a href=''' + @AppAddress + 'MTR/LearnEvalManagement.aspx''>Link here...</a>'

	IF IsNull(@recipients1,'') <> ''
	BEGIN

		EXEC msdb.dbo.sp_send_dbmail @recipients=@recipients1, @copy_recopients = @CCMail,
									 @subject = @subject1,
									 @body = @body1,
									 @body_format = 'HTML' ;
	END
	----------------------------------------------------------------------------------------------------
	FETCH NEXT FROM curResult 
	INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @FromDate, @ToDate, @Email


END

CLOSE curResult
DEALLOCATE curResult

-- sp_sendmail_LearningEvaluation @ResultID = 41
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_BusImpEvalRemind_Daily]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored procedure
CREATE PROCEDURE [dbo].[sp_sendmail_BusImpEvalRemind_Daily]
AS

declare @recipients1 varchar(max)
declare @subject1 nvarchar(255)
declare @body1 nvarchar(max)

declare @EmployeeCode	nvarchar(50)
declare @FullName	nvarchar(500)
declare @CompanyName	nvarchar(500)
declare @DeptName	nvarchar(500)
declare @CourseName	nvarchar(500)
declare @Year	nvarchar(500)
declare @FromDate	nvarchar(500)
declare @ToDate	nvarchar(500)
declare @Email	nvarchar(500)
-----
declare @AppAddress	nvarchar(500) , @CCMail nvarchar(40)
set @AppAddress = (select [Value] from tblLS_SystemParam where [Name] = 'AppAddress')
set @CCMail = (select [Value] from tblLS_SystemParam where [Name] = 'CCMail')

declare curResult CURSOR FOR 
	select a.EmployeeCode, a.FullName, a.CompanyName, a.DeptName, a.[Year], a.CourseName, a.FromDate, a.ToDate,
		   Email = (select email from tblHR_Employee where EmployeeID = a.LineManager)
	from vTR_TrainingResultEmp a inner join tblMail_BusImpEvaluation_Daily b 
								 on a.ResultID = b.ResultID and a.EmployeeID = b.EmployeeID
	where 1=1
	and	convert(nvarchar,b.EffDate,103) = convert(nvarchar,getdate(),103)

OPEN curResult

FETCH NEXT FROM curResult 
INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @FromDate, @ToDate, @Email

WHILE @@FETCH_STATUS = 0
BEGIN
	----------------------------------------------------------------------------------------------------
	set @recipients1 = /*'phuongdk@fpt.com.vn'*/ @Email
	set @subject1 = N'BUSINESS IMPACT EVALUATION REMIND'
	set @body1 = N'
	Employee Code: ' + @EmployeeCode + '
	<br />Leagal Name: ' + @FullName + '
	<br />Company: ' + @CompanyName + '
	<br />Department: ' + @DeptName + '
	<br />Year: ' + @Year + '
	<br />Course Name: ' + @CourseName + '
	<br />Date: ' + @FromDate + ' - ' + @ToDate + '
	<br /><a href=''' + @AppAddress + 'MTR/BusImpEvalManagement.aspx''>Link here...</a>'

	IF IsNull(@recipients1,'') <> ''
	BEGIN

		EXEC msdb.dbo.sp_send_dbmail @recipients=@recipients1, @copy_recopients = @CCMail,
									 @subject = @subject1,
									 @body = @body1,
									 @body_format = 'HTML' ;
	END
	----------------------------------------------------------------------------------------------------
	FETCH NEXT FROM curResult 
	INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @FromDate, @ToDate, @Email


END

CLOSE curResult
DEALLOCATE curResult
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_BusImpEvalRemind_6Month]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored procedure
CREATE PROCEDURE [dbo].[sp_sendmail_BusImpEvalRemind_6Month] 
AS

declare @recipients1 varchar(max)
declare @subject1 nvarchar(255)
declare @body1 nvarchar(max)

declare @EmployeeCode	nvarchar(50)
declare @FullName	nvarchar(500)
declare @CompanyName	nvarchar(500)
declare @DeptName	nvarchar(500)
declare @CourseName	nvarchar(500)
declare @Year	nvarchar(500)
declare @FromDate	nvarchar(500)
declare @ToDate	nvarchar(500)
declare @Email	nvarchar(500)
-----
declare @AppAddress	nvarchar(500) , @CCMail nvarchar(40)
set @AppAddress = (select [Value] from tblLS_SystemParam where [Name] = 'AppAddress')
set @CCMail = (select [Value] from tblLS_SystemParam where [Name] = 'CCMail')

declare curResult CURSOR FOR 
	select a.EmployeeCode, a.FullName, a.CompanyName, a.DeptName, a.[Year], a.CourseName, a.FromDate, a.ToDate,
		   Email = (select email from tblHR_Employee where EmployeeID = a.LineManager)
	from vTR_TrainingResultEmp a inner join tblMail_BusImpEvaluation_6Month b 
								 on a.ResultID = b.ResultID and a.EmployeeID = b.EmployeeID
	where 1=1
	and	convert(nvarchar,b.EffDate,103) = convert(nvarchar,getdate(),103)

OPEN curResult

FETCH NEXT FROM curResult 
INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @FromDate, @ToDate, @Email

WHILE @@FETCH_STATUS = 0
BEGIN
	----------------------------------------------------------------------------------------------------
	set @recipients1 = /*'phuongdk@fpt.com.vn'*/ @Email
	set @subject1 = N'BUSINESS IMPACT EVALUATION REMIND'
	set @body1 = N'
	Employee Code: ' + @EmployeeCode + '
	<br />Leagal Name: ' + @FullName + '
	<br />Company: ' + @CompanyName + '
	<br />Department: ' + @DeptName + '
	<br />Year: ' + @Year + '
	<br />Course Name: ' + @CourseName + '
	<br />Date: ' + @FromDate + ' - ' + @ToDate + '
	<br /><a href=''' + @AppAddress + 'MTR/BusImpEvalManagement.aspx''>Link here...</a>'

	IF IsNull(@recipients1,'') <> ''
	BEGIN

		EXEC msdb.dbo.sp_send_dbmail @recipients=@recipients1, @copy_recopients = @CCMail,
									 @subject = @subject1,
									 @body = @body1,
									 @body_format = 'HTML' ;
	END
	----------------------------------------------------------------------------------------------------
	FETCH NEXT FROM curResult 
	INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @FromDate, @ToDate, @Email


END

CLOSE curResult
DEALLOCATE curResult

-- INSRET TO Daily Remind
INSERT INTO tblMail_BusImpEvaluation_Daily([ResultID],[EmployeeID],[EffDate])
SELECT [ResultID],[EmployeeID], GetDate() +  convert(int, (select [value] from tblLS_SystemParam where [Name]='BusImpDailyRemind'))
From tblMail_BusImpEvaluation_6Month
where 1=1
and	convert(nvarchar,EffDate,103) = convert(nvarchar,getdate(),103)

-- Delete after sent 6 month
Delete from tblMail_BusImpEvaluation_6Month
where 1=1
and	convert(nvarchar,EffDate,103) = convert(nvarchar,getdate(),103)

-- exec sp_sendmail_BusImpEvalRemind_6Month
GO
/****** Object:  StoredProcedure [dbo].[sp_sendmail_TrainingRequest]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored procedure
CREATE PROCEDURE [dbo].[sp_sendmail_TrainingRequest] 
(
	@RequestID	int = null,
	@CurEmployeeID	int = null
)
AS

declare @recipientsMail varchar(max)
declare @recipientsName nvarchar(max)
declare @subject1 nvarchar(255)
declare @body1 nvarchar(max)

declare @EmployeeCode	nvarchar(50)
declare @FullName	nvarchar(500)
declare @CompanyName	nvarchar(500)
declare @DeptName	nvarchar(500)
declare @Year	nvarchar(500)
declare @CourseName	nvarchar(500)
declare @Reason	nvarchar(500)
declare @StatusName	nvarchar(500)

-----
declare @AppAddress	nvarchar(500) , @CCMail nvarchar(40)
set @AppAddress = (select [Value] from tblLS_SystemParam where [Name] = 'AppAddress')
set @CCMail = (select [Value] from tblLS_SystemParam where [Name] = 'CCMail')

declare curRequest CURSOR FOR 
	select EmployeeCode, FullName, CompanyName, DeptName, [Year], CourseName, Reason,
		   StatusName = dbo.fnGetTrainingRequestLastReview('StatusName',RequestID,null)
	from vTR_TrainingRequest 
	where RequestID = @RequestID

OPEN curRequest

FETCH NEXT FROM curRequest 
INTO @EmployeeCode, @FullName, @CompanyName, @DeptName, @Year, @CourseName, @Reason, @StatusName

CLOSE curRequest
DEALLOCATE curRequest

Select @recipientsMail = b.Email,
	   @recipientsName = b.FullName
from vHR_Employee b
where b.EmployeeID = @CurEmployeeID

set @subject1 = N'New Training Request'
set @body1 = N'
Dear ' + @recipientsName + '
<br />Please review for Training Request below
<br /><br />
Employee Code: ' + @EmployeeCode + '
<br />Leagal Name: ' + @FullName + '
<br />Company: ' + @CompanyName + '
<br />Department: ' + @DeptName + '
<br />Year: ' + @Year + '
<br />Course Name: ' + @CourseName + '
<br />Reason: ' + @Reason + '
<br />Status: ' + @StatusName + '
<br /><br /><a href=''' + @AppAddress + 'MTR/TrainingRequestManagement.aspx''>Link here...</a>'

IF IsNull(@recipientsMail,'') <> ''
BEGIN
	 --print @body1
	--INSERT INTO zTest(TestDate, TestData) VALUES (getdate(), @body1)

	EXEC msdb.dbo.sp_send_dbmail @recipients=@recipientsMail, @copy_recopients = @CCMail,
								 @subject = @subject1,
								 @body = @body1,
								 @body_format = 'HTML' ;
END


 -- sp_sendmail_TrainingRequest @RequestID = 39, @CurEmployeeID=1597
GO
/****** Object:  StoredProcedure [dbo].[spfrmRPT_SumaryReport_PhuongDK]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmRPT_SumaryReport_PhuongDK]
/*
Procedure: spfrmRPT_SumaryReport
Desc:
	 
Author:
	 QuanBM
Create date:
	25/05/2009
History:
	...
*/
(
	@Year int = null,
	@CompanyID int = null
)
AS
BEGIN
	
SELECT
	DeptName = (Case when RS.DeptName = 'zzzzzz' then 'Total ' + (Select CompanyName from tblLS_Company where CompanyID = @CompanyID) else RS.DeptName end),
	RS.SectionName,
	RS.OCT,
	RS.NOV,
	RS.DEC,
	RS.JAN,
	RS.FEB,
	RS.MAR,
	RS.APR,
	RS.MAY,
	RS.JUN,
	RS.JUL,
	RS.AUG,
	RS.SEP,
	YTD = (IsNull(RS.OCT,0)+IsNull(RS.NOV,0)+IsNull(RS.DEC,0)+IsNull(RS.JAN,0)+IsNull(RS.FEB,0)+IsNull(RS.MAR,0)+IsNull(RS.APR,0)+IsNull(RS.MAY,0)+IsNull(RS.JUN,0)+IsNull(RS.JUL,0)+IsNull(RS.AUG,0)+IsNull(RS.SEP,0))
FROM
(
	 select distinct 
			e.DeptName,
			ISNULL(f.SectionName,'No name') AS SectionName,
			OCT = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,10,@Year-1),
			NOV = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,11,@Year-1),
			DEC = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,12,@Year-1),
			JAN = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,1,@Year),
			FEB = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,2,@Year),
			MAR = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,3,@Year),
			APR = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,4,@Year),
			MAY = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,5,@Year),
			JUN = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,6,@Year),
			JUL = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,7,@Year),
			AUG = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,8,@Year),
			SEP = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,f.SectionID,9,@Year)
					
		from tblTR_TrainResultEmp a inner join tblTR_TrainingResult b on a.ResultID = b.ResultID
								left join tblTR_TrainingPlan c on b.PlanID = c.PlanID
								left join vHR_Employee d on a.EmpID = d.EmployeeID
								left join tblLS_Dept e on d.DeptID = e.DeptID
								left join tblLS_Section f on d.SectionID = f.SectionID
		where 1 = 1
		and c.CompanyID = @CompanyID
		and b.FromDate between Convert(datetime,'01/10/' + convert(nvarchar,@year-1),103) and Convert(datetime,'30/09/' + convert(nvarchar,@year),103)
		
		-- Sum by Dept
		Union all
		select distinct 
			e.DeptName,
			'' AS SectionName,
			OCT = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,10,@Year-1),
			NOV = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,11,@Year-1),
			DEC = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,12,@Year-1),
			JAN = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,1,@Year),
			FEB = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,2,@Year),
			MAR = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,3,@Year),
			APR = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,4,@Year),
			MAY = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,5,@Year),
			JUN = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,6,@Year),
			JUL = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,7,@Year),
			AUG = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,8,@Year),
			SEP = dbo.fnGetTrHrByDeptSectionMonthYear(@CompanyID,e.DeptID,null,9,@Year)
					
		from tblTR_TrainResultEmp a inner join tblTR_TrainingResult b on a.ResultID = b.ResultID
								left join tblTR_TrainingPlan c on b.PlanID = c.PlanID
								left join vHR_Employee d on a.EmpID = d.EmployeeID
								left join tblLS_Dept e on d.DeptID = e.DeptID
		where 1 = 1
		and c.CompanyID = @CompanyID
		and b.FromDate between Convert(datetime,'01/10/' + convert(nvarchar,@year-1),103) and Convert(datetime,'30/09/' + convert(nvarchar,@year),103)

		-- Total by Company
		Union all
		select DeptName, SectionName,
			   OCT, NOV, DEC, JAN, FEB, MAR, APR, MAY, JUN, JUL, AUG, SEP
		from dbo.fn_GetSumaryTotal(1,2009)
					

) RS

ORDER BY RS.DeptName, RS.SectionName

		-- spfrmRPT_SumaryReport @Year=2009, @CompanyID = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_TrainingResult]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmTR_TrainingResult]
( 
/*
Procedure: spfrmTR_TrainingResult
Desc:
	 Procedure for table: tblTR_TrainingResult
Author:
	 PhuongDK
Create date:
	06-04-2009
History:
	...
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@ResultID	int = null out,
@CourseDesc	nvarchar(500) = null,
@FromDate	nvarchar(10) = null,
@ToDate	nvarchar(10) = null,
@Duration	int = null,
@Method	char(18) = null,
@CertName	nvarchar(500) = null,
@CertEffDate	nvarchar(10) = null,
@CertExpDate	nvarchar(10) = null,
@PlanID	int = null,
@ProviderID	int = null,
@TeacherID	int = null,
@StatusID	int = null,
@ReasonID	int = null,
@EmployeeID int = null,
@ReactionEval	nvarchar(500) = null,
@IsNoOfPart int = null,
-- More
@ListAccountCode nvarchar(2000) = null,
@ListActualCost nvarchar(2000) = null,

@ListEmp nvarchar(2000) = null,
@ListEmpCert nvarchar(2000) = null,
@ListEmpContractedBy nvarchar(2000) = null,
@ListEmpCost nvarchar(2000) = null,
@ListEmpNotes nvarchar(2000) = null,
@ListEmpLineManager nvarchar(2000) = null,

@ListDept nvarchar(2000) = null,
@ListDeptQuantity nvarchar(2000) = null,
@TrainLocation	nvarchar(50) = null,
@Year	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@SectionID	int = null,
@AreaID	int = null,
@CourseID	int = null,
@LearningEvalStatus nvarchar(10) = null,
@UserID	int = null
) 
AS
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblTR_TrainingResult where ResultID = @ResultID)
	BEGIN
	 UPDATE tblTR_TrainingResult SET
		 [CourseDesc]  = @CourseDesc,
		 [FromDate]  = Convert(datetime,@FromDate,103),
		 [ToDate]  = Convert(datetime,@ToDate,103),
		 [Duration]  = @Duration,
		 [Method]  = @Method,
		 [CertName]  = @CertName,
		 [CertEffDate]  = Convert(datetime,@CertEffDate,103),
		 [CertExpDate]  = Convert(datetime,@CertExpDate,103),
		 [PlanID]  = @PlanID,
		 [ProviderID]  = @ProviderID,
		 [TeacherID]  = @TeacherID,
		 [IsNoOfPart] = @IsNoOfPart, TrainLocation = @TrainLocation
	 WHERE
		[ResultID] = @ResultID

		-- Budget
		DELETE FROM tblTR_TrainResultCost WHERE ResultID = @ResultID
		
		IF @ListAccountCode <> ''
		BEGIN
			INSERT INTO tblTR_TrainResultCost([ResultID], [ActualCost], [AccountCodeID])
			SELECT @ResultID, a.listValue, b.listValue 
			FROM GetTableFromList(@ListActualCost, DEFAULT) a, GetTableFromList(@ListAccountCode, DEFAULT) b
			WHERE a.listNo = b.listNo
		END
		
		-- Emp
		DELETE FROM tblTR_TrainResultEmp  WHERE ResultID = @ResultID
		DELETE FROM tblTR_TrainResultDept WHERE ResultID = @ResultID

		IF @ListEmp <> ''
		BEGIN
			INSERT INTO tblTR_TrainResultEmp([ResultID],[ResultFail],[EndLearningContract],[TrainingCost],[Notes],[EmpID], [LineManager])
			SELECT @ResultID, b.listValue, Case c.listValue when '' then null else Convert(datetime,c.listValue,103) END as EndLearningContract,
				   d.listValue, e.listValue, a.listValue, f.listValue
			FROM   GetTableFromList(@ListEmp, DEFAULT) a, 
				   GetTableFromList(@ListEmpCert, DEFAULT) b,
				   GetTableFromList(@ListEmpContractedBy, DEFAULT) c,
				   GetTableFromList(@ListEmpCost, DEFAULT) d,
				   GetTableFromList(@ListEmpNotes, DEFAULT) e,
				   GetTableFromList(@ListEmpLineManager, DEFAULT) f
			WHERE a.listNo = b.listNo
			  AND a.listNo = c.listNo
			  AND a.listNo = d.listNo
			  AND a.listNo = e.listNo
			  AND a.listNo = f.listNo
		END

		IF @ListDept <> ''
		BEGIN
			INSERT INTO tblTR_TrainResultDept([ResultID],[Quantity],[DeptID])
			SELECT @ResultID, a.listValue, b.listValue 
			FROM GetTableFromList(@ListDeptQuantity, DEFAULT) a, GetTableFromList(@ListDept, DEFAULT) b
			WHERE a.listNo = b.listNo
		END

		-- Update Plan Status
		UPDATE tblTR_TrainingPlan
		SET StatusID = @StatusID, ReasonID = @ReasonID
		WHERE PlanID = @PlanID

	END
	ELSE IF not Exists (Select * from tblTR_TrainingResult where PlanID = @PlanID)
	BEGIN
		
		 INSERT INTO tblTR_TrainingResult ( [CourseDesc] , [FromDate] , [ToDate] , [Duration] , [Method] , [CertName] , [CertEffDate] , [CertExpDate] , [PlanID] , [ProviderID] , [TeacherID] , [IsNoOfPart],TrainLocation )
		 VALUES 
		( @CourseDesc, Convert(datetime,@FromDate,103), Convert(datetime,@ToDate,103), @Duration, @Method, @CertName, Convert(datetime,@CertEffDate,103), Convert(datetime,@CertExpDate,103), @PlanID, @ProviderID
			, @TeacherID , @IsNoOfPart, @TrainLocation) 

		SET @ResultID = SCOPE_IDENTITY()

		-- Budget
		IF @ListAccountCode <> ''
		BEGIN
			INSERT INTO tblTR_TrainResultCost([ResultID], [ActualCost], [AccountCodeID])
			SELECT @ResultID, a.listValue, b.listValue 
			FROM GetTableFromList(@ListActualCost, DEFAULT) a, GetTableFromList(@ListAccountCode, DEFAULT) b
			WHERE a.listNo = b.listNo
		END
		
		-- Emp
		IF @ListEmp <> ''
		BEGIN
			INSERT INTO tblTR_TrainResultEmp([ResultID],[ResultFail],[EndLearningContract],[TrainingCost],[Notes],[EmpID], [LineManager])
			SELECT @ResultID, b.listValue, Case c.listValue when '' then null else Convert(datetime,c.listValue,103) END as EndLearningContract,
				   d.listValue, e.listValue, a.listValue, f.listValue
			FROM   GetTableFromList(@ListEmp, DEFAULT) a, 
				   GetTableFromList(@ListEmpCert, DEFAULT) b,
				   GetTableFromList(@ListEmpContractedBy, DEFAULT) c,
				   GetTableFromList(@ListEmpCost, DEFAULT) d,
				   GetTableFromList(@ListEmpNotes, DEFAULT) e,
				   GetTableFromList(@ListEmpLineManager, DEFAULT) f
			WHERE a.listNo = b.listNo
			  AND a.listNo = c.listNo
			  AND a.listNo = d.listNo
			  AND a.listNo = e.listNo
			  AND a.listNo = f.listNo
		END

		IF @ListDept <> ''
		BEGIN
			INSERT INTO tblTR_TrainResultDept([ResultID],[Quantity],[DeptID])
			SELECT @ResultID, a.listValue, b.listValue 
			FROM GetTableFromList(@ListDeptQuantity, DEFAULT) a, GetTableFromList(@ListDept, DEFAULT) b
			WHERE a.listNo = b.listNo
		END
		
		-- Update Plan Status
		UPDATE tblTR_TrainingPlan
		SET StatusID = @StatusID, ReasonID = @ReasonID
		WHERE PlanID = @PlanID

		-- SEND MAIL
		IF @StatusID = 4
		BEGIN
			Declare @LearnEval bit
			Declare @BusImpEval bit

			Set @LearnEval = (Select LearningEval from tblTR_TrainingPlan where PlanID = @PlanID)
			Set @BusImpEval = (Select BusImpEval from tblTR_TrainingPlan where PlanID = @PlanID)

			-- LEARNING EVALUATION
			IF @LearnEval = 1
			BEGIN
				--> Gui mail remind sau khi khoa hoc ket thuc
				exec sp_sendmail_LearningEvaluation @ResultID = @ResultID
				--> Remind hang ngay
				INSERT INTO tblMail_LearningEvaluation([ResultID],[EmployeeID],[EffDate])
				SELECT @ResultID, a.listValue, GetDate()
				FROM   GetTableFromList(@ListEmp, DEFAULT) a
			END
			
			IF @BusImpEval = 1
			BEGIN
			-- BUS IMP EVALUATION
				delete from  tblMail_BusImpEvaluation_6Month where ResultID = @ResultID
				--> Gui mail remind sau 6 thang cho LM
				INSERT INTO tblMail_BusImpEvaluation_6Month([ResultID],[EmployeeID],[EffDate])
				SELECT @ResultID, a.listValue, GetDate() + convert(int, (select [value] from tblLS_SystemParam where [Name]='BusImpFirstRemind'))
				FROM   GetTableFromList(@ListEmp, DEFAULT) a
			END
		END
	END
END
ELSE IF @Activity ='SaveStatus'
BEGIN
	 -- Update Plan Status
		UPDATE tblTR_TrainingPlan
		SET StatusID = @StatusID, ReasonID = @ReasonID
		WHERE PlanID = @PlanID
END

ELSE IF @Activity ='SaveReactionFile'
BEGIN
		UPDATE tblTR_TrainingResult
		SET ReactionEval = @ReactionEval
		WHERE [ResultID] = @ResultID
END

ELSE IF @Activity ='DeleteReactionFile'
BEGIN
		UPDATE tblTR_TrainingResult
		SET ReactionEval = null
		WHERE [ResultID] = @ResultID
END

ELSE IF @Activity ='Delete'
BEGIN
--	 DELETE FROM tblTR_TrainingResult
--	 WHERE
--		[ResultID] = @ResultID

	-- Delete Evaluation first
	delete from tblTR_LearningEvalDetail
	where LnEval_ID in (select LnEval_ID from tblTR_TrainResultEmp where ResultID = @ResultID)

	delete from tblTR_LearningEval 
	where LnEval_ID in (select LnEval_ID from tblTR_TrainResultEmp where ResultID = @ResultID)

	delete from tblTR_BusImpEval
	where BusImpEval_ID in (select BusImpEval_ID from tblTR_TrainResultEmp where ResultID = @ResultID)

	delete from tblTR_ReactionEval
	where ReactionEval_ID in (select ReactionEval_ID from tblTR_TrainResultEmp where ResultID = @ResultID)

	-- Delete Training Result
	delete from tblTR_TrainResultEmp  where ResultID = @ResultID
	delete from tblTR_TrainResultCost where ResultID = @ResultID
	delete from tblTR_TrainResultDept where ResultID = @ResultID
	
	DELETE FROM tblTR_TrainingResult  WHERE ResultID = @ResultID

END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		a.ResultID,
		a.CourseDesc,
		Convert(nvarchar,a.FromDate, 103) as FromDate,
		Convert(nvarchar,a.ToDate, 103) as ToDate,
		a.Duration,
		a.Method,
		a.CertName,
		Convert(nvarchar,a.CertEffDate, 103) as CertEffDate,
		Convert(nvarchar,a.CertExpDate, 103) as CertExpDate,
		a.ReactionEval,
		a.PlanID,
		a.ProviderID,
		a.TeacherID,
		a.IsNoOfPart,
		b.IsOther,
		b.LossCategoryID,

		b.LearningEval,
		b.BusImpEval,
		b.ReactionEval as IsReactionEval,
		b.Year,
		b.IsAddition,
		b.StatusID,
		b.ReasonID,

		c.CompanyID,
		c.CompanyName,
		d.CourseName,
		e.CourseTypeName,
		f.DeptID,
		f.DeptName,

		g.StatusName,
		h.ReasonName, a.TrainLocation
, a.PlanID
	 FROM tblTR_TrainingResult a left join tblTR_TrainingPlan b on a.PlanID = b.PlanID
								 left join tblLS_Company c on b.CompanyID = c.CompanyID
							     left join tblLS_Course d on b.CourseID = d.CourseID
							     left join tblLS_CourseType e on d.CourseTypeID = e.CourseTypeID
							     left join tblLS_Dept f on b.DeptID = f.DeptID
								 left join tblLS_TrainingStatus g on b.StatusID = g.StatusID
							     left join tblLS_TrainingStatusReason h on b.ReasonID = h.ReasonID
	 WHERE
	    a.[ResultID] = @ResultID

	-- spfrmTR_TrainingResult @Activity ='GetDataByID', @ResultID = 36
END
ELSE IF @Activity ='GetBudgetByResultID'
BEGIN
	 select distinct a.ResultID, b.AccountCodeID, b.AccountCode, b.Description, a.ActualCost, IsNull(d.PlanCost, 0) as PlanCost, 0 as NewCost
	 from tblTR_TrainResultCost a inner join vLS_AccountCode b on a.AccountCodeID = b.AccountCodeID
								  inner join tblTR_TrainingResult c on a.ResultID = c.ResultID
								  left join tblTR_PlanBudget d on c.PlanID = d.PlanID and a.AccountCodeID = d.AccountCodeID
	 where 	a.ResultID = @ResultID

	-- spfrmTR_TrainingResult @Activity ='GetBudgetByResultID', @ResultID=14
END
ELSE IF @Activity ='GetEmpByResultID'
BEGIN
	 select b.EmployeeID, b.EmployeeCode, b.FullName, c.JobTitleName, 
			a.ResultFail,
			Convert(nvarchar,a.EndLearningContract,103) as EndLearningContract,
			a.Notes,
			a.TrainingCost,
			'1' as STT,
			a.LnEval_ID,
			a.BusImpEval_ID,
			a.ReactionEval_ID,
			a.ResultID,
			d.ReactionEval_ID,
			d.FileName,
			e.DeptName,
			e.DeptID,
			a.LineManager,
			f.FullName as LineManagerName
	 from tblTR_TrainResultEmp a left join vHR_Employee b on a.EmpID = b.EmployeeID
								 left join tblLS_JobTitle c on b.JobTitleID = c.JobTitleID
								 left join tblTR_ReactionEval d on a.ReactionEval_ID = d.ReactionEval_ID
								 left join tblLS_Dept e on b.DeptID = e.DeptID
								 left join vHR_Employee f on a.LineManager = f.EmployeeID
	 where 
			a.ResultID = @ResultID
	 and	(a.EmpID = @EmployeeID or IsNull(@EmployeeID,'') = '')
	-- spfrmTR_TrainingResult @Activity ='GetEmpByResultID', @ResultID=14
END
ELSE IF @Activity ='GetDeptByResultID'
BEGIN
	 select a.*, b.DeptID, b.DeptName, a.Quantity, '1' as STT
	 from tblTR_TrainResultDept a left join tblLS_Dept b on a.DeptID = b.DeptID
	 where 	a.ResultID = @ResultID

	-- spfrmTR_TrainingResult @Activity ='GetDeptByResultID', @ResultID=38
END

ELSE IF @Activity ='GetData'
BEGIN
	 SELECT 
		ResultID,
		CourseDesc,
		FromDate,
		ToDate,
		Duration,
		Method,
		CertName,
		CertEffDate,
		CertExpDate,
		PlanID,
		ProviderID,
		TeacherID
	 FROM tblTR_TrainingResult
	 WHERE 1=1
		AND (IsNull([CourseDesc],'')  like N'%' + Isnull(@CourseDesc,'') + '%')
		AND (Convert(datetime,[FromDate],103) like @FromDate)
		AND (Convert(datetime,[ToDate],103) like @ToDate)
		AND ([Duration]  = @Duration or isnull( @Duration,'')='')
		AND (IsNull([Method],'')  like N'%' + Isnull(@Method,'') + '%')
		AND (IsNull([CertName],'')  like N'%' + Isnull(@CertName,'') + '%')
		AND (Convert(datetime,[CertEffDate],103) like @CertEffDate)
		AND (Convert(datetime,[CertExpDate],103) like @CertExpDate)
		AND ([PlanID]  = @PlanID or isnull( @PlanID,'')='')
		AND ([ProviderID]  = @ProviderID or isnull( @ProviderID,'')='')
		AND ([TeacherID]  = @TeacherID or isnull( @TeacherID,'')='')
END
ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		ResultID,
		CourseDesc,
		FromDate,
		ToDate,
		Duration,
		Method,
		CertName,
		CertEffDate,
		CertExpDate,
		PlanID,
		ProviderID,
		TeacherID
	 FROM tblTR_TrainingResult
END

-- EVALUATION

else IF @Activity ='GetTrainingResultForLearningEval'
BEGIN
	
	SELECT
			ROW_NUMBER() OVER (ORDER BY RS.CompanyRank, RS.DeptRank) AS STT,
			RS.*
    FROM 
		(
			SELECT  a.PlanID,
					b.ResultID,
					d.CompanyName,
					e.DeptName,
					h.SectionName,
					--a.Year,
					FullName = g.FirstName + ' ' + g.LastName,
					c.CourseName,
					b.CourseDesc, b.FromDate,
					Duration = Convert(nvarchar,b.FromDate,103) + ' - ' + Convert(nvarchar,b.ToDate,103),
					LearningEvalStatus = Case IsNull(f.LnEval_ID,'') when '' then 'No' else 'Yes' end,
					d.Rank as CompanyRank,
					e.Rank as DeptRank,
					f.LnEval_ID,g.EmployeeID,f.TrainingCost
		, dbo.fnConvertNumber(f.TrainingCost) as sTrainingCost
			FROM tblTR_TrainingPlan a 
				inner join tblTR_TrainingResult b on a.PlanID = b.PlanID
				inner join tblTR_TrainResultEmp f on b.ResultID = f.ResultID
				inner join tblHR_Employee g on f.EmpID = g.EmployeeID

				left join tblLS_Course c on a.CourseID = c.CourseID
				left join tblLS_Company d on g.CompanyID = d.CompanyID
				left join tblLS_Dept e on g.DeptID = e.DeptID
				left join tblLS_Section h on g.SectionID = h.SectionID
				left join (
					select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
				) Ar on Ar.EmployeeID = g.EmployeeID
				
				inner join tblSYS_UserPermission Per on Per.EmployeeID = f.EmpID and Per.UserID = @UserID-- Phan quyen du lieu

			WHERE 1 = 1 and LearningEval = 1 --and a.StatusID = 4 -- trạng thái Complete
			AND (a.[Year] = @Year or isnull( @Year,'')='')	
			
			AND (a.FromDate between convert(datetime,@FromDate,103) and convert(datetime,@ToDate,103))

			AND (a.[CourseID] = @CourseID or isnull( @CourseID,'')='')
			AND ((IsNull(b.CourseDesc,'') like N'%' + IsNull(@CourseDesc,'')+'%'))
			
			AND (g.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
			AND (g.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
			AND (g.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
			AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)

		 ) RS
	WHERE
		( RS.LearningEvalStatus = @LearningEvalStatus OR isnull(@LearningEvalStatus,'')='')

	ORDER BY RS.CompanyRank, RS.DeptRank

--select * from tblTR_TrainingPlan
End

else IF @Activity ='GetTrainingResultForBusImpEval'
BEGIN
	
	SELECT
			ROW_NUMBER() OVER (ORDER BY RS.CompanyRank, RS.DeptRank) AS STT,
			RS.*
    FROM 
		(
			SELECT  a.PlanID,
					b.ResultID,
					d.CompanyName,
					e.DeptName,
					h.SectionName,
					--a.Year,
					FullName = g.FirstName + ' ' + g.LastName,
					c.CourseName,
					b.CourseDesc,
					Duration = Convert(nvarchar,b.FromDate,103) + ' - ' + Convert(nvarchar,b.ToDate,103),
					LearningEvalStatus = Case IsNull(f.BusImpEval_ID,'') when '' then 'No' else 'Yes' end,
					d.Rank as CompanyRank,
					e.Rank as DeptRank,
					f.LnEval_ID,
					f.BusImpEval_ID,
					f.EmpID as EmployeeID, b.FromDate,
					f.TrainingCost,
					dbo.fnConvertNumber(f.TrainingCost) as sTrainingCost
			FROM tblTR_TrainingPlan a 
				inner join tblTR_TrainingResult b on a.PlanID = b.PlanID
				inner join tblTR_TrainResultEmp f on b.ResultID = f.ResultID
				inner join tblHR_Employee g on f.EmpID = g.EmployeeID

				left join tblLS_Course c on a.CourseID = c.CourseID
				left join tblLS_Company d on g.CompanyID = d.CompanyID
				left join tblLS_Dept e on g.DeptID = e.DeptID
				left join tblLS_Section h on g.SectionID = h.SectionID
				left join (
					select EmployeeID,[AreaID] from tblHR_EmployeeArea where ([AreaID]  = @AreaID)
				) Ar on Ar.EmployeeID = g.EmployeeID

				-- inner join tblSYS_UserPermission Per on Per.EmployeeID = f.EmpID and Per.UserID = @UserID-- Phan quyen du lieu

			WHERE 1 = 1 and BusImpEval = 1 --and a.StatusID = 4 -- trạng thái Complete
			--AND (a.[Year] = @Year or isnull( @Year,'')='')	
			
			AND (a.FromDate between convert(datetime,@FromDate,103) and convert(datetime,@ToDate,103))

			AND (a.[CourseID] = @CourseID or isnull( @CourseID,'')='')
			AND ((IsNull(b.CourseDesc,'') like N'%' + IsNull(@CourseDesc,'')+'%'))
			
			AND (g.[CompanyID]  = @CompanyID or isnull( @CompanyID,'')='')
			AND (g.[DeptID]  = @DeptID or isnull( @DeptID,'')='')
			AND (g.[SectionID]  = @SectionID or isnull( @SectionID,'')='')
			AND (isnull( @AreaID,'')='' or @AreaID = Ar.AreaID)
			AND (isnull( @EmployeeID,'')='' or f.LineManager = @EmployeeID)
			--

		 ) RS
	WHERE
		( RS.LearningEvalStatus = @LearningEvalStatus OR isnull(@LearningEvalStatus,'')='')

	ORDER BY RS.CompanyRank, RS.DeptRank--, RS.Year

	-- spfrmTR_TrainingResult @Activity='GetTrainingResultForBusImpEval'
--select * from tblTR_TrainingPlan
End

ELSE IF @Activity ='GetResultForRemind'
BEGIN
	 select 
			--a.year,
			d.CompanyName,
			f.DeptName,
			e.CourseName,
			b.CourseDesc,
			Convert(nvarchar,b.FromDate,103) as FromDate,
			Convert(nvarchar,b.ToDate,103) as ToDate,
			g.EmployeeCode,
			g.FullName,
			g.Email
		from tblTR_TRainingPlan a left join tblTR_TrainingResult b on a.PlanID = b.PlanID
								  left join tblTR_TrainResultEmp c on b.ResultID = c.ResultID
								  left join tblLS_Company d on a.CompanyID = d.CompanyID
								  left join tblLS_Course e on a.CourseID = e.CourseID
								  left join tblLS_Dept f on a.DeptID = f.DeptID
								  left join vHR_Employee g on c.EmpID = g.EmployeeID
		where b.ResultID = @ResultID
		and	  c.EmpID = @EmployeeID

		-- spfrmTR_TrainingResult @Activity ='GetResultForRemind', @ResultID=18, @EmployeeID=5
END

ELSE IF @Activity ='GetResultReactionEval'
BEGIN
	 select 
			--a.year,
			d.CompanyName,
			f.DeptName,
			e.CourseName,
			b.CourseDesc,
			Convert(nvarchar,b.FromDate,103) as FromDate,
			Convert(nvarchar,b.ToDate,103) as ToDate,
			g.EmployeeCode,
			g.FullName,
			h.ReactionEval_ID,
			h.FileName
		from tblTR_TRainingPlan a left join tblTR_TrainingResult b on a.PlanID = b.PlanID
								  left join tblTR_TrainResultEmp c on b.ResultID = c.ResultID
								  left join tblLS_Company d on a.CompanyID = d.CompanyID
								  left join tblLS_Course e on a.CourseID = e.CourseID
								  left join tblLS_Dept f on a.DeptID = f.DeptID
								  left join vHR_Employee g on c.EmpID = g.EmployeeID
								  left join tblTR_ReactionEval h on c.ReactionEval_ID = h.ReactionEval_ID
		where b.ResultID = @ResultID
		and	  c.EmpID = @EmployeeID

		-- spfrmTR_TrainingResult @Activity ='GetResultForRemind', @ResultID=18, @EmployeeID=5
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_TrainingRequest]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Stored procedure
CREATE PROCEDURE [dbo].[spfrmTR_TrainingRequest]
( 
/*
Procedure: spfrmTR_TrainingRequest
Desc:
	 Procedure for table: tblTR_TrainingRequest
Author:
	 PhuongDK
Create date:
	16-03-2009
History:
	Thêm phân quyền dữ liệu
*/

@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@RequestID	int = NULL out,
@CourseType	int = null,
@Year	int = null,
@CourseID int = null,
@OtherCourse	nvarchar(500) = null,
@IsTeam	int = null,
@Reason	nvarchar(500) = null,
@MailNotify	int = null,
-- More
@EmployeeCode	nvarchar(50) = null,
@CourseName	nvarchar(500) = null,
@FullName	nvarchar(500) = null,
@CompanyID	int = null,
@DeptID	int = null,
@Comment	nvarchar(500) = null,
@EmployeeID int = null,
@UpdateEmployeeID int = null,
@UserID	int = null, --user phân quyền dữ liệu
@UserRole	nvarchar(500) = null,
--
@ReviewID	int = null,
@ReviewActionCode	int = null,
@DelegateID	int = null,
@Status	int = null,
@RoleID	int = NULL,
@NextReviewID int = null,
@NextDelegateID int = null,
-------------------------
@ListEmp nvarchar(max) = null
--@LineManager int = null
--@StatusID	int = null,
--@GroupID	int = null,
) 
AS
declare @PreReviewID int
declare @PreDelegateID int
--------------------------
IF @Activity ='Save'
BEGIN
	IF Exists(Select * from tblTR_TrainingRequest where RequestID = @RequestID)
	BEGIN
	 UPDATE tblTR_TrainingRequest SET
		 [CourseType]  = @CourseType,
		 [Year]  = @Year,
		 [CourseID] = @CourseID,
		 [OtherCourse]  = @OtherCourse,
		 [IsTeam]  = @IsTeam,
		 [Reason]  = @Reason,
		 [MailNotify]  = @MailNotify,
		 [EmployeeID] = @EmployeeID
		 --[LineManager] = @LineManager
	 WHERE
		[RequestID] = @RequestID
	END
	ELSE
	BEGIN
		 INSERT INTO tblTR_TrainingRequest ( [CourseType] , [Year], [CourseID] , [OtherCourse] , [IsTeam] , [Reason] , [MailNotify], [EmployeeID])
		 VALUES 
		( @CourseType, @Year, @CourseID, @OtherCourse, @IsTeam, @Reason, @MailNotify, @EmployeeID) 

		SET @RequestID = SCOPE_IDENTITY()

		-- Save Next Review
		-- exec spfrmTR_TrainingRequest @Activity='SaveNextReview', @RequestID=@RequestID, @EmployeeID=@EmployeeID
	END

	-- Training Request Emp
	DELETE FROM dbo.tblTR_TrainingRequestEmp WHERE RequestID = @RequestID
	-- Save
	IF @ListEmp <> ''
	BEGIN
		INSERT INTO tblTR_TrainingRequestEmp(RequestID,EmployeeID)
		SELECT @RequestID, a.listValue
		FROM GetTableFromList(@ListEmp, DEFAULT) a
	END
	
END
ELSE IF @Activity ='Delete'
BEGIN

	 DELETE FROM tblTR_TrainingRequestWait WHERE [RequestID] = @RequestID
	 ----------------------------------------
	 DELETE FROM tblTR_TrainingRequestReview WHERE [RequestID] = @RequestID
	 ----------------------------------------
	 DELETE FROM tblTR_TrainingRequest WHERE [RequestID] = @RequestID

END
ELSE IF @Activity ='GetDataByID'
BEGIN
	 select a.*,
		    c.CompanyName,
		    d.DeptID,
		    d.DeptName,
		    b.EmployeeCode,
		    b.FullName,
			e.CourseTypeID,
			e.CourseName,
			b.Email,
			f.CourseTypeName
			-- a.LineManager
			-- f.StatusName,
	from tblTR_TrainingRequest a left join vHR_Employee b on a.EmployeeID = b.EmployeeID
								 left join tblLS_Company c on b.CompanyID = c.CompanyID
								 left join tblLS_Dept d on b.DeptID = d.DeptID
								 left join tblLS_Course e on a.CourseID = e.CourseID
								 left join tblLS_CourseType f on e.CourseTypeID = f.CourseTypeID
								 --left join tblLS_RequestStatus f on a.StatusID = f.StatusID
	 WHERE
		a.[RequestID] = @RequestID
	
-- spfrmTR_TrainingRequest @Activity ='GetDataByID', @RequestID=53
END
ELSE IF @Activity ='GetDataByAdmin'
BEGIN
	
	SELECT
			A.*,
			StatusName = (Case when Status = 1 then 'Approved by ' + A.[Role] when Status = 2 then 'Rejected by ' + A.[Role] when Status = 3 then 'Passed by ' + A.[Role] else 'Request' end),
			RequestType = '1',
			ReviewID = '',
			DelegateID = ''
	 FROM vTR_TrainingRequest A
		--inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(A.EmployeeCode,'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(A.FullName,'')  like N'%' + Isnull(@FullName,'') + '%')
		AND (A.CompanyID  = @CompanyID or isnull(@CompanyID,'')='' or @CompanyID='-1')
		AND (A.DeptID  = @DeptID or isnull(@DeptID,'')='' or @DeptID='-1')
		AND (A.[Year]  = @Year or isnull( @Year,'')='')
		AND (IsNull(A.CourseName,'')  like N'%' + Isnull(@CourseName,'') + '%')

		AND (Isnull(A.Status,'') = @Status or @Status = -1)
		AND (A.[RoleID] = @RoleID or IsNull(@RoleID,'')='')
	
	-- spfrmTR_TrainingRequest @Activity ='GetData', @UserRole = 'Admin', @Status=0, @RoleID=''
END

ELSE IF @Activity ='GetDataUnAnswered'
BEGIN
	-- Get Own Request
	SELECT
			A.*,
			StatusName = (Case when Status = 1 then 'Approved by ' + A.[Role] when Status = 2 then 'Rejected by ' + A.[Role] when Status = 3 then 'Passed by ' + A.[Role] else 'Request' end),
			RequestType = '1',
			ReviewID = '',
			DelegateID = ''
	 FROM vTR_TrainingRequest A
		inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(A.EmployeeCode,'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(A.FullName,'')  like N'%' + Isnull(@FullName,'') + '%')
		AND (A.CompanyID  = @CompanyID or isnull(@CompanyID,'')='' or @CompanyID='-1')
		AND (A.DeptID  = @DeptID or isnull(@DeptID,'')='' or @DeptID='-1')
		AND (A.[Year]  = @Year or isnull( @Year,'')='')
		AND (IsNull(A.CourseName,'')  like N'%' + Isnull(@CourseName,'') + '%')
	
		AND A.EmployeeID = @EmployeeID
		AND (Isnull(A.Status,'') = '')
END
ELSE IF @Activity ='GetDataAnswered'
BEGIN
	-- Get Own Request
	SELECT
			A.*,
			StatusName = (Case when Status = 1 then 'Approved by ' + A.[Role] when Status = 2 then 'Rejected by ' + A.[Role] when Status = 3 then 'Passed by ' + A.[Role] else 'Request' end),
			RequestType = '1',
			ReviewID = '',
			DelegateID = ''
	 FROM vTR_TrainingRequest A
		inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(A.EmployeeCode,'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(A.FullName,'')  like N'%' + Isnull(@FullName,'') + '%')
		AND (A.CompanyID  = @CompanyID or isnull(@CompanyID,'')='' or @CompanyID='-1')
		AND (A.DeptID  = @DeptID or isnull(@DeptID,'')='' or @DeptID='-1')
		AND (A.[Year]  = @Year or isnull( @Year,'')='')
		AND (IsNull(A.CourseName,'')  like N'%' + Isnull(@CourseName,'') + '%')
	
		AND A.EmployeeID = @EmployeeID
		AND (Isnull(A.Status,'') <> '')

		AND (Isnull(A.Status,'') = @Status or @Status = -1)
		AND (A.[RoleID] = @RoleID or IsNull(@RoleID,'')='')
END
ELSE IF @Activity ='GetDataUnReplied'
BEGIN
	-- Get Request for Own Review
	SELECT
			A.*,
			StatusName = (Case when Status = 1 then 'Approved by ' + A.[Role] when Status = 2 then 'Rejected by ' + A.[Role] when Status = 3 then 'Passed by ' + A.[Role] else 'Request' end),
			RequestType = '2',
			ReviewID = B.ReviewID,
			DelegateID = ''
	 FROM vTR_TrainingRequest A
			left join tblTR_TrainingRequestWait B on A.RequestID = B.RequestID
			--inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(A.EmployeeCode,'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(A.FullName,'')  like N'%' + Isnull(@FullName,'') + '%')
		AND (A.CompanyID  = @CompanyID or isnull(@CompanyID,'')='' or @CompanyID='-1')
		AND (A.DeptID  = @DeptID or isnull(@DeptID,'')='' or @DeptID='-1')
		AND (A.[Year]  = @Year or isnull( @Year,'')='')
		AND (IsNull(A.CourseName,'')  like N'%' + Isnull(@CourseName,'') + '%')
	
		AND B.ReviewID = @EmployeeID
		AND IsNull(B.DelegateID,'') = ''

	-- Get Request for Delegate Review
	UNION ALL
	SELECT
			A.*,
			StatusName = (Case when Status = 1 then 'Approved by ' + A.[Role] when Status = 2 then 'Rejected by ' + A.[Role] when Status = 3 then 'Passed by ' + A.[Role] else 'Request' end),
			RequestType = '3',
			ReviewID = B.ReviewID,
			DelegateID = B.DelegateID
	 FROM vTR_TrainingRequest A
			left join tblTR_TrainingRequestWait B on A.RequestID = B.RequestID
			--inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(A.EmployeeCode,'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(A.FullName,'')  like N'%' + Isnull(@FullName,'') + '%')
		AND (A.CompanyID  = @CompanyID or isnull(@CompanyID,'')='' or @CompanyID='-1')
		AND (A.DeptID  = @DeptID or isnull(@DeptID,'')='' or @DeptID='-1')
		AND (A.[Year]  = @Year or isnull( @Year,'')='')
		AND (IsNull(A.CourseName,'')  like N'%' + Isnull(@CourseName,'') + '%')
	
		AND B.DelegateID = @EmployeeID
END
ELSE IF @Activity ='GetDataReplied'
BEGIN
	-- Get Own Request
	SELECT distinct
			A.*,
			StatusName = (Case when Status = 1 then 'Approved by ' + A.[Role] when Status = 2 then 'Rejected by ' + A.[Role] when Status = 3 then 'Passed by ' + A.[Role] else 'Request' end),
			RequestType = '1',
			ReviewID = '',
			DelegateID = ''
	 FROM vTR_TrainingRequest A left join tblTR_TrainingRequestReview B on A.RequestID = B.RequestID
		--inner join tblSYS_UserPermission Per on Per.EmployeeID = a.EmployeeID and Per.UserID = @UserID-- Phan quyen du lieu
	 WHERE 1=1
		AND (IsNull(A.EmployeeCode,'')  like N'%' + Isnull(@EmployeeCode,'') + '%')
		AND (IsNull(A.FullName,'')  like N'%' + Isnull(@FullName,'') + '%')
		AND (A.CompanyID  = @CompanyID or isnull(@CompanyID,'')='' or @CompanyID='-1')
		AND (A.DeptID  = @DeptID or isnull(@DeptID,'')='' or @DeptID='-1')
		AND (A.[Year]  = @Year or isnull( @Year,'')='')
		AND (IsNull(A.CourseName,'')  like N'%' + Isnull(@CourseName,'') + '%')
	
		AND (B.EmployeeID = @EmployeeID)
END

ELSE IF @Activity ='GetDataAll'
BEGIN
	 SELECT 
		RequestID,
		CourseType,
		Year,
		OtherCourse,
		IsTeam,
		Reason,
		--StatusID,
		MailNotify
	 FROM tblTR_TrainingRequest
END

ELSE IF @Activity ='SaveReview'
BEGIN
	-- Find Previous Employee (for Rejected)
	select 
		   top 1
		   @PreReviewID = a.EmployeeID,
		   @PreDelegateID = a.DelegateID
	from vTR_TrainingRequestReview a 
	where RequestID = @RequestID
	and a.ReviewActionCode <> 2
	and a.EmployeeID <> @EmployeeID
	and a.EmployeeID not in (select EmployeeID from vTR_TrainingRequestReview where RequestID = @RequestID and ReviewActionCode = 2)
	order by ReviewID desc

	IF @PreDelegateID = 0
	BEGIN
		SET @PreDelegateID = NULL
	END

	-- Save New Review
	INSERT INTO tblTR_TrainingRequestReview ([RequestID],[EmployeeID],[ReviewActionCode],[Comment],[ReviewDate],[DelegateID])
	VALUES (@RequestID, @EmployeeID, @ReviewActionCode, @Comment, GetDate(), @DelegateID)

	-- Delete Training Request Wait for Review
	Delete from tblTR_TrainingRequestWait where RequestID = @RequestID
	
	-- Neu la Rejected
	IF @ReviewActionCode = 2 
	BEGIN
		IF @PreReviewID <> (select EmployeeID from tblTR_TrainingRequest where RequestID = @RequestID)
		BEGIN
			INSERT INTO tblTR_TrainingRequestWait([RequestID],[ReviewID],[DelegateID])
			VALUES (@RequestID, @PreReviewID, @PreDelegateID)

			-- Mail notify
			Set @MailNotify = (Select MailNotify from tblTR_TrainingRequest where RequestID = @RequestID)
			IF @MailNotify = 1 
			BEGIN
				IF IsNull(@PreDelegateID,0) = 0
				BEGIN
					EXEC sp_sendmail_TrainingRequest @RequestID = @RequestID, @CurEmployeeID = @PreReviewID
				END
				ELSE
				BEGIN
					EXEC sp_sendmail_TrainingRequest @RequestID = @RequestID, @CurEmployeeID = @PreDelegateID
				END
			END
		END
	END

END

ELSE IF @Activity ='SaveNextReview'
BEGIN
	-- Find & stored next review
		-- select @NextReviewID = col1, @NextDelegateID = col2 from dbo.fn_SplitTwoCol(dbo.fnGetReportToID(@EmployeeID),default)

		if IsNull(@NextReviewID,'') <> ''
		begin
			
			if IsNull(@NextDelegateID,'') = ''
			begin
			   --> Emp se Review
				INSERT INTO tblTR_TrainingRequestWait([RequestID],[ReviewID],[DelegateID])
				VALUES (@RequestID, @NextReviewID, null)
			end
			else
			begin
				--> Uy thac
				INSERT INTO tblTR_TrainingRequestWait([RequestID],[ReviewID],[DelegateID])
				VALUES (@RequestID, @NextReviewID, @NextDelegateID)
			end

			-- Mail notify
			Set @MailNotify = (Select MailNotify from tblTR_TrainingRequest where RequestID = @RequestID)
			IF @MailNotify = 1 
			BEGIN
				EXEC sp_sendmail_TrainingRequest @RequestID = @RequestID, @CurEmployeeID = @NextReviewID
			END
		end
		else
		begin
			-- Neu ko con emp de approve
			declare @tmp int		
			----
			declare curResult CURSOR FOR 
			select distinct EmployeeID from vTR_TrainingRequestReview where RequestID = @RequestID

			OPEN curResult

			FETCH NEXT FROM curResult INTO @tmp

			WHILE @@FETCH_STATUS = 0
			BEGIN
				EXEC sp_sendmail_TrainingRequest @RequestID = @RequestID, @CurEmployeeID = @tmp
				FETCH NEXT FROM curResult INTO @tmp
			END
			
			CLOSE curResult
			DEALLOCATE curResult
			----

		end
	-- End of Find & stored next review
END

ELSE IF @Activity ='SavePassedReview'
BEGIN
	INSERT INTO tblTR_TrainingRequestReview ([RequestID],[EmployeeID],[ReviewActionCode],[Comment],[ReviewDate],[DelegateID])
	VALUES (@RequestID, @EmployeeID, 3, null, GetDate(), null)
END

ELSE IF @Activity ='DeleteDataReview'
BEGIN
	DELETE FROM tblTR_TrainingRequestReview WHERE ReviewID = @ReviewID

	DELETE FROM tblTR_TrainingRequestWait WHERE RequestID = @RequestID

	-- Find Previous Employee to Review
	select top 1 
			@PreReviewID = a.EmployeeID
	from vTR_TrainingRequestReview a 
	where RequestID = @RequestID
	order by ReviewID desc

	-- Save Next Review
	exec spfrmTR_TrainingRequest @Activity='SaveNextReview', @RequestID=@RequestID, @EmployeeID=@PreReviewID

END
ELSE IF @Activity ='DeleteAllDataReview'
BEGIN
	DELETE FROM tblTR_TrainingRequestReview WHERE RequestID = @RequestID

	DELETE FROM tblTR_TrainingRequestWait WHERE RequestID = @RequestID
END
ELSE IF @Activity ='GetDataReview'
BEGIN
	select
			a.RequestID,
			a.ReviewID,
			a.EmployeeID,
			b.FullName,
			a.RoleName,
			StatusName = IsNull(f.ReviewActionName,'Request'),
			a.Comment,
			ReviewDate = Convert(nvarchar, a.ReviewDate, 103),
			DelegateName = c.FullName,
			DelegateRoleName = e.RoleName
	from vTR_TrainingRequestReview a left join vHR_Employee b on a.EmployeeID = b.EmployeeID
									 left join vHR_Employee c on a.DelegateID = c.EmployeeID
									 left join tblHR_EmpReportTo d on a.DelegateID = d.EmployeeID
									 left join tblLS_Roles e on d.RoleID = e.RoleID
									 left join tblLS_ReviewAction f on a.ReviewActionCode = f.ReviewActionCode
	where RequestID = @RequestID
	order by a.ReviewID

	-- spfrmTR_TrainingRequest @Activity ='GetDataReview', @RequestID=62
END

ELSE IF @Activity ='GetDataNextReview'
BEGIN
	select
			a.RequestID,
			a.ReviewID,
			b.FullName,
			d.RoleName,
			a.DelegateID,
			e.FullName as DelegateName,
			g.RoleName as DelegateRoleName
	from tblTR_TrainingRequestWait a left join vHR_Employee b on a.ReviewID = b.EmployeeID
									 left join tblHR_EmpReportTo c on a.ReviewID = c.EmployeeID
									 left join tblLS_Roles d on c.RoleID = d.RoleID
									 left join vHR_Employee e on a.DelegateID = e.EmployeeID
									 left join tblHR_EmpReportTo f on a.DelegateID = f.EmployeeID
									 left join tblLS_Roles g on f.RoleID = g.RoleID
	where RequestID = @RequestID

	-- spfrmTR_TrainingRequest @Activity ='GetDataNextReview', @RequestID=62
END

ELSE IF @Activity ='SaveReviewPass'
BEGIN
	Insert into dbo.tblTR_TrainingRequestReview(RequestID,EmployeeID,ReviewActionCode,ReviewDate)
	values(@RequestID,@EmployeeID,3,GetDate())
END

ELSE IF @Activity ='SaveReviewPass'
BEGIN
	DELETE FROM tblTR_TrainingRequestEmp WHERE RequestID = @RequestID
	--
	IF @ListEmp <> ''
	BEGIN
		INSERT INTO tblTR_TrainingRequestEmp(RequestID, EmployeeID)
		SELECT @RequestID, a.listValue
		FROM GetTableFromList(@ListEmp, DEFAULT) a
	END
END

ELSE IF @Activity ='GetTrainingRequestEmp'
BEGIN
	SELECT a.RequestID, a.EmployeeID,
		   b.EmployeeCode,
		   b.FullName,
		   c.JobTitleName,
		   d.DeptName
	FROM   tblTR_TrainingRequestEmp a 
			left join vHR_Employee b on a.EmployeeID = b.EmployeeID
			left join tblLS_JobTitle c on b.JobTitleID = c.JobTitleID
			left join tblLS_Dept d on b.DeptID = d.DeptID
	WHERE 
			RequestID = @RequestID
END

IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmTR_TrainingPlan]    Script Date: 03/05/2015 21:26:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmTR_TrainingPlan]
(
-- Modified by PhuongDK
-- spfrmTR_TrainingPlan
@Activity	varchar(50),

@PlanID	int = null out,
@Year	int = null,
@CourseDesc	nvarchar(500) = null,
@FromDate	nvarchar(10) = null,
@ToDate	nvarchar(10) = null,
@Duration	int = null,
@DurationFT	nvarchar(50) = null,
@IsAddition	int = null,
@Method	nvarchar(50) = null,
@LearningEval	int = null,
@BusImpEval	int = null,
@ReactionEval	int = null,
@StatusID	int = null,
@ReasonID	int = null,
@CompanyID	int = null,
@DeptID	int = null,
@CourseID	int = null,
@ProviderID	int = null,
@TeacherID	int = null,
@IsNoOfPart int = null,
@IsOther	int = null,
@TrainLocation	nvarchar(50) = null,
-- More
@CompanyName varchar(50)= null,
@DeptName varchar(50)=null,
@CourseName varchar(50)= null,
@StatusName varchar(50)= null,
@ListAccountCode nvarchar(2000) = null,
@ListPlanCost nvarchar(2000) = null,
@ListEmp nvarchar(2000) = null,
@ListDept nvarchar(2000) = null,
@ListDeptQuantity nvarchar(2000) = null,

--More
@EmployeeID int = null,
@EmployeeCode nvarchar(50) = null,
@FullName nvarchar (1001) = null,
@ResultID	int = null,
@UserID		int = null,
@LossCategoryID nvarchar(50) = null
)
AS
--
IF @LossCategoryID = ''
BEGIN
	SET @LossCategoryID = null
END
--

declare @GroupCode int--, @DeptID int
select @GroupCode = GroupCode
from tblSYS_UserGroup A
inner join tblSYS_Group B On A.GroupID = B.GroupID
where A.UserID = @UserID

if (@GroupCode = 2)
begin
	select @CompanyID = A.CompanyID,@DeptID = A.DeptID 
	from tblHR_Employee A
	inner join tblSYS_User B On A.EmployeeID = B.EmployeeID
	where B.UserID = @UserID
end


IF @Activity ='GetData'
BEGIN
	 SELECT 
		 a.PlanID
		,a.[Year]
		,a.CourseID
		,b.CourseName
		,a.[CourseDesc]
		,c.PlanCost, RC.ActualCost 
		,a.Duration
		,a.IsNoOfPart
		,a.IsOther
		,d.[StatusName]	
		,convert(nvarchar,a.[FromDate],103)as FromDate
		,convert(nvarchar,a.[ToDate],103)as ToDate
		,PlanDate = (convert(nvarchar,a.[FromDate],103) + isnull('-' + convert(nvarchar,a.[ToDate],103),''))
		,a.CompanyID
		,f.CompanyName
		,e.DeptID
		,e.DeptName
		,d.StatusID
		,d.StatusName
		,g.ReasonID
		,g.ReasonName
		,h.ResultID
	 FROM [tblTR_TrainingPlan] a 
			left join dbo.tblLS_Course b on a.CourseID = b.CourseID
			left join (select PlanID,sum(PlanCost) as PlanCost from dbo.tblTR_PlanBudget group by PlanID
					   ) c on a.PlanID = c.PlanID
			left join tblLS_TrainingStatus d on a.StatusID = d.StatusID
			left join tblLS_Company f on a.CompanyID = f.CompanyID
			left join tblLS_Dept e on a.DeptID = e.DeptID
			left join tblLS_TrainingStatusReason g on a.ReasonID = g.ReasonID
			left join tblTR_TrainingResult h on a.PlanID = h.PlanID
			left join (
				select ResultID,sum(ActualCost) as ActualCost from tblTR_TrainResultCost group by ResultID
			) RC On RC.ResultID = h.ResultID
			inner join (
			select CompanyID from tblHR_Employee E
			inner join tblSYS_UserPermission Per on Per.EmployeeID = E.EmployeeID
			where Per.UserID = @UserID-- Phan quyen du lieu
			group by CompanyID
			) Perc on Perc.CompanyID = a.CompanyID
	where 1=1
		AND (a.[Year] = @Year or isnull( @Year,'')='')	
	
		AND (a.FromDate between convert(datetime,@FromDate,103) and convert(datetime,@ToDate,103))
			
		/*
		and (a.FromDate >= convert(datetime,@FromDate,103) or isnull( @FromDate,'')='')
		and (a.ToDate <= convert(datetime,@ToDate,103) or isnull( @ToDate,'')='')
		*/

		AND (a.[CompanyID] = @CompanyID or isnull( @CompanyID,'')='')
		AND (e.[DeptID] = @DeptID or isnull( @DeptID,'')='')
		AND (b.[CourseID] = @CourseID or isnull( @CourseID,'')='')

		and ((IsNull(a.CourseDesc,'') like N'%' + IsNull(@CourseDesc,'')+'%'))
		AND (d.[StatusID] = @StatusID or isnull( @StatusID,'')='')
		AND (g.[ReasonID] = @ReasonID or isnull( @ReasonID,'')='')
		AND (a.[LossCategoryID] = @LossCategoryID or isnull( @LossCategoryID,'')='')
	
	Order by a.PlanID Desc

		-- spfrmTR_TrainingPlan @Activity ='GetData', @CourseID = 1
END

ELSE IF @Activity ='Delete'
BEGIN
	
	-- Delete Training Result FIRST
	SET @ResultID = (Select ResultID from tblTR_TrainingResult where PlanID = @PlanID)
	EXEC spfrmTR_TrainingResult @Activity='Delete', @ResultID = @ResultID

	-- Delete TRaining Plan
	Delete from tblTR_PlanEmp where PlanID = @PlanID
	Delete from tblTR_PlanDept where PlanID = @PlanID
	Delete from tblTR_PlanBudget where  PlanID = @PlanID

	DELETE FROM tblTR_TrainingPlan WHERE PlanID = @PlanID 
END


ELSE IF @Activity ='GetBridBudget'
BEGIN
	SELECT
		pb.PlanID,
		ROW_NUMBER() OVER (ORDER BY pb.PlanID) AS STT, 
		ACode + '.' + BCode + '.' + TRCode as AccountCode, 
		Description, 
		PlanCost, 
		pb.AccountCodeID as AccountCodeID
	FROM
		tblTR_TrainingPlan tr, tblTR_PlanBudget pb, tblLS_AccountCode ac
	WHERE
		tr.PlanID = pb.PlanID and 
	    pb.AccountCodeID = ac.AccountCodeID and 
        tr.CompanyID = @CompanyID and 
        tr.CourseID = @CourseID
END


ELSE IF @Activity ='GetGridEmp'
BEGIN
	SELECT
		ROW_NUMBER() OVER (ORDER BY em.EmployeeID) AS STT, 
		em.EmployeeID, 
		em.EmployeeCode, 
		em.FirstName + ' ' + em.LastName as FullName,
		co.CompanyName,
		dp.DeptName,
		jb.JobTitleName
	FROM
		tblHR_Employee em left join tblLS_Company co on em.CompanyID = co.CompanyID
						  left join tblLS_Dept dp on em.DeptID = dp.DeptID
						  left join tblLS_JobTitle jb on em.JobTitleID = jb.JobTitleID
	WHERE 1=1
	--and dp.DeptID = (Select DeptID from tblLS_Course where CourseID = @CourseID)
	and co.CompanyID = @CompanyID
	and dp.DeptID = @DeptID

	-- spfrmTR_TrainingPlan @Activity='GetGridEmp', @CompanyID=1, @DeptID=13
END

-- spfrmTR_TrainingPlan @Activity='GetGridEmp', @CourseID=15, @CompanyID=2

ELSE IF @Activity ='GetDataPlan'
BEGIN
	SELECT
		pl.PlanID,
		pl.[Year],
		pl.CourseDesc,
		pl.FromDate,
		pl.ToDate,
		pl.Duration,
		pl.IsAddition,
		pl.IsOther,
		pl.Method,
		pl.LearningEval,
		pl.BusImpEval,
		pl.ReactionEval,
		pl.StatusID,
		pl.ReasonID,
		pl.ProviderID,
		pl.TeacherID,
		ct.CourseTypeName, pl.TrainLocation

	FROM
		tblTR_TrainingPlan pl, tblLS_Course co, tblLS_CourseType ct
	WHERE
		pl.CompanyID = @CompanyID and
		co.CourseID = @CourseID and
		co.CourseTypeID = ct.CourseTypeID
END

else IF @Activity ='Save'
BEGIN
	declare @iCourseTypeID int
	set @iCourseTypeID = (select CourseTypeID from tblLS_Course where CourseID = @CourseID)

	IF Exists(Select * from tblTR_TrainingPlan where PlanID = @PlanID)
	BEGIN
		 UPDATE tblTR_TrainingPlan SET
			 [Year]  = @Year,
			 [CourseDesc]  = @CourseDesc,
			 [FromDate]  = Convert(datetime,@FromDate,103),
			 [ToDate]  = Convert(datetime,@ToDate,103),
			 [Duration]  = @Duration,
			 [IsAddition]  = @IsAddition,
			 [Method]  = @Method,
			 [LearningEval]  = @LearningEval,
			 [BusImpEval]  = @BusImpEval,
			 [ReactionEval]  = @ReactionEval,
			 [ReasonID]  = @ReasonID,
			 [CompanyID]  = @CompanyID,
			 [DeptID]  = @DeptID,
			 [CourseID]  = @CourseID,
			 [ProviderID]  = @ProviderID,
			 [TeacherID]  = @TeacherID,
			 [IsNoOfPart] = @IsNoOfPart,
			 [IsOther] = @IsOther,
			 [LossCategoryID] = @LossCategoryID, TrainLocation = @TrainLocation
		 WHERE
			[PlanID] = @PlanID

		-- Budget
		DELETE FROM tblTR_PlanBudget WHERE [PlanID] = @PlanID
		
		IF @ListAccountCode <> ''
		BEGIN
			INSERT INTO tblTR_PlanBudget([PlanID],[PlanCost],[AccountCodeID])
			SELECT @PlanID, a.listValue, b.listValue 
			FROM GetTableFromList(@ListPlanCost, DEFAULT) a, GetTableFromList(@ListAccountCode, DEFAULT) b
			WHERE a.listNo = b.listNo
		END

		-- Emp/Dept
		DELETE FROM dbo.tblTR_PlanEmp WHERE [PlanID] = @PlanID
		DELETE FROM dbo.tblTR_PlanDept WHERE [PlanID] = @PlanID

		IF @ListEmp <> ''
		BEGIN
			INSERT INTO tblTR_PlanEmp([PlanID],[EmpID])
			SELECT @PlanID, a.listValue
			FROM GetTableFromList(@ListEmp, DEFAULT) a
		END

		IF @ListDept <> ''
		BEGIN
			INSERT INTO tblTR_PlanDept([PlanID],[Quantity],[DeptID])
			SELECT @PlanID, a.listValue, b.listValue 
			FROM GetTableFromList(@ListDeptQuantity, DEFAULT) a, GetTableFromList(@ListDept, DEFAULT) b
			WHERE a.listNo = b.listNo
		END
	
	END
	ELSE
	BEGIN

		 INSERT INTO tblTR_TrainingPlan ([CourseDesc] , [Year] , [FromDate] , [ToDate] , [Duration] , [IsAddition] , [Method] , [LearningEval] , [BusImpEval] , [ReactionEval] , [StatusID] , [CompanyID] , [DeptID] , [CourseID] , [ProviderID] , [TeacherID] 
										, IsNoOfPart, [IsOther], [LossCategoryID], TrainLocation )
		 VALUES 
		(@CourseDesc, @Year , Convert(datetime,@FromDate,103), Convert(datetime,@ToDate,103), @Duration, @IsAddition, @Method, @LearningEval, @BusImpEval, @ReactionEval, 1, @CompanyID, @DeptID, @CourseID, @ProviderID, @TeacherID , @IsNoOfPart, @IsOther
, @LossCategoryID, @TrainLocation)
		
		SET @PlanID = SCOPE_IDENTITY()

		-- Budget
		IF @ListAccountCode <> ''
		BEGIN
			INSERT INTO tblTR_PlanBudget([PlanID],[PlanCost],[AccountCodeID])
			SELECT @PlanID, a.listValue, b.listValue 
			FROM GetTableFromList(@ListPlanCost, DEFAULT) a, GetTableFromList(@ListAccountCode, DEFAULT) b
			WHERE a.listNo = b.listNo
		END

		-- Emp/Dept
		IF @ListEmp <> ''
		BEGIN
			INSERT INTO tblTR_PlanEmp([PlanID],[EmpID])
			SELECT @PlanID, a.listValue
			FROM GetTableFromList(@ListEmp, DEFAULT) a
		END

		IF @ListDept <> ''
		BEGIN
			INSERT INTO tblTR_PlanDept([PlanID],[Quantity],[DeptID])
			SELECT @PlanID, a.listValue, b.listValue 
			FROM GetTableFromList(@ListDeptQuantity, DEFAULT) a, GetTableFromList(@ListDept, DEFAULT) b
			WHERE a.listNo = b.listNo
		END
		
		
	END
END

-- select a.listValue, b.listValue from GetTableFromList('af@aefws', DEFAULT) a, GetTableFromList('235@4565', DEFAULT) b
--vuhm

ELSE IF @Activity ='GetDataEmployeeTraining'
BEGIN
	SELECT 
		ROW_NUMBER() OVer (Order by em.EmployeeID) as STT,
		em.EmployeeID,
		em.FirstName + ' ' + em.LastName as FullName,
		tr.[Year],
		tr.CourseID	
	FROM
		tblHR_Employee em, 
		tblTR_PlanEmp pe,
		tblTR_TrainingPlan tr, 
		tblTR_PlanBudget bg, 
		tblLS_Course cr,
		tblTR_PlanDept pd
	WHERE 1=1
		and em.EmployeeID = pe.EmpID
		and pe.PlanID = tr.PlanID
		and tr.PlanID = bg.PlanID
		and tr.CourseID = cr.CourseID
		and tr.PlanID = pd.PlanID
END

-----------
-- PhuongDK
-- Load Data
ELSE IF @Activity ='GetDataByID'
BEGIN
	 SELECT 
		a.PlanID,
		a.Year,
		a.CourseDesc,
		Convert(nvarchar,a.FromDate, 103) as FromDate,
		Convert(nvarchar,a.ToDate, 103) as ToDate,
		a.Duration,
		a.IsAddition,
		a.Method,
		a.LearningEval,
		a.BusImpEval,
		a.ReactionEval,
		a.ReactionEval as IsReactionEval,
		a.StatusID,
		a.ReasonID,
		a.CompanyID,
		a.CourseID,
		a.ProviderID,
		a.TeacherID,
		a.IsNoOfPart,
		a.IsOther,
		a.LossCategoryID,-- = Isnull(a.LossCategoryID,'-1'),
		b.CompanyName,
		c.CourseName,
		IsNull(d.CourseTypeID,-1) as CourseTypeID,
		d.CourseTypeName,
		e.DeptID,
		e.DeptName,
		f.StatusName,
		g.ReasonName,a.TrainLocation

	 FROM tblTR_TrainingPlan a left join tblLS_Company b on a.CompanyID = b.CompanyID
							   left join tblLS_Course c on a.CourseID = c.CourseID
							   left join tblLS_CourseType d on c.CourseTypeID = d.CourseTypeID
							   left join tblLS_Dept e on a.DeptID = e.DeptID
							   left join tblLS_TrainingStatus f on a.StatusID = f.StatusID
							   left join tblLS_TrainingStatusReason g on a.ReasonID = g.ReasonID
	 WHERE
		[PlanID] = @PlanID

	-- spfrmTR_TrainingPlan @Activity ='GetDataByID', @PlanID=50
END

ELSE IF @Activity ='GetBudgetByPlanID'
BEGIN
	 select a.PlanID, b.AccountCodeID, b.AccountCode, b.Description,a.PlanCost, 0 as ActualCost, a.PlanCost as NewCost, a.PlanCost as Cost
	 from tblTR_PlanBudget a, vLS_AccountCode b
	 where 
			a.AccountCodeID = b.AccountCodeID
	 AND	a.[PlanID] = @PlanID

	-- spfrmTR_TrainingPlan @Activity ='GetBudgetByPlanID', @PlanID=33
END

ELSE IF @Activity ='GetEmpByPlanID'
BEGIN
	 select a.PlanID, b.EmployeeID, b.EmployeeCode, b.FullName, c.JobTitleName, 0 as TrainingCost, d.DeptName, d.DeptID,
			-- temp field, do not remove code below
			'1' as STT, '' as ResultID, '' as ReactionEval_ID, '' as FileName,
			'' as ResultFail, '' as EndLearningContract, '' as Notes,
			'' as LineManagerName, '' as LineManager
	 from tblTR_PlanEmp a left join vHR_Employee b on a.EmpID = b.EmployeeID
						  left join tblLS_JobTitle c on b.JobTitleID = c.JobTitleID
						  left join tblLS_Dept d on b.DeptID = d.DeptID
	 where 
			a.[PlanID] = @PlanID

	-- spfrmTR_TrainingPlan @Activity ='GetEmpByPlanID', @PlanID=34
END

ELSE IF @Activity ='GetDeptByPlanID'
BEGIN
	 select a.*, b.DeptID, b.DeptName, a.Quantity, '1' as STT
	 from tblTR_PlanDept a left join tblLS_Dept b on a.DeptID = b.DeptID
	 where 	a.[PlanID] = @PlanID

	-- spfrmTR_TrainingPlan @Activity ='GetDeptByPlanID', @PlanID=26
END


ELSE IF @Activity ='GetDataPlanEmpByEmpID'
BEGIN
	 select 
		em.EmployeeID,
		em.EmployeeCode,
		em.FullName,
		pl.Year,
		convert(nvarchar,pl.FromDate,103) as FromDate,
		convert(nvarchar,pl.ToDate,103) as ToDate,
		pl.CourseDesc,
		co.CompanyName,
		cr.CourseName

	 from tblTR_PlanEmp pe	inner join vHR_Employee em			on pe.EmpID = em.EmployeeID
							inner join tblTR_TrainingPlan pl	on pe.PlanID = pl.PlanID
							left join tblLS_Company	co			on pl.CompanyID = co.CompanyID
							left join tblLS_Course cr			on pl.CourseID = cr.CourseID

	WHERE
		em.EmployeeID = @EmployeeID

	-- spfrmTR_TrainingPlan @Activity ='GetDataPlanEmpByEmpID' , @EmployeeID = 2
END

ELSE IF @Activity ='CheckPlan'
BEGIN
	 select * from tblTR_TrainingPlan
	 where FromDate = Convert(DateTime,@FromDate,103)
	 and   ToDate = Convert(DateTime,@ToDate,103)
	 and   CourseID = @CourseID
	and   CompanyID = @CompanyID

	-- spfrmTR_TrainingPlan @Activity ='CheckPlan' , @FromDate='05/05/2009', @ToDate='22/05/2009', @CourseID=20
END
GO
/****** Object:  Default [DF_tblLS_CourseType_Used]    Script Date: 03/05/2015 21:26:49 ******/
ALTER TABLE [dbo].[tblLS_CourseType] ADD  CONSTRAINT [DF_tblLS_CourseType_Used]  DEFAULT ((1)) FOR [Used]
GO
/****** Object:  Default [DF_tblLS_Message_Used]    Script Date: 03/05/2015 21:26:49 ******/
ALTER TABLE [dbo].[tblLS_Message] ADD  CONSTRAINT [DF_tblLS_Message_Used]  DEFAULT ((1)) FOR [Used]
GO
/****** Object:  Default [DF_tblLS_Skill_Rank]    Script Date: 03/05/2015 21:26:50 ******/
ALTER TABLE [dbo].[tblLS_Skill] ADD  CONSTRAINT [DF_tblLS_Skill_Rank]  DEFAULT ((1)) FOR [Rank]
GO
/****** Object:  Default [DF_tblTR_TrainingRequest_MailNotify]    Script Date: 03/05/2015 21:26:50 ******/
ALTER TABLE [dbo].[tblTR_TrainingRequest] ADD  CONSTRAINT [DF_tblTR_TrainingRequest_MailNotify]  DEFAULT ((1)) FOR [MailNotify]
GO
/****** Object:  Default [DF_tblIMP_ErrorLog_DateID]    Script Date: 03/05/2015 21:26:52 ******/
ALTER TABLE [dbo].[tblIMP_ErrorLog] ADD  CONSTRAINT [DF_tblIMP_ErrorLog_DateID]  DEFAULT (getdate()) FOR [DateID]
GO
/****** Object:  Default [DF_tblDataTraineesList_Level3]    Script Date: 03/05/2015 21:26:52 ******/
ALTER TABLE [dbo].[tblDataTraineesList] ADD  CONSTRAINT [DF_tblDataTraineesList_Level3]  DEFAULT ((0)) FOR [Level3]
GO
/****** Object:  Default [DF_tblTR_TrainingPlan_IsNoOfPart]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainingPlan] ADD  CONSTRAINT [DF_tblTR_TrainingPlan_IsNoOfPart]  DEFAULT ((0)) FOR [IsNoOfPart]
GO
/****** Object:  Default [DF_tblLS_TableField_Visible]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TableField] ADD  CONSTRAINT [DF_tblLS_TableField_Visible]  DEFAULT ((1)) FOR [Visible]
GO
/****** Object:  Default [DF_tblLS_TableField_Enable]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TableField] ADD  CONSTRAINT [DF_tblLS_TableField_Enable]  DEFAULT ((1)) FOR [Enable]
GO
/****** Object:  Default [DF_tblLS_TableField_IsKey]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TableField] ADD  CONSTRAINT [DF_tblLS_TableField_IsKey]  DEFAULT ((0)) FOR [IsKey]
GO
/****** Object:  Default [DF_tblLS_TableField_IsRequire]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TableField] ADD  CONSTRAINT [DF_tblLS_TableField_IsRequire]  DEFAULT ((0)) FOR [IsRequire]
GO
/****** Object:  Default [DF_tblLS_TableField_IsCode]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TableField] ADD  CONSTRAINT [DF_tblLS_TableField_IsCode]  DEFAULT ((0)) FOR [IsCode]
GO
/****** Object:  Default [DF_tblLS_TableField_IsMultiLine]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TableField] ADD  CONSTRAINT [DF_tblLS_TableField_IsMultiLine]  DEFAULT ((0)) FOR [IsMultiLine]
GO
/****** Object:  Default [DF_tblLS_ChkLstCategory_Used]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_ChkLstCategory] ADD  CONSTRAINT [DF_tblLS_ChkLstCategory_Used]  DEFAULT ((1)) FOR [Used]
GO
/****** Object:  Default [DF_tblLS_Course_Used]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Course] ADD  CONSTRAINT [DF_tblLS_Course_Used]  DEFAULT ((1)) FOR [Used]
GO
/****** Object:  Default [DF_tblLS_Section_Used]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Section] ADD  CONSTRAINT [DF_tblLS_Section_Used]  DEFAULT ((1)) FOR [Used]
GO
/****** Object:  Default [DF_tblTR_PlanBudget_PlanCost]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_PlanBudget] ADD  CONSTRAINT [DF_tblTR_PlanBudget_PlanCost]  DEFAULT ((0)) FOR [PlanCost]
GO
/****** Object:  Default [DF_tblLS_Area_Used]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Area] ADD  CONSTRAINT [DF_tblLS_Area_Used]  DEFAULT ((1)) FOR [Used]
GO
/****** Object:  Default [DF_tblHR_Employee_GenderCode]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_Employee] ADD  CONSTRAINT [DF_tblHR_Employee_GenderCode]  DEFAULT ((1)) FOR [GenderCode]
GO
/****** Object:  Default [DF_tblTR_TrainResultEmp_TrainingCost]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainResultEmp] ADD  CONSTRAINT [DF_tblTR_TrainResultEmp_TrainingCost]  DEFAULT ((0)) FOR [TrainingCost]
GO
/****** Object:  Default [DF_tblTR_TrainResultDept_Quantity]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainResultDept] ADD  CONSTRAINT [DF_tblTR_TrainResultDept_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
/****** Object:  ForeignKey [R_203]    Script Date: 03/05/2015 21:26:52 ******/
ALTER TABLE [dbo].[tblASS_ChkLstDetail]  WITH CHECK ADD  CONSTRAINT [R_203] FOREIGN KEY([CheckListID])
REFERENCES [dbo].[tblASS_CheckList] ([CheckListID])
GO
ALTER TABLE [dbo].[tblASS_ChkLstDetail] CHECK CONSTRAINT [R_203]
GO
/****** Object:  ForeignKey [FK_tblLS_Dept_tblLS_Company]    Script Date: 03/05/2015 21:26:52 ******/
ALTER TABLE [dbo].[tblLS_Dept]  WITH NOCHECK ADD  CONSTRAINT [FK_tblLS_Dept_tblLS_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tblLS_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tblLS_Dept] CHECK CONSTRAINT [FK_tblLS_Dept_tblLS_Company]
GO
/****** Object:  ForeignKey [FK_tblASS_AssessEmpSkill_tblLS_Skill]    Script Date: 03/05/2015 21:26:52 ******/
ALTER TABLE [dbo].[tblASS_AssessEmpSkill]  WITH CHECK ADD  CONSTRAINT [FK_tblASS_AssessEmpSkill_tblLS_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[tblLS_Skill] ([SkillID])
GO
ALTER TABLE [dbo].[tblASS_AssessEmpSkill] CHECK CONSTRAINT [FK_tblASS_AssessEmpSkill_tblLS_Skill]
GO
/****** Object:  ForeignKey [R_202]    Script Date: 03/05/2015 21:26:52 ******/
ALTER TABLE [dbo].[tblASS_AssessEmpSkill]  WITH CHECK ADD  CONSTRAINT [R_202] FOREIGN KEY([CheckListID])
REFERENCES [dbo].[tblASS_CheckList] ([CheckListID])
GO
ALTER TABLE [dbo].[tblASS_AssessEmpSkill] CHECK CONSTRAINT [R_202]
GO
/****** Object:  ForeignKey [R_200]    Script Date: 03/05/2015 21:26:52 ******/
ALTER TABLE [dbo].[tblASS_AssessEmp]  WITH CHECK ADD  CONSTRAINT [R_200] FOREIGN KEY([AssID])
REFERENCES [dbo].[tblASS_Assessment] ([AssID])
GO
ALTER TABLE [dbo].[tblASS_AssessEmp] CHECK CONSTRAINT [R_200]
GO
/****** Object:  ForeignKey [FK_tblTR_TrainingPlan_tblLS_LossCategory]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainingPlan]  WITH CHECK ADD  CONSTRAINT [FK_tblTR_TrainingPlan_tblLS_LossCategory] FOREIGN KEY([LossCategoryID])
REFERENCES [dbo].[tblLS_LossCategory] ([LossCategoryID])
GO
ALTER TABLE [dbo].[tblTR_TrainingPlan] CHECK CONSTRAINT [FK_tblTR_TrainingPlan_tblLS_LossCategory]
GO
/****** Object:  ForeignKey [FK_tblLS_SkillCourse_tblLS_Skill]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_SkillCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_SkillCourse_tblLS_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[tblLS_Skill] ([SkillID])
GO
ALTER TABLE [dbo].[tblLS_SkillCourse] CHECK CONSTRAINT [FK_tblLS_SkillCourse_tblLS_Skill]
GO
/****** Object:  ForeignKey [R_24]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Trainer]  WITH CHECK ADD  CONSTRAINT [R_24] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[tblLS_Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[tblLS_Trainer] CHECK CONSTRAINT [R_24]
GO
/****** Object:  ForeignKey [FK_tblLS_Table_tblLS_TableField]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TableField]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_Table_tblLS_TableField] FOREIGN KEY([TableID])
REFERENCES [dbo].[tblLS_Table] ([TableID])
GO
ALTER TABLE [dbo].[tblLS_TableField] CHECK CONSTRAINT [FK_tblLS_Table_tblLS_TableField]
GO
/****** Object:  ForeignKey [R_101]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_OverTrainEffDetail]  WITH CHECK ADD  CONSTRAINT [R_101] FOREIGN KEY([OverTrainEff_ID])
REFERENCES [dbo].[tblTR_OverTrainEff] ([OverTrainEff_ID])
GO
ALTER TABLE [dbo].[tblTR_OverTrainEffDetail] CHECK CONSTRAINT [R_101]
GO
/****** Object:  ForeignKey [R_36]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_OverTrainEffDetail]  WITH CHECK ADD  CONSTRAINT [R_36] FOREIGN KEY([OverTrainEff_ID])
REFERENCES [dbo].[tblTR_OverTrainEff] ([OverTrainEff_ID])
GO
ALTER TABLE [dbo].[tblTR_OverTrainEffDetail] CHECK CONSTRAINT [R_36]
GO
/****** Object:  ForeignKey [FK_tblLS_TrainingStatusReason_tblLS_TrainingStatus]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TrainingStatusReason]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_TrainingStatusReason_tblLS_TrainingStatus] FOREIGN KEY([TrainingStatusID])
REFERENCES [dbo].[tblLS_TrainingStatus] ([StatusID])
GO
ALTER TABLE [dbo].[tblLS_TrainingStatusReason] CHECK CONSTRAINT [FK_tblLS_TrainingStatusReason_tblLS_TrainingStatus]
GO
/****** Object:  ForeignKey [R_13]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_ProviderEval]  WITH CHECK ADD  CONSTRAINT [R_13] FOREIGN KEY([ProviderID])
REFERENCES [dbo].[tblLS_Provider] ([ProviderID])
GO
ALTER TABLE [dbo].[tblLS_ProviderEval] CHECK CONSTRAINT [R_13]
GO
/****** Object:  ForeignKey [R_14]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_ProviderEval]  WITH CHECK ADD  CONSTRAINT [R_14] FOREIGN KEY([ProEvalCateID])
REFERENCES [dbo].[tblLS_ProEvalCategory] ([ProEvalCateID])
GO
ALTER TABLE [dbo].[tblLS_ProviderEval] CHECK CONSTRAINT [R_14]
GO
/****** Object:  ForeignKey [FK_tblLS_ChkLstCategory_tblLS_ChkLstCategoryGroup]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_ChkLstCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_ChkLstCategory_tblLS_ChkLstCategoryGroup] FOREIGN KEY([ChkLstCateGroupID])
REFERENCES [dbo].[tblLS_ChkLstCategoryGroup] ([ChkLstCateGroupID])
GO
ALTER TABLE [dbo].[tblLS_ChkLstCategory] CHECK CONSTRAINT [FK_tblLS_ChkLstCategory_tblLS_ChkLstCategoryGroup]
GO
/****** Object:  ForeignKey [FK_tblLS_CheckListTemp_tblLS_Skill]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_CheckListTemp]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_CheckListTemp_tblLS_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[tblLS_Skill] ([SkillID])
GO
ALTER TABLE [dbo].[tblLS_CheckListTemp] CHECK CONSTRAINT [FK_tblLS_CheckListTemp_tblLS_Skill]
GO
/****** Object:  ForeignKey [R_35]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_CheckListTemp]  WITH CHECK ADD  CONSTRAINT [R_35] FOREIGN KEY([SkillID])
REFERENCES [dbo].[tblLS_Skill] ([SkillID])
GO
ALTER TABLE [dbo].[tblLS_CheckListTemp] CHECK CONSTRAINT [R_35]
GO
/****** Object:  ForeignKey [R_33]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_LnEvalCategory]  WITH CHECK ADD  CONSTRAINT [R_33] FOREIGN KEY([LnEvalCateGroupID])
REFERENCES [dbo].[tblLS_LnEvalCateGroup] ([LnEvalCateGroupID])
GO
ALTER TABLE [dbo].[tblLS_LnEvalCategory] CHECK CONSTRAINT [R_33]
GO
/****** Object:  ForeignKey [FK_tblLS_Course_tblLS_Company]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Course]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_Course_tblLS_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tblLS_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tblLS_Course] CHECK CONSTRAINT [FK_tblLS_Course_tblLS_Company]
GO
/****** Object:  ForeignKey [R_23]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Course]  WITH CHECK ADD  CONSTRAINT [R_23] FOREIGN KEY([CourseTypeID])
REFERENCES [dbo].[tblLS_CourseType] ([CourseTypeID])
GO
ALTER TABLE [dbo].[tblLS_Course] CHECK CONSTRAINT [R_23]
GO
/****** Object:  ForeignKey [FK_tblLS_Document_tblLS_Skill]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Document]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_Document_tblLS_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[tblLS_Skill] ([SkillID])
GO
ALTER TABLE [dbo].[tblLS_Document] CHECK CONSTRAINT [FK_tblLS_Document_tblLS_Skill]
GO
/****** Object:  ForeignKey [R_10]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Document]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([DocDomainID])
REFERENCES [dbo].[tblLS_DocDomain] ([DocDomainID])
GO
ALTER TABLE [dbo].[tblLS_Document] CHECK CONSTRAINT [R_10]
GO
/****** Object:  ForeignKey [R_28]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Document]  WITH CHECK ADD  CONSTRAINT [R_28] FOREIGN KEY([CourseID])
REFERENCES [dbo].[tblLS_Course] ([CourseID])
GO
ALTER TABLE [dbo].[tblLS_Document] CHECK CONSTRAINT [R_28]
GO
/****** Object:  ForeignKey [R_9]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Document]  WITH CHECK ADD  CONSTRAINT [R_9] FOREIGN KEY([DocTypeID])
REFERENCES [dbo].[tblLS_DocType] ([DocTypeID])
GO
ALTER TABLE [dbo].[tblLS_Document] CHECK CONSTRAINT [R_9]
GO
/****** Object:  ForeignKey [R_17]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Section]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([DeptID])
REFERENCES [dbo].[tblLS_Dept] ([DeptID])
GO
ALTER TABLE [dbo].[tblLS_Section] CHECK CONSTRAINT [R_17]
GO
/****** Object:  ForeignKey [R_25]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_TrainerCourse]  WITH CHECK ADD  CONSTRAINT [R_25] FOREIGN KEY([TrainerID])
REFERENCES [dbo].[tblLS_Trainer] ([TrainerID])
GO
ALTER TABLE [dbo].[tblLS_TrainerCourse] CHECK CONSTRAINT [R_25]
GO
/****** Object:  ForeignKey [FK_tblLS_AccountCode_tblLS_Company]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_AccountCode]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_AccountCode_tblLS_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tblLS_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tblLS_AccountCode] CHECK CONSTRAINT [FK_tblLS_AccountCode_tblLS_Company]
GO
/****** Object:  ForeignKey [R_20]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_AccountCode]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([DeptID])
REFERENCES [dbo].[tblLS_Dept] ([DeptID])
GO
ALTER TABLE [dbo].[tblLS_AccountCode] CHECK CONSTRAINT [R_20]
GO
/****** Object:  ForeignKey [R_104]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_PlanEmp]  WITH CHECK ADD  CONSTRAINT [R_104] FOREIGN KEY([PlanID])
REFERENCES [dbo].[tblTR_TrainingPlan] ([PlanID])
GO
ALTER TABLE [dbo].[tblTR_PlanEmp] CHECK CONSTRAINT [R_104]
GO
/****** Object:  ForeignKey [R_103]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_PlanDept]  WITH CHECK ADD  CONSTRAINT [R_103] FOREIGN KEY([PlanID])
REFERENCES [dbo].[tblTR_TrainingPlan] ([PlanID])
GO
ALTER TABLE [dbo].[tblTR_PlanDept] CHECK CONSTRAINT [R_103]
GO
/****** Object:  ForeignKey [R_16]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_PlanDept]  WITH CHECK ADD  CONSTRAINT [R_16] FOREIGN KEY([PlanID])
REFERENCES [dbo].[tblTR_TrainingPlan] ([PlanID])
GO
ALTER TABLE [dbo].[tblTR_PlanDept] CHECK CONSTRAINT [R_16]
GO
/****** Object:  ForeignKey [R_102]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_PlanBudget]  WITH CHECK ADD  CONSTRAINT [R_102] FOREIGN KEY([PlanID])
REFERENCES [dbo].[tblTR_TrainingPlan] ([PlanID])
GO
ALTER TABLE [dbo].[tblTR_PlanBudget] CHECK CONSTRAINT [R_102]
GO
/****** Object:  ForeignKey [R_105]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainingResult]  WITH CHECK ADD  CONSTRAINT [R_105] FOREIGN KEY([PlanID])
REFERENCES [dbo].[tblTR_TrainingPlan] ([PlanID])
GO
ALTER TABLE [dbo].[tblTR_TrainingResult] CHECK CONSTRAINT [R_105]
GO
/****** Object:  ForeignKey [R_26]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_ChkLstTempDetail]  WITH CHECK ADD  CONSTRAINT [R_26] FOREIGN KEY([CheckListTempID])
REFERENCES [dbo].[tblLS_CheckListTemp] ([CheckListTempID])
GO
ALTER TABLE [dbo].[tblLS_ChkLstTempDetail] CHECK CONSTRAINT [R_26]
GO
/****** Object:  ForeignKey [R_27]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_ChkLstTempDetail]  WITH CHECK ADD  CONSTRAINT [R_27] FOREIGN KEY([ChkLstCateID])
REFERENCES [dbo].[tblLS_ChkLstCategory] ([ChkLstCateID])
GO
ALTER TABLE [dbo].[tblLS_ChkLstTempDetail] CHECK CONSTRAINT [R_27]
GO
/****** Object:  ForeignKey [FK_tblHR_Employee_tblLS_Company]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_Employee_OLD]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_Employee_tblLS_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tblLS_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tblHR_Employee_OLD] CHECK CONSTRAINT [FK_tblHR_Employee_tblLS_Company]
GO
/****** Object:  ForeignKey [FK_tblHR_Employee_tblLS_Dept]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_Employee_OLD]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_Employee_tblLS_Dept] FOREIGN KEY([DeptID])
REFERENCES [dbo].[tblLS_Dept] ([DeptID])
GO
ALTER TABLE [dbo].[tblHR_Employee_OLD] CHECK CONSTRAINT [FK_tblHR_Employee_tblLS_Dept]
GO
/****** Object:  ForeignKey [R_18]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_Area]  WITH CHECK ADD  CONSTRAINT [R_18] FOREIGN KEY([SectionID])
REFERENCES [dbo].[tblLS_Section] ([SectionID])
GO
ALTER TABLE [dbo].[tblLS_Area] CHECK CONSTRAINT [R_18]
GO
/****** Object:  ForeignKey [FK_Emp_Company]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Emp_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tblLS_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tblHR_Employee] CHECK CONSTRAINT [FK_Emp_Company]
GO
/****** Object:  ForeignKey [FK_Emp_Dept]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Emp_Dept] FOREIGN KEY([DeptID])
REFERENCES [dbo].[tblLS_Dept] ([DeptID])
GO
ALTER TABLE [dbo].[tblHR_Employee] CHECK CONSTRAINT [FK_Emp_Dept]
GO
/****** Object:  ForeignKey [FK_Emp_JobLevel]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Emp_JobLevel] FOREIGN KEY([JobLevelID])
REFERENCES [dbo].[tblLS_JobLevel] ([JobLevelID])
GO
ALTER TABLE [dbo].[tblHR_Employee] CHECK CONSTRAINT [FK_Emp_JobLevel]
GO
/****** Object:  ForeignKey [FK_Emp_JobTitle]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Emp_JobTitle] FOREIGN KEY([JobTitleID])
REFERENCES [dbo].[tblLS_JobTitle] ([JobTitleID])
GO
ALTER TABLE [dbo].[tblHR_Employee] CHECK CONSTRAINT [FK_Emp_JobTitle]
GO
/****** Object:  ForeignKey [FK_Emp_Section]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_Employee]  WITH CHECK ADD  CONSTRAINT [FK_Emp_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[tblLS_Section] ([SectionID])
GO
ALTER TABLE [dbo].[tblHR_Employee] CHECK CONSTRAINT [FK_Emp_Section]
GO
/****** Object:  ForeignKey [R_107]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainResultEmp]  WITH CHECK ADD  CONSTRAINT [R_107] FOREIGN KEY([ResultID])
REFERENCES [dbo].[tblTR_TrainingResult] ([ResultID])
GO
ALTER TABLE [dbo].[tblTR_TrainResultEmp] CHECK CONSTRAINT [R_107]
GO
/****** Object:  ForeignKey [FK_tblTR_TrainResultDept_tblLS_Dept]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainResultDept]  WITH CHECK ADD  CONSTRAINT [FK_tblTR_TrainResultDept_tblLS_Dept] FOREIGN KEY([DeptID])
REFERENCES [dbo].[tblLS_Dept] ([DeptID])
GO
ALTER TABLE [dbo].[tblTR_TrainResultDept] CHECK CONSTRAINT [FK_tblTR_TrainResultDept_tblLS_Dept]
GO
/****** Object:  ForeignKey [FK_tblTR_TrainResultDept_tblTR_TrainingResult]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainResultDept]  WITH CHECK ADD  CONSTRAINT [FK_tblTR_TrainResultDept_tblTR_TrainingResult] FOREIGN KEY([ResultID])
REFERENCES [dbo].[tblTR_TrainingResult] ([ResultID])
GO
ALTER TABLE [dbo].[tblTR_TrainResultDept] CHECK CONSTRAINT [FK_tblTR_TrainResultDept_tblTR_TrainingResult]
GO
/****** Object:  ForeignKey [R_106]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainResultCost]  WITH CHECK ADD  CONSTRAINT [R_106] FOREIGN KEY([ResultID])
REFERENCES [dbo].[tblTR_TrainingResult] ([ResultID])
GO
ALTER TABLE [dbo].[tblTR_TrainResultCost] CHECK CONSTRAINT [R_106]
GO
/****** Object:  ForeignKey [R_51]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainResultCost]  WITH CHECK ADD  CONSTRAINT [R_51] FOREIGN KEY([ResultID])
REFERENCES [dbo].[tblTR_TrainingResult] ([ResultID])
GO
ALTER TABLE [dbo].[tblTR_TrainResultCost] CHECK CONSTRAINT [R_51]
GO
/****** Object:  ForeignKey [R_29]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_SkillArea]  WITH CHECK ADD  CONSTRAINT [R_29] FOREIGN KEY([AreaID])
REFERENCES [dbo].[tblLS_Area] ([AreaID])
GO
ALTER TABLE [dbo].[tblLS_SkillArea] CHECK CONSTRAINT [R_29]
GO
/****** Object:  ForeignKey [R_30]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblLS_SkillArea]  WITH CHECK ADD  CONSTRAINT [R_30] FOREIGN KEY([SkillID])
REFERENCES [dbo].[tblLS_Skill] ([SkillID])
GO
ALTER TABLE [dbo].[tblLS_SkillArea] CHECK CONSTRAINT [R_30]
GO
/****** Object:  ForeignKey [FK_tblHR_EmpDelegate_tblHR_Employee]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_EmpDelegateTo]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_EmpDelegate_tblHR_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_EmpDelegateTo] CHECK CONSTRAINT [FK_tblHR_EmpDelegate_tblHR_Employee]
GO
/****** Object:  ForeignKey [FK_tblHR_EmpDelegate_tblHR_Employee1]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_EmpDelegateTo]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_EmpDelegate_tblHR_Employee1] FOREIGN KEY([EmpDelegateID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_EmpDelegateTo] CHECK CONSTRAINT [FK_tblHR_EmpDelegate_tblHR_Employee1]
GO
/****** Object:  ForeignKey [R_12]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_CertificationHistory]  WITH CHECK ADD  CONSTRAINT [R_12] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_CertificationHistory] CHECK CONSTRAINT [R_12]
GO
/****** Object:  ForeignKey [FK_tblHR_AssEmpReportTo_tblHR_Employee]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_AssEmpReportTo]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_AssEmpReportTo_tblHR_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_AssEmpReportTo] CHECK CONSTRAINT [FK_tblHR_AssEmpReportTo_tblHR_Employee]
GO
/****** Object:  ForeignKey [FK_tblHR_AssEmpReportTo_tblHR_Employee1]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_AssEmpReportTo]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_AssEmpReportTo_tblHR_Employee1] FOREIGN KEY([ReportToID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_AssEmpReportTo] CHECK CONSTRAINT [FK_tblHR_AssEmpReportTo_tblHR_Employee1]
GO
/****** Object:  ForeignKey [FK_tblHR_AssEmpReportTo_tblLS_AssRoles]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_AssEmpReportTo]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_AssEmpReportTo_tblLS_AssRoles] FOREIGN KEY([AssRoleID])
REFERENCES [dbo].[tblLS_AssRoles] ([AssRoleID])
GO
ALTER TABLE [dbo].[tblHR_AssEmpReportTo] CHECK CONSTRAINT [FK_tblHR_AssEmpReportTo_tblLS_AssRoles]
GO
/****** Object:  ForeignKey [R_8]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_WorkingHistory]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_WorkingHistory] CHECK CONSTRAINT [R_8]
GO
/****** Object:  ForeignKey [FK_tblHR_EmpReportTo_tblHR_Employee]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_EmpReportTo]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_EmpReportTo_tblHR_Employee] FOREIGN KEY([ReportToID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_EmpReportTo] CHECK CONSTRAINT [FK_tblHR_EmpReportTo_tblHR_Employee]
GO
/****** Object:  ForeignKey [FK_tblHR_EmpReportTo_tblLS_Roles]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_EmpReportTo]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_EmpReportTo_tblLS_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tblLS_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[tblHR_EmpReportTo] CHECK CONSTRAINT [FK_tblHR_EmpReportTo_tblLS_Roles]
GO
/****** Object:  ForeignKey [R_EmpReportTo]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_EmpReportTo]  WITH CHECK ADD  CONSTRAINT [R_EmpReportTo] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_EmpReportTo] CHECK CONSTRAINT [R_EmpReportTo]
GO
/****** Object:  ForeignKey [FK_tblHR_EmployeeArea_tblLS_Area]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_EmployeeArea]  WITH CHECK ADD  CONSTRAINT [FK_tblHR_EmployeeArea_tblLS_Area] FOREIGN KEY([AreaID])
REFERENCES [dbo].[tblLS_Area] ([AreaID])
GO
ALTER TABLE [dbo].[tblHR_EmployeeArea] CHECK CONSTRAINT [FK_tblHR_EmployeeArea_tblLS_Area]
GO
/****** Object:  ForeignKey [FK_tblLS_EmpArea_tblHR_Employee]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblHR_EmployeeArea]  WITH CHECK ADD  CONSTRAINT [FK_tblLS_EmpArea_tblHR_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblHR_EmployeeArea] CHECK CONSTRAINT [FK_tblLS_EmpArea_tblHR_Employee]
GO
/****** Object:  ForeignKey [FK_tblTR_TrainingRequestEmp_tblHR_Employee]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainingRequestEmp]  WITH CHECK ADD  CONSTRAINT [FK_tblTR_TrainingRequestEmp_tblHR_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblHR_Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[tblTR_TrainingRequestEmp] CHECK CONSTRAINT [FK_tblTR_TrainingRequestEmp_tblHR_Employee]
GO
/****** Object:  ForeignKey [FK_tblTR_TrainingRequestEmp_tblTR_TrainingRequest]    Script Date: 03/05/2015 21:26:53 ******/
ALTER TABLE [dbo].[tblTR_TrainingRequestEmp]  WITH CHECK ADD  CONSTRAINT [FK_tblTR_TrainingRequestEmp_tblTR_TrainingRequest] FOREIGN KEY([RequestID])
REFERENCES [dbo].[tblTR_TrainingRequest] ([RequestID])
GO
ALTER TABLE [dbo].[tblTR_TrainingRequestEmp] CHECK CONSTRAINT [FK_tblTR_TrainingRequestEmp_tblTR_TrainingRequest]
GO
