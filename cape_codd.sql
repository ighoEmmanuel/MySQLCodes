USE cape_codd;

CREATE TABLE BUYER (
	BuyerName			Char(35)			NOT NULL,
	Department			Char(30)			NOT NULL,
	Position			Char(10)			NULL,
	Supervisor			Char(35)			NULL,
	CONSTRAINT			BUYER_PK			PRIMARY KEY(BuyerName),
	CONSTRAINT			BUYER_SUPERVISOR_FK	FOREIGN KEY(Supervisor)
							REFERENCES  BUYER(BuyerName)
	);

CREATE TABLE RETAIL_ORDER (
	OrderNumber       	Integer 	      	NOT NULL,
	StoreNumber       	Integer 	      	NULL,
	StoreZip          	Char (9)        	NULL,
	OrderMonth    	  	Char (12) 	    	NOT NULL,
	OrderYear     	  	Integer 	      	NOT NULL,
	OrderTotal   	    Numeric(9,2)    	NULL,
	CONSTRAINT 		    RETAIL_ORDER_PK 	PRIMARY KEY (OrderNumber)
	);

CREATE TABLE SKU_DATA (
	SKU   			    Integer 	      	NOT NULL,
	SKU_Description   	Char (35) 	    	NOT NULL,
	Department  	    Char (30)       	NOT NULL,
	Buyer  			    Char (35)       	NULL,
	CONSTRAINT 		    SKU_DATA_PK     	PRIMARY KEY (SKU),
    CONSTRAINT			SKU_DATA_EMP_FK		FOREIGN KEY (Buyer)
							REFERENCES  BUYER(BuyerName)
								ON UPDATE CASCADE
	);

CREATE TABLE ORDER_ITEM (
	OrderNumber  	    Integer  	       	NOT NULL,
	SKU  			    Integer 	       	NOT NULL,
	Quantity  		    Integer 	       	NOT NULL,
	Price  			    Numeric(9,2)     	NOT NULL,
	ExtendedPrice     	Numeric(9,2)     	NOT NULL,
	CONSTRAINT 		    ORDER_ITEM_PK 	 	PRIMARY KEY (SKU, OrderNumber),
	CONSTRAINT 		    ORDER_ITEM_SKU_FK 	FOREIGN KEY (SKU)
							REFERENCES  SKU_DATA (SKU),
	CONSTRAINT 		    RETAIL_ORDER_SKU_FK FOREIGN KEY (OrderNumber)
							REFERENCES  RETAIL_ORDER (OrderNumber)
	);

CREATE TABLE WAREHOUSE (
	WarehouseID		    Integer		       	NOT NULL,
	WarehouseCity	    Char(30)  	    	NOT NULL,
	WarehouseState	  	Char(2)		       	NOT NULL,
	Manager			    Char(35)	       	NULL,
	SquareFeet		    Integer		       	NULL,
	CONSTRAINT 		    WAREHOUSE_PK 	   	PRIMARY KEY (WarehouseID)
	);

CREATE TABLE INVENTORY (
	WarehouseID		    Integer  	       	NOT NULL,
	SKU   			    Integer 	       	NOT NULL,
	SKU_Description   	Char (35) 	     	NOT NULL,
	QuantityOnHand 	  	Integer  	       	NULL,
	QuantityOnOrder	  	Integer  	       	NULL,
	CONSTRAINT 		    INVENTORY_PK 	  	PRIMARY KEY (SKU, WarehouseID),
	CONSTRAINT 		    INV_SKU_DATA_FK	   	FOREIGN KEY (SKU)
							REFERENCES	SKU_DATA (SKU),
	CONSTRAINT 		    INV_WAREHOUSE_FK	FOREIGN KEY (WarehouseID)
							REFERENCES	WAREHOUSE (WarehouseID)
	);
    
CREATE TABLE CATALOG_SKU_2016 (
	CatalogID		Integer		NOT NULL AUTO_INCREMENT,
	SKU   			Integer 	NOT NULL,
	SKU_Description Char(35) 	NOT NULL,
	Department  	Char(30)  	NOT NULL,
	CatalogPage		Integer		NULL,
	DateOnWebSite	Date		NULL,
	CONSTRAINT 		CSKU16_PK 	PRIMARY KEY (CatalogID)
	);
    
