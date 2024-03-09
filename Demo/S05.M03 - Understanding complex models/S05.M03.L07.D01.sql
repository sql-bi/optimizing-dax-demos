SELECT TOP (1000001) [semijoin2].[c16],
    [semijoin2].[c25],
    COUNT_BIG(DISTINCT [a0]) AS [a0]
FROM (
    (
        (
            SELECT [t3].[Order Date] AS [t3_Order Date],
                [t3].[Delivery Date] AS [t3_Delivery Date],
                [t3].[Order Number] AS [a0]
            FROM ([Data].[Sales]) AS [t3]
            ) AS [basetable0] 
            INNER JOIN (
                (SELECT 2019 AS [c16], 12 AS [c25], 
                        CAST('20200125 00:00:00' AS DATETIME) AS [t3_Delivery Date])
                UNION ALL (SELECT 2019 AS [c16], 12 AS [c25], 
                        CAST('20191219 00:00:00' AS DATETIME) AS [t3_Delivery Date])
                UNION ALL (SELECT 2019 AS [c16], 12 AS [c25], 
                        CAST('20200105 00:00:00' AS DATETIME) AS [t3_Delivery Date])

--  … skipping thousands of rows

                UNION ALL (SELECT 2019 AS [c16], 12 AS [c25], 
                        CAST('20110822 00:00:00' AS DATETIME) AS [t3_Order Date])
                UNION ALL (SELECT 2019 AS [c16], 12 AS [c25], 
                        CAST('20101026 00:00:00' AS DATETIME) AS [t3_Order Date])
        ) AS [semijoin2] ON (
            ([semijoin2].[t3_Order Date] = [basetable0].[t3_Order Date])
            AND (
                [semijoin2].[c16] = [semijoin1].[c16]
                OR [semijoin2].[c16] IS NULL
                AND [semijoin1].[c16] IS NULL
                )
            AND (
                [semijoin2].[c25] = [semijoin1].[c25]
                OR [semijoin2].[c25] IS NULL
                AND [semijoin1].[c25] IS NULL
                )
            )
    )
GROUP BY [semijoin2].[c16],
    [semijoin2].[c25]
