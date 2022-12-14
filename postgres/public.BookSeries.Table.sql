CREATE TABLE BookSeries(
	BookSeriesId int  GENERATED ALWAYS AS IDENTITY,
	SeriesName varchar(100) NOT NULL,
	DateCreated timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (BookSeriesId)
);
CREATE INDEX IX_BookSeries_SeriesName ON BookSeries(SeriesName);

