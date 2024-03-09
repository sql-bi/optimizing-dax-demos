SELECT TOP (2000001) *
    [semijoin1].[c40],
    (COUNT_BIG(DISTINCT [a0]) + MAX(CASE WHEN [a0] IS NULL THEN 1 ELSE 0 END)) AS [a0]
FROM
(
    SELECT [t1].[CustomerKey] AS [c20], [t1].[CustomerKey] AS [a0]
    FROM Sales  AS [t1]
) AS [basetable0] (
(
    (SELECT 3 AS [c40],1279112 AS [c20] )  UNION ALL 
    (SELECT 5 AS [c40],166945 AS [c20] )  UNION ALL 
    (SELECT 5 AS [c40],166991 AS [c20] )  UNION ALL 
    (SELECT 5 AS [c40],167122 AS [c20] )  UNION ALL 
    ..
    ..
    (SELECT 3 AS [c40],1211409 AS [c20] )  UNION ALL 
    ..
    ..
    (SELECT 3 AS [c40],399987 AS [c20] )  UNION ALL 
    (SELECT 3 AS [c40],392899 AS [c20] ) 
) AS [semijoin1] on 
    ([semijoin1].[c20] = [basetable0].[c20])
)
GROUP BY [semijoin1].[c40]