ALTER TABLE CATALOG_SKU_2016 AUTO_INCREMENT = 20160001;
    

CREATE TABLE CATALOG_SKU_2017 (
	CatalogID		Integer		NOT NULL AUTO_INCREMENT,
	SKU   			Integer 	NOT NULL,
	SKU_Description Char(35) 	NOT NULL,
	Department  	Char(30)  	NOT NULL,
	CatalogPage		Integer		NULL,
	DateOnWebSite	Date		NULL,
	CONSTRAINT 		CSKU17_PK 	PRIMARY KEY (CatalogID)
	);

ALTER TABLE CATALOG_SKU_2017 AUTO_INCREMENT = 20170001;

CREATE TABLE CATALOG_SKU_2018 (
	CatalogID		Integer		NOT NULL AUTO_INCREMENT,
	SKU   			Integer 	NOT NULL,
	SKU_Description Char(35) 	NOT NULL,
	Department  	Char(30)  	NOT NULL,
	CatalogPage		Integer		NULL,
	DateOnWebSite	Date		NULL,
	CONSTRAINT 		CSKU18_PK 	PRIMARY KEY (CatalogID)
	);
    
ALTER TABLE CATALOG_SKU_2018 AUTO_INCREMENT = 20180001;

INSERT INTO BUYER VALUES (
	'Mary Smith', 'Purchasing', 'Manager', NULL);
INSERT INTO BUYER VALUES (
	'Pete Hansen', 'Purchasing', 'Buyer 3', 'Mary Smith');
INSERT INTO BUYER VALUES (
	'Nancy Meyers', 'Purchasing', 'Buyer 1', 'Pete Hansen');
INSERT INTO BUYER VALUES (
	'Cindy Lo', 'Purchasing', 'Buyer 2', 'Mary Smith');
INSERT INTO BUYER VALUES (
	'Jerry Martin', 'Purchasing', 'Buyer 1', 'Cindy Lo');
    
INSERT INTO RETAIL_ORDER VALUES (
	1000, 10, '98110', 'December', 2017, 445.00);
INSERT INTO RETAIL_ORDER VALUES (
	2000, 20, '02335', 'December', 2017, 310.00);
INSERT INTO RETAIL_ORDER VALUES (
	3000, 10, '98110', 'January', 2018, 480.00);
    
INSERT INTO SKU_DATA VALUES (
	100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100300, 'Std. Scuba Tank, Light Blue', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100400, 'Std. Scuba Tank, Dark Blue', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100500, 'Std. Scuba Tank, Light Green', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	100600, 'Std. Scuba Tank, Dark Green', 'Water Sports', 'Pete Hansen');
INSERT INTO SKU_DATA VALUES (
	101100, 'Dive Mask, Small Clear', 'Water Sports', 'Nancy Meyers');
INSERT INTO SKU_DATA VALUES (
	101200, 'Dive Mask, Med Clear', 'Water Sports', 'Nancy Meyers');
INSERT INTO SKU_DATA VALUES (
	201000, 'Half-dome Tent', 'Camping', 'Cindy Lo');		
INSERT INTO SKU_DATA VALUES (
	202000, 'Half-dome Tent Vestibule', 'Camping', 'Cindy Lo');
INSERT INTO SKU_DATA VALUES (
	203000, 'Half-dome Tent Vestibule - Wide', 'Camping', 'Cindy Lo');
INSERT INTO SKU_DATA VALUES (
	301000, 'Light Fly Climbing Harness', 'Climbing', 'Jerry Martin');		
INSERT INTO SKU_DATA VALUES (
	302000, 'Locking Carabiner, Oval', 'Climbing', 'Jerry Martin');	
    
INSERT INTO ORDER_ITEM VALUES (
	1000, 201000, 1, 300.00, 300.00);
INSERT INTO ORDER_ITEM VALUES (
	1000, 202000, 1, 130.00, 130.00);
