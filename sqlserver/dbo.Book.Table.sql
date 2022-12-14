USE [BookCollector]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 9/3/2022 10:21:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] NOT NULL,
	[SeriesId] [int] NULL,
	[SeriesOrder] [tinyint] NULL,
	[Title] [varchar](200) NOT NULL,
	[PublicationYear] [smallint] NOT NULL,
	[DateCreated] [datetime] NULL,
	[BookCoverImage] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Book_PublicationYear]    Script Date: 9/3/2022 10:21:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_Book_PublicationYear] ON [dbo].[Book]
(
	[PublicationYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Book_Title]    Script Date: 9/3/2022 10:21:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_Book_Title] ON [dbo].[Book]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_BookSeries_BookSeriesId] FOREIGN KEY([SeriesId])
REFERENCES [dbo].[BookSeries] ([BookSeriesId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_BookSeries_BookSeriesId]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'unique identifier for a specific publication of a book. For example, if you have teh first printing and second printing of a book, those would be 2 seperate entries.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book', @level2type=N'COLUMN',@level2name=N'BookId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If not null, identifies teh series the book is part of' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book', @level2type=N'COLUMN',@level2name=N'SeriesId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies the order the book falls in within the series' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book', @level2type=N'COLUMN',@level2name=N'SeriesOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'title of the book' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'what year was the book published in' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book', @level2type=N'COLUMN',@level2name=N'PublicationYear'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the record was added' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'file location of the book cover image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book', @level2type=N'COLUMN',@level2name=N'BookCoverImage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Books in collection' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Book'
GO
