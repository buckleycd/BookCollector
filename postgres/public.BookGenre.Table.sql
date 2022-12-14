CREATE TABLE BookGenre(
	BookId int NOT NULL,
	GenreId int NOT NULL,
    PRIMARY KEY(BookId,GenreId)
);

ALTER TABLE BookGenre 
    ADD  CONSTRAINT fk_BookGenre_Book_BookId 
        FOREIGN KEY(BookId)
    REFERENCES Book (BookId)
;

ALTER TABLE BookGenre 
    ADD  CONSTRAINT fk_BookGenre_Genre_GenreId 
        FOREIGN KEY(GenreId)
    REFERENCES Genre (GenreId)
;

