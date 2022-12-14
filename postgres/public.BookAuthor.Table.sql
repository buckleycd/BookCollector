CREATE TABLE BookAuthor(
	BookId int NOT NULL,
	AuthorId int NOT NULL,
    PRIMARY KEY(BookId,AuthorId)
);
ALTER TABLE BookAuthor 
    ADD CONSTRAINT fk_BookAuthor_Author_AuthorId 
        FOREIGN KEY(AuthorId)
    REFERENCES Author (AuthorId)
;

ALTER TABLE BookAuthor 
    ADD CONSTRAINT fk_BookAuthor_Book_BookId 
        FOREIGN KEY(BookId)
    REFERENCES Book(BookId)
;

