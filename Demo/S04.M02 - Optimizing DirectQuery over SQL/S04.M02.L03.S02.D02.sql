ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 16;
GO
SET STATISTICS TIME ON
GO
SELECT TOP (1000001) *
FROM (
    SELECT [t0_Continent],
        SUM([a0]) AS [a0]
    FROM (
        SELECT [t0].[Continent] AS [t0_Continent],
            [t3].[Quantity] AS [t3_Quantity],
            [t3].[Net Price] AS [t3_Net Price],
            ([t3].[Quantity] * [t3].[Net Price]) AS [a0]
        FROM (
            [Data].[Sales1] AS [t3] 
                INNER JOIN [Data].[Customer1] AS [t0] 
                    ON ( [t3].[CustomerKey] = [t0].[CustomerKey] )
            )
        ) AS [t0]
    GROUP BY [t0_Continent]
   ) AS [MainTable]
WHERE (NOT (([a0] IS NULL)))
