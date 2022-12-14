USE [BookCollector]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 9/3/2022 10:21:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [tinyint] NOT NULL,
	[GenreName] [varchar](100) NOT NULL,
	[DateCreated] [date] NOT NULL,
 CONSTRAINT [pk_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Genre] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Uniquely identifies a genre within the system' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Genre', @level2type=N'COLUMN',@level2name=N'GenreId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the genre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Genre', @level2type=N'COLUMN',@level2name=N'GenreName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the record was added' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Genre', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Possible genres for the books' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Genre'
GO
