--
--	Script to use to prepare the model
--	Beware, this may take hours on the Contoso 100M x 10 database
--
ALTER TABLE Data.Sales ADD QuantityBigInt BIGINT
GO
UPDATE Data.Sales SET QuantityBigInt = Quantity
GO

--
--	Clean up everything
--
ALTER TABLE Data.Sales DROP COLUMN QuantityBigInt
