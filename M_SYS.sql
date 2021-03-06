USE [master]
GO
/****** Object:  Database [HRMCore_SYS]    Script Date: 03/05/2015 21:26:06 ******/
CREATE DATABASE [HRMCore_SYS] ON  PRIMARY 
( NAME = N'iHRP_VBL_SYS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\iHRP_VBL_SYS.mdf' , SIZE = 3392KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'iHRP_VBL_SYS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\iHRP_VBL_SYS_1.ldf' , SIZE = 388544KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HRMCore_SYS] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRMCore_SYS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HRMCore_SYS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [HRMCore_SYS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [HRMCore_SYS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [HRMCore_SYS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [HRMCore_SYS] SET ARITHABORT OFF
GO
ALTER DATABASE [HRMCore_SYS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [HRMCore_SYS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [HRMCore_SYS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [HRMCore_SYS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [HRMCore_SYS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [HRMCore_SYS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [HRMCore_SYS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [HRMCore_SYS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [HRMCore_SYS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [HRMCore_SYS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [HRMCore_SYS] SET  DISABLE_BROKER
GO
ALTER DATABASE [HRMCore_SYS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [HRMCore_SYS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [HRMCore_SYS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [HRMCore_SYS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [HRMCore_SYS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [HRMCore_SYS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [HRMCore_SYS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [HRMCore_SYS] SET  READ_WRITE
GO
ALTER DATABASE [HRMCore_SYS] SET RECOVERY FULL
GO
ALTER DATABASE [HRMCore_SYS] SET  MULTI_USER
GO
ALTER DATABASE [HRMCore_SYS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [HRMCore_SYS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'HRMCore_SYS', N'ON'
GO
USE [HRMCore_SYS]
GO
/****** Object:  User [traning]    Script Date: 03/05/2015 21:26:06 ******/
CREATE USER [traning] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [training]    Script Date: 03/05/2015 21:26:06 ******/
CREATE USER [training] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[hrm_Registry]    Script Date: 03/05/2015 21:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hrm_Registry](
	[RegistryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[VALUE] [ntext] NULL,
	[BoardID] [int] NULL,
 CONSTRAINT [PK_hrm_Registry] PRIMARY KEY CLUSTERED 
(
	[RegistryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hrm_Replace_Words]    Script Date: 03/05/2015 21:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hrm_Replace_Words](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[badword] [nvarchar](255) NULL,
	[goodword] [nvarchar](255) NULL,
 CONSTRAINT [PK_hrm_Replace_Words] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_Common]    Script Date: 03/05/2015 21:26:10 ******/
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
/****** Object:  Table [dbo].[tblSYS_UserRightNot]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_UserRightNot](
	[UserRightNotID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionID] [int] NOT NULL,
	[yPermission] [tinyint] NOT NULL,
	[FRun] [int] NOT NULL,
	[FEdit] [int] NOT NULL,
	[FDel] [int] NOT NULL,
	[FAdd] [int] NOT NULL,
	[FApp] [int] NOT NULL,
 CONSTRAINT [PK_tblSYS_UserRightNot] PRIMARY KEY CLUSTERED 
(
	[UserRightNotID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_UserRight]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_UserRight](
	[UserRightID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[FunctionID] [int] NOT NULL,
	[yPermission] [tinyint] NOT NULL,
	[FRun] [int] NOT NULL,
	[FEdit] [int] NOT NULL,
	[FDel] [int] NOT NULL,
	[FAdd] [int] NOT NULL,
	[FApp] [int] NOT NULL,
 CONSTRAINT [PK_tblSYS_UserRight] PRIMARY KEY CLUSTERED 
(
	[UserRightID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_UserPermission]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_UserPermission](
	[UserID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_tblSYS_UserPermission] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_UserGroup]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_UserGroup](
	[UserGroupID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[GroupID] [int] NULL,
 CONSTRAINT [PK_tblSYS_UserGroup] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_UserDomain]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_UserDomain](
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[NotDisplay] [bit] NULL,
 CONSTRAINT [PK_tblSYS_UserDomain] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_UserDept]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_UserDept](
	[UserDeptID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LSCompanyID] [int] NULL,
	[LSDeptID] [int] NULL,
	[LSSectionID] [int] NULL,
 CONSTRAINT [PK_tblSYS_UserDept] PRIMARY KEY CLUSTERED 
(
	[UserDeptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_UserDataPermission]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_UserDataPermission](
	[UserDataPerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LSCompanyID] [int] NOT NULL,
	[LSDeptID] [int] NULL,
	[LSSectionID] [int] NULL,
	[AreaID] [int] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_tblSYS_UserDataPermission] PRIMARY KEY CLUSTERED 
(
	[UserDataPerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_UserDataNotPermission]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_UserDataNotPermission](
	[UserID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
 CONSTRAINT [PK_tblSYS_UserDataNotPermission] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_User]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[sUserName] [nvarchar](50) NULL,
	[sPassword] [nvarchar](50) NULL,
	[EmployeeID] [int] NULL,
	[Themes] [nvarchar](50) NULL,
	[IsLocal] [bit] NULL,
	[UserDomain] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSYS_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_Menu]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Parent] [int] NULL,
	[FunctionNameV] [nvarchar](200) NULL,
	[FunctionNameE] [nvarchar](200) NULL,
	[ModuleID] [nvarchar](50) NULL,
	[NavigateUrl] [nvarchar](50) NULL,
	[Rank] [tinyint] NULL,
	[Display] [bit] NULL,
	[LookId] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSYS_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_GroupRight]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_GroupRight](
	[GroupRightID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[FunctionID] [int] NOT NULL,
	[yPermission] [tinyint] NOT NULL,
	[FRun] [int] NOT NULL,
	[FEdit] [int] NOT NULL,
	[FDel] [int] NOT NULL,
	[FAdd] [int] NOT NULL,
	[FApp] [int] NOT NULL,
 CONSTRAINT [PK_tblSYS_GroupRight] PRIMARY KEY CLUSTERED 
(
	[GroupRightID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_Group]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[Note] [nvarchar](200) NULL,
	[GroupCode] [int] NULL,
 CONSTRAINT [PK_tblSYS_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_ConfigParam]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSYS_ConfigParam](
	[ID] [int] NULL,
	[Code] [varchar](50) NOT NULL,
	[Param] [nvarchar](200) NULL,
	[Value] [nvarchar](4000) NULL,
 CONSTRAINT [PK_tblSYS_ConfigParam] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSYS_CaptionLanguage]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_CaptionLanguage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[VN] [nvarchar](4000) NULL,
	[EN] [nvarchar](4000) NULL,
	[Notes] [nvarchar](4000) NULL,
 CONSTRAINT [PK_tblSYS_CaptionLanguage] PRIMARY KEY CLUSTERED 
(
	[FormID] ASC,
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSYS_CaptionFrmCtl]    Script Date: 03/05/2015 21:26:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSYS_CaptionFrmCtl](
	[AutoID] [bigint] IDENTITY(1,1) NOT NULL,
	[FormID] [nvarchar](100) NOT NULL,
	[ControlID] [nvarchar](30) NOT NULL,
	[ColumnIndex] [int] NULL,
	[CaptionCtl] [nvarchar](200) NULL,
	[CaptionVNCtl] [nvarchar](200) NULL,
	[CaptionENCtl] [nvarchar](200) NULL,
	[Parent] [nvarchar](100) NULL,
	[bShow] [tinyint] NULL,
 CONSTRAINT [PK_tblSYS_CaptionFrmCtl] PRIMARY KEY CLUSTERED 
(
	[AutoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tblLS_Section]    Script Date: 03/05/2015 21:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblLS_Section]
AS
SELECT     *
FROM         HRMCore.dbo.tblLS_Section AS tblLS_Section
GO
/****** Object:  StoredProcedure [dbo].[hrm_replace_words_save]    Script Date: 03/05/2015 21:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hrm_replace_words_save](
                @ID       INT  = NULL,
                @badword  NVARCHAR(255),
                @goodword NVARCHAR(255))
AS
    BEGIN
        IF @ID IS NULL 
            OR @ID = 0
        BEGIN
            INSERT INTO hrm_replace_words
                       (badword,
                        goodword)
            VALUES     (@badword,
                        @goodword)
        END
        ELSE
        BEGIN
            UPDATE hrm_replace_words
            SET    badword = @badword,
                   goodword = @goodword
            WHERE  ID = @ID
        END
    END
GO
/****** Object:  StoredProcedure [dbo].[hrm_replace_words_list]    Script Date: 03/05/2015 21:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hrm_replace_words_list]
AS
    BEGIN
        SELECT *
        FROM   hrm_Replace_Words
    END
GO
/****** Object:  StoredProcedure [dbo].[hrm_replace_words_edit]    Script Date: 03/05/2015 21:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hrm_replace_words_edit](
                @ID INT  = NULL)
AS
    BEGIN
        SELECT *
        FROM   hrm_replace_words
        WHERE  ID = @ID
    END
GO
/****** Object:  StoredProcedure [dbo].[hrm_replace_words_delete]    Script Date: 03/05/2015 21:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hrm_replace_words_delete](
                @ID INT)
AS
    BEGIN
        DELETE FROM dbo.hrm_replace_words
        WHERE       ID = @ID
    END
GO
/****** Object:  StoredProcedure [dbo].[hrm_registry_save]    Script Date: 03/05/2015 21:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hrm_registry_save](
                @Name    NVARCHAR(50),
                @Value   NTEXT  = NULL,
                @BoardID INT  = NULL)
AS
    BEGIN
        IF @BoardID IS NULL
        BEGIN
            IF EXISTS (SELECT 1
                       FROM   hrm_Registry
                       WHERE  Lower(Name) = Lower(@Name))
            UPDATE hrm_Registry
            SET    VALUE = @Value
            WHERE  Lower(Name) = Lower(@Name)
            AND BoardID IS NULL
            ELSE
            BEGIN
                INSERT INTO hrm_Registry
                           (Name,
                            VALUE)
                VALUES     (Lower(@Name),
                            @Value)
            END
        END
        ELSE
        BEGIN
            IF EXISTS (SELECT 1
                       FROM   hrm_Registry
                       WHERE  Lower(Name) = Lower(@Name)
                       AND BoardID = @BoardID)
            UPDATE hrm_Registry
            SET    VALUE = @Value
            WHERE  Lower(Name) = Lower(@Name)
            AND BoardID = @BoardID
            ELSE
            BEGIN
                INSERT INTO hrm_Registry
                           (Name,
                            VALUE,
                            BoardID)
                VALUES     (Lower(@Name),
                            @Value,
                            @BoardID)
            END
        END
    END
GO
/****** Object:  StoredProcedure [dbo].[hrm_registry_list]    Script Date: 03/05/2015 21:26:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hrm_registry_list](
                @Name    NVARCHAR(50)  = NULL,
                @BoardID INT  = NULL)
AS
    BEGIN
        IF @BoardID IS NULL
        BEGIN
            IF @Name IS NULL 
                OR @Name = ''
            BEGIN
                SELECT *
                FROM   hrm_Registry
                WHERE  BoardID IS NULL
            END
            ELSE
            BEGIN
                SELECT *
                FROM   hrm_Registry
                WHERE  Lower(Name) = Lower(@Name)
                AND BoardID IS NULL
            END
        END
        ELSE
        BEGIN
            IF @Name IS NULL 
                OR @Name = ''
            BEGIN
                SELECT *
                FROM   hrm_Registry
                WHERE  BoardID = @BoardID
            END
            ELSE
            BEGIN
                SELECT *
                FROM   hrm_Registry
                WHERE  Lower(Name) = Lower(@Name)
                AND BoardID = @BoardID
            END
        END
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_sysGetPermissionMenuGroup]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         function [dbo].[fn_sysGetPermissionMenuGroup](@UserID int, @MenuID int)
returns table
as
return	
	select  A.[UserID] ,B.[FunctionID] MenuID,B.[yPermission] ,B.[FRun] ,B.[FEdit] ,B.[FDel] ,B.[FAdd] ,B.[FApp]
		from tblSYS_UserGroup A
		inner join tblSYS_GroupRight B ON A.GroupID = B.GroupID
		where B.FunctionID = @MenuID and A.UserID = @UserID
GO
/****** Object:  UserDefinedFunction [dbo].[fn_sysGetPermissionMenu]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE         function [dbo].[fn_sysGetPermissionMenu](@UserID int, @MenuID int)
returns table
as
return	
select distinct * from
(
	
	select A.[UserID] ,A.[FunctionID] MenuID,A.[yPermission] ,A.[FRun] ,A.[FEdit] ,A.[FDel] ,A.[FAdd] ,A.[FApp]
		from tblSYS_UserRight A
		where A.FunctionID = @MenuID and A.UserID = @UserID
	union all
	select @MenuID [UserID],A.[FunctionID] MenuID,A.[yPermission] ,A.[FRun] ,A.[FEdit] ,A.[FDel] ,A.[FAdd] ,A.[FApp]
		from tblSYS_UserRightNot A
		where A.FunctionID = @MenuID 
	union all
	select 0 [UserID] ,@MenuID [FunctionID] ,10 ,1 [FRun] ,1 [FEdit] ,1 [FDel] ,1 [FAdd] ,1 [FApp]

) as AA where UserID = @UserID
GO
/****** Object:  UserDefinedFunction [dbo].[fn_sysGetEmpIDPermission]    Script Date: 03/05/2015 21:26:12 ******/
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
/****** Object:  StoredProcedure [dbo].[spfrmSYS_UserGroupRight]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tanldt>
-- Create date: <4/9/2008>
-- Description:	<Tạo phân quyền Group + User cho Menu>
-- =============================================
CREATE PROCEDURE [dbo].[spfrmSYS_UserGroupRight]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'VN',
@UserID			nvarchar(50) = null,
@ReturnMess			nvarchar(500) = null out,
@where	nvarchar(1000)=null,
@yPermission smallint = null
,@MenuID int = null
,@GroupID int = null
,@Parent int = null
,@FunctionNameV nvarchar(200) = null
,@FunctionNameE nvarchar(200) = null
,@ModuleID nvarchar(50) = null
,@NavigateUrl nvarchar(50) = null
,@Rank tinyint = null
,@Display bit = null
,@LookId nvarchar(50) = null
,@FRun bit = null
,@FEdit bit = null
,@FDel bit = null
,@FAdd bit = null
,@FApp bit = null
AS
BEGIN

if @Activity = 'GetAll'
BEGIN
	select @MenuID = MenuID FROM [dbo].[tblSYS_Menu] where [Parent] is null	and isnull(@ModuleID,'') = ModuleID

	SELECT A.[MenuID],A.[Parent],A.[FunctionNameV],A.[FunctionNameE],A.[ModuleID],A.[NavigateUrl]
		,A.[Rank],A.[Display] ,A.[LookId]
		,B.[FunctionNameV] ModuleName, C.GroupRightID, C.GroupID, C.yPermission
	FROM [dbo].[tblSYS_Menu] A
	left join [tblSYS_Menu] B On A.[ModuleID] = B.[ModuleID] and B.Parent is null
	left join tblSYS_GroupRight C On A.MenuID = C.FunctionID and GroupID = @GroupID
	where --(isnull(@MenuID,'') = '' or A.[Parent] = @MenuID)
	--and 
	(isnull(@ModuleID,'') = '' or A.ModuleID = @ModuleID)
	and isnull(A.[NavigateUrl],'') != ''
	and isnull(A.Role,'') != 'system' and A.display = 1
	order by isnull(B.[Rank],100),isnull(A.[Rank],100)
END
else if @Activity = 'DeleteByGroupID'
BEGIN
	delete A
	from [dbo].tblSYS_GroupRight A
	left join [dbo].[tblSYS_Menu] B On B.MenuID = A.FunctionID
	WHERE A.GroupID = @GroupID and (isnull(@ModuleID,'') = '' or B.ModuleID = @ModuleID)
END
else if @Activity = 'SaveByGroupID'
BEGIN
	if exists (select * from tblSYS_GroupRight WHERE FunctionID = @MenuID and GroupID = @GroupID)
		BEGIN
			set @ReturnMess = 'error'
			RETURN
		END

		INSERT INTO [dbo].[tblSYS_GroupRight] 
						(FunctionID ,GroupID,yPermission, FRun, FEdit, FDel, FAdd, FApp)
					VALUES (@MenuID ,@GroupID,@yPermission, @FRun, @FEdit, @FDel, @FAdd, @FApp)
END
else if @Activity = 'GetAllUser'
BEGIN
	select @MenuID = MenuID FROM [dbo].[tblSYS_Menu] where [Parent] is null	and isnull(@ModuleID,'') = ModuleID
	select @GroupID = GroupID FROM [dbo].tblSYS_UserGroup where UserID = @UserID

	SELECT A.[MenuID],A.[Parent],A.[FunctionNameV],A.[FunctionNameE],A.[ModuleID],A.[NavigateUrl]
		,A.[Rank],A.[Display] ,A.[LookId]
		,B.[FunctionNameV] ModuleName, C.UserRightID, C.UserID, C.yPermission yPermission
	FROM [dbo].[tblSYS_Menu] A
	left join [tblSYS_Menu] B On A.[ModuleID] = B.[ModuleID] and B.Parent is null
	left join tblSYS_UserRight C On A.MenuID = C.FunctionID  and C.UserID = @UserID
	left join tblSYS_GroupRight gr on A.MenuID = gr.FunctionID and gr.yPermission <> 0 and gr.GroupID = @GroupID
--select * from tblSYS_GroupRight
	where --(isnull(@MenuID,'') = '' or A.[Parent] = @MenuID)
	--and 
	(isnull(@ModuleID,'') = '' or A.ModuleID = @ModuleID)
	and isnull(A.[NavigateUrl],'') != ''
	and isnull(A.Role,'') != 'system' and A.Display = 1
	and gr.FunctionID is null
	order by isnull(B.[Rank],100),isnull(A.[Rank],100)
END
else if @Activity = 'DeleteByUserID'
BEGIN
	delete A
	from [dbo].tblSYS_UserRight A
	left join [dbo].[tblSYS_Menu] B On B.MenuID = A.FunctionID
	WHERE A.UserID = @UserID and (isnull(@ModuleID,'') = '' or B.ModuleID = @ModuleID)
END
else if @Activity = 'SaveByUserID'
BEGIN
	if exists (select * from tblSYS_UserRight WHERE FunctionID = @MenuID and UserID = @UserID)
		BEGIN
			set @ReturnMess = 'error'
			RETURN
		END

		INSERT INTO [dbo].tblSYS_UserRight 
						(FunctionID ,UserID,yPermission, FRun, FEdit, FDel, FAdd, FApp)
					VALUES (@MenuID ,@UserID,@yPermission, @FRun, @FEdit, @FDel, @FAdd, @FApp)
END


END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_UserByComByDept]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tanldt>
-- Create date: <4/9/2008>
-- Description:	<Tạo phân quyền user cho phòng ban>
-- =============================================
CREATE PROCEDURE [dbo].[spfrmSYS_UserByComByDept]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'VN',
@UserID			nvarchar(50) = null,
@ReturnMess			nvarchar(500) = null out,
@where	nvarchar(1000)=null
,@LSCompanyID int = null
,@LSDeptID	int = null
AS
BEGIN

if @Activity = 'GetAllUser'
BEGIN

	SELECT A.VNName CompanyName, B.LSDeptID,B.LSCompanyID, C.VNName DeptName, D.UserID
	FROM [dbo].[tblLS_Company] A
	inner join [tblLS_CompanyDept] B On A.CompanyID = B.CompanyID
	inner join tblLS_Dept C On B.DeptID = C.DeptID
	left join tblSYS_UserDept D On D.LSDeptID = C.DeptID and D.CompanyID = A.LSCompanyID and UserID = @UserID
	where --(isnull(@MenuID,'') = '' or A.[Parent] = @MenuID)
	--and 
	(isnull(@LSCompanyID,'') = '' or A.LSCompanyID = @LSCompanyID)
	order by CompanyName,DeptName
END
else if @Activity = 'DeleteByUserID'
BEGIN
	delete from tblSYS_UserDept where UserID = @UserID and (isnull(@LSCompanyID,'') = '' or LSCompanyID = @LSCompanyID)
	-- Delete quyền
	delete A 
		from tblSYS_UserPermission A 
		inner join tblHR_Employee B On A.EmployeeID = B.EmployeeID
		where A.UserID = @UserID and  (isnull(@LSCompanyID,'') = '' or B.CompanyID = @LSCompanyID)

END
else if @Activity = 'SaveByUserID'
BEGIN
	if not exists (select * from tblSYS_UserDept WHERE LSCompanyID = @LSCompanyID and LSDeptID = @LSDeptID and UserID = @UserID)
		BEGIN
			INSERT INTO [dbo].tblSYS_UserDept 
					(LSDeptID,LSCompanyID ,UserID)
				VALUES (@LSDeptID,@LSCompanyID ,@UserID)
		END
	-- gán quyền
	exec [dbo].[spfrmSYS_UserByComByDept] @Activity = 'insertUserIDPer', @LSCompanyID = @LSCompanyID, @LSDeptID = @LSDeptID, @UserID = @UserID
	
END
else if @Activity = 'insertUserIDPer'
BEGIN
	-- insert tblSYS_UserPermission
	begin
		delete A 
		from tblSYS_UserPermission A 
		inner join tblHR_Employee B On A.EmployeeID = B.EmployeeID
		where A.UserID = @UserID and B.CompanyID = @LSCompanyID and B.DeptID = @LSDeptID


		insert into tblSYS_UserPermission (UserID, EmployeeID)
		select A.UserID, B.EmployeeID
		from [dbo].tblSYS_UserDept A
		inner join tblHR_Employee B On A.LSCompanyID = B.CompanyID and A.LSDeptID = B.DeptID
		where A.LSCompanyID = @LSCompanyID and A.LSDeptID = @LSDeptID and A.UserID = @UserID
	end
END
else if @Activity = 'ResetUserPer'
BEGIN
	-- insert tblSYS_UserPermission
	begin
		delete A 
		from tblSYS_UserPermission A 
		where A.UserID = @UserID

		insert into tblSYS_UserPermission (UserID, EmployeeID)
		select A.UserID, B.EmployeeID
		from [dbo].tblSYS_UserDept A
		inner join tblHR_Employee B On A.LSCompanyID = B.CompanyID and A.LSDeptID = B.DeptID
		where A.UserID = @UserID
	end
END
END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_User]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE	PROCEDURE [dbo].[spfrmSYS_User]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'EN',
@ReturnMess			nvarchar(500) = null out,
@UserID			int = null,
@EmployeeID			int = null,
@UserName       nvarchar(50)= null
,@Password       nvarchar(50)= null
,@DeptID       nvarchar(50)= null
,@CompanyID       nvarchar(50)= null
,@IsLocal       bit= null
,@where	nvarchar(1000)=null
AS
if (@IsLocal is null)
	set @IsLocal = 1

if @Activity = 'GetAll'
	BEGIN
		select A.*, B.[FirstName] + ' ' + B.[LastName] as sFullName, C.DeptName sDept
		from [dbo].[tblSYS_User] A
        inner join tblHR_Employee B On A.EmployeeID = B.EmployeeID
		left join tblLS_Dept C On C.DeptID = B.DeptID
		where (B.CompanyID = @CompanyID or isnull(@CompanyID,'') = '')
				and (B.DeptID = @DeptID or isnull(@DeptID,'') = '')
				and (A.IsLocal = @IsLocal)
	END
else if @Activity = 'GetUserID'
	BEGIN
		select A.*, B.[FirstName] + ' ' + B.[LastName] as sFullName, C.DeptName sDept
		, B.CompanyID, B.DeptID--, B.LSGroupID
		from [dbo].[tblSYS_User] A
        inner join tblHR_Employee B On A.EmployeeID = B.EmployeeID
		left join tblLS_Dept C On C.DeptID = B.DeptID
		where A.UserID = @UserID and (A.IsLocal = @IsLocal)
	END
else if @Activity = 'GetEmpID'
	BEGIN
		select A.*, B.[FirstName] + ' ' + B.[LastName] as sFullName, C.DeptName sDept
		, B.CompanyID, B.DeptID--, B.LSGroupID
		from tblHR_Employee B
        left join [dbo].[tblSYS_User] A On A.EmployeeID = B.EmployeeID
		left join tblLS_Dept C On C.DeptID = B.DeptID
		where A.EmployeeID = @EmployeeID and (A.IsLocal = @IsLocal)
	END
else if @Activity = 'Save'
	BEGIN
		update [tblSYS_User] set [sUserName] = null where [sUserName] = ''

		if exists (select * from [tblSYS_User] WHERE [EmployeeID] = @EmployeeID)
		BEGIN
			if exists (select * from [tblSYS_User] WHERE [EmployeeID] <> @EmployeeID and [sUserName] = @UserName )
			BEGIN
				set @ReturnMess = 'Username exits'
--@@Error = 'Username domain exits'
				set @LanguageID = convert(datetime,'loi',103)
				return
			end
			else
			BEGIN
				update [dbo].[tblSYS_User] set
				   [sUserName] = @UserName
				   ,[sPassword] = @Password,IsLocal = @IsLocal
				where [EmployeeID] = @EmployeeID
			end
		END
		else
		begin

			INSERT INTO [dbo].[tblSYS_User]
			   ([sUserName]
			   ,[sPassword]
			   ,[EmployeeID],IsLocal)
			 VALUES
				   (@UserName
				   ,@Password
				   ,@EmployeeID,@IsLocal)
		end
	END
else if @Activity = 'SaveDomain'
	BEGIN
		if exists (select * from [tblSYS_User] WHERE [EmployeeID] = @EmployeeID)
		BEGIN
			if exists (select * from [tblSYS_User] WHERE [EmployeeID] <> @EmployeeID and UserDomain = @UserName )
			BEGIN
				if (isnull(@UserName,'') = '')
				begin
					update [dbo].[tblSYS_User] set
					   UserDomain = null
					where [EmployeeID] = @EmployeeID
				end
				else
				begin
					set @ReturnMess = 'Username domain exits'
					--@@Error = 'Username domain exits'
					set @LanguageID = convert(datetime,'loi',103)
					return
				end
			end
			else
			BEGIN
				update [dbo].[tblSYS_User] set
				   UserDomain = @UserName
				   ,IsLocal = 0
				where [EmployeeID] = @EmployeeID
			end
				

		END
		else
		begin

				INSERT INTO [dbo].[tblSYS_User]
			   (UserDomain
			    ,[EmployeeID],IsLocal)
			 VALUES
				   (@UserName
				   ,@EmployeeID,0)
		end
	END
else if @Activity = 'InsertUserDomain'
	BEGIN
		if not exists (select * from tblSYS_UserDomain WHERE UserName = @UserName)
		BEGIN
				INSERT INTO [dbo].tblSYS_UserDomain
			   (UserName
			    ,Email)
			 VALUES
				   (@UserName
				   ,null)
		END
		
	END
else if @Activity = 'Update'
	BEGIN
		update [dbo].[tblSYS_User] set
           [sUserName] = @UserName
           ,[sPassword] = @Password
           ,[EmployeeID] = @EmployeeID,IsLocal = @IsLocal
		where UserID = @UserID		
	END
else if @Activity = 'UpdatePass'
	BEGIN
		update [dbo].[tblSYS_User] set
           [sPassword] = @Password
           
		where UserID = @UserID		
	END
else if @Activity = 'Delete'
	BEGIN
		delete from tblSYS_User	where UserID = @UserID	and IsLocal = @IsLocal
	END
else if @Activity = 'CheckUserLogin'
	BEGIN
declare @Themes nvarchar(50)
select @Themes = [VALUE] from hrm_Registry where [Name] = 'PageThemes'

		select A.*, B.[FirstName] + ' ' + B.[LastName] as sFullName, C.DeptName sDept
		, B.CompanyID, B.DeptID--, B.LSGroupID
		, isnull(A.Themes,@Themes) PageThemes
		from [dbo].[tblSYS_User] A
        inner join tblHR_Employee B On A.EmployeeID = B.EmployeeID
		left join tblLS_Dept C On C.DeptID = B.DeptID
		where sUserName = @UserName and sPassword = @Password
	END
else if @Activity = 'UserLoginDomain'
	BEGIN

select @Themes = [VALUE] from hrm_Registry where [Name] = 'PageThemes'

		select A.*, B.[FirstName] + ' ' + B.[LastName] as sFullName, C.DeptName sDept
		, B.CompanyID, B.DeptID--, B.LSGroupID
		, isnull(A.Themes,@Themes) PageThemes
		from [dbo].[tblSYS_User] A
        inner join tblHR_Employee B On A.EmployeeID = B.EmployeeID
		left join tblLS_Dept C On C.DeptID = B.DeptID
		where UserDomain = @UserName
	END

if @@Error <> 0
	BEGIN
		set	@EmployeeID = -1
		set	@ReturnMess = ''
	END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_UpdateControlSystem]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spfrmSYS_UpdateControlSystem]
@FromID as nvarchar(100) = null,
@ControlID as nvarchar(30) = null,
@ColumnIndex as int = 0,
@CaptionCtl as nvarchar(200) = null,
@CaptionVNCtl as nvarchar(200) = null,
@Parent as nvarchar(100) = null
as

if (@ControlID != N'lblAccount' and @ControlID != 'cmdSaveLang' and @ControlID != 'lblShowDetails')
begin
--print 'a'

if not exists(select * from tblSYS_CaptionFrmCtl 
	where FormID = @FromID and ControlID = @ControlID and ColumnIndex = @ColumnIndex and isnull(Parent,'') = isnull(@Parent,''))
begin
	insert into tblSYS_CaptionFrmCtl(FormID,ControlID,ColumnIndex,CaptionCtl,CaptionVnCtl,CaptionEnCtl, Parent,bShow)
	values(@FromID,@ControlID,@ColumnIndex,@CaptionCtl,@CaptionVNCtl,@CaptionVNCtl, @Parent,0)
end

end
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_ModuleMenu]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tanldt>
-- Create date: <28/8/2008>
-- Description:	<Tạo Module + Menu>
-- =============================================
CREATE PROCEDURE [dbo].[spfrmSYS_ModuleMenu]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'VN',
@ReturnMess			nvarchar(500) = null out,
@where	nvarchar(1000)=null,
@MenuID int = null
,@Parent int = null
,@FunctionNameV nvarchar(200) = null
,@FunctionNameE nvarchar(200) = null
,@ModuleID nvarchar(50) = null
,@NavigateUrl nvarchar(50) = null
,@Rank tinyint = null
,@Display bit = null
,@LookId nvarchar(50) = null
AS
BEGIN

if @Activity = 'GetAllModule'
BEGIN
	SELECT [MenuID],[Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display] ,[LookId]
	FROM [dbo].[tblSYS_Menu]
	where [Parent] is null
END


END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_Module]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tanldt>
-- Create date: <28/8/2008>
-- Description:	<Tạo Module + Menu>
-- =============================================
CREATE PROCEDURE [dbo].[spfrmSYS_Module]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'VN',
@UserID			nvarchar(50) = null,
@ReturnMess			nvarchar(500) = null out,
@where	nvarchar(1000)=null,
@MenuID int = null
,@Parent int = null
,@FunctionNameV nvarchar(200) = null
,@FunctionNameE nvarchar(200) = null
,@ModuleID nvarchar(50) = null
,@NavigateUrl nvarchar(50) = null
,@Rank tinyint = null
,@Display bit = null
,@LookId nvarchar(50) = null
AS
BEGIN

if @Activity = 'GetAll'
BEGIN
	SELECT [MenuID],[Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display] ,[LookId]
	FROM [dbo].[tblSYS_Menu]
	where [Parent] is null
	order by isnull([Rank],100)
END
else if @Activity = 'GetDataByID'
BEGIN
	SELECT [MenuID],[Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display] ,[LookId]
	FROM [dbo].[tblSYS_Menu]
	where [Parent] is null and [MenuID] = @MenuID
	order by isnull([Rank],100)
END
else if @Activity = 'Update'
BEGIN
	UPDATE [dbo].[tblSYS_Menu]
   SET [Parent] = @Parent
      ,[FunctionNameV] = @FunctionNameV
      ,[FunctionNameE] = @FunctionNameE
      ,[NavigateUrl] = @NavigateUrl
      ,[Rank] = @Rank
      ,[Display] = @Display
 WHERE [MenuID] = @MenuID
END
else if @Activity = 'Save'
BEGIN
	INSERT INTO [dbo].[tblSYS_Menu]
           ([Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display])
     VALUES
           (@Parent,@FunctionNameV,@FunctionNameE,@ModuleID,@NavigateUrl,@Rank,@Display)
END
else if @Activity = 'Delete'
BEGIN
	delete from [dbo].[tblSYS_Menu] WHERE [MenuID] = @MenuID
END

END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_MenuLevel2]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tanldt>
-- Create date: <28/8/2008>
-- Description:	<Tạo Module + Menu>
-- =============================================
CREATE PROCEDURE [dbo].[spfrmSYS_MenuLevel2]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'VN',
@UserID			nvarchar(50) = null,
@ReturnMess			nvarchar(500) = null out,
@where	nvarchar(1000)=null,
@MenuID int = null
,@Parent int = null
,@FunctionNameV nvarchar(200) = null
,@FunctionNameE nvarchar(200) = null
,@ModuleID nvarchar(50) = null
,@NavigateUrl nvarchar(50) = null
,@Rank tinyint = null
,@Display bit = null
,@LookId nvarchar(50) = null
AS
BEGIN

if @Activity = 'GetAll'
BEGIN
	SELECT [MenuID],[Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display] ,[LookId]
	FROM [dbo].[tblSYS_Menu]
	where [Parent] = @MenuID
	order by isnull([Rank],100)
END
else if @Activity = 'GetDataByID'
BEGIN
	SELECT [MenuID],[Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display] ,[LookId]
	FROM [dbo].[tblSYS_Menu]
	where [MenuID] = @MenuID
	order by isnull([Rank],100)
END
else if @Activity = 'Update'
BEGIN
	UPDATE [dbo].[tblSYS_Menu]
   SET [Parent] = @Parent
      ,[FunctionNameV] = @FunctionNameV
      ,[FunctionNameE] = @FunctionNameE
      ,[NavigateUrl] = @NavigateUrl
      ,[Rank] = @Rank
      ,[Display] = @Display
 WHERE [MenuID] = @MenuID
END
else if @Activity = 'Save'
BEGIN

	INSERT INTO [dbo].[tblSYS_Menu]
           ([Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display])
     VALUES
           (@Parent,@FunctionNameV,@FunctionNameE,@ModuleID,@NavigateUrl,@Rank,@Display)
END
else if @Activity = 'Delete'
BEGIN
	delete from [dbo].[tblSYS_Menu] WHERE [MenuID] = @MenuID
END

END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_MenuLevel1]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tanldt>
-- Create date: <28/8/2008>
-- Description:	<Tạo Module + Menu>
-- =============================================
CREATE PROCEDURE [dbo].[spfrmSYS_MenuLevel1]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'VN',
@UserID			nvarchar(50) = null,
@ReturnMess			nvarchar(500) = null out,
@where	nvarchar(1000)=null,
@MenuID int = null
,@Parent int = null
,@FunctionNameV nvarchar(200) = null
,@FunctionNameE nvarchar(200) = null
,@ModuleID nvarchar(50) = null
,@NavigateUrl nvarchar(50) = null
,@Rank tinyint = null
,@Display bit = null
,@LookId nvarchar(50) = null
AS
BEGIN

if @Activity = 'GetAll'
BEGIN
	select @MenuID = MenuID FROM [dbo].[tblSYS_Menu] where [Parent] is null	and isnull(@ModuleID,'') = ModuleID

	SELECT [MenuID],[Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display] ,[LookId]
	FROM [dbo].[tblSYS_Menu]
	where [Parent] = @MenuID
	and isnull(@ModuleID,'') = ModuleID
	order by isnull([Rank],100)
END
else if @Activity = 'GetDataByID'
BEGIN
	SELECT [MenuID],[Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display] ,[LookId]
	FROM [dbo].[tblSYS_Menu]
	where [MenuID] = @MenuID
	order by isnull([Rank],100)
END
else if @Activity = 'Update'
BEGIN
	select @Parent = MenuID from [dbo].[tblSYS_Menu] where ModuleID = @ModuleID and [Parent] is null
	UPDATE [dbo].[tblSYS_Menu]
   SET [Parent] = @Parent
      ,[FunctionNameV] = @FunctionNameV
      ,[FunctionNameE] = @FunctionNameE
      ,[NavigateUrl] = @NavigateUrl
      ,[Rank] = @Rank
      ,[Display] = @Display
 WHERE [MenuID] = @MenuID
END
else if @Activity = 'Save'
BEGIN
	select @Parent = MenuID from [dbo].[tblSYS_Menu] where ModuleID = @ModuleID and [Parent] is null
	
	INSERT INTO [dbo].[tblSYS_Menu]
           ([Parent],[FunctionNameV],[FunctionNameE],[ModuleID],[NavigateUrl],[Rank],[Display])
     VALUES
           (@Parent,@FunctionNameV,@FunctionNameE,@ModuleID,@NavigateUrl,@Rank,@Display)
END
else if @Activity = 'Delete'
BEGIN
	delete from [dbo].[tblSYS_Menu] WHERE [MenuID] = @MenuID
END

END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_Group]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[spfrmSYS_Group]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'EN',
@ReturnMess			nvarchar(500) = null out,
@GroupID			int = null,
@GroupName       nvarchar(50)= null
,@Note       nvarchar(200)= null
,@where	nvarchar(1000)=null
,@Parameter1 nvarchar(50)= null
AS

if @Activity = 'GetAll'
	BEGIN
		select A.*
		from [dbo].[tblSYS_Group] A
        
	END
else if @Activity = 'GetGroupID'
	BEGIN
		select A.*
		from [dbo].[tblSYS_Group] A
		where A.GroupID = @GroupID
	END
else if @Activity = 'GetData'
	BEGIN
		select A.*
		from [dbo].[tblSYS_Group] A
		where (isnull(@GroupName,'') = '' or A.GroupName like N'%' + @GroupName + '%')
	END
else if @Activity = 'Save'
	BEGIN
		if exists (select * from [tblSYS_Group] WHERE GroupName = @GroupName)
		BEGIN
			set @ReturnMess = 'Group name exits'
			RETURN
		END
		INSERT INTO [dbo].[tblSYS_Group]
           (GroupName
           ,Note)
		 VALUES
			   (@GroupName
			   ,@Note)
		
	END
else if @Activity = 'Update'
	BEGIN
		update [dbo].[tblSYS_Group] set
           GroupName = @GroupName
           ,Note = @Note
		where GroupID = @GroupID		
	END
else if @Activity = 'Delete'
	BEGIN
		delete from [tblSYS_Group]	where GroupID = @GroupID		
	END


if @@Error <> 0
	BEGIN
		set	@GroupID = -1
		set	@ReturnMess = ''
	END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_CaptionLANGUAGE]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[spfrmSYS_CaptionLANGUAGE]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'EN',
@ReturnMess			nvarchar(500) = null out,
@ID			int = null,
@FormID			nvarchar(50) = null,
@Code			nvarchar(50) = null,
@EN			nvarchar(50) = null,
@VN			nvarchar(50) = null,
@Notes			nvarchar(100) = null
,@where	nvarchar(1000)=null
AS
if (isnull(@FormID,'') = '')
	set @FormID = 'CommonPage'

if @Activity = 'GetDataAll'
	BEGIN
		select ID,FormID, Code,EN,VN,Notes from tblSYS_CaptionLanguage A where A.FormID = @FormID
		/*union all
		select ID,FormID, Code,EN,VN,Notes from tblSYS_CaptionLanguage A where A.FormID = 'CommonPage'*/
		
	END
else if @Activity = 'DataAll'
	BEGIN
		select ID,FormID, Code,EN,VN,Notes from tblSYS_CaptionLanguage		order by FormID, Code
	END
else If @Activity ='Save'
	BEGIN
		if exists (select * from tblSYS_CaptionLanguage WHERE FormID = @FormID and Code = @Code)
		BEGIN
		if @LanguageID='VN'
		set @ReturnMess=N'Mã này đã tồn tại. Xin nhập vào mã khác.'
		else if @LanguageID='EN'
		set @ReturnMess=N'This code was existed. Please check again.'Return
		END

		INSERT INTO tblSYS_CaptionLanguage
(
FormID,Code,EN,VN,Notes
)
		VALUES
(
@FormID,@Code,@EN,@VN,@Notes
)

		
	
	END


else If @Activity = 'Update'
	BEGIN
		UPDATE tblSYS_CaptionLanguage
		SET
			Code = @Code,
			EN = @EN,
			VN = @VN,
			Notes = @Notes
		WHERE ID = @ID

		
	END


else If @Activity = 'Delete'
	BEGIN
		DELETE FROM tblSYS_CaptionLanguage
		WHERE ID = @ID

		
	END
else If @Activity = 'DeleteAll'
	BEGIN
		DELETE FROM tblSYS_CaptionLanguage
		WHERE FormID = @FormID

		
	END
else If @Activity = 'GetDataByID'
	BEGIN
		SELECT
ID, FormID, Code, EN, VN, Notes
		FROM tblSYS_CaptionLanguage
		WHERE ID = @ID
	END

if @@Error <> 0
	BEGIN
		set	@ID = -1
		set	@ReturnMess = ''
	END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_CaptionFrmCtl]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmSYS_CaptionFrmCtl]
@para nvarchar(50)='Update',
@txtVn nvarchar(200) = null,
@txtEn nvarchar(200) = null,
@autoID bigint = null,
@FormID nvarchar(100) = null
as
if @para='Update'
begin
	Update tblSYS_CaptionFrmCtl set 
	CaptionVNCtl=@txtVn,
	CaptionENCtl=@txtEn 
	where AutoID=@autoID
end
else if @para='Delete'
begin
	Delete tblSYS_CaptionFrmCtl
	where AutoID=@autoID
end
else if @para='DeleteAll'
begin
	Delete tblSYS_CaptionFrmCtl
	where FormID=@FormID
end
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_Account]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spfrmSYS_Account]
( 
@Activity	varchar(50),
@LanguageID	nvarchar(2) = null,
@ReturnMess	nvarchar(500) = null out,

@EmployeeID	int = null,
@EmployeeCode	nvarchar(50) = null,
@FirstName	nvarchar(500) = null,
@LastName	nvarchar(500) = null,
@EmpName	nvarchar(500) = null,
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
-- More
@FullName	nvarchar(500) = null
) 
AS

IF @Activity ='Save'
BEGIN
	print 'a'
END
ELSE IF @Activity ='Delete'
BEGIN
	 print 'a'
END

ELSE IF @Activity ='GetDataAll'
BEGIN
	SELECT a.EmployeeID, a.FirstName + ' ' + a.LastName as sFullName
		, lc.CompanyName , ld.DeptName, c.sUserName , c.sPassword
	FROM tblHR_Employee a 
	left join [tblHR_EmployeeArea] b On a.EmployeeID = b.EmployeeID
	left join tblSYS_User c On a.EmployeeID = c.EmployeeID
	left join tblLS_Company lc on lc.CompanyID = a.CompanyID
	left join tblLS_Dept ld on ld.DeptID = a.DeptID
	order by a.LastName
END


IF (@@error  <> 0)
	RETURN '-1'
RETURN '0'
GO
/****** Object:  StoredProcedure [dbo].[spfrmMenu]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[spfrmMenu]
	@Activity as nvarchar(30) = 'GetLeftMenu',
	@Language as nvarchar(10) = 'EN',
	@ModuleID as nvarchar(10) = 'TR',
	@FuntionID as int = null,
	@Parent as int = null,
	@FunctionID as int = null,
	@MenuLevel as int = null,
	@UserGroupID nvarchar(80) = 'admin'

as
	declare @FAdm as bit
	declare @Sql as nvarchar(4000)
	set @Sql = ''
	if @Activity = 'GetTopMenu'
	begin
		select * from tblSYS_Menu order by [Rank]
	end
	else if @Activity = 'GetTopMenu2'
	begin
		if (@UserGroupID = '0')
		begin
			select A.[MenuID]
			  ,A.[Parent]
			  , case when @Language = 'VN' then A.[FunctionNameV] else A.[FunctionNameE] end FunctionName
			  ,A.[FunctionNameV]
			  ,A.[FunctionNameE]
			  ,A.[ModuleID]
			  ,'M' + [ModuleID] + '/' + [NavigateUrl] as [NavigateUrl]
			  ,A.[Rank]
			  ,A.[Display]
			  ,A.[LookId] ,1 FRun
				from tblSYS_Menu A
				where Display = 1 
				order by [Rank]
		end
		else
		begin

			create table #Temp (
			UserID int null,
			MenuID int null,
			Parent int null,
			FRun int null
			)
			-- Insert phân hệ
			insert into #Temp (UserID,MenuID,Parent,Frun)
			select @UserGroupID, A.MenuID,A.Parent,0 from tblSYS_Menu A
			where A.Parent is null
			group by A.MenuID,A.Parent
			-- end Insert phân hệ

			insert into #Temp (UserID,MenuID,Parent,FRun)
			select @UserGroupID, A.MenuID,A.Parent, AAA.FRun from tblSYS_Menu A
			inner join (
				select [UserID] ,MenuID, max(Frun) Frun from (
						select  B.[UserID] ,A.[FunctionID] MenuID, FRun
						from tblSYS_GroupRight A
						inner join tblSYS_UserGroup B ON A.GroupID = B.GroupID and B.UserID = @UserGroupID
						where A.FRun = 1
						union all
						select A.[UserID] ,A.[FunctionID] MenuID, FRun
						from tblSYS_UserRight A
						where A.UserID = @UserGroupID and A.FRun = 1
					) AA group by [UserID] ,MenuID
				) AAA On A.MenuID = AAA.MenuID
--select * from tblSYS_GroupRight
			insert into #Temp (UserID,MenuID,Parent, Frun )
			select @UserGroupID, A.MenuID,A.Parent,0 from tblSYS_Menu A
			inner join #Temp B On A.MenuID = B.Parent and UserID = @UserGroupID
			group by A.MenuID,A.Parent

			insert into #Temp (UserID,MenuID,Parent,Frun)
			select @UserGroupID, A.MenuID,A.Parent,0 from tblSYS_Menu A
			inner join #Temp B On A.MenuID = B.Parent and UserID = @UserGroupID
			group by A.MenuID,A.Parent


			select A.[MenuID]
			  ,A.[Parent]
			  ,A.[FunctionNameV]
			  ,A.[FunctionNameE]
			  , case when @Language = 'VN' then A.[FunctionNameV] else A.[FunctionNameE] end FunctionName
			  ,A.[ModuleID]
			  ,'M' + [ModuleID] + '/' + [NavigateUrl] as [NavigateUrl]
			  ,A.[Rank]
			  ,A.[Display]
			  ,A.[LookId] , G.Frun
				from tblSYS_Menu A
				inner join (
					select MenuID, max(Frun) Frun from #Temp where UserID = @UserGroupID group by MenuID
				)G On G.MenuID = A.MenuID
				where Display = 1 and isnull(A.Role,'') != 'system'
				--and ((G.MenuID is not null) or isnull([NavigateUrl],'') = '')
				order by A.[Rank]
/*
select A.[MenuID]
			  ,A.[Parent]
			  ,A.[FunctionNameV]
			  ,A.[FunctionNameE]
			  , case when @Language = 'VN' then A.[FunctionNameV] else A.[FunctionNameE] end FunctionName
			  ,A.[ModuleID]
			  ,'M' + [ModuleID] + '/' + [NavigateUrl] as [NavigateUrl]
			  ,A.[Rank]
			  ,A.[Display]
			  ,A.[LookId] 
*/
--or isnull([NavigateUrl],'') = ''
				--order by [Rank]
		end
	end
	else if @Activity = 'GetTopMenuNull'
	begin
		select null  [MenuID]
      ,null [Parent]
      ,null [FunctionNameV]
      ,null [FunctionNameE]
	   ,null [FunctionName]
      ,null [ModuleID]
      ,null  as [NavigateUrl]
      ,null [Rank]
      ,null [Display]
      ,null [LookId]
	
	end
GO
/****** Object:  View [dbo].[vTest]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTest]
AS
SELECT     TOP (100) PERCENT A.MenuID, A.Parent, A.FunctionNameE, A.ModuleID, 'M' + A.ModuleID + '/' + A.NavigateUrl AS NavigateUrl, A.Rank, A.Display, 
                      A.LookId
FROM         dbo.tblSYS_Menu AS A LEFT OUTER JOIN
                          (SELECT DISTINCT UserID, MenuID
                            FROM          (SELECT     B.UserID, A.FunctionID AS MenuID
                                                    FROM          dbo.tblSYS_GroupRight AS A INNER JOIN
                                                                           dbo.tblSYS_UserGroup AS B ON A.GroupID = B.GroupID AND B.UserID = 2
                                                    UNION ALL
                                                    SELECT     UserID, FunctionID AS MenuID
                                                    FROM         dbo.tblSYS_UserRight AS A
                                                    WHERE     (UserID = 2)) AS AA) AS G ON G.MenuID = A.MenuID
WHERE     (A.Display = 1) AND (ISNULL(A.Role, '') <> 'system') AND (G.MenuID IS NOT NULL) OR
                      (A.Display = 1) AND (ISNULL(A.Role, '') <> 'system') AND (ISNULL(A.NavigateUrl, '') = '')
ORDER BY A.Rank
GO
/****** Object:  View [dbo].[tblLS_Dept]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblLS_Dept]
AS
SELECT     DeptID, DeptCode, DeptName, Rank, Remark, Used, CompanyID
FROM         HRMCore.dbo.tblLS_Dept AS tblLS_Dept
GO
/****** Object:  View [dbo].[tblHR_EmployeeArea]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblHR_EmployeeArea]
AS
SELECT     *
FROM         HRMCore.dbo.tblHR_EmployeeArea AS tblHR_EmployeeArea_1
GO
/****** Object:  View [dbo].[tblLS_Company]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblLS_Company]
AS
SELECT     CompanyID, CompanyCode, CompanyName, Rank, Used
FROM         HRMCore.dbo.tblLS_Company AS tblLS_Company
GO
/****** Object:  View [dbo].[tblHR_Employee]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tblHR_Employee]
AS
SELECT     EmployeeID, EmployeeCode, FirstName, LastName, GenderCode, DateOfBirth, BirthPlace, Address, HomeAddress, DateOfHire, DateOfTermination, 
                      Telephone, Email, Remark, EmployeeStatusID, JobTitleID, JobLevelID, CompanyID, DeptID, SectionID, InsertUserID, InsertDate, UpdateUserID, 
                      UpdateDate
FROM         HRMCore.dbo.tblHR_Employee AS tblHR_Employee_1
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_UserDataPermission]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Tanldt>
-- Create date: <4/9/2008>
-- Description:	<Tạo phân quyền user cho phòng ban>
-- =============================================
CREATE PROCEDURE [dbo].[spfrmSYS_UserDataPermission]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'VN',
@UserID			int = null,
@ReturnMess			nvarchar(500) = null out,
@where	nvarchar(1000)=null
,@LSCompanyID int = null
,@LSDeptID	int = null 
,@LSSectionID	int = null
,@AreaID	int = null
,@EmployeeID	int = null
,@UserDataPerID	int = null
AS
BEGIN
declare @Role int
if @Activity = 'GetDataByUserID'
BEGIN
	-- reset, update quyen neu là
	exec spfrmSYS_UserDataPermission @Activity = 'ResetGroupByUserID', @UserID = @UserID

	SELECT E.*,E.FirstName + ' ' + E.LastName as FullName, A.CompanyName, C.DeptName, S.SectionName
	FROM tblSYS_UserPermission D
	inner join tblHR_Employee E On E.EmployeeID = D.EmployeeID
	left join [tblLS_Company] A on E.CompanyID = A.CompanyID
	left join tblLS_Dept C On E.DeptID = C.DeptID
	left join tblLS_Section S On S.SectionID = E.SectionID
	--left join tblSYS_UserDataPermission N on N.EmployeeID = E.EmployeeID
	where D.UserID = @UserID --and N.EmployeeID is null
		and E.EmployeeStatusID = 1
	order by CompanyName,DeptName,SectionName,LastName

--select * from tblHR_Employee
-- Select * from tblLS_Status
END
else if @Activity = 'SaveEmpID'
BEGIN
	select @LSCompanyID = CompanyID,@LSDeptID = DeptID , @LSSectionID = SectionID from tblHR_Employee where EmployeeID = @EmployeeID

	if exists (select * from tblSYS_UserDataPermission WHERE EmployeeID = @EmployeeID and UserID = @UserID)
		BEGIN
				delete from tblSYS_UserDataNotPermission where EmployeeID = @EmployeeID and UserID = @UserID
				return
		END
	else
		begin
			
			INSERT INTO [dbo].tblSYS_UserDataPermission
			   (UserID,LSCompanyID
			   ,LSDeptID
			   ,LSSectionID,EmployeeID)
			 VALUES
				   (@UserID,@LSCompanyID
				   ,@LSDeptID
				   ,@LSSectionID,@EmployeeID)
			delete from tblSYS_UserDataNotPermission where EmployeeID = @EmployeeID and UserID = @UserID
		end
end
else if @Activity = 'RemoveEmpID'
BEGIN
	declare @UserID2 int
	select @LSCompanyID = CompanyID,@LSDeptID = DeptID , @LSSectionID = SectionID from tblHR_Employee where EmployeeID = @EmployeeID
select @UserID2 = UserID from tblSYS_User where EmployeeID = @EmployeeID

	if @UserID2 = @UserID
		return

	if exists (select * from tblSYS_UserDataPermission WHERE EmployeeID = @EmployeeID and UserID = @UserID)
		BEGIN
				delete from tblSYS_UserDataPermission WHERE EmployeeID = @EmployeeID and UserID = @UserID
				return
		END
	else
		begin
			
			INSERT INTO [dbo].tblSYS_UserDataNotPermission
			   (UserID,EmployeeID)
			 VALUES
				   (@UserID,@EmployeeID)
			delete from tblSYS_UserDataPermission where EmployeeID = @EmployeeID and UserID = @UserID
		end

end
else if @Activity = 'Save'
BEGIN
	
	if exists (select * from tblSYS_UserDataPermission WHERE UserID = @UserID
				and LSCompanyID = @LSCompanyID and LSDeptID = @LSDeptID and LSSectionID = @LSSectionID)
		BEGIN
				return
		END
		else
		begin
			if (@LSCompanyID = 0)
				return
			if (@LSDeptID = 0)
				set @LSDeptID = null
			if (@LSSectionID = 0)
				set @LSSectionID = null
			INSERT INTO [dbo].tblSYS_UserDataPermission
			   (UserID,LSCompanyID
			   ,LSDeptID
			   ,LSSectionID)
			 VALUES
				   (@UserID,@LSCompanyID
				   ,@LSDeptID
				   ,@LSSectionID)
		end


END
else if @Activity = 'Delete'
BEGIN

	delete from tblSYS_UserDataPermission WHERE UserDataPerID = @UserDataPerID

END
else if @Activity = 'ResetGroupByUserID'
BEGIN
	-- reset, update quyen neu là
select @EmployeeID = EmployeeID  from tblSYS_User where UserID = @UserID
select @LSCompanyID = CompanyID,@LSDeptID = DeptID , @LSSectionID = SectionID from tblHR_Employee where EmployeeID = @EmployeeID

--select * from tblHR_Employee where EmployeeID = @EmployeeID

SELECT @Role = IsNull(Max(b.GroupCode),0) 
		  FROM tblSYS_UserGroup a inner join tblSYS_Group b on a.GroupID = b.GroupID
		 WHERE a.UserID = @UserID
	if (isnull(@Role,1) = 1) -- Neu no' la role NV
	begin
		exec spfrmSYS_UserDataPermission @Activity = 'ResetUserPer',@UserID = @UserID 
	end
	else if (isnull(@Role,1) = 2) -- Neu no' la role LM
	begin
		delete from tblSYS_UserDataPermission where UserID = @UserID and EmployeeID is null -- Xoa tat ca
		INSERT INTO [dbo].tblSYS_UserDataPermission (UserID,LSCompanyID ,LSDeptID ,LSSectionID, EmployeeID)
			 VALUES (@UserID,@LSCompanyID ,@LSDeptID ,@LSSectionID, null)

		exec spfrmSYS_UserDataPermission @Activity = 'ResetUserPer',@UserID = @UserID 
	end

	else if (isnull(@Role,1) = 3) -- Neu no' la role TR
	begin
		delete from tblSYS_UserDataPermission where UserID = @UserID and EmployeeID is null -- Xoa tat ca
		INSERT INTO [dbo].tblSYS_UserDataPermission (UserID,LSCompanyID ,LSDeptID ,LSSectionID, EmployeeID)
			 VALUES (@UserID,@LSCompanyID ,null ,null, null)

		exec spfrmSYS_UserDataPermission @Activity = 'ResetUserPer',@UserID = @UserID 
	end
	else if (isnull(@Role,1) = 4) -- Neu no' la role admin
	begin
		delete from tblSYS_UserDataPermission where UserID = @UserID -- Xoa tat ca
		INSERT INTO [dbo].tblSYS_UserDataPermission (UserID,LSCompanyID)
		select @UserID, CompanyID from tblLS_Company

		exec spfrmSYS_UserDataPermission @Activity = 'ResetUserPer',@UserID = @UserID 
	end

END
else if @Activity = 'ResetUserPer'
BEGIN
	-- insert tblSYS_UserPermission
	begin
		delete A 
		from tblSYS_UserPermission A 
		where A.UserID = @UserID
--insert Company
		insert into tblSYS_UserPermission (UserID, EmployeeID)
		select A.UserID, B.EmployeeID
			from tblHR_Employee B
			inner join [dbo].tblSYS_UserDataPermission A on A.LSCompanyID = B.CompanyID 
				and A.LSDeptID is null and A.LSSectionID is null and A.EmployeeID is null
				and A.UserID = @UserID
			left join tblSYS_UserPermission u on u.EmployeeID = B.EmployeeID and u.UserID = @UserID
		--where u.EmployeeID is null
--insert Department
		insert into tblSYS_UserPermission (UserID, EmployeeID)
		select A.UserID, B.EmployeeID
			from tblHR_Employee B
			inner join [dbo].tblSYS_UserDataPermission A on A.LSCompanyID = B.CompanyID 
				and A.LSDeptID = B.DeptID and A.LSSectionID is null and A.EmployeeID is null
				and A.UserID = @UserID
			left join tblSYS_UserPermission u on u.EmployeeID = B.EmployeeID and u.UserID = @UserID
		where u.EmployeeID is null
--insert Section
		insert into tblSYS_UserPermission (UserID, EmployeeID)
		select A.UserID, B.EmployeeID
			from tblHR_Employee B
			inner join [dbo].tblSYS_UserDataPermission A on A.LSCompanyID = B.CompanyID 
				and A.LSDeptID = B.DeptID and A.LSSectionID = B.SectionID and A.EmployeeID is null
				and A.UserID = @UserID
			left join tblSYS_UserPermission u on u.EmployeeID = B.EmployeeID and u.UserID = @UserID
		where u.EmployeeID is null

--insert Employee
		insert into tblSYS_UserPermission (UserID, EmployeeID)
		select A.UserID, A.EmployeeID
			from [dbo].tblSYS_UserDataPermission A 
			left join tblSYS_UserPermission u on u.EmployeeID = A.EmployeeID and u.UserID = @UserID
		where A.UserID = @UserID and u.EmployeeID is null and A.EmployeeID is not null
		
--insert UserID
		insert into tblSYS_UserPermission (UserID, EmployeeID)
		select B.UserID, B.EmployeeID
			from tblSYS_User B
			left join tblSYS_UserPermission u on u.EmployeeID = B.EmployeeID and u.UserID = @UserID
		where B.UserID = @UserID and u.EmployeeID is null 
		
--Remove Employee Not Permission
		delete from tblSYS_UserPermission
		where EmployeeID in (select B.EmployeeID from tblSYS_UserDataNotPermission B where B.UserID = @UserID)
			and UserID = @UserID
--select * from tblSYS_UserPermission
	end
END

END
GO
/****** Object:  StoredProcedure [dbo].[spfrm_pageload]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[spfrm_pageload]
	@SessionID  NVARCHAR(24),
    @User       NVARCHAR(50),
    @IP         NVARCHAR(15),
    @Location   NVARCHAR(50),
	@ModuleID   NVARCHAR(50),
	@FormID   NVARCHAR(50),
    @Browser    NVARCHAR(50),
    @Platform   NVARCHAR(50),
	@LangID   NVARCHAR(50),
	@cID   int
as

		BEGIN
        DECLARE  @UserID INT, @NameFunction nvarchar(200)
		DECLARE  @MenuID INT
        DECLARE  @UserBoardID INT
        DECLARE  @IsGuest TINYINT
        DECLARE  @rowcount INT
        DECLARE  @PreviousVisit DATETIME
        SET implicit_transactions  off
        select @MenuID = MenuID from tblSYS_Menu where ModuleID = @ModuleID and NavigateUrl like '%' + @FormID
		--set @MenuID = @cID
		select @ModuleID = ModuleID from tblSYS_Menu where MenuID = MenuID
		
		select @NameFunction = case when @LangID = 'VN' then FunctionNameV else FunctionNameE end from tblSYS_Menu where ModuleID = @ModuleID and Parent is null
		--select @Themes = [VALUE] from hrm_Registry where [Name] = 'PageThemes'
		
        -- return information
        --SELECT @User UserID, 'UserName' UserName, 'UglyRed' Theme, (select FunctionNameV from tblSYS_Menu where NavigateUrl = @FormID) FormName
	if (@User = '0')
	begin
		SELECT 'System' UserName
		, (select case when @LangID = 'VN' then FunctionNameV else FunctionNameE end  from tblSYS_Menu where MenuID = @MenuID) FormName
		, A.*, @NameFunction ModuleName , @ModuleID ModuleID
		, @FormID FormID, @Location Location, 0 roles
		from [dbo].[fn_sysGetPermissionMenu] (@User, @MenuID) A

	end
	else
	begin
		select A.UserID, A.sUserName UserName,E.FirstName + ' ' + E.LastName as FullName, E.EmployeeStatusID StatusEmp
		, isnull(B.MenuID,G.MenuID) MenuID
		,case when isnull(B.[yPermission],0) > isnull(G.[yPermission],0) then B.[yPermission] else G.[yPermission] end [yPermission]
		,case when B.[FRun] = 1 then B.[FRun] else G.[FRun] end [FRun]
		,case when B.[FEdit]  = 1 then B.[FEdit] else G.[FEdit] end [FEdit]
		,case when B.[FDel]  = 1 then B.[FDel] else G.[FDel] end [FDel]
		,case when B.[FAdd]  = 1 then B.[FAdd] else G.[FAdd] end [FAdd]
		, case when @LangID = 'VN' then M.FunctionNameV else M.FunctionNameE end FormName
		, M.ModuleID, @NameFunction ModuleName
		, M.NavigateUrl FormID
		,TimeZoneUser = +0, @Location Location, GroupCode as Roles
		from tblSYS_User A
		inner join [dbo].[tblHR_Employee] E On E.EmployeeID = A.EmployeeID
		left join tblSYS_UserGroup r on r.UserID = A.UserID
		left join tblSYS_Group gr on gr.GroupID = r.GroupID
		left join [dbo].[fn_sysGetPermissionMenu] (@User, @MenuID) B On B.UserID = A.UserID
		left join [dbo].[fn_sysGetPermissionMenuGroup] (@User, @MenuID) G On G.UserID = A.UserID
		left join [dbo].[tblSYS_Menu] M On M.MenuID = isnull(B.MenuID,isnull(G.MenuID,@MenuID))
		--left join tblSYS_UserRight B On A.UserID = A.UserID and B.FunctionID = @MenuID and B.UserID = @User
		where A.UserID = @User
	end
--		select * from tblSYS_Group
    END
GO
/****** Object:  StoredProcedure [dbo].[spfrmSYS_UserGroup]    Script Date: 03/05/2015 21:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[spfrmSYS_UserGroup]
@Activity			varchar(50),
@LanguageID			nchar(2) = 'EN',
@ReturnMess			nvarchar(500) = null out,
@UserGroupID			int = null,
@UserID			int = null,
@GroupID			int = null
,@where	nvarchar(1000)=null
AS

if @Activity = 'DeleteByUserID'
	BEGIN
		delete from tblSYS_UserGroup	where UserID = @UserID		
	END
else if @Activity = 'Save'
	BEGIN
		if exists (select * from tblSYS_UserGroup WHERE UserID = @UserID and GroupID = @GroupID)
		BEGIN
			
			RETURN
		END
		INSERT INTO [dbo].[tblSYS_UserGroup] 
						(UserID ,GroupID)
					VALUES (@UserID ,@GroupID)
		delete from tblSYS_UserDataPermission where UserID = @UserID
		delete from tblSYS_UserDataNotPermission where UserID = @UserID
		delete from tblSYS_UserPermission where UserID = @UserID

		exec spfrmSYS_UserDataPermission @Activity = 'ResetGroupByUserID', @UserID = @UserID
	END
else if @Activity = 'SaveAssign'
	BEGIN
		Delete from tblSYS_UserGroup where UserID = @UserID
		INSERT INTO [dbo].[tblSYS_UserGroup] 
						(UserID ,GroupID)
					VALUES (@UserID ,@GroupID)
		delete from tblSYS_UserDataPermission where UserID = @UserID
		delete from tblSYS_UserDataNotPermission where UserID = @UserID
		delete from tblSYS_UserPermission where UserID = @UserID

		exec spfrmSYS_UserDataPermission @Activity = 'ResetGroupByUserID', @UserID = @UserID


	END
else if @Activity = 'GroupByUserID'
	BEGIN
		select * from tblSYS_Group A
		left join tblSYS_UserGroup B On A.GroupID = B.GroupID and B.UserID = @UserID
	END


if @@Error <> 0
	BEGIN
		set	@UserGroupID = -1
		set	@ReturnMess = ''
	END
GO
/****** Object:  Default [DF_tblSYS_CaptionFrmCtl_bShow]    Script Date: 03/05/2015 21:26:10 ******/
ALTER TABLE [dbo].[tblSYS_CaptionFrmCtl] ADD  CONSTRAINT [DF_tblSYS_CaptionFrmCtl_bShow]  DEFAULT ((0)) FOR [bShow]
GO
