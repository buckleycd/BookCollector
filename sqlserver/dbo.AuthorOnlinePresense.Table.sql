USE [BookCollector]
GO
/****** Object:  Table [dbo].[AuthorOnlinePresense]    Script Date: 9/3/2022 10:21:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorOnlinePresense](
	[AuthorOnlinePrecenseId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Sitename] [varchar](20) NOT NULL,
	[URL] [varchar](255) NOT NULL,
	[SiteIcon] [varchar](40) NULL,
	[DateCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorOnlinePrecenseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuthorOnlinePresense] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[AuthorOnlinePresense]  WITH CHECK ADD  CONSTRAINT [FK_Author_AuthorOnlinePrecense_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[AuthorOnlinePresense] CHECK CONSTRAINT [FK_Author_AuthorOnlinePrecense_AuthorId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Uniquely identifies an online precense record' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthorOnlinePresense', @level2type=N'COLUMN',@level2name=N'AuthorOnlinePrecenseId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'identifies the author' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthorOnlinePresense', @level2type=N'COLUMN',@level2name=N'AuthorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the site related to the author (IE Twitter, Facebook, official website, etc.)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthorOnlinePresense', @level2type=N'COLUMN',@level2name=N'Sitename'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'URL for the site' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthorOnlinePresense', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Location of the icon to use for the Site' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthorOnlinePresense', @level2type=N'COLUMN',@level2name=N'SiteIcon'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the record was added' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthorOnlinePresense', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
