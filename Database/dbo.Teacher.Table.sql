USE [School]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 28.07.2024 21:35:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[idTeacher] [int] NOT NULL,
	[name] [char](10) NOT NULL,
	[surname] [char](10) NOT NULL,
	[emailAddress] [varchar](50) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[education] [char](10) NOT NULL,
	[univercity] [char](10) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[idTeacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
