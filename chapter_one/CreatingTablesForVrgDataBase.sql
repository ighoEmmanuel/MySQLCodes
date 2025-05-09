USE vrg;
CREATE TABLE ARTIST (
	ArtistID 			Int 			NOT NULL auto_increment,
	LastName			Char(25)		NOT NULL,
	FirstName			Char(25)		NOT NULL, 
	Nationality 		Char(30)		NULL,
	DateOfBirth 		Numeric(4)		NULL, 
	DateDeceased 		Numeric(4)		NULL,
	CONSTRAINT 	ArtistPK			PRIMARY KEY(ArtistID),
	CONSTRAINT 	ArtistAK1			UNIQUE(LastName, FirstName),
	CONSTRAINT 	NationalityValues	CHECK 
					(Nationality IN ('Canadian', 'English', 'French',
					 'German', 'Mexican', 'Russian', 'Spanish',
					 'United States')), 
	CONSTRAINT 	BirthValuesCheck 	CHECK (DateOfBirth < DateDeceased),
	CONSTRAINT 	ValidBirthYear 		CHECK
					(DateOfBirth LIKE '[1-2][0-9][0-9][0-9]'),
	CONSTRAINT 	ValidDeathYear 		CHECK
					(DateDeceased LIKE '[1-2][0-9][0-9][0-9]')
	);
    ALTER TABLE ARTIST DROP CHECK ValidBirthYear;
	ALTER TABLE ARTIST DROP CHECK ValidDeathYear;
    ALTER TABLE ARTIST 
	ADD CONSTRAINT ValidBirthYear CHECK (DateOfBirth BETWEEN 1000 AND 5025);

	ALTER TABLE ARTIST 
	ADD CONSTRAINT ValidDeathYear CHECK (DateDeceased BETWEEN 1000 AND 5025);
    CREATE TABLE WORK (
	WorkID 				Int 			NOT NULL auto_increment,
	Title 				Char(35) 		NOT NULL,
	Copy 				Char(12)		NOT NULL,
	Medium 				Char(35) 		NULL,
	Description 		Varchar(1000) 	NULL DEFAULT 'Unknown provenance',
	ArtistID 			Int 			NOT NULL,
	CONSTRAINT 	WorkPK				PRIMARY KEY(WorkID),
	CONSTRAINT 	WorkAK1				UNIQUE(Title, Copy),
	CONSTRAINT 	ArtistFK			FOREIGN KEY(ArtistID)
						REFERENCES ARTIST(ArtistID)
 							ON UPDATE NO ACTION
							ON DELETE NO ACTION
	);
    ALTER table WORK auto_increment = 500;
    
    
    CREATE TABLE CUSTOMER (
	CustomerID 			Int 			NOT NULL auto_increment,
	LastName 			Char(25) 		NOT NULL,
	FirstName 			Char(25) 		NOT NULL,	
	EmailAddress		Varchar(100) 	NULL,
	EncryptedPassword	Varchar(50)		NULL,
	Street 				Char(30) 		NULL,
	City 				Char(35) 		NULL,
	State 				Char(2) 		NULL,
	ZIPorPostalCode		Char(9)			NULL, 
	Country				Char(50)		NULL,
	AreaCode 			Char(3)			NULL,
	PhoneNumber 		Char(8) 		NULL,
	CONSTRAINT 	CustomerPK			PRIMARY KEY(CustomerID),
	CONSTRAINT 	EmailAK1			UNIQUE(EmailAddress)
	);
    ALTER table CUSTOMER auto_increment = 1000;
    
    
    CREATE TABLE TRANS (
	TransactionID		Int 			NOT NULL auto_increment,
	DateAcquired 		Date			NOT NULL, 
	AcquisitionPrice	Numeric(8,2)	NOT NULL,
	AskingPrice			Numeric(8,2)	NULL,
	DateSold			Date			NULL,
	SalesPrice 			Numeric(8,2)	NULL, 
	CustomerID			Int 			NULL,
	WorkID				Int 			NOT NULL,
	CONSTRAINT 	TransPK				PRIMARY KEY(TransactionID),
	CONSTRAINT 	TransWorkFK			FOREIGN KEY(WorkID)
						REFERENCES WORK(WorkID)
 							ON UPDATE NO ACTION
							ON DELETE NO ACTION,
	CONSTRAINT 	TransCustomerFK FOREIGN KEY(CustomerID)
						REFERENCES CUSTOMER(CustomerID)
 							ON UPDATE NO ACTION
							ON DELETE NO ACTION,
	CONSTRAINT 	SalesPriceRange 	CHECK
					((SalesPrice > 0) AND (SalesPrice <=500000)),
	CONSTRAINT	ValidTransDate 		CHECK (DateAcquired <= DateSold)
	);
    ALTER table TRANS auto_increment = 100;
    
    CREATE TABLE CUSTOMER_ARTIST_INT(
	ArtistID 			Int 			NOT NULL, 
	CustomerID 			Int 			NOT NULL,
 	CONSTRAINT 	CAIntPK				PRIMARY KEY(ArtistID, CustomerID),
	CONSTRAINT 	CAInt_ArtistFK		FOREIGN KEY(ArtistID)
						REFERENCES ARTIST(ArtistID)
							ON UPDATE NO ACTION
							ON DELETE CASCADE,
	CONSTRAINT 	CAInt_CustomerFK FOREIGN KEY(CustomerID)
						REFERENCES CUSTOMER(CustomerID)
							ON UPDATE NO ACTION
							ON DELETE CASCADE
	);
    
    select * from customer_artist_int;
    
 
    
    
    
    
    

    
    