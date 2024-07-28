USE [School]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 28.07.2024 21:35:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[idStudent] [int] NOT NULL,
	[name] [char](10) NOT NULL,
	[surname] [char](10) NOT NULL,
	[emailAddress] [varchar](50) NOT NULL,
	[phoneNumber] [int] NOT NULL,
	[status] [char](10) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[idStudent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Students_LevelOfLanguage] FOREIGN KEY([idStudent])
REFERENCES [dbo].[LevelOfLanguage] ([idStudent])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Students_LevelOfLanguage]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Students_Program] FOREIGN KEY([idStudent])
REFERENCES [dbo].[Program] ([idStudent])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Students_Program]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Students_Students] FOREIGN KEY([idStudent])
REFERENCES [dbo].[Student] ([idStudent])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Students_Students]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Students_Teachers] FOREIGN KEY([idStudent])
REFERENCES [dbo].[Teacher] ([idTeacher])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Students_Teachers]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Students_TypeOfLanguage] FOREIGN KEY([idStudent])
REFERENCES [dbo].[TypeOfLanguage] ([idStudent])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Students_TypeOfLanguage]
GO
