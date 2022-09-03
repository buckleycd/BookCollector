CREATE TABLE Genre(
	GenreId int  GENERATED ALWAYS AS IDENTITY,
	GenreName varchar(100) NOT NULL,
	DateCreated timestamp DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(GenreId)
);
