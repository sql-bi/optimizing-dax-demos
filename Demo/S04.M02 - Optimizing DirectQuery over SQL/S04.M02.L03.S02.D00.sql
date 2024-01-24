--
--  DEMO: 
--
USE "Contoso 100M" -- Repeat with Contoso 100M x 10
GO

SELECT 
    Sales.*
INTO Data.Sales1 
FROM Data.Sales WITH ( TABLOCK )

GO

SELECT Customer.*
INTO Data.Customer1
FROM Data.Customer WITH ( TABLOCK )
GO

CREATE CLUSTERED INDEX CustomerIndex ON Data.Customer1 ( CustomerKey )
GO

CREATE NONCLUSTERED INDEX SalesIndex ON [Data].[Sales1] (Quantity, [Net Price], [CustomerKey] )

GO

--
--  Clean up steps
--
DROP TABLE Data.Sales1
GO
DROP TABLE Data.Customer1
GO
