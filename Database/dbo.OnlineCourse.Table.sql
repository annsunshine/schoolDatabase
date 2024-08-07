USE [School]
GO
/****** Object:  Table [dbo].[OnlineCourse]    Script Date: 28.07.2024 21:35:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OnlineCourse](
	[idStudent] [int] NOT NULL,
	[dateStart] [char](10) NOT NULL,
	[dateStop] [char](10) NULL,
	[language] [char](10) NOT NULL,
	[idTeacher] [int] NOT NULL,
	[status] [char](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
