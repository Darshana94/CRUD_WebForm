USE [master]
GO
/****** Object:  Database [db_test]    Script Date: 7/22/2019 10:31:59 PM ******/
CREATE DATABASE [db_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\db_test.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\db_test_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_test] SET  MULTI_USER 
GO
ALTER DATABASE [db_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [db_test] SET DELAYED_DURABILITY = DISABLED 
GO
USE [db_test]
GO
/****** Object:  Table [dbo].[tb_contact]    Script Date: 7/22/2019 10:31:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_contact](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[dob] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_contact] PRIMARY KEY CLUSTERED 
(
	[uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[deletebyid]    Script Date: 7/22/2019 10:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deletebyid]
@id int
AS
	BEGIN
	DELETE FROM tb_contact
	WHERE uid = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[saveandupdate]    Script Date: 7/22/2019 10:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[saveandupdate]
@id int,
@name nvarchar(50),
@add nvarchar(50),
@dob nvarchar(50)
AS
BEGIN
IF(@id=0)
	BEGIN
	INSERT INTO tb_contact(name,address,dob)
	VALUES (@name,@add,@dob);
	END
ELSE
	BEGIN
	UPDATE tb_contact
	SET
		name = @name,
		address = @add,
		dob = @dob
	WHERE uid = @id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[viewall]    Script Date: 7/22/2019 10:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[viewall]
AS
	BEGIN
	SELECT * 
	FROM tb_contact
	END
GO
/****** Object:  StoredProcedure [dbo].[viewbyid]    Script Date: 7/22/2019 10:32:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[viewbyid]
@id int
AS
	BEGIN
	SELECT *
	FROM tb_contact
	WHERE uid = @id
	END
GO
USE [master]
GO
ALTER DATABASE [db_test] SET  READ_WRITE 
GO
