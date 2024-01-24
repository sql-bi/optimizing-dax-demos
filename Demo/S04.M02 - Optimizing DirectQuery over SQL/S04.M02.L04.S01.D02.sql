--
-- Create Data.AggregatedSales table on Contoso 100M x 10 database
--
SELECT
    [Date].[Year],
    [Date].[Year Month],
    [Date].[Year Month Number],
    ProductKey,
    Customer.CountryFull AS Country,
    Customer.Continent,
    SUM ( [Quantity] ) AS SumOfQuantity,
    SUM ( [Quantity] * [Net Price] ) AS SumOfAggLineAmount,
    COUNT ( [Quantity] ) AS CountOfQuantity
INTO Data.AggregatedSales 
FROM
    Data.Sales WITH ( TABLOCK )
    INNER JOIN Data.Date WITH ( TABLOCK )
        ON [Order Date] = [Date]
    INNER JOIN Data.Customer WITH ( TABLOCK )
        ON Customer.CustomerKey = Sales.CustomerKey
GROUP BY 
    ProductKey,
    [Date].[Year],
    [Date].[Year Month],
    [Date].[Year Month Number],
    Customer.CountryFull,
    Customer.Continent
GO
CREATE CLUSTERED COLUMNSTORE INDEX [IDX_Clustered] ON Data.AggregatedSales 
    WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0)
GO