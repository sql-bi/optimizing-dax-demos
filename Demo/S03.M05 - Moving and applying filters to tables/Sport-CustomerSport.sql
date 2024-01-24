--
--  Execute the following script on Contoso 100M 
--  SQL Server database to populate the tables
--  Sport and CustomerSport used in the 
--  "Modeling many-to-many relationships" section
--

-- Uncomment the following DROP TABLE statements
-- to remove previous versions of these tables
DROP TABLE IF EXISTS [Data].CustomerSport
DROP TABLE IF EXISTS [Data].Sport
DROP VIEW IF EXISTS dbo.CustomerSport
DROP VIEW IF EXISTS dbo.Sport
GO

CREATE TABLE [Data].Sport (
    SportKey INT NOT NULL,
    Sport NVARCHAR ( 100 )
)
GO

CREATE TABLE [Data].CustomerSport (
    CustomerKey INT NOT NULL,
    SportKey INT NOT NULL
)
GO

CREATE VIEW dbo.Sport AS 
    SELECT 
        SportKey, 
        Sport 
    FROM [Data].Sport
GO

CREATE VIEW dbo.CustomerSport AS 
    SELECT 
        CustomerKey,
        SportKey
    FROM [Data].CustomerSport
GO

INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 1, 'Soccer');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 2, 'Basketball');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 3, 'Tennis');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 4, 'Baseball');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 5, 'Golf');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 6, 'Running');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 7, 'Volleyball');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 8, 'Badminton');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 9, 'Swimming');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 10, 'Boxing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 11, 'Table Tennis');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 12, 'Skiing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 13, 'Ice Skating');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 14, 'Roller Skating');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 15, 'Cricket');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 16, 'Rugby');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 17, 'Pool');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 18, 'Darts');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 19, 'Football');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 20, 'Bowling');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 21, 'Ice Hockey');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 22, 'Surfing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 23, 'Karate');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 24, 'Horse Racing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 25, 'Snowboarding');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 26, 'Skateboarding');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 27, 'Cycling');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 28, 'Archery');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 29, 'Fishing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 30, 'Gymnastics');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 31, 'Figure Skating');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 32, 'Rock Climbing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 33, 'Sumo Wrestling');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 34, 'Taekwondo');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 35, 'Fencing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 36, 'Water Skiing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 37, 'Jet Skiing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 38, 'Weight Lifting');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 39, 'Scuba Diving');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 40, 'Judo');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 41, 'Wind Surfing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 42, 'Kickboxing');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 43, 'Sky Diving');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 44, 'Hang Gliding');
INSERT INTO [Data].Sport (SportKey, Sport) VALUES ( 45, 'Bungee Jumping');
GO

INSERT INTO [Data].CustomerSport ( CustomerKey, SportKey )
SELECT
    CustomerKey,
    SportKey
FROM 
    Customer C
    CROSS APPLY (
        SELECT TOP ( ( C.CustomerKey % 4 ))
        SportKey FROM Sport 
        ORDER BY NEWID() ) A
ORDER BY 
    CustomerKey,
    SportKey
GO