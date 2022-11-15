USE [Book_Assessment]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 15-11-2022 18:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorLastName] [varchar](250) NULL,
	[AuthorFirstName] [varchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 15-11-2022 18:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Publisher] [varchar](250) NULL,
	[Title] [varchar](250) NULL,
	[AuthorId] [int] NULL,
	[MLAId] [int] NULL,
	[CSMId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CSMs]    Script Date: 15-11-2022 18:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CSMs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JournalTitle] [varchar](250) NULL,
	[VolumeNo] [varchar](50) NULL,
	[IssueNo] [varchar](50) NULL,
	[PageRange] [varchar](50) NULL,
	[URL_DOI] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MLAs]    Script Date: 15-11-2022 18:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MLAs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TitleOfSource] [varchar](250) NULL,
	[TitleOfContainer] [varchar](250) NULL,
	[PublicationDate] [date] NULL,
	[Location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 
GO
INSERT [dbo].[Authors] ([Id], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (1, N'Ashok', N'Kumar', CAST(150 AS Decimal(18, 0)))
GO
INSERT [dbo].[Authors] ([Id], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (2, N'Balaji', N'SS', CAST(100 AS Decimal(18, 0)))
GO
INSERT [dbo].[Authors] ([Id], [AuthorLastName], [AuthorFirstName], [Price]) VALUES (3, N'Mahendran', N'Madhan', CAST(120 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([Id], [Publisher], [Title], [AuthorId], [MLAId], [CSMId]) VALUES (1, N'AMadhan', N'Home Assessment', 2, 3, 2)
GO
INSERT [dbo].[Books] ([Id], [Publisher], [Title], [AuthorId], [MLAId], [CSMId]) VALUES (2, N'Balaji', N'Book Assessment', 1, 2, 3)
GO
INSERT [dbo].[Books] ([Id], [Publisher], [Title], [AuthorId], [MLAId], [CSMId]) VALUES (3, N'Balaji', N'Home Assessment', 3, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[CSMs] ON 
GO
INSERT [dbo].[CSMs] ([Id], [JournalTitle], [VolumeNo], [IssueNo], [PageRange], [URL_DOI]) VALUES (1, N'African Journal of Food Science', N'No.4', N'March 1935', N'600-650', N'https://images.app.goo.gl/')
GO
INSERT [dbo].[CSMs] ([Id], [JournalTitle], [VolumeNo], [IssueNo], [PageRange], [URL_DOI]) VALUES (2, N'Clinical Reviews and Opinions', N'No.2', N'Jan 1935', N'300-330', N'https://images.app.goo.gl/')
GO
INSERT [dbo].[CSMs] ([Id], [JournalTitle], [VolumeNo], [IssueNo], [PageRange], [URL_DOI]) VALUES (3, N'Myster of a talking wombat', N'No.2', N'February 1935', N'275-380', N'https://images.app.goo.gl/')
GO
SET IDENTITY_INSERT [dbo].[CSMs] OFF
GO
SET IDENTITY_INSERT [dbo].[MLAs] ON 
GO
INSERT [dbo].[MLAs] ([Id], [TitleOfSource], [TitleOfContainer], [PublicationDate], [Location]) VALUES (1, N'Behind the Blue Pen', N'On Reading', CAST(N'1996-01-01' AS Date), N'pp. 10-40')
GO
INSERT [dbo].[MLAs] ([Id], [TitleOfSource], [TitleOfContainer], [PublicationDate], [Location]) VALUES (2, N'Behind the Blue Pencil:Censorship', N'On Writing', CAST(N'1996-01-01' AS Date), N'pp. 120-126')
GO
INSERT [dbo].[MLAs] ([Id], [TitleOfSource], [TitleOfContainer], [PublicationDate], [Location]) VALUES (3, N'Colour Pencil', N'On Checking', CAST(N'1997-01-01' AS Date), N'pp. 1440-1446')
GO
SET IDENTITY_INSERT [dbo].[MLAs] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([CSMId])
REFERENCES [dbo].[CSMs] ([Id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([MLAId])
REFERENCES [dbo].[MLAs] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[sp_GetBookDetails]    Script Date: 15-11-2022 18:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetBookDetails]      
(  
@Type varchar(50) = ''  
)  
AS    
BEGIN    
BEGIN TRY   
	  IF(@Type = 'PUBLISHER')
	  BEGIN
		SELECT * FROM Books b
		INNER JOIN Authors a on a.id=b.AuthorId
		ORDER BY b.Publisher,a.AuthorLastName + ','+a.AuthorFirstName,b.Title
	  END
	  ELSE IF(@Type = 'AUTHOR')
	  BEGIN
		SELECT * FROM Books b
		INNER JOIN Authors a on a.id=b.AuthorId
		ORDER BY a.AuthorLastName + ','+a.AuthorFirstName,b.Title
	  END
	  ELSE IF(@Type = 'PRICE')
	  BEGIN
		SELECT SUM(PRICE) AS TotalPrice 
		FROM Books b
		INNER JOIN Authors a on a.id = b.AuthorId
	  END	  
END TRY  
BEGIN CATCH    
	SELECT '' AS Result    
END CATCH   
END
GO
