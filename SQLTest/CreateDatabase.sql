DROP DATABASE ExampleDB
GO
CREATE DATABASE [ExampleDB] 
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExampleDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExampleDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ExampleDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ExampleDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ExampleDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ExampleDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ExampleDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ExampleDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ExampleDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ExampleDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ExampleDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ExampleDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ExampleDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ExampleDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ExampleDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ExampleDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ExampleDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ExampleDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ExampleDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ExampleDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ExampleDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ExampleDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ExampleDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ExampleDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ExampleDB] SET  READ_WRITE
GO
ALTER DATABASE [ExampleDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ExampleDB] SET  MULTI_USER
GO
ALTER DATABASE [ExampleDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ExampleDB] SET DB_CHAINING OFF
GO