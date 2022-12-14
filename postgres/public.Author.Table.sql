CREATE TABLE Author
(
	AuthorId INT generated always as identity (increment by 1),
	FirstName VARCHAR (30) NOT NULL,
	LastName VARCHAR(60) NOT NULL,
	MiddleName VARCHAR(30) NOT NULL,
	DateCreated TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(AuthorId)
) 
;

CREATE UNIQUE INDEX UIX_Author_LastName_FirstName 
ON public.Author
(
	LastName,FirstName
)
;
