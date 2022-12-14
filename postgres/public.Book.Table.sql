CREATE TABLE Book(
	BookId int  GENERATED ALWAYS AS IDENTITY,
	SeriesId int NULL,
	SeriesOrder int NULL,
	Title varchar(200) NOT NULL,
	PublicationYear smallint NOT NULL,
	BookCoverImage varchar(255) NULL,
	DateCreated timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(BookId)
); 

CREATE INDEX IX_Book_PublicationYear ON Book(PublicationYear);
CREATE INDEX IX_Book_Title ON Book(Title);

ALTER TABLE Book 
    ADD  CONSTRAINT FK_Book_BookSeries_BookSeriesId 
        FOREIGN KEY(SeriesId)
    REFERENCES BookSeries (BookSeriesId);
    
