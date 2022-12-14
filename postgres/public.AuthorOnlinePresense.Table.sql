CREATE TABLE AuthorOnlinePresense(
	AuthorOnlinePrecenseId int  GENERATED ALWAYS AS IDENTITY,
	AuthorId int NOT NULL,
	Sitename varchar(20) NOT NULL,
	URL varchar(255) NOT NULL,
	SiteIcon varchar(40) NULL,
	DateCreated timestamp DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(AuthorOnlinePrecenseId)
) 
;
ALTER TABLE AuthorOnlinePresense
    ADD CONSTRAINT FK_Author_AuthorOnlinePrecense_AuthorId 
        FOREIGN KEY(AuthorId)
    REFERENCES Author (AuthorId)
;
