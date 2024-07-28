USE [School]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 28.07.2024 21:35:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[idCourse] [int] NOT NULL,
	[idStudent] [int] NOT NULL,
	[idTeacher] [int] NOT NULL,
	[startDate] [char](10) NOT NULL,
	[stopDate] [char](10) NULL,
	[price] [int] NOT NULL,
	[language] [char](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