INSERT INTO ORDER_ITEM VALUES (
	2000, 101100, 4, 50.00, 200.00);
INSERT INTO ORDER_ITEM VALUES (
	2000, 101200, 2, 50.00, 100.00);
INSERT INTO ORDER_ITEM VALUES (
	3000, 100200, 1, 300.00, 300.00);
INSERT INTO ORDER_ITEM VALUES (
	3000, 101100, 2, 50.00, 100.00);
INSERT INTO ORDER_ITEM VALUES (
	3000, 101200, 1, 50.00, 50.00);
    
INSERT INTO WAREHOUSE VALUES (
	100, 'Atlanta', 'GA','Dave Jones', 125000);
INSERT INTO WAREHOUSE VALUES (
	200, 'Chicago', 'IL', 'Lucille Smith', 100000);
INSERT INTO WAREHOUSE VALUES (
	300, 'Bangor', 'ME', 'Bart Evans', 150000);
INSERT INTO WAREHOUSE VALUES (
	400, 'Seattle', 'WA','Dale Rogers', 130000);
INSERT INTO WAREHOUSE VALUES (
	500, 'San Francisco', 'CA','Grace Jefferson', 200000);
    

INSERT INTO INVENTORY VALUES (
	100, 100100, 'Std. Scuba Tank, Yellow', 250, 0);
INSERT INTO INVENTORY VALUES (
	200, 100100, 'Std. Scuba Tank, Yellow', 100, 50);
INSERT INTO INVENTORY VALUES (
	300, 100100, 'Std. Scuba Tank, Yellow', 100, 0);
INSERT INTO INVENTORY VALUES (
	400, 100100, 'Std. Scuba Tank, Yellow', 200, 0);
INSERT INTO INVENTORY VALUES (
	100, 100200, 'Std. Scuba Tank, Magenta', 200, 30);
INSERT INTO INVENTORY VALUES (
	200, 100200, 'Std. Scuba Tank, Magenta', 75, 75);
INSERT INTO INVENTORY VALUES (
	300, 100200, 'Std. Scuba Tank, Magenta', 100, 100);
INSERT INTO INVENTORY VALUES (
	400, 100200, 'Std. Scuba Tank, Magenta', 250, 0);
INSERT INTO INVENTORY VALUES (
	100, 101100, 'Dive Mask, Small Clear', 0, 500);
INSERT INTO INVENTORY VALUES (
	200, 101100, 'Dive Mask, Small Clear', 0, 500);
INSERT INTO INVENTORY VALUES (
	300, 101100, 'Dive Mask, Small Clear', 300, 200);
INSERT INTO INVENTORY VALUES (
	400, 101100, 'Dive Mask, Small Clear', 450, 0);
INSERT INTO INVENTORY VALUES (
	100, 101200, 'Dive Mask, Med Clear', 100, 500);
INSERT INTO INVENTORY VALUES (
	200, 101200, 'Dive Mask, Med Clear', 50, 500);
INSERT INTO INVENTORY VALUES (
	300, 101200, 'Dive Mask, Med Clear', 475, 0);
INSERT INTO INVENTORY VALUES (
	400, 101200, 'Dive Mask, Med Clear', 250, 250);
INSERT INTO INVENTORY VALUES (
	100, 201000, 'Half-dome Tent', 2, 100);
INSERT INTO INVENTORY VALUES (
	200, 201000, 'Half-dome Tent', 10, 250);
INSERT INTO INVENTORY VALUES (
	300, 201000, 'Half-dome Tent', 250, 0);
INSERT INTO INVENTORY VALUES (
	400, 201000, 'Half-dome Tent', 0, 250);
INSERT INTO INVENTORY VALUES (
	100, 202000, 'Half-dome Tent Vestibule', 10, 250);
INSERT INTO INVENTORY VALUES (
	200, 202000, 'Half-dome Tent Vestibule', 1, 250);
INSERT INTO INVENTORY VALUES (
	300, 202000, 'Half-dome Tent Vestibule', 100, 0);
INSERT INTO INVENTORY VALUES (
	400, 202000, 'Half-dome Tent Vestibule', 0, 200);
