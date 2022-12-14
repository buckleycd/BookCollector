USE [BookCollector]
GO
/****** Object:  Table [dbo].[BookSeries]    Script Date: 9/3/2022 10:21:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookSeries](
	[BookSeriesId] [int] NOT NULL,
	[SeriesName] [varchar](100) NOT NULL,
	[DateCreated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookSeriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BookSeries_SeriesName]    Script Date: 9/3/2022 10:21:14 AM ******/
CREATE NONCLUSTERED INDEX [IX_BookSeries_SeriesName] ON [dbo].[BookSeries]
(
	[SeriesName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookSeries] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifies a series within the system' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BookSeries', @level2type=N'COLUMN',@level2name=N'BookSeriesId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the book series' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BookSeries', @level2type=N'COLUMN',@level2name=N'SeriesName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the record was added' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BookSeries', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
