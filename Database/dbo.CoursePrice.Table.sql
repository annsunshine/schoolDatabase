USE [School]
GO
/****** Object:  Table [dbo].[CoursePrice]    Script Date: 28.07.2024 21:35:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoursePrice](
	[idProgramme] [int] NOT NULL,
	[courseType] [char](10) NOT NULL,
	[languageLevel] [char](10) NOT NULL,
	[courseLength] [int] NOT NULL,
	[pricePerHour] [int] NOT NULL,
	[totalPrice] [int] NOT NULL,
 CONSTRAINT [PK_Course_price] PRIMARY KEY CLUSTERED 
(
	[idProgramme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