INSERT INTO INVENTORY VALUES (
	100, 301000, 'Light Fly Climbing Harness', 300, 250);
INSERT INTO INVENTORY VALUES (
	200, 301000, 'Light Fly Climbing Harness', 250, 250);
INSERT INTO INVENTORY VALUES (
	300, 301000, 'Light Fly Climbing Harness', 0, 250);
INSERT INTO INVENTORY VALUES (
	400, 301000, 'Light Fly Climbing Harness', 0, 250);
INSERT INTO INVENTORY VALUES (
	100, 302000, 'Locking Carabiner, Oval', 1000, 0);
INSERT INTO INVENTORY VALUES (
	200, 302000, 'Locking Carabiner, Oval', 1250, 0);
INSERT INTO INVENTORY VALUES (
	300, 302000, 'Locking Carabiner, Oval', 500, 500);
INSERT INTO INVENTORY VALUES (
	400, 302000, 'Locking Carabiner, Oval', 0, 1000);
    

INSERT INTO CATALOG_SKU_2016 (SKU, SKU_Description, Department, CatalogPage, DateOnWebSite)
	VALUES
	(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '2016-01-01'),
	(100500, 'Std. Scuba Tank, Light Green', 'Water Sports', NULL, '2016-07-01'),
	(100600, 'Std. Scuba Tank, Dark Green', 'Water Sports', NULL, '2016-07-01'),
	(101100, 'Dive Mask, Small Clear', 'Water Sports', 24, '2016-01-01'),
	(101200, 'Dive Mask, Med Clear', 'Water Sports', 24, '2016-01-01'),
	(201000, 'Half-dome Tent', 'Camping', 45, '2016-01-01'),		
	(202000, 'Half-dome Tent Vestibule', 'Camping', 47, '2016-01-01'),
	(301000, 'Light Fly Climbing Harness', 'Climbing', 76, '2016-01-01'),		
	(302000, 'Locking Carabiner, Oval', 'Climbing', 78, '2016-01-01');
    

INSERT INTO CATALOG_SKU_2017 (SKU, SKU_Description, Department, CatalogPage, DateOnWebSite)
	VALUES
	(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '2017-01-01'),
	(100300, 'Std. Scuba Tank, Light Blue', 'Water Sports', 23, '2017-01-01'),
	(100400, 'Std. Scuba Tank, Dark Blue', 'Water Sports', NULL, '2017-08-01'),
	(101100, 'Dive Mask, Small Clear', 'Water Sports', 26, '2017-01-01'),
	(101200, 'Dive Mask, Med Clear', 'Water Sports', 26, '2017-01-01'),
	(201000, 'Half-dome Tent', 'Camping', 46, '2017-01-01'),		
	(202000, 'Half-dome Tent Vestibule', 'Camping', 46, '2017-01-01'),
	(301000, 'Light Fly Climbing Harness', 'Climbing', 77, '2017-01-01'),		
	(302000, 'Locking Carabiner, Oval', 'Climbing', 79, '2017-01-01');
    


INSERT INTO CATALOG_SKU_2018 (SKU, SKU_Description, Department, CatalogPage, DateOnWebSite)
	VALUES
	(100100, 'Std. Scuba Tank, Yellow', 'Water Sports', 23, '2018-01-01'),
	(100200, 'Std. Scuba Tank, Magenta', 'Water Sports', 23, '2018-01-01'),
	(101100, 'Dive Mask, Small Clear', 'Water Sports', 27, '2018-08-01'),
	(101200, 'Dive Mask, Med Clear', 'Water Sports', 27, '2018-01-01'),
	(201000, 'Half-dome Tent', 'Camping', 45, '2018-01-01'),		
	(202000, 'Half-dome Tent Vestibule', 'Camping', 45, '2018-01-01'),
	(203000, 'Half-dome Tent Vestibule - Wide', 'Camping', NULL, '2018-04-01'),
	(301000, 'Light Fly Climbing Harness', 'Climbing', 76, '2018-01-01'),		
	(302000, 'Locking Carabiner, Oval', 'Climbing', 78, '2018-01-01');	





    
    