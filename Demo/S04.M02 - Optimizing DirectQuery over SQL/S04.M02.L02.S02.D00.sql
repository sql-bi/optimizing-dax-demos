--
--	Script to use to prepare the model
--
SELECT * INTO Data.Sales1 FROM Data.Sales

GO

--
--	Index to create for the demo, after the first tests
--
CREATE INDEX IDX_Test1 ON [Data].[Sales1] ( [ProductKey], [Quantity], [Net Price] )

GO

--
--	Clean up everything
--
DROP TABLE Data.Sales1 