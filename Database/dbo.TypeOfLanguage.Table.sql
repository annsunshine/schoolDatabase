USE [School]
GO
/****** Object:  Table [dbo].[TypeOfLanguage]    Script Date: 28.07.2024 21:35:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypeOfLanguage](
	[idStudent] [int] NOT NULL,
	[name] [char](10) NOT NULL,
	[surname] [char](10) NOT NULL,
	[courseType] [char](10) NOT NULL,
 CONSTRAINT [PK_Type_of_language] PRIMARY KEY CLUSTERED 
(
	[idStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
