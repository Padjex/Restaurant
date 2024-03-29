/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2016
    Target Database Engine Edition : Microsoft SQL Server Express Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [Restoran]
GO
/****** Object:  StoredProcedure [dbo].[PrijemZaposlenih]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP PROCEDURE [dbo].[PrijemZaposlenih]
GO
/****** Object:  StoredProcedure [dbo].[pPorudzbina]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP PROCEDURE [dbo].[pPorudzbina]
GO
ALTER TABLE [dbo].[Zaposleni] DROP CONSTRAINT [Z]
GO
ALTER TABLE [dbo].[Porudzbina] DROP CONSTRAINT [Stat]
GO
ALTER TABLE [dbo].[Angazovanje] DROP CONSTRAINT [STATUS]
GO
ALTER TABLE [dbo].[Zaposleni] DROP CONSTRAINT [FK__Zaposleni__Sifra__300424B4]
GO
ALTER TABLE [dbo].[Zaposleni] DROP CONSTRAINT [FK__Zaposleni__Sifra__2E1BDC42]
GO
ALTER TABLE [dbo].[Sto] DROP CONSTRAINT [FK__Sto__SifraRestor__3A81B327]
GO
ALTER TABLE [dbo].[StavkaRacuna] DROP CONSTRAINT [FK__StavkaRacuna__628FA481]
GO
ALTER TABLE [dbo].[StavkaRacuna] DROP CONSTRAINT [FK__StavkaRac__Sifra__619B8048]
GO
ALTER TABLE [dbo].[Sluzi] DROP CONSTRAINT [FK__Sluzi__SifraZap__3E52440B]
GO
ALTER TABLE [dbo].[Sluzi] DROP CONSTRAINT [FK__Sluzi__BrojStola__3D5E1FD2]
GO
ALTER TABLE [dbo].[Rezervacija] DROP CONSTRAINT [FK__Rezervaci__Sifra__46E78A0C]
GO
ALTER TABLE [dbo].[Rezervacija] DROP CONSTRAINT [FK__Rezervaci__Sifra__45F365D3]
GO
ALTER TABLE [dbo].[Rezervacija] DROP CONSTRAINT [FK__Rezervaci__Sifra__440B1D61]
GO
ALTER TABLE [dbo].[Rezervacija] DROP CONSTRAINT [FK__Rezervaci__BrojS__44FF419A]
GO
ALTER TABLE [dbo].[Restoran] DROP CONSTRAINT [FK__Restoran__SifraG__2B3F6F97]
GO
ALTER TABLE [dbo].[Recepcionar] DROP CONSTRAINT [FK__Recepcion__Sifra__412EB0B6]
GO
ALTER TABLE [dbo].[Racun] DROP CONSTRAINT [FK__Racun__SifraMeni__4AB81AF0]
GO
ALTER TABLE [dbo].[Racun] DROP CONSTRAINT [FK__Racun__BrojStola__49C3F6B7]
GO
ALTER TABLE [dbo].[Porudzbina] DROP CONSTRAINT [FK__Porudzbin__RedBr__5EBF139D]
GO
ALTER TABLE [dbo].[Porudzbina] DROP CONSTRAINT [FK__Porudzbin__BrojS__5DCAEF64]
GO
ALTER TABLE [dbo].[Nalazi] DROP CONSTRAINT [FK__Nalazi__SifraMen__4F7CD00D]
GO
ALTER TABLE [dbo].[Nalazi] DROP CONSTRAINT [FK__Nalazi__RedBr__5070F446]
GO
ALTER TABLE [dbo].[Konobar] DROP CONSTRAINT [FK__Konobar__SifraZa__37A5467C]
GO
ALTER TABLE [dbo].[Angazovanje] DROP CONSTRAINT [FK__Angazovan__Sifra__34C8D9D1]
GO
ALTER TABLE [dbo].[Angazovanje] DROP CONSTRAINT [FK__Angazovan__Sifra__33D4B598]
GO
/****** Object:  Table [dbo].[StavkaRacuna]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StavkaRacuna]') AND type in (N'U'))
DROP TABLE [dbo].[StavkaRacuna]
GO
/****** Object:  Table [dbo].[Sluzi]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sluzi]') AND type in (N'U'))
DROP TABLE [dbo].[Sluzi]
GO
/****** Object:  Table [dbo].[Recepcionar]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recepcionar]') AND type in (N'U'))
DROP TABLE [dbo].[Recepcionar]
GO
/****** Object:  Table [dbo].[Racun]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Racun]') AND type in (N'U'))
DROP TABLE [dbo].[Racun]
GO
/****** Object:  Table [dbo].[Nalazi]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nalazi]') AND type in (N'U'))
DROP TABLE [dbo].[Nalazi]
GO
/****** Object:  Table [dbo].[Meni]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Meni]') AND type in (N'U'))
DROP TABLE [dbo].[Meni]
GO
/****** Object:  Table [dbo].[Konobar]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Konobar]') AND type in (N'U'))
DROP TABLE [dbo].[Konobar]
GO
/****** Object:  UserDefinedFunction [dbo].[fRadnikPremija]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP FUNCTION [dbo].[fRadnikPremija]
GO
/****** Object:  UserDefinedFunction [dbo].[fPorudzbina]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP FUNCTION [dbo].[fPorudzbina]
GO
/****** Object:  View [dbo].[pPorudzbinaSto]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP VIEW [dbo].[pPorudzbinaSto]
GO
/****** Object:  Table [dbo].[Porudzbina]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Porudzbina]') AND type in (N'U'))
DROP TABLE [dbo].[Porudzbina]
GO
/****** Object:  Table [dbo].[StavkaMenija]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StavkaMenija]') AND type in (N'U'))
DROP TABLE [dbo].[StavkaMenija]
GO
/****** Object:  Table [dbo].[Sto]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sto]') AND type in (N'U'))
DROP TABLE [dbo].[Sto]
GO
/****** Object:  View [dbo].[pInfo_Zaposleni]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP VIEW [dbo].[pInfo_Zaposleni]
GO
/****** Object:  Table [dbo].[Zaposleni]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zaposleni]') AND type in (N'U'))
DROP TABLE [dbo].[Zaposleni]
GO
/****** Object:  Table [dbo].[Angazovanje]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Angazovanje]') AND type in (N'U'))
DROP TABLE [dbo].[Angazovanje]
GO
/****** Object:  Table [dbo].[Restoran]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Restoran]') AND type in (N'U'))
DROP TABLE [dbo].[Restoran]
GO
/****** Object:  Table [dbo].[TipRadnogMesta]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipRadnogMesta]') AND type in (N'U'))
DROP TABLE [dbo].[TipRadnogMesta]
GO
/****** Object:  Table [dbo].[Grad]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Grad]') AND type in (N'U'))
DROP TABLE [dbo].[Grad]
GO
/****** Object:  UserDefinedFunction [dbo].[fRec]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP FUNCTION [dbo].[fRec]
GO
/****** Object:  Table [dbo].[Rezervacija]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rezervacija]') AND type in (N'U'))
DROP TABLE [dbo].[Rezervacija]
GO
/****** Object:  Table [dbo].[Gost]    Script Date: 3/27/2022 4:17:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Gost]') AND type in (N'U'))
DROP TABLE [dbo].[Gost]
GO
USE [master]
GO
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP LOGIN [##MS_PolicyEventProcessingLogin##]
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP LOGIN [##MS_PolicyTsqlExecutionLogin##]
GO
/****** Object:  Login [AzureAD\PredragJokovic]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP LOGIN [AzureAD\PredragJokovic]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP LOGIN [NT SERVICE\SQLWriter]
GO
/****** Object:  Database [Restoran]    Script Date: 3/27/2022 4:17:45 PM ******/
DROP DATABASE [Restoran]
GO
/****** Object:  Database [Restoran]    Script Date: 3/27/2022 4:17:45 PM ******/
CREATE DATABASE [Restoran]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restoran', FILENAME = N'C:\Users\PredragJokovic\Restoran.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Restoran_log', FILENAME = N'C:\Users\PredragJokovic\Restoran_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Restoran] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restoran].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restoran] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restoran] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restoran] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restoran] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restoran] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restoran] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Restoran] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restoran] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restoran] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restoran] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restoran] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restoran] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restoran] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restoran] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restoran] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Restoran] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restoran] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restoran] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restoran] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restoran] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restoran] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restoran] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restoran] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restoran] SET  MULTI_USER 
GO
ALTER DATABASE [Restoran] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restoran] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restoran] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restoran] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Restoran] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Restoran] SET QUERY_STORE = OFF
GO
USE [Restoran]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 3/27/2022 4:17:45 PM ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/****** Object:  Login [AzureAD\PredragJokovic]    Script Date: 3/27/2022 4:17:45 PM ******/
CREATE LOGIN [AzureAD\PredragJokovic] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 3/27/2022 4:17:45 PM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'serM6bBAVwqqM3bUsllh1x5V7+fhRtb8+lIQl0r6GUQ=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 3/27/2022 4:17:45 PM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'lDlprD2dbArK58yVenrwOu8VrTrN59kruU7Xj5FPoiU=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [AzureAD\PredragJokovic]
GO
USE [Restoran]
GO
/****** Object:  Table [dbo].[Gost]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gost](
	[SifraGosta] [int] IDENTITY(1,1) NOT NULL,
	[Prezime] [varchar](20) NOT NULL,
	[BrojTelefona] [varchar](11) NOT NULL,
 CONSTRAINT [PK__Gost__1155569807B1925F] PRIMARY KEY CLUSTERED 
(
	[SifraGosta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacija]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacija](
	[VremeRezervacije] [smalldatetime] NOT NULL,
	[SifraGosta] [int] NOT NULL,
	[BrojStola] [varchar](10) NOT NULL,
	[SifraZap] [varchar](10) NOT NULL,
	[SifraRestorana] [varchar](10) NOT NULL,
	[VremeDo] [smalldatetime] NULL,
 CONSTRAINT [PK__Rezervac__A48E0730B0B14AE6] PRIMARY KEY CLUSTERED 
(
	[VremeRezervacije] ASC,
	[SifraGosta] ASC,
	[BrojStola] ASC,
	[SifraZap] ASC,
	[SifraRestorana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fRec]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fRec](@brojStola varchar(10))
returns table
as
return select g.SifraGosta,g.Prezime,r.VremeRezervacije
from Gost g join Rezervacija r on r.SifraGosta=g.SifraGosta
where r.BrojStola=@brojStola
GO
/****** Object:  Table [dbo].[Grad]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grad](
	[SifraGrada] [varchar](10) NOT NULL,
	[Naziv] [varchar](20) NOT NULL,
	[BrojRestorana] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK__Grad__127FA70FA2217533] PRIMARY KEY CLUSTERED 
(
	[SifraGrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipRadnogMesta]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipRadnogMesta](
	[SifraRM] [varchar](10) NOT NULL,
	[NazivRM] [varchar](20) NOT NULL,
 CONSTRAINT [PK__TipRadno__0449B1E8C2758707] PRIMARY KEY CLUSTERED 
(
	[SifraRM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restoran]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restoran](
	[SifraRestorana] [varchar](10) NOT NULL,
	[Lokacija] [varchar](20) NOT NULL,
	[Naziv] [varchar](20) NOT NULL,
	[SifraGrada] [varchar](10) NULL,
 CONSTRAINT [PK__Restoran__9CE57ABA0D8740FF] PRIMARY KEY CLUSTERED 
(
	[SifraRestorana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Angazovanje]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Angazovanje](
	[StatusA] [varchar](10) NULL,
	[SifraZap] [varchar](10) NOT NULL,
	[SifraRM] [varchar](10) NOT NULL,
	[DatumOd] [date] NOT NULL,
	[DatumDo] [date] NULL,
 CONSTRAINT [PK__Angazova__59A390E081A35BB9] PRIMARY KEY CLUSTERED 
(
	[DatumOd] ASC,
	[SifraZap] ASC,
	[SifraRM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaposleni]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposleni](
	[SifraZap] [varchar](10) NOT NULL,
	[SifraNadr] [varchar](10) NULL,
	[Ime] [varchar](10) NOT NULL,
	[Prezime] [varchar](20) NOT NULL,
	[JMBG] [numeric](13, 0) NOT NULL,
	[Pol] [varchar](1) NULL,
	[Plata] [numeric](8, 2) NOT NULL,
	[SifraRestorana] [varchar](10) NOT NULL,
	[Lozinka] [nvarchar](50) NULL,
 CONSTRAINT [PK__Zaposlen__D9BBE5C3CB4F010B] PRIMARY KEY CLUSTERED 
(
	[SifraZap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[pInfo_Zaposleni]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[pInfo_Zaposleni]
(SifraRadnika,Ime,Prezime,Plata,NazivRestorana,Grad,Lokacija,RadnoMesto,DatumOd,DatumDo)
as
select z.SifraZap,z.Ime,z.Prezime,z.Plata,r.Naziv,g.Naziv,r.Lokacija,t.NazivRM,a.DatumOd,a.DatumDo

from Zaposleni z join Restoran r on r.SifraRestorana=z.SifraRestorana
join Grad g on g.SifraGrada=r.SifraGrada 
join Angazovanje a on z.SifraZap=a.SifraZap
join TipRadnogMesta t on t.SifraRM=a.SifraRM
where a.StatusA='Aktivan'
GO
/****** Object:  Table [dbo].[Sto]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sto](
	[BrojStola] [varchar](10) NOT NULL,
	[BrojMesta] [numeric](3, 0) NOT NULL,
	[SifraRestorana] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Sto__ADA335D62A29F878] PRIMARY KEY CLUSTERED 
(
	[BrojStola] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StavkaMenija]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StavkaMenija](
	[RedBr] [numeric](3, 0) IDENTITY(1,1) NOT NULL,
	[Cena] [numeric](7, 2) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__StavkaMe__363E62214B0BC166] PRIMARY KEY CLUSTERED 
(
	[RedBr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Porudzbina]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Porudzbina](
	[StatusP] [char](1) NOT NULL,
	[SifraPor] [varchar](10) NOT NULL,
	[BrojStola] [varchar](10) NOT NULL,
	[RedBrSm] [numeric](3, 0) NOT NULL,
	[Kolicina] [numeric](3, 0) NOT NULL,
 CONSTRAINT [PK__Porudzbi__30F3173B19F26D9E] PRIMARY KEY CLUSTERED 
(
	[BrojStola] ASC,
	[SifraPor] ASC,
	[RedBrSm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[pPorudzbinaSto]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[pPorudzbinaSto]
(Status_por,Sto,SifraPor,Jelo,cena,kolicina,ukupno)
as
select top 100 p.StatusP,s.BrojStola,p.SifraPor,sm.Naziv,sm.Cena,p.Kolicina,p.Kolicina*sm.Cena
from Porudzbina p join sto s on s.BrojStola=p.BrojStola
join StavkaMenija sm on sm.RedBr=p.RedBrSm
order by SifraPor
GO
/****** Object:  UserDefinedFunction [dbo].[fPorudzbina]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fPorudzbina] (@sifraPor varchar(10))
returns table
as
return select p.Jelo,p.cena,p.kolicina,p.ukupno
from pPorudzbinaSto p
where p.SifraPor=@sifraPor
GO
/****** Object:  UserDefinedFunction [dbo].[fRadnikPremija]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fRadnikPremija] (@sifraZapn varchar(10))
returns table
as
return select p.SifraRadnika,p.Ime,p.Prezime,p.Plata,p.NazivRestorana,p.Grad,p.Lokacija,p.RadnoMesto,p.DatumOd,p.DatumDo
from pInfo_Zaposleni p
where p.sifraRadnika=@sifraZapn
GO
/****** Object:  Table [dbo].[Konobar]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konobar](
	[SifraZap] [varchar](10) NOT NULL,
	[Reon] [numeric](2, 0) NOT NULL,
 CONSTRAINT [PK__Konobar__D9BBE5C372CE2BB3] PRIMARY KEY CLUSTERED 
(
	[SifraZap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meni]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meni](
	[SifraMenija] [varchar](10) NOT NULL,
	[DatumOd] [date] NOT NULL,
	[DatumDo] [date] NULL,
 CONSTRAINT [PK__Meni__786429B933845B17] PRIMARY KEY CLUSTERED 
(
	[SifraMenija] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nalazi]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nalazi](
	[SifraMenija] [varchar](10) NOT NULL,
	[RedBr] [numeric](3, 0) NOT NULL,
 CONSTRAINT [PK__Nalazi__7B07CF9B2E54F198] PRIMARY KEY CLUSTERED 
(
	[SifraMenija] ASC,
	[RedBr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Racun]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racun](
	[SifraRacuna] [numeric](18, 0) NOT NULL,
	[Datum] [datetime] NOT NULL,
	[BrojStola] [varchar](10) NOT NULL,
	[SifraMenija] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Racun__2EBE4CFC5AD97675] PRIMARY KEY CLUSTERED 
(
	[SifraRacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recepcionar]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recepcionar](
	[SifraZap] [varchar](10) NOT NULL,
	[Jezik] [varchar](30) NOT NULL,
 CONSTRAINT [PK__Recepcio__D9BBE5C38671DC7B] PRIMARY KEY CLUSTERED 
(
	[SifraZap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sluzi]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sluzi](
	[BrojStola] [varchar](10) NOT NULL,
	[SifraZap] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Sluzi__80388B8AD55DC245] PRIMARY KEY CLUSTERED 
(
	[BrojStola] ASC,
	[SifraZap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StavkaRacuna]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StavkaRacuna](
	[RedBrSr] [numeric](3, 0) NOT NULL,
	[BrojStola] [varchar](10) NOT NULL,
	[RedBrSm] [numeric](3, 0) NOT NULL,
	[SifraPor] [varchar](10) NOT NULL,
	[SifraRacuna] [numeric](18, 0) NOT NULL,
	[Iznos] [numeric](8, 2) NOT NULL,
 CONSTRAINT [PK__StavkaRa__B35D3DA509BC5C3B] PRIMARY KEY CLUSTERED 
(
	[RedBrSr] ASC,
	[SifraRacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z1', N'RM-1', CAST(N'2015-01-24' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z2', N'RM-2', CAST(N'2017-05-24' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z3', N'RM-3', CAST(N'2017-07-24' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z10', N'RM-4', CAST(N'2019-04-24' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z5', N'RM-1', CAST(N'2019-04-24' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z8', N'RM-1', CAST(N'2019-09-24' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z4', N'RM-4', CAST(N'2019-12-24' AS Date), CAST(N'2021-12-24' AS Date))
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z9', N'RM-2', CAST(N'2020-10-24' AS Date), CAST(N'2022-10-24' AS Date))
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z7', N'RM-4', CAST(N'2020-11-24' AS Date), CAST(N'2021-11-24' AS Date))
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z6', N'RM-2', CAST(N'2021-02-24' AS Date), CAST(N'2023-02-24' AS Date))
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z11', N'RM-1', CAST(N'2021-04-24' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z12', N'RM-3', CAST(N'2022-03-17' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z13', N'RM-3', CAST(N'2022-03-17' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z14', N'RM-3', CAST(N'2022-03-17' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z15', N'RM-2', CAST(N'2022-03-18' AS Date), NULL)
INSERT [dbo].[Angazovanje] ([StatusA], [SifraZap], [SifraRM], [DatumOd], [DatumDo]) VALUES (N'Aktivan', N'Z16', N'RM-4', CAST(N'2022-03-18' AS Date), NULL)
GO
SET IDENTITY_INSERT [dbo].[Gost] ON 

INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (1, N'Jovanovic', N'0655552827')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (2, N'Katic', N'0622269395')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (3, N'Minic', N'0611123589')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (4, N'Jankovici', N'0655558251')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (5, N'Jankovic', N'062222145')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (6, N'Maric', N'061874987')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (7, N'Pavlovic', N'0699985212')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (8, N'Pajkovic', N'0612887412')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (9, N'Matijevic', N'062215626')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (10, N'Gajic', N'064891614')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (11, N'Gakovic', N'06124798')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (12, N'Pajkovic', N'065157489')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (13, N'Pantic', N'065894112')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (14, N'Dimitrijevic', N'061115489')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (15, N'Jakovljevici', N'062222584')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (20, N'Minici', N'0655555551')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (23, N'Milica', N'0602241233')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (24, N'Slobodan', N'0662224521')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (25, N'Mirko', N'0602221463')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (27, N'Bojanici', N'0622241894')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (28, N'Jankovic', N'065558412')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (29, N'Marko', N'022222222')
INSERT [dbo].[Gost] ([SifraGosta], [Prezime], [BrojTelefona]) VALUES (31, N'Jovan', N'0655419812')
SET IDENTITY_INSERT [dbo].[Gost] OFF
GO
INSERT [dbo].[Grad] ([SifraGrada], [Naziv], [BrojRestorana]) VALUES (N'11000', N'Beograd', CAST(2 AS Numeric(2, 0)))
INSERT [dbo].[Grad] ([SifraGrada], [Naziv], [BrojRestorana]) VALUES (N'18000', N'Nis', CAST(1 AS Numeric(2, 0)))
INSERT [dbo].[Grad] ([SifraGrada], [Naziv], [BrojRestorana]) VALUES (N'34000', N'Pozega', CAST(1 AS Numeric(2, 0)))
GO
INSERT [dbo].[Konobar] ([SifraZap], [Reon]) VALUES (N'Z15', CAST(1 AS Numeric(2, 0)))
INSERT [dbo].[Konobar] ([SifraZap], [Reon]) VALUES (N'Z2', CAST(1 AS Numeric(2, 0)))
INSERT [dbo].[Konobar] ([SifraZap], [Reon]) VALUES (N'Z6', CAST(1 AS Numeric(2, 0)))
INSERT [dbo].[Konobar] ([SifraZap], [Reon]) VALUES (N'Z9', CAST(1 AS Numeric(2, 0)))
GO
INSERT [dbo].[Meni] ([SifraMenija], [DatumOd], [DatumDo]) VALUES (N'M0', CAST(N'2005-12-05' AS Date), CAST(N'2015-12-05' AS Date))
INSERT [dbo].[Meni] ([SifraMenija], [DatumOd], [DatumDo]) VALUES (N'M1', CAST(N'2015-12-05' AS Date), CAST(N'2025-12-05' AS Date))
GO
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(3 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(4 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(5 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(6 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(7 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(8 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(9 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(10 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(11 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(12 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(13 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M0', CAST(14 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(3 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(4 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(5 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(7 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(8 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(9 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(10 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(11 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(12 AS Numeric(3, 0)))
INSERT [dbo].[Nalazi] ([SifraMenija], [RedBr]) VALUES (N'M1', CAST(14 AS Numeric(3, 0)))
GO
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P1', N'S0', CAST(1 AS Numeric(3, 0)), CAST(4 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P1', N'S0', CAST(17 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P1', N'S0', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P17', N'S0', CAST(15 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P17', N'S0', CAST(17 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'c', N'P7', N'S0', CAST(1 AS Numeric(3, 0)), CAST(9 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P16', N'S2', CAST(14 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P16', N'S2', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P16', N'S2', CAST(18 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P16', N'S2', CAST(20 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P22', N'S2', CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P22', N'S2', CAST(3 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P22', N'S2', CAST(17 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P22', N'S2', CAST(19 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P23', N'S2', CAST(16 AS Numeric(3, 0)), CAST(3 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P23', N'S2', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P23', N'S2', CAST(20 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P24', N'S2', CAST(1 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P24', N'S2', CAST(3 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P24', N'S2', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P24', N'S2', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P25', N'S2', CAST(5 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P25', N'S2', CAST(7 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P25', N'S2', CAST(9 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P25', N'S2', CAST(10 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P25', N'S2', CAST(11 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P28', N'S2', CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P28', N'S2', CAST(3 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P28', N'S2', CAST(5 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P28', N'S2', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P28', N'S2', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P4', N'S2', CAST(3 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'c', N'P5', N'S2', CAST(3 AS Numeric(3, 0)), CAST(4 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'c', N'P5', N'S2', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P6', N'S2', CAST(4 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P15', N'S24', CAST(1 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P15', N'S24', CAST(15 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P15', N'S24', CAST(17 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P15', N'S24', CAST(19 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P14', N'S26', CAST(1 AS Numeric(3, 0)), CAST(3 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P14', N'S26', CAST(3 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P14', N'S26', CAST(5 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P14', N'S26', CAST(14 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P14', N'S26', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P14', N'S26', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P21', N'S26', CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P21', N'S26', CAST(2 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P21', N'S26', CAST(3 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P21', N'S26', CAST(4 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P21', N'S26', CAST(6 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P21', N'S26', CAST(7 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P21', N'S26', CAST(8 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P13', N'S28', CAST(1 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P13', N'S28', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P13', N'S28', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P13', N'S28', CAST(20 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P19', N'S3', CAST(1 AS Numeric(3, 0)), CAST(4 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P19', N'S3', CAST(14 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P19', N'S3', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P19', N'S3', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P9', N'S3', CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P9', N'S3', CAST(3 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P9', N'S3', CAST(5 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P9', N'S3', CAST(7 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P20', N'S30', CAST(15 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P20', N'S30', CAST(17 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P20', N'S30', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P20', N'S30', CAST(19 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P10', N'S4', CAST(14 AS Numeric(3, 0)), CAST(3 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P10', N'S4', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P10', N'S4', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P11', N'S4', CAST(1 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P11', N'S4', CAST(14 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P11', N'S4', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P11', N'S4', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P12', N'S4', CAST(1 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P12', N'S4', CAST(14 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P12', N'S4', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P18', N'S4', CAST(15 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P18', N'S4', CAST(17 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P18', N'S4', CAST(19 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P2', N'S4', CAST(5 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P2', N'S4', CAST(14 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P26', N'S4', CAST(4 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P26', N'S4', CAST(5 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P26', N'S4', CAST(7 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P26', N'S4', CAST(10 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P26', N'S4', CAST(16 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P27', N'S4', CAST(4 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P27', N'S4', CAST(5 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P27', N'S4', CAST(7 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P27', N'S4', CAST(18 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'O', N'P8', N'S5', CAST(1 AS Numeric(3, 0)), CAST(1 AS Numeric(3, 0)))
INSERT [dbo].[Porudzbina] ([StatusP], [SifraPor], [BrojStola], [RedBrSm], [Kolicina]) VALUES (N'C', N'P3', N'S9', CAST(14 AS Numeric(3, 0)), CAST(2 AS Numeric(3, 0)))
GO
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(N'2020-04-19T17:47:21.000' AS DateTime), N'S0', N'M0')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(N'2021-07-30T20:47:21.000' AS DateTime), N'S4', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(N'2021-08-30T20:44:21.000' AS DateTime), N'S9', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(N'2022-03-13T03:07:03.230' AS DateTime), N'S2', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(N'2022-03-20T23:15:33.373' AS DateTime), N'S2', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(N'2022-03-26T13:29:08.367' AS DateTime), N'S2', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(N'2022-03-26T14:12:16.483' AS DateTime), N'S0', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(N'2022-03-26T14:14:52.953' AS DateTime), N'S5', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(N'2022-03-26T14:15:21.760' AS DateTime), N'S3', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(N'2022-03-26T19:51:56.353' AS DateTime), N'S4', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(N'2022-03-26T19:53:14.510' AS DateTime), N'S4', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(N'2022-03-26T19:54:08.377' AS DateTime), N'S4', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(N'2022-03-26T19:55:28.750' AS DateTime), N'S28', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(N'2022-03-26T20:01:38.010' AS DateTime), N'S26', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(N'2022-03-26T20:02:50.530' AS DateTime), N'S24', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(N'2022-03-26T20:04:22.920' AS DateTime), N'S2', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(N'2022-03-26T20:04:52.973' AS DateTime), N'S0', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(N'2022-03-26T20:06:29.880' AS DateTime), N'S4', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(N'2022-03-26T20:08:20.060' AS DateTime), N'S3', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(N'2022-03-26T20:09:38.677' AS DateTime), N'S30', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(N'2022-03-26T20:10:22.250' AS DateTime), N'S26', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(N'2022-03-26T20:12:25.647' AS DateTime), N'S2', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(N'2022-03-26T20:16:19.540' AS DateTime), N'S2', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(N'2022-03-26T20:18:54.493' AS DateTime), N'S2', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(N'2022-03-26T20:20:25.177' AS DateTime), N'S2', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(N'2022-03-26T20:22:31.493' AS DateTime), N'S4', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(27 AS Numeric(18, 0)), CAST(N'2022-03-26T20:31:32.740' AS DateTime), N'S4', N'M1')
INSERT [dbo].[Racun] ([SifraRacuna], [Datum], [BrojStola], [SifraMenija]) VALUES (CAST(28 AS Numeric(18, 0)), CAST(N'2022-03-26T20:34:47.647' AS DateTime), N'S2', N'M1')
GO
INSERT [dbo].[Recepcionar] ([SifraZap], [Jezik]) VALUES (N'Z10', N'Engleski, Srpski, Nemacki')
INSERT [dbo].[Recepcionar] ([SifraZap], [Jezik]) VALUES (N'Z12', N'Srpski')
INSERT [dbo].[Recepcionar] ([SifraZap], [Jezik]) VALUES (N'Z16', N'Srpski')
INSERT [dbo].[Recepcionar] ([SifraZap], [Jezik]) VALUES (N'Z4', N'Engleski, Srpski')
INSERT [dbo].[Recepcionar] ([SifraZap], [Jezik]) VALUES (N'Z7', N'Srpski')
GO
INSERT [dbo].[Restoran] ([SifraRestorana], [Lokacija], [Naziv], [SifraGrada]) VALUES (N'R0', N'Djuriceva 28', N'Zip Zvezdara', N'11000')
INSERT [dbo].[Restoran] ([SifraRestorana], [Lokacija], [Naziv], [SifraGrada]) VALUES (N'R1', N'Kneza Milosa 4', N'Zip Terazije', N'11000')
INSERT [dbo].[Restoran] ([SifraRestorana], [Lokacija], [Naziv], [SifraGrada]) VALUES (N'R2', N'Svetogorska 3', N'Zip Centar', N'18000')
INSERT [dbo].[Restoran] ([SifraRestorana], [Lokacija], [Naziv], [SifraGrada]) VALUES (N'R3', N'Kneza Mihailova 2', N'Zip Pozega', N'34000')
GO
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-18T14:00:00' AS SmallDateTime), 1, N'S0', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-18T14:00:00' AS SmallDateTime), 2, N'S0', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T05:59:00' AS SmallDateTime), 20, N'S4', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 3, N'S3', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 4, N'S2', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 5, N'S1', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 6, N'S1', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 7, N'S1', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 8, N'S7', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 9, N'S24', N'Z10', N'R3', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 10, N'S24', N'Z10', N'R3', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 11, N'S25', N'Z10', N'R3', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 12, N'S26', N'Z10', N'R3', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 13, N'S27', N'Z10', N'R3', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 14, N'S30', N'Z10', N'R3', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T14:00:00' AS SmallDateTime), 15, N'S7', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-19T21:32:00' AS SmallDateTime), 23, N'S2', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-22T16:09:00' AS SmallDateTime), 25, N'S4', N'Z4', N'R0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-22T16:09:00' AS SmallDateTime), 27, N's2', N'z4', N'r0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-22T16:09:00' AS SmallDateTime), 28, N's6', N'z4', N'r0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-22T16:09:00' AS SmallDateTime), 29, N's2', N'z4', N'r0', NULL)
INSERT [dbo].[Rezervacija] ([VremeRezervacije], [SifraGosta], [BrojStola], [SifraZap], [SifraRestorana], [VremeDo]) VALUES (CAST(N'2022-03-24T17:26:00' AS SmallDateTime), 31, N'S6', N'Z4', N'R0', NULL)
GO
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S0', N'Z2')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S1', N'Z2')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S10', N'Z6')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S11', N'Z6')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S12', N'Z6')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S13', N'Z6')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S14', N'Z6')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S15', N'Z6')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S16', N'Z15')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S17', N'Z15')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S18', N'Z15')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S19', N'Z15')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S2', N'Z2')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S20', N'Z15')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S21', N'Z15')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S22', N'Z15')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S23', N'Z15')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S24', N'Z9')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S25', N'Z9')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S26', N'Z9')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S27', N'Z9')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S28', N'Z9')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S29', N'Z9')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S3', N'Z2')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S30', N'Z9')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S31', N'Z9')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S4', N'Z2')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S5', N'Z2')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S6', N'Z2')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S7', N'Z2')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S8', N'Z6')
INSERT [dbo].[Sluzi] ([BrojStola], [SifraZap]) VALUES (N'S9', N'Z6')
GO
SET IDENTITY_INSERT [dbo].[StavkaMenija] ON 

INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(1 AS Numeric(3, 0)), CAST(150.00 AS Numeric(7, 2)), N'Zajacarsko 0.5')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(2 AS Numeric(3, 0)), CAST(165.00 AS Numeric(7, 2)), N'Jelen 0.5')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(3 AS Numeric(3, 0)), CAST(160.00 AS Numeric(7, 2)), N'Lav 0.5')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(4 AS Numeric(3, 0)), CAST(190.00 AS Numeric(7, 2)), N'Pomorandza 0.33')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(5 AS Numeric(3, 0)), CAST(170.00 AS Numeric(7, 2)), N'Jabuka 0.33')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(6 AS Numeric(3, 0)), CAST(120.00 AS Numeric(7, 2)), N'Caj')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(7 AS Numeric(3, 0)), CAST(120.00 AS Numeric(7, 2)), N'Kafa')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(8 AS Numeric(3, 0)), CAST(180.00 AS Numeric(7, 2)), N'Nes Kafa')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(9 AS Numeric(3, 0)), CAST(320.00 AS Numeric(7, 2)), N'Cesar salata')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(10 AS Numeric(3, 0)), CAST(290.00 AS Numeric(7, 2)), N'Ruska salata')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(11 AS Numeric(3, 0)), CAST(240.00 AS Numeric(7, 2)), N'Paradajiz salata')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(12 AS Numeric(3, 0)), CAST(220.00 AS Numeric(7, 2)), N'Mesana salata')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(13 AS Numeric(3, 0)), CAST(200.00 AS Numeric(7, 2)), N'Kupus salata')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(14 AS Numeric(3, 0)), CAST(790.00 AS Numeric(7, 2)), N'Pileci file')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(15 AS Numeric(3, 0)), CAST(650.00 AS Numeric(7, 2)), N'Cevapi 5kom')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(16 AS Numeric(3, 0)), CAST(1200.00 AS Numeric(7, 2)), N'Cevapi 10kom')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(17 AS Numeric(3, 0)), CAST(890.00 AS Numeric(7, 2)), N'Pileci raznjic')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(18 AS Numeric(3, 0)), CAST(1200.00 AS Numeric(7, 2)), N'Dimljena vesalica')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(19 AS Numeric(3, 0)), CAST(1400.00 AS Numeric(7, 2)), N'Mesano meso')
INSERT [dbo].[StavkaMenija] ([RedBr], [Cena], [Naziv]) VALUES (CAST(20 AS Numeric(3, 0)), CAST(1850.00 AS Numeric(7, 2)), N'Svinjska kolenica')
SET IDENTITY_INSERT [dbo].[StavkaMenija] OFF
GO
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S0', CAST(18 AS Numeric(3, 0)), N'P1', CAST(1 AS Numeric(18, 0)), CAST(3300.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S4', CAST(14 AS Numeric(3, 0)), N'P2', CAST(2 AS Numeric(18, 0)), CAST(680.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S9', CAST(14 AS Numeric(3, 0)), N'P3', CAST(3 AS Numeric(18, 0)), CAST(680.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(3 AS Numeric(3, 0)), N'P4', CAST(4 AS Numeric(18, 0)), CAST(3600.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(3 AS Numeric(3, 0)), N'P5', CAST(5 AS Numeric(18, 0)), CAST(320.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(4 AS Numeric(3, 0)), N'P6', CAST(6 AS Numeric(18, 0)), CAST(190.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S5', CAST(1 AS Numeric(3, 0)), N'P8', CAST(8 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S3', CAST(1 AS Numeric(3, 0)), N'P9', CAST(9 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S4', CAST(18 AS Numeric(3, 0)), N'P10', CAST(10 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S4', CAST(16 AS Numeric(3, 0)), N'P11', CAST(11 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S4', CAST(16 AS Numeric(3, 0)), N'P12', CAST(12 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S28', CAST(16 AS Numeric(3, 0)), N'P13', CAST(13 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S26', CAST(16 AS Numeric(3, 0)), N'P14', CAST(14 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S24', CAST(15 AS Numeric(3, 0)), N'P15', CAST(15 AS Numeric(18, 0)), CAST(650.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(16 AS Numeric(3, 0)), N'P16', CAST(16 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S0', CAST(15 AS Numeric(3, 0)), N'P17', CAST(17 AS Numeric(18, 0)), CAST(650.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S4', CAST(17 AS Numeric(3, 0)), N'P18', CAST(18 AS Numeric(18, 0)), CAST(890.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S3', CAST(14 AS Numeric(3, 0)), N'P19', CAST(19 AS Numeric(18, 0)), CAST(790.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S30', CAST(19 AS Numeric(3, 0)), N'P20', CAST(20 AS Numeric(18, 0)), CAST(1400.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S26', CAST(1 AS Numeric(3, 0)), N'P21', CAST(21 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(19 AS Numeric(3, 0)), N'P22', CAST(22 AS Numeric(18, 0)), CAST(1400.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(16 AS Numeric(3, 0)), N'P23', CAST(23 AS Numeric(18, 0)), CAST(3600.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(18 AS Numeric(3, 0)), N'P24', CAST(24 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(10 AS Numeric(3, 0)), N'P25', CAST(25 AS Numeric(18, 0)), CAST(290.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S4', CAST(16 AS Numeric(3, 0)), N'P26', CAST(26 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S4', CAST(18 AS Numeric(3, 0)), N'P27', CAST(27 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(1 AS Numeric(3, 0)), N'S2', CAST(18 AS Numeric(3, 0)), N'P28', CAST(28 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S0', CAST(17 AS Numeric(3, 0)), N'P1', CAST(1 AS Numeric(18, 0)), CAST(3200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S4', CAST(5 AS Numeric(3, 0)), N'P2', CAST(2 AS Numeric(18, 0)), CAST(320.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S2', CAST(18 AS Numeric(3, 0)), N'P5', CAST(5 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S2', CAST(4 AS Numeric(3, 0)), N'P6', CAST(6 AS Numeric(18, 0)), CAST(190.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S3', CAST(3 AS Numeric(3, 0)), N'P9', CAST(9 AS Numeric(18, 0)), CAST(160.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S4', CAST(14 AS Numeric(3, 0)), N'P10', CAST(10 AS Numeric(18, 0)), CAST(2370.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S4', CAST(18 AS Numeric(3, 0)), N'P11', CAST(11 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S4', CAST(14 AS Numeric(3, 0)), N'P12', CAST(12 AS Numeric(18, 0)), CAST(790.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S28', CAST(18 AS Numeric(3, 0)), N'P13', CAST(13 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S26', CAST(18 AS Numeric(3, 0)), N'P14', CAST(14 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S24', CAST(17 AS Numeric(3, 0)), N'P15', CAST(15 AS Numeric(18, 0)), CAST(890.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S2', CAST(18 AS Numeric(3, 0)), N'P16', CAST(16 AS Numeric(18, 0)), CAST(2400.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S0', CAST(17 AS Numeric(3, 0)), N'P17', CAST(17 AS Numeric(18, 0)), CAST(890.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S4', CAST(15 AS Numeric(3, 0)), N'P18', CAST(18 AS Numeric(18, 0)), CAST(650.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S3', CAST(16 AS Numeric(3, 0)), N'P19', CAST(19 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S30', CAST(17 AS Numeric(3, 0)), N'P20', CAST(20 AS Numeric(18, 0)), CAST(890.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S26', CAST(3 AS Numeric(3, 0)), N'P21', CAST(21 AS Numeric(18, 0)), CAST(160.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S2', CAST(17 AS Numeric(3, 0)), N'P22', CAST(22 AS Numeric(18, 0)), CAST(890.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S2', CAST(18 AS Numeric(3, 0)), N'P23', CAST(23 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S2', CAST(16 AS Numeric(3, 0)), N'P24', CAST(24 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S2', CAST(11 AS Numeric(3, 0)), N'P25', CAST(25 AS Numeric(18, 0)), CAST(240.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S4', CAST(7 AS Numeric(3, 0)), N'P26', CAST(26 AS Numeric(18, 0)), CAST(120.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S4', CAST(5 AS Numeric(3, 0)), N'P27', CAST(27 AS Numeric(18, 0)), CAST(170.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(2 AS Numeric(3, 0)), N'S2', CAST(16 AS Numeric(3, 0)), N'P28', CAST(28 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P1', CAST(1 AS Numeric(18, 0)), CAST(600.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S3', CAST(5 AS Numeric(3, 0)), N'P9', CAST(9 AS Numeric(18, 0)), CAST(170.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S4', CAST(16 AS Numeric(3, 0)), N'P10', CAST(10 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S4', CAST(14 AS Numeric(3, 0)), N'P11', CAST(11 AS Numeric(18, 0)), CAST(790.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S4', CAST(1 AS Numeric(3, 0)), N'P12', CAST(12 AS Numeric(18, 0)), CAST(300.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S28', CAST(20 AS Numeric(3, 0)), N'P13', CAST(13 AS Numeric(18, 0)), CAST(1850.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S26', CAST(14 AS Numeric(3, 0)), N'P14', CAST(14 AS Numeric(18, 0)), CAST(1580.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S24', CAST(19 AS Numeric(3, 0)), N'P15', CAST(15 AS Numeric(18, 0)), CAST(1400.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S2', CAST(14 AS Numeric(3, 0)), N'P16', CAST(16 AS Numeric(18, 0)), CAST(790.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S4', CAST(19 AS Numeric(3, 0)), N'P18', CAST(18 AS Numeric(18, 0)), CAST(1400.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S3', CAST(18 AS Numeric(3, 0)), N'P19', CAST(19 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S30', CAST(15 AS Numeric(3, 0)), N'P20', CAST(20 AS Numeric(18, 0)), CAST(650.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S26', CAST(7 AS Numeric(3, 0)), N'P21', CAST(21 AS Numeric(18, 0)), CAST(120.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S2', CAST(3 AS Numeric(3, 0)), N'P22', CAST(22 AS Numeric(18, 0)), CAST(160.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S2', CAST(20 AS Numeric(3, 0)), N'P23', CAST(23 AS Numeric(18, 0)), CAST(1850.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S2', CAST(1 AS Numeric(3, 0)), N'P24', CAST(24 AS Numeric(18, 0)), CAST(300.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S2', CAST(9 AS Numeric(3, 0)), N'P25', CAST(25 AS Numeric(18, 0)), CAST(320.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S4', CAST(5 AS Numeric(3, 0)), N'P26', CAST(26 AS Numeric(18, 0)), CAST(170.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S4', CAST(4 AS Numeric(3, 0)), N'P27', CAST(27 AS Numeric(18, 0)), CAST(190.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(3 AS Numeric(3, 0)), N'S2', CAST(1 AS Numeric(3, 0)), N'P28', CAST(28 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S3', CAST(7 AS Numeric(3, 0)), N'P9', CAST(9 AS Numeric(18, 0)), CAST(120.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S4', CAST(1 AS Numeric(3, 0)), N'P11', CAST(11 AS Numeric(18, 0)), CAST(300.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S28', CAST(1 AS Numeric(3, 0)), N'P13', CAST(13 AS Numeric(18, 0)), CAST(300.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S26', CAST(1 AS Numeric(3, 0)), N'P14', CAST(14 AS Numeric(18, 0)), CAST(450.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S24', CAST(1 AS Numeric(3, 0)), N'P15', CAST(15 AS Numeric(18, 0)), CAST(300.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S2', CAST(20 AS Numeric(3, 0)), N'P16', CAST(16 AS Numeric(18, 0)), CAST(1850.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S3', CAST(1 AS Numeric(3, 0)), N'P19', CAST(19 AS Numeric(18, 0)), CAST(600.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S30', CAST(18 AS Numeric(3, 0)), N'P20', CAST(20 AS Numeric(18, 0)), CAST(1200.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S26', CAST(6 AS Numeric(3, 0)), N'P21', CAST(21 AS Numeric(18, 0)), CAST(120.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S2', CAST(1 AS Numeric(3, 0)), N'P22', CAST(22 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S2', CAST(3 AS Numeric(3, 0)), N'P24', CAST(24 AS Numeric(18, 0)), CAST(160.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S2', CAST(5 AS Numeric(3, 0)), N'P25', CAST(25 AS Numeric(18, 0)), CAST(170.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S4', CAST(4 AS Numeric(3, 0)), N'P26', CAST(26 AS Numeric(18, 0)), CAST(190.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S4', CAST(7 AS Numeric(3, 0)), N'P27', CAST(27 AS Numeric(18, 0)), CAST(120.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(4 AS Numeric(3, 0)), N'S2', CAST(3 AS Numeric(3, 0)), N'P28', CAST(28 AS Numeric(18, 0)), CAST(160.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(5 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(5 AS Numeric(3, 0)), N'S26', CAST(3 AS Numeric(3, 0)), N'P14', CAST(14 AS Numeric(18, 0)), CAST(160.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(5 AS Numeric(3, 0)), N'S26', CAST(8 AS Numeric(3, 0)), N'P21', CAST(21 AS Numeric(18, 0)), CAST(180.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(5 AS Numeric(3, 0)), N'S2', CAST(7 AS Numeric(3, 0)), N'P25', CAST(25 AS Numeric(18, 0)), CAST(120.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(5 AS Numeric(3, 0)), N'S4', CAST(10 AS Numeric(3, 0)), N'P26', CAST(26 AS Numeric(18, 0)), CAST(290.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(5 AS Numeric(3, 0)), N'S2', CAST(5 AS Numeric(3, 0)), N'P28', CAST(28 AS Numeric(18, 0)), CAST(170.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(6 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(6 AS Numeric(3, 0)), N'S26', CAST(5 AS Numeric(3, 0)), N'P14', CAST(14 AS Numeric(18, 0)), CAST(170.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(6 AS Numeric(3, 0)), N'S26', CAST(4 AS Numeric(3, 0)), N'P21', CAST(21 AS Numeric(18, 0)), CAST(190.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(7 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
GO
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(7 AS Numeric(3, 0)), N'S26', CAST(2 AS Numeric(3, 0)), N'P21', CAST(21 AS Numeric(18, 0)), CAST(165.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(8 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
INSERT [dbo].[StavkaRacuna] ([RedBrSr], [BrojStola], [RedBrSm], [SifraPor], [SifraRacuna], [Iznos]) VALUES (CAST(9 AS Numeric(3, 0)), N'S0', CAST(1 AS Numeric(3, 0)), N'P7', CAST(7 AS Numeric(18, 0)), CAST(150.00 AS Numeric(8, 2)))
GO
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S0', CAST(2 AS Numeric(3, 0)), N'R0')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S1', CAST(2 AS Numeric(3, 0)), N'R0')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S10', CAST(4 AS Numeric(3, 0)), N'R1')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S11', CAST(4 AS Numeric(3, 0)), N'R1')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S12', CAST(6 AS Numeric(3, 0)), N'R1')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S13', CAST(6 AS Numeric(3, 0)), N'R1')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S14', CAST(8 AS Numeric(3, 0)), N'R1')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S15', CAST(8 AS Numeric(3, 0)), N'R1')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S16', CAST(2 AS Numeric(3, 0)), N'R2')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S17', CAST(2 AS Numeric(3, 0)), N'R2')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S18', CAST(4 AS Numeric(3, 0)), N'R2')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S19', CAST(4 AS Numeric(3, 0)), N'R2')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S2', CAST(4 AS Numeric(3, 0)), N'R0')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S20', CAST(6 AS Numeric(3, 0)), N'R2')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S21', CAST(6 AS Numeric(3, 0)), N'R2')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S22', CAST(8 AS Numeric(3, 0)), N'R2')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S23', CAST(8 AS Numeric(3, 0)), N'R2')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S24', CAST(2 AS Numeric(3, 0)), N'R3')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S25', CAST(2 AS Numeric(3, 0)), N'R3')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S26', CAST(4 AS Numeric(3, 0)), N'R3')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S27', CAST(4 AS Numeric(3, 0)), N'R3')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S28', CAST(6 AS Numeric(3, 0)), N'R3')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S29', CAST(6 AS Numeric(3, 0)), N'R3')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S3', CAST(4 AS Numeric(3, 0)), N'R0')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S30', CAST(8 AS Numeric(3, 0)), N'R3')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S31', CAST(8 AS Numeric(3, 0)), N'R3')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S4', CAST(6 AS Numeric(3, 0)), N'R0')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S5', CAST(6 AS Numeric(3, 0)), N'R0')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S6', CAST(8 AS Numeric(3, 0)), N'R0')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S7', CAST(8 AS Numeric(3, 0)), N'R0')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S8', CAST(2 AS Numeric(3, 0)), N'R1')
INSERT [dbo].[Sto] ([BrojStola], [BrojMesta], [SifraRestorana]) VALUES (N'S9', CAST(2 AS Numeric(3, 0)), N'R1')
GO
INSERT [dbo].[TipRadnogMesta] ([SifraRM], [NazivRM]) VALUES (N'RM-1', N'Menadzer')
INSERT [dbo].[TipRadnogMesta] ([SifraRM], [NazivRM]) VALUES (N'RM-2', N'Konobar')
INSERT [dbo].[TipRadnogMesta] ([SifraRM], [NazivRM]) VALUES (N'RM-3', N'Kuvar')
INSERT [dbo].[TipRadnogMesta] ([SifraRM], [NazivRM]) VALUES (N'RM-4', N'Recepcionar')
GO
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z1', NULL, N'Milovan', N'Milovanovic', CAST(1234567589641 AS Numeric(13, 0)), N'M', CAST(110000.00 AS Numeric(8, 2)), N'R0', N'R0Z1')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z10', N'Z8', N'Marija', N'Katic', CAST(1247856935874 AS Numeric(13, 0)), N'Z', CAST(55000.00 AS Numeric(8, 2)), N'R3', N'R3Z10')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z11', NULL, N'Milica', N'Katic', CAST(1212996495161 AS Numeric(13, 0)), N'Z', CAST(89000.00 AS Numeric(8, 2)), N'R2', N'R2Z11')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z12', N'Z5', N'Petar', N'Savic', CAST(1802997456121 AS Numeric(13, 0)), N'M', CAST(60000.00 AS Numeric(8, 2)), N'R1', N'')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z13', N'Z8', N'Marija', N'Jankovic', CAST(18599462 AS Numeric(13, 0)), N'Z', CAST(65000.00 AS Numeric(8, 2)), N'R3', N'')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z14', N'Z11', N'Mirko', N'Jeremic', CAST(181299845625 AS Numeric(13, 0)), N'M', CAST(65000.00 AS Numeric(8, 2)), N'R2', N'')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z15', N'Z11', N'Nevena', N'Savic', CAST(181299845625 AS Numeric(13, 0)), N'Z', CAST(55000.00 AS Numeric(8, 2)), N'R2', N'R2Z15')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z16', N'Z11', N'Dragan', N'Mrkovic', CAST(181299845625 AS Numeric(13, 0)), N'M', CAST(55000.00 AS Numeric(8, 2)), N'R2', N'R2Z16')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z2', N'Z1', N'Jovan', N'Jovanovic', CAST(1453698745216 AS Numeric(13, 0)), N'M', CAST(55000.00 AS Numeric(8, 2)), N'R0', N'R0Z2')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z3', N'Z1', N'Milica', N'Janic', CAST(1247856932654 AS Numeric(13, 0)), N'Z', CAST(85000.00 AS Numeric(8, 2)), N'R0', N'R0Z3')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z4', N'Z1', N'Stefan', N'Raketic', CAST(5469871236458 AS Numeric(13, 0)), N'M', CAST(45000.00 AS Numeric(8, 2)), N'R0', N'R0Z4')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z5', NULL, N'Dejan', N'Milosevic', CAST(5687412548697 AS Numeric(13, 0)), N'M', CAST(110000.00 AS Numeric(8, 2)), N'R1', N'R1Z5')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z6', N'Z5', N'Goran', N'Cvijanovic', CAST(1453698745216 AS Numeric(13, 0)), N'M', CAST(55000.00 AS Numeric(8, 2)), N'R1', N'R1Z6')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z7', N'Z5', N'Ana', N'Spasic', CAST(6547123648128 AS Numeric(13, 0)), N'Z', CAST(85000.00 AS Numeric(8, 2)), N'R1', N'R1Z7')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z8', NULL, N'Milivoje', N'Pajkic', CAST(1247856935894 AS Numeric(13, 0)), N'M', CAST(105000.00 AS Numeric(8, 2)), N'R3', N'R3Z8')
INSERT [dbo].[Zaposleni] ([SifraZap], [SifraNadr], [Ime], [Prezime], [JMBG], [Pol], [Plata], [SifraRestorana], [Lozinka]) VALUES (N'Z9', N'Z8', N'Marko', N'Markovic', CAST(6847856935894 AS Numeric(13, 0)), N'M', CAST(45000.00 AS Numeric(8, 2)), N'R3', N'R3Z9')
GO
ALTER TABLE [dbo].[Angazovanje]  WITH CHECK ADD  CONSTRAINT [FK__Angazovan__Sifra__33D4B598] FOREIGN KEY([SifraZap])
REFERENCES [dbo].[Zaposleni] ([SifraZap])
GO
ALTER TABLE [dbo].[Angazovanje] CHECK CONSTRAINT [FK__Angazovan__Sifra__33D4B598]
GO
ALTER TABLE [dbo].[Angazovanje]  WITH CHECK ADD  CONSTRAINT [FK__Angazovan__Sifra__34C8D9D1] FOREIGN KEY([SifraRM])
REFERENCES [dbo].[TipRadnogMesta] ([SifraRM])
GO
ALTER TABLE [dbo].[Angazovanje] CHECK CONSTRAINT [FK__Angazovan__Sifra__34C8D9D1]
GO
ALTER TABLE [dbo].[Konobar]  WITH CHECK ADD  CONSTRAINT [FK__Konobar__SifraZa__37A5467C] FOREIGN KEY([SifraZap])
REFERENCES [dbo].[Zaposleni] ([SifraZap])
GO
ALTER TABLE [dbo].[Konobar] CHECK CONSTRAINT [FK__Konobar__SifraZa__37A5467C]
GO
ALTER TABLE [dbo].[Nalazi]  WITH CHECK ADD  CONSTRAINT [FK__Nalazi__RedBr__5070F446] FOREIGN KEY([RedBr])
REFERENCES [dbo].[StavkaMenija] ([RedBr])
GO
ALTER TABLE [dbo].[Nalazi] CHECK CONSTRAINT [FK__Nalazi__RedBr__5070F446]
GO
ALTER TABLE [dbo].[Nalazi]  WITH CHECK ADD  CONSTRAINT [FK__Nalazi__SifraMen__4F7CD00D] FOREIGN KEY([SifraMenija])
REFERENCES [dbo].[Meni] ([SifraMenija])
GO
ALTER TABLE [dbo].[Nalazi] CHECK CONSTRAINT [FK__Nalazi__SifraMen__4F7CD00D]
GO
ALTER TABLE [dbo].[Porudzbina]  WITH CHECK ADD  CONSTRAINT [FK__Porudzbin__BrojS__5DCAEF64] FOREIGN KEY([BrojStola])
REFERENCES [dbo].[Sto] ([BrojStola])
GO
ALTER TABLE [dbo].[Porudzbina] CHECK CONSTRAINT [FK__Porudzbin__BrojS__5DCAEF64]
GO
ALTER TABLE [dbo].[Porudzbina]  WITH CHECK ADD  CONSTRAINT [FK__Porudzbin__RedBr__5EBF139D] FOREIGN KEY([RedBrSm])
REFERENCES [dbo].[StavkaMenija] ([RedBr])
GO
ALTER TABLE [dbo].[Porudzbina] CHECK CONSTRAINT [FK__Porudzbin__RedBr__5EBF139D]
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD  CONSTRAINT [FK__Racun__BrojStola__49C3F6B7] FOREIGN KEY([BrojStola])
REFERENCES [dbo].[Sto] ([BrojStola])
GO
ALTER TABLE [dbo].[Racun] CHECK CONSTRAINT [FK__Racun__BrojStola__49C3F6B7]
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD  CONSTRAINT [FK__Racun__SifraMeni__4AB81AF0] FOREIGN KEY([SifraMenija])
REFERENCES [dbo].[Meni] ([SifraMenija])
GO
ALTER TABLE [dbo].[Racun] CHECK CONSTRAINT [FK__Racun__SifraMeni__4AB81AF0]
GO
ALTER TABLE [dbo].[Recepcionar]  WITH CHECK ADD  CONSTRAINT [FK__Recepcion__Sifra__412EB0B6] FOREIGN KEY([SifraZap])
REFERENCES [dbo].[Zaposleni] ([SifraZap])
GO
ALTER TABLE [dbo].[Recepcionar] CHECK CONSTRAINT [FK__Recepcion__Sifra__412EB0B6]
GO
ALTER TABLE [dbo].[Restoran]  WITH CHECK ADD  CONSTRAINT [FK__Restoran__SifraG__2B3F6F97] FOREIGN KEY([SifraGrada])
REFERENCES [dbo].[Grad] ([SifraGrada])
GO
ALTER TABLE [dbo].[Restoran] CHECK CONSTRAINT [FK__Restoran__SifraG__2B3F6F97]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK__Rezervaci__BrojS__44FF419A] FOREIGN KEY([BrojStola])
REFERENCES [dbo].[Sto] ([BrojStola])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK__Rezervaci__BrojS__44FF419A]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK__Rezervaci__Sifra__440B1D61] FOREIGN KEY([SifraGosta])
REFERENCES [dbo].[Gost] ([SifraGosta])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK__Rezervaci__Sifra__440B1D61]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK__Rezervaci__Sifra__45F365D3] FOREIGN KEY([SifraZap])
REFERENCES [dbo].[Recepcionar] ([SifraZap])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK__Rezervaci__Sifra__45F365D3]
GO
ALTER TABLE [dbo].[Rezervacija]  WITH CHECK ADD  CONSTRAINT [FK__Rezervaci__Sifra__46E78A0C] FOREIGN KEY([SifraRestorana])
REFERENCES [dbo].[Restoran] ([SifraRestorana])
GO
ALTER TABLE [dbo].[Rezervacija] CHECK CONSTRAINT [FK__Rezervaci__Sifra__46E78A0C]
GO
ALTER TABLE [dbo].[Sluzi]  WITH CHECK ADD  CONSTRAINT [FK__Sluzi__BrojStola__3D5E1FD2] FOREIGN KEY([BrojStola])
REFERENCES [dbo].[Sto] ([BrojStola])
GO
ALTER TABLE [dbo].[Sluzi] CHECK CONSTRAINT [FK__Sluzi__BrojStola__3D5E1FD2]
GO
ALTER TABLE [dbo].[Sluzi]  WITH CHECK ADD  CONSTRAINT [FK__Sluzi__SifraZap__3E52440B] FOREIGN KEY([SifraZap])
REFERENCES [dbo].[Konobar] ([SifraZap])
GO
ALTER TABLE [dbo].[Sluzi] CHECK CONSTRAINT [FK__Sluzi__SifraZap__3E52440B]
GO
ALTER TABLE [dbo].[StavkaRacuna]  WITH CHECK ADD  CONSTRAINT [FK__StavkaRac__Sifra__619B8048] FOREIGN KEY([SifraRacuna])
REFERENCES [dbo].[Racun] ([SifraRacuna])
GO
ALTER TABLE [dbo].[StavkaRacuna] CHECK CONSTRAINT [FK__StavkaRac__Sifra__619B8048]
GO
ALTER TABLE [dbo].[StavkaRacuna]  WITH CHECK ADD  CONSTRAINT [FK__StavkaRacuna__628FA481] FOREIGN KEY([BrojStola], [SifraPor], [RedBrSm])
REFERENCES [dbo].[Porudzbina] ([BrojStola], [SifraPor], [RedBrSm])
GO
ALTER TABLE [dbo].[StavkaRacuna] CHECK CONSTRAINT [FK__StavkaRacuna__628FA481]
GO
ALTER TABLE [dbo].[Sto]  WITH CHECK ADD  CONSTRAINT [FK__Sto__SifraRestor__3A81B327] FOREIGN KEY([SifraRestorana])
REFERENCES [dbo].[Restoran] ([SifraRestorana])
GO
ALTER TABLE [dbo].[Sto] CHECK CONSTRAINT [FK__Sto__SifraRestor__3A81B327]
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [FK__Zaposleni__Sifra__2E1BDC42] FOREIGN KEY([SifraNadr])
REFERENCES [dbo].[Zaposleni] ([SifraZap])
GO
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [FK__Zaposleni__Sifra__2E1BDC42]
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [FK__Zaposleni__Sifra__300424B4] FOREIGN KEY([SifraRestorana])
REFERENCES [dbo].[Restoran] ([SifraRestorana])
GO
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [FK__Zaposleni__Sifra__300424B4]
GO
ALTER TABLE [dbo].[Angazovanje]  WITH CHECK ADD  CONSTRAINT [STATUS] CHECK  (([StatusA]='Neaktivan' OR [StatusA]='Aktivan'))
GO
ALTER TABLE [dbo].[Angazovanje] CHECK CONSTRAINT [STATUS]
GO
ALTER TABLE [dbo].[Porudzbina]  WITH CHECK ADD  CONSTRAINT [Stat] CHECK  (([StatusP]='C' OR [StatusP]='O'))
GO
ALTER TABLE [dbo].[Porudzbina] CHECK CONSTRAINT [Stat]
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [Z] CHECK  (([pol]='d' OR [pol]='z' OR [pol]='m'))
GO
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [Z]
GO
/****** Object:  StoredProcedure [dbo].[pPorudzbina]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pPorudzbina]
	@BrojStola varchar(10),@StavkaMenija numeric(3,0)=null,@Kolicina int=null,@ZatvoritiPor int=null
as
declare @lenPor int,@SifraPor varchar(10)=null,@SifraRacuna numeric,@cena numeric(7,2),@provStRac int,
@provStRac1 int,@sifraMenija varchar(10),@RedBr numeric(3,0),@istaStMenija int=null
begin try
	set xact_abort on
	begin transaction

	select @lenPor=max(len(sifraPor))
	from Porudzbina
	
	--Provera ima li otvorene porudzbine za tim stolom
	select top 1 @SifraPor=sifraPor
	from Porudzbina
	where len(SifraPor)=@lenPor
	and BrojStola=@BrojStola
	and StatusP='O'
	order by SifraPor desc

	--Ubacivanje podataka u vec otvorenu porudzbinu
	if @SifraPor is not null
	begin
		--Provera unosa stavke racuna
		select @provStRac=count(*) from StavkaRacuna
		
		--Uzimanje sifre poslednjeg racuna za tim stolom
		select @SifraRacuna=SifraRacuna
		from Racun
		where Datum=(select max(datum) from Racun where BrojStola=@BrojStola)
		print  @SifraRacuna	

		--Uzimanje sifre poslednje stavke racuna
		select @RedBr=max(RedBrSr)
		from StavkaRacuna
		where SifraPor=@SifraPor
		print @RedBr

		--Proverava da li se narucuje ista stavka menija
		select @istaStMenija=RedBrSm from Porudzbina where SifraPor=@SifraPor
		and RedBrSm in (@StavkaMenija)

		if @ZatvoritiPor is null
		begin
			if @istaStMenija is null
			begin
				insert into Porudzbina values('O',@SifraPor,@BrojStola,@StavkaMenija,@Kolicina)
			end;
			else 
			begin
				update Porudzbina
				set Kolicina=Kolicina+@Kolicina 
				where SifraPor=@SifraPor and @istaStMenija=RedBrSm
			end
			insert into StavkaRacuna values
			((@RedBr+1),@BrojStola,@StavkaMenija,@SifraPor,@SifraRacuna,(select cena*@Kolicina
			from StavkaMenija where RedBr=@StavkaMenija))
	
			--Provera Unosa
			select @provStRac1=count(*) from StavkaRacuna
			if @provStRac+1=@provStRac1
			begin
				print('Uspesno je kreirana stavka racuna')
				commit transaction;
			end;
			else
			begin
				print('Doslo je do greske pokusajte ponovo')
				rollback transaction;
			end;
		end;
		--Zatvaranje porudzbine
		else
		begin
			if @StavkaMenija is not null
			begin
				if @istaStMenija is null
				begin
					insert into Porudzbina values('O',@SifraPor,@BrojStola,@StavkaMenija,@Kolicina)
				end
				else
				begin
					update Porudzbina
					set Kolicina=Kolicina+@Kolicina
					where SifraPor=@SifraPor and @istaStMenija=RedBrSm
				end

				insert into StavkaRacuna values
				((@RedBr+1),@BrojStola,@StavkaMenija,@SifraPor,@SifraRacuna,(select cena*@Kolicina
				from StavkaMenija where RedBr=@StavkaMenija))

				update Porudzbina
				set StatusP='C'
				where SifraPor=@SifraPor
				
				--Provera Unosa
				select @provStRac1=count(*) from StavkaRacuna
				if @provStRac+1=@provStRac1
				begin
					print('Porudzbina je zatvorena')
					print('Uspesno je kreirana stavka racuna')
					commit transaction;
				end;
				else
				begin
					print('Doslo je do greske pokusajte ponovo, fa')
					rollback transaction;
				end;
			end;
			else
			begin
				update Porudzbina
				set StatusP='C'
				where SifraPor=@SifraPor
				print('Uspesno je zatvorena porudzbina.')
				commit transaction;
			end;
		end;
	end;
	--Kreiranje nove porudzbine
	else if @SifraPor is null
	begin
		--Provera
		select @provStRac=count(*) from StavkaRacuna

		--Deo koda koji regulise sifru porudzbine
		select top 1 @SifraPor=SifraPor
		from Porudzbina
		where len(SifraPor)=@lenPor
		order by SifraPor desc

		set @SifraPor=RIGHT(@SifraPor,@lenPor-1)
		set @SifraPor=CAST(@SifraPor as int)+1
		set @SifraPor=CAST('P'+@SifraPor as varchar(10))

		insert into Porudzbina values('O',@SifraPor,@BrojStola,@StavkaMenija,@Kolicina)

		--Kreiranje sifre novog racuna
		select @SifraRacuna=max(SifraRacuna) from Racun
		--Sifra aktuelnog menija
		select @sifraMenija=SifraMenija
		from Meni
		where DatumDo>GETDATE() or DatumDo=null

		insert into Racun values((@SifraRacuna+1),GETDATE(),@BrojStola,@sifraMenija)
		set @RedBr=1
		insert into StavkaRacuna values
		(@RedBr,@BrojStola,@StavkaMenija,@SifraPor,(@SifraRacuna+1),(select cena*@Kolicina
		from StavkaMenija where RedBr=@StavkaMenija))

		--Provera unosa
		select @provStRac1=count(*) from StavkaRacuna
		if @provStRac+1=@provStRac1
		begin
			print('Uspesno je kreirana stavka racuna nove porudzbine')
			commit transaction;
		end;
		else
		begin
			print('Doslo je do greske pokusajte ponovo!')
			rollback transaction;
		end;
	end;
end try
begin catch
	print 'Doslo je do greske, ponovite unos'
	rollback transaction;
	print 'Ponistene su promene u bazi.'
end catch;
GO
/****** Object:  StoredProcedure [dbo].[PrijemZaposlenih]    Script Date: 3/27/2022 4:17:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PrijemZaposlenih]
	@Izbor varchar(11),@JBMG numeric(13,0),@Ime varchar(10)=null,@Prezime varchar(20)=null,
	@sifraRestorana varchar(10)=null,@Pol Varchar(1)=null,@Plata Numeric(8,2)=null,
	@SifraRadMes varchar(10)=null,@DatumDo date=null,@Reon numeric(2)=null,
	@Jezik varchar(30)=null
as
declare @SifraZaposlenog varchar(10),@lensifra int,
@ProveraZ int,@ProveraZ1 int,@SifraNadr varchar(10),
@ProveraA int,@ProveraA1 int,@lozinka nvarchar(50)

begin try
	set xact_abort on
	begin transaction

	if @Izbor='Zaposlenje'
	begin
		--Regulisanje sifre zaposlenog
		select @lensifra=max(len(SifraZap))
		from Zaposleni 

		select top 1 @SifraZaposlenog=SifraZap
		from Zaposleni
		where len(SifraZap)=@lensifra
		order by SifraZap desc

		set @SifraZaposlenog=RIGHT(@SifraZaposlenog,@lensifra-1)
		set @SifraZaposlenog=CAST(@SifraZaposlenog as int)+1
		set @SifraZaposlenog=CAST('Z'+@SifraZaposlenog as varchar(10))

		set @lozinka=CONCAT(@sifraRestorana,@SifraZaposlenog)
		
		--Provera
		select @ProveraA=COUNT(*) from Angazovanje

		--Odredjivanje nadredjenog
		select @SifraNadr=z.SifraZap
		from Zaposleni z
		where z.SifraRestorana=@sifraRestorana
		and exists (select SifraNadr from Zaposleni p
		where p.SifraNadr=z.SifraZap)

		if @SifraRadMes!='RM-1'
		begin
			insert into Zaposleni values
			(@SifraZaposlenog,@SifraNadr,@Ime,@Prezime,@JBMG,@Pol,@Plata,@sifraRestorana,@lozinka)
			--Ubacivanje konobara
			if @SifraRadMes='RM-2'
			begin
				insert into Konobar values (@SifraZaposlenog,@Reon)

				insert into Sluzi(BrojStola,SifraZap)
				select  s.BrojStola,z.SifraZap
				from Sto s join Zaposleni z on z.SifraRestorana=s.SifraRestorana
				where s.SifraRestorana=@sifraRestorana and
				z.SifraZap=@SifraZaposlenog
			end;
			--Ubacivanje recepcionara
			if @SifraRadMes='RM-4'
				insert into Recepcionar values(@SifraZaposlenog,@Jezik)
		end;
		
		--Zamena menadzera
		if @SifraRadMes='RM-1'
		begin
			insert into Zaposleni values
			(@SifraZaposlenog,null,@Ime,@Prezime,@JBMG,@Pol,@Plata,@sifraRestorana,@lozinka)
			update Zaposleni
			set SifraNadr=@SifraZaposlenog
			where SifraNadr=@SifraNadr;
			update Angazovanje
			set StatusA='Neaktivan',
			DatumDo=GETDATE()
			where SifraZap=@SifraNadr
		end;

		insert into Angazovanje values
		('Aktivan',@SifraZaposlenog,@SifraRadMes,GETDATE(),@DatumDo)

		--Provera da li su ubaceni podaci u bazu podataka
		select @ProveraZ1=COUNT(*) from Zaposleni
		select @ProveraA1=COUNT(*) from Angazovanje
		if @ProveraA+1=@ProveraA1 and @ProveraA+1=@ProveraZ1
		begin
			print('Uspesno su uneti podaci u bazu')
			commit transaction;
		end;
		else if @ProveraA+1!=@ProveraA1 and @ProveraA+1!=@ProveraZ1
		begin
			print('Doslo je do greske pokusajte ponovo')
			rollback transaction;
		end;
	end;

	declare @ProveraS int,@ProveraS1 int

	if @Izbor='Otpust'
	begin
		declare @sifraz varchar(10)
		select @sifraz=SifraZap
		from Zaposleni
		where JMBG=@JBMG

		select @ProveraS=COUNT(*)
		from Angazovanje
		where StatusA='Neaktivan'

		update Angazovanje
		set DatumDo=GETDATE(),
		StatusA='Neaktivan'
		where SifraZap=@sifraz

		delete from Sluzi where SifraZap=@sifraz
		delete from Konobar where SifraZap=@sifraz
		delete from Recepcionar where SifraZap=@sifraz

		--Provera statusa angazovanja
		select @ProveraS1=COUNT(*)
		from Angazovanje
		where StatusA='Neaktivan'

		if @ProveraS+1=@ProveraS1
		begin
			print('Uspesno su uneti podaci u bazu')
			commit transaction;
		end;
		else if @ProveraS+1!=@ProveraS1
		begin
			print('Doslo je do greske pokusajte ponovo')
			rollback transaction;
		end;
	end;
end try
begin catch
	print 'Doslo je do greske!'
	rollback transaction;
	print 'Ponistene su sve promene u bazi'
end catch;
GO
USE [master]
GO
ALTER DATABASE [Restoran] SET  READ_WRITE 
GO
