--  DEMO: Choose the best data type for relationships
--
--  Create a relationship between Sales and Customer based on
--  a GUID column rather than the integer we are using 
--
USE "Contoso 100M x 10"
GO

ALTER TABLE Data.Customer
ADD 
    CustomerGuidKey UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID ()
GO

UPDATE Data.Customer SET CustomerGuidKey = NEWID () 
GO

DROP Table Data.Sales1
GO

SELECT 
    Sales.*,
    Customer.CustomerGuidKey
INTO Data.Sales1 
FROM Data.Sales WITH ( TABLOCK )
    INNER JOIN Data.Customer WITH ( TABLOCK )
        ON Customer.CustomerKey = Sales.CustomerKey

GO

CREATE CLUSTERED COLUMNSTORE INDEX [IDX_MaterializedSales_Clustered] ON [Data].[Sales1] 
	WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0)

GO

--
--  Clean up steps
--
ALTER TABLE Data.Customer
DROP COLUMN
    CustomerGuidKey 
GO
DROP TABLE Data.Sales1