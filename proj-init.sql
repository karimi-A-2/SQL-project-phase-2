-- Drop the database 'projDB1'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Uncomment the ALTER DATABASE statement below to set the database to SINGLE_USER mode if the drop database command fails because the database is in use.
ALTER DATABASE projDB1 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- Drop the database if it exists
IF EXISTS (
    SELECT [name]
        FROM sys.databases
        WHERE [name] = N'projDB1'
)
DROP DATABASE projDB1
GO

USE master;
CREATE DATABASE projDB1;
GO

USE projDB1;
GO

CREATE TABLE [Province](
	[id] INT NOT NULL PRIMARY KEY,
	[name] NVARCHAR(30)
);
GO

CREATE TABLE [City](
	[id] INT NOT NULL PRIMARY KEY,
	[name] NVARCHAR(30),
	[province_id] INT FOREIGN KEY REFERENCES Province(id)
);
GO

CREATE TABLE [Type](
	[id] INT NOT NULL PRIMARY KEY,
	[type] NVARCHAR(15) NOT NULL
);
GO

CREATE TABLE [User_](
	[id] INT NOT NULL PRIMARY KEY,
	[phone] NVARCHAR(11) NOT NULL UNIQUE,
	[code] NVARCHAR(8) NOT NULL UNIQUE,
	[fname] NVARCHAR(50),
	[lname] NVARCHAR(50),
	[pass] NVARCHAR(25),
	[invatation] TINYINT DEFAULT 10,
	[is_logged_in] BIT DEFAULT 1
);
GO

create table [Reminder](
	[id] INT NOT NULL PRIMARY KEY,
	[user_id] INT FOREIGN KEY REFERENCES [User_](id) ON DELETE CASCADE,
	[ins_type] INT FOREIGN KEY REFERENCES [Type](id),
	[ins_description] NVARCHAR(100),
	[due_date] NVARCHAR(10) NOT NULL,
	[ins_period] TINYINT NOT NULL CHECK ([ins_period] IN (0, 1, 3, 6, 12)),
	[province_id] INT FOREIGN KEY REFERENCES [Province](id),
	[city_id] INT FOREIGN KEY REFERENCES [City](id),
);
GO

CREATE TABLE [Inqury](
	[id] INT NOT NULL PRIMARY KEY,
    [inq_type] INT FOREIGN KEY REFERENCES [Type](id),
);
GO

CREATE TABLE [Life_inq](
	[id] INT NOT NULL PRIMARY KEY,
	[inq_id] INT FOREIGN KEY REFERENCES Inqury(id) ON DELETE CASCADE,
	[birth_date] NVARCHAR(10),
	[contract_period] TINYINT NOT NULL DEFAULT 5 CHECK (5 <= [contract_period] AND [contract_period] <= 30),
	[payment_way] TINYINT NOT NULL CHECK ([payment_way] IN (3, 6, 12)),
	[monthly_payment] BIGINT NOT NULL CHECK ([monthly_payment] >= 50000),
	[premiums_increase] TINYINT DEFAULT 25 CHECK (0 <= [premiums_increase] AND [premiums_increase] <= 25),
	[capital_increase] TINYINT DEFAULT 10 CHECK (0 <= [capital_increase] AND [capital_increase] <= 20),
	[death_coefficient] TINYINT DEFAULT 20 CHECK (3 <= [death_coefficient] AND [death_coefficient] <= 25)
);
GO

CREATE TABLE [Health_inq](
	[id] INT NOT NULL PRIMARY KEY,
	[inq_id] INT FOREIGN KEY REFERENCES [Inqury](id),
	[is_family] BIT,
	[count_of_memeber] TINYINT NOT NULL CHECK (1 <= [count_of_memeber] AND [count_of_memeber] <= 10)
);
GO

CREATE TABLE [BaseIns](
	[id] INT NOT NULL PRIMARY KEY,
	[insurance] NVARCHAR(30)
);
GO

CREATE TABLE [Relation](
	[id] INT NOT NULL PRIMARY KEY,
	[relation] NVARCHAR(30)
);
GO

CREATE TABLE [AgeRange](
	[id] INT NOT NULL PRIMARY KEY,
	[range] NVARCHAR(30)
);
GO

CREATE TABLE [Member](
	[id] INT NOT NULL PRIMARY KEY,
    [health_inq_id] INT FOREIGN KEY REFERENCES [Health_inq](id),
	[base_ins] INT FOREIGN KEY REFERENCES [BaseIns](id),
	[age_range] INT FOREIGN KEY REFERENCES [AgeRange](id),
	[head_id] INT FOREIGN KEY REFERENCES [Member](id),
	[relation] INT FOREIGN KEY REFERENCES [Relation](id)
);
GO

CREATE TABLE [StructureType](
	[id] INT NOT NULL PRIMARY KEY,
	[type] NVARCHAR(30)
);
GO

CREATE TABLE [BuildingMaterial](
	[id] INT NOT NULL PRIMARY KEY,
	[material] NVARCHAR(30)
);
GO

CREATE TABLE [Property_inq](
	[id] INT NOT NULL PRIMARY KEY,
	[inq_id] INT FOREIGN KEY REFERENCES [Inqury](id),
    [province_id] INT FOREIGN KEY REFERENCES [Province](id),
	[city_id] INT FOREIGN KEY REFERENCES [City](id),
	[structure_type] INT FOREIGN KEY REFERENCES [StructureType](id),
	[uinit_count] INT DEFAULT 1 CHECK ([uinit_count] >= 1),
	[building_material] INT FOREIGN KEY REFERENCES [BuildingMaterial](id),
	[life_building] TINYINT NOT NULL CHECK (0 <= [life_building] AND [life_building] <= 35),
	[meterage] INT NOT NULL,
	[cost_per_meter] TINYINT NOT NULL CHECK (0 <= [cost_per_meter] AND [cost_per_meter] <= 10),
	[appliance_price] BIGINT NOT NULL,
);
GO

CREATE TABLE [Company](
	[id] INT NOT NULL PRIMARY KEY,
	[name] NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE [Insurance](
	[id] INT NOT NULL PRIMARY KEY,
	[ins_type] INT FOREIGN KEY REFERENCES [Type](id),
	[company_id] Int FOREIGN KEY REFERENCES [Company](id),
	[price] BIGINT NOT NULL,
	[discount] TINYINT DEFAULT 0 CHECK (0 <= [discount] AND [discount] <= 100),
);
GO

CREATE TABLE [Life_insurance](
	[id] INT NOT NULL PRIMARY KEY,
	[ins_id] INT FOREIGN KEY REFERENCES [Insurance](id),
	[redemption_value] BIGINT NOT NULL,
	[death_capital] BIGINT NOT NULL,
	[medical_expences] BIGINT NOT NULL,
);
GO

CREATE TABLE [Health_insurance](
	[id] INT NOT NULL PRIMARY KEY,
	[ins_id] INT FOREIGN KEY REFERENCES [Insurance](id),
	[ins_service] NVARCHAR(50),
	[child_birth] INT DEFAULT 9,
	[chronic_disease] INT DEFAULT 3,
	[share_of_costs] INT DEFAULT 10 CHECK (0 <= [share_of_costs] AND [share_of_costs] <= 100),
);
GO

CREATE TABLE [Property_ins](
	[id] INT NOT NULL PRIMARY KEY,
	[ins_id] INT FOREIGN KEY REFERENCES [Insurance](id),
	[rating] DECIMAL(2, 1) CHECK (0.0 <= [rating] AND [rating] <= 5.0),
	[ability] TINYINT CHECK (0 <= [ability] AND [ability] <= 5),
	[satisfaction] DECIMAL(2, 1) CHECK (0.0 <= [satisfaction] AND [satisfaction] <= 5.0),
	[branch] INT NOT NULL,
);
GO

CREATE TABLE [Buy](
	[id] INT NOT NULL PRIMARY KEY,
	[user_id] INT FOREIGN KEY REFERENCES [User_](id) ON DELETE CASCADE,
	[ins_id] INT FOREIGN KEY REFERENCES [Insurance](id),
	[inq_id] INT FOREIGN KEY REFERENCES [inqury](id) ON DELETE CASCADE,
	[final_price] BIGINT NOT NULL,
	[discount_code] NVARCHAR(15)
);
GO


-- static values
INSERT INTO [Type]
( [id], [type])
VALUES
(1, 'Life'),
(2, 'Health'),
(3, 'Fire'),
(4, 'Earthquake')
GO

INSERT INTO [BaseIns]
( [id], [insurance])
VALUES
(1, 'No Base Insurance'),
(2, 'Tamin Ejtemayee'),
(3, 'Khadamat Darman'),
(4, 'Niro Mosalah'),
(5, 'Bank ha'),
(6, 'Salamat Iranian'),
(7, 'Other Insurance')
GO

INSERT INTO [Relation]
( [id], [relation])
VALUES
(0, 'Head'),
(1, 'Hamsar'),
(2, 'Farzand dokhtar'),
(3, 'Farzand pesar'),
(4, 'Pedar'),
(5, 'Madar'),
(6, 'Pedar bozorg'),
(7, 'Madar bozorg'),
(8, 'Nave'),
(9, 'Other')
GO

INSERT INTO [AgeRange]
( [id], [range])
VALUES
(1, '5 to 15'),
(2, '16 to 45'),
(3, '46 to 50'),
(4, '51 to 60'),
(5, '61 to 70')
GO

INSERT INTO [StructureType]
( [id], [type])
VALUES
(1, '1 vahed dar aparteman'),
(2, '1 sakhteman vilayee'),
(3, 'aparteman ya mojtama')
GO

INSERT INTO [BuildingMaterial]
( [id], [material])
VALUES
(1, 'Ajori'),
(2, 'Felezi'),
(3, 'Betoni')
GO

INSERT INTO [Province]
( [id], [name])
VALUES
(01, 'Azarbayjan Shargi'),
(02, 'Azarbayjan gharbi'),
(03, 'Ardabil'),
(04, 'Esfahan'),
(05, 'Alborz'),
(06, 'Ilam'),
(07, 'Boshehr'),
(08, 'Tehran'),
(09, 'Charmahal'),
(10, 'khorasan Jonobi'),
(11, 'khorasan Razavi'),
(12, 'khorasan Shomali'),
(13, 'Khozestan'),
(14, 'Zanjan'),
(15, 'Semnan'),
(16, 'Sistan'),
(17, 'Fars'),
(18, 'Qazvin'),
(19, 'Qom'),
(20, 'Kordestan'),
(21, 'Kerman'),
(22, 'Kermanshah'),
(23, 'Kohkiloye'),
(24, 'Golestan'),
(25, 'Gilan'),
(26, 'Lorestan'),
(27, 'Mazandaran'),
(28, 'Markazi'),
(29, 'Hormozgan'),
(30, 'Hamedan'),
(31, 'Yazd')
GO

INSERT INTO [City]
( [id], [name], [province_id])
VALUES
(0401, 'Esfahan', 04),
(0402, 'Golpaygan', 04),
(0403, 'Natanz', 04),
(0505, 'Kan', 05),
(0509, 'Karaj', 05),
(0801, 'Tehran', 08),
(0802, 'Varamin', 08),
(1001, 'Qaen', 10),
(1002, 'Ferdos', 10),
(1003, 'Birjand', 10),
(1101, 'Mashhad', 11),
(1102, 'Neyshabor', 11),
(1103, 'Sabzevar', 11),
(1201, 'Bojnord', 12),
(1202, 'Shiravan', 12),
(1203, 'Garme', 12)
GO

INSERT INTO [Company]
( [id], [name])
VALUES
(1, 'Iran'),
(2, 'Asia'),
(3, 'Parsian'),
(4, 'Dana'),
(5, 'Razi'),
(6, 'Ma'),
(7, 'Moalem'),
(8, 'Pasargad'),
(9, 'Alborz'),
(10, 'Dey'),
(11, 'Melat'),
(12, 'Karafarin'),
(13, 'Novin'),
(14, 'Saman'),
(15, 'Tejarat No'),
(16, 'Kosar'),
(17, 'Arman'),
(18, 'Sina'),
(19, 'Taavon'),
(20, 'Asmari'),
(21, 'Sarmad'),
(22, 'Mihan'),
(23, 'Hafez'),
(24, 'Tosee')
GO


-- dynamic values
INSERT INTO [User_]
( [id], [phone], [code], [fname], [lname], [pass], [invatation], [is_logged_in])
VALUES
(11, '09026743937', 'r00nh2lt', 'Ali', 'Karimi', 'pass', 5, 1),
(12, '09018110650', 'ygupw435', 'Mohammad', 'Amiri', 'pass', 8, 1),
(13, '09129615681', 'tmvx37i0', 'Mahda', 'Ashrafi', 'pass', 7, 1),
(14, '09371752150', 'qvri9z9g', 'Hossein', 'Mortazavi', 'pass', 10, 0),
(15, '09025807894', '13czlwwg', 'Helma', 'Akhgar', 'pass', 4, 1),
(16, '09374787030', 'pye761w9', 'Roqaye', 'Azizi', 'pass', 7, 1),
(17, '09308687695', '934bo6me', 'Kasra', 'Siyavashpoor', 'pass', 3, 1),
(18, '09027061854', 'yca0mvyl', 'Nikan', 'Norafkan', 'pass', 8, 0),
(19, '09509879142', 'dul70p8r', 'Erfan', 'Riyazati', 'pass', 10, 1),
(20, '09503672963', 'hr2kyfej', 'Reza', 'Najafi', 'pass', 10, 1)
GO

INSERT INTO [Reminder]
( [id], [user_id], [ins_type], [ins_description], [due_date], [ins_period], [province_id], [city_id])
VALUES
(111, 11, 1, 'test purpose', '1401-10-10', 12, 08, 0801),
(112, 11, 3, 'test purpose', '1401-05-01', 3, 08, 0802),

(121, 12, 1, 'test purpose', '1401-05-01', 6, 10, 1001),

(131, 13, 2, 'test purpose', '1401-06-07', 1, 10, 1002),
(132, 13, 4, 'test purpose', '1401-03-01', 12, 05, 0509),

(171, 17, 1, 'test purpose', '1380-09-01', 6, 08, 0801),

(191, 19, 1, 'test purpose', '1370-01-01', 3, 08, 0801),

(201, 20, 1, 'test purpose', '1360-03-01', 6, 08, 0801)
GO

INSERT INTO [Inqury]
( [id], [inq_type])
VALUES
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),

(201, 2),
(202, 2),
(203, 2),
(204, 2),
(205, 2),

(301, 3),
(302, 3),
(303, 3),
(304, 3),
(305, 3),
(306, 3),
(307, 3),

(401, 4),
(402, 4),
(403, 4),
(404, 4)
GO

INSERT INTO [Life_inq]
( [id], [inq_id], [birth_date], [contract_period], [payment_way], [monthly_payment], [premiums_increase], [capital_increase], [death_coefficient])
VALUES
(101, 101, '1400-10-10', 5, 3, (70 * 1000), 25, 10, 20),
(102, 102, '1360-01-01', 10, 3, (100 * 1000), 25, 10, 20),
(103, 103, '1375-03-10', 20, 12, (100 * 1000), 25, 10, 20),
(104, 104, '1399-07-06', 15, 12, (100 * 1000), 25, 10, 20),
(105, 105, '1401-02-26', 30, 3, (100 * 1000), 25, 10, 20)
GO

INSERT INTO [Health_inq]
( [id], [inq_id], [is_family], [count_of_memeber])
VALUES
(201, 201, 0, 1),
(202, 202, 0, 3),
(203, 203, 1, 3),
(204, 204, 1, 4),
(205, 205, 0, 1)
GO
INSERT INTO [Member]
( [id], [health_inq_id], [base_ins], [age_range], [head_id], [relation])
VALUES
(2011, 201, 5, 3, NULL, NULL),

(2021, 202, 3, 1, NULL, NULL),
(2022, 202, 3, 2, NULL, NULL),
(2023, 202, 3, 2, NULL, NULL),

(2031, 203, 3, 3, NULL, 0),
(2032, 203, 6, 3, 2031, 1),
(2033, 203, 6, 1, 2031, 2),

(2041, 204, 1, 4, NULL, 0),
(2042, 204, 1, 3, 2041, 1),
(2043, 204, 1, 1, 2041, 2),
(2044, 204, 1, 1, 2041, 3),

(2051, 205, 5, 3, NULL, NULL)
GO

INSERT INTO [Property_inq]
( [id], [inq_id], [province_id], [city_id], [structure_type], [uinit_count], [building_material], [life_building], [meterage], [cost_per_meter], [appliance_price] )
VALUES
(301, 301, 11, 1102, 3, 11, 3, 8, 800, 10, 100 * 1000000),
(302, 302, 08, 0801, 3, 6, 2, 30, 900, 7, 210 * 1000000),
(303, 303, 11, 1103, 1, 1, 2, 30, 900, 7, 250 * 1000000),
(304, 304, 08, 0801, 3, 15, 2, 30, 900, 7, 350 * 1000000),
(305, 305, 08, 0802, 1, 1, 2, 30, 900, 7, 100 * 1000000),
(306, 306, 08, 0802, 2, 1, 2, 30, 900, 7, 100 * 1000000),
(307, 307, 08, 0802, 3, 6, 2, 30, 900, 7, 100 * 1000000),

(401, 401, 11, 1103, 1, 1, 1, 0, 150, 5, 500 * 1000000),
(402, 402, 12, 1203, 2, 1, 2, 15, 300, 6, 200 * 1000000),
(403, 403, 05, 0509, 2, 6, 3, 10, 500, 3, 150 * 1000000),
(404, 404, 11, 1101, 1, 1, 1, 0, 200, 5, 500 * 1000000)
GO

INSERT INTO [Insurance]
( [id], [ins_type], [company_id], [price], [discount])
VALUES
(101, 1, 14, 300 * 1000, 0),
(102, 1, 1, 500 * 1000, 0),
(103, 1, 8, 100 * 1000, 0),
(104, 1, 7, 100 * 1000, 0),
(105, 1, 3, 100 * 1000, 0),

(201, 2, 10, 150 * 1000, 10),
(202, 2, 10, 100 * 1000, 20),
(203, 2, 10, 170 * 1000, 0),
(204, 2, 10, 130 * 1000, 5),
(205, 2, 14, 190 * 1000, 0),
(206, 2, 14, 200 * 1000, 0),
(207, 2, 14, 210 * 1000, 0),

(301, 3, 19, 210 * 1000, 0),
(302, 3, 2, 220 * 1000, 0),
(303, 3, 5, 230 * 1000, 0),
(304, 3, 3, 240 * 1000, 0),
(305, 3, 10, 250 * 1000, 0),

(401, 4, 1, 210 * 1000, 0),
(402, 4, 10, 220 * 1000, 0),
(403, 4, 3, 230 * 1000, 0),
(404, 4, 14, 240 * 1000, 0),
(405, 4, 20, 250 * 1000, 0)
GO

INSERT INTO [Life_insurance]
( [id], [ins_id], [redemption_value], [death_capital], [medical_expences])
VALUES
(101, 101, 0600 * 1000, 0900 * 1000, 0),
(102, 102, 1000 * 1000, 1500 * 1000, 0),
(103, 103, 1100 * 1000, 1900 * 1000, 0),
(104, 103, 1200 * 1000, 1700 * 1000, 0),
(105, 103, 1300 * 1000, 1400 * 1000, 0)
GO

INSERT INTO [Health_insurance]
( [id], [ins_id], [ins_service], [child_birth], [chronic_disease], [share_of_costs])
VALUES
(201, 201, 'shakhs vahed 3 star', 9, 3, 10),
(202, 202, 'shakhs vahed 4 star', 9, 3, 10),
(203, 203, 'shakhs vahed 4 star plus', 9, 3, 10),
(204, 204, 'shakhs vahed 5 star', 9, 3, 10),
(205, 205, 'tarh sero', 9, 3, 10),
(206, 206, 'tarh sepidar', 9, 3, 10),
(207, 207, 'tarh afra', 9, 3, 10)
GO

INSERT INTO [Property_ins]
( [id], [ins_id], [rating], [ability], [satisfaction], [branch])
VALUES
(301, 301, 4.2, 5, 5.0, 29),
(302, 302, 4.2, 5, 4.0, 99),
(303, 303, 3.9, 5, 4.1, 47),
(304, 304, 4.0, 5, 4.3, 62),
(305, 305, 3.7, 4, 3.0, 49),

(401, 401, 4.2, 5, 5.0, 10),
(402, 402, 4.2, 5, 4.0, 30),
(403, 403, 3.9, 5, 4.1, 7),
(404, 404, 4.0, 5, 4.3, 5),
(405, 405, 3.7, 4, 3.0, 30)
GO

INSERT INTO [Buy]
( [id], [user_id], [ins_id], [inq_id], [final_price], [discount_code] )
VALUES
(111, 11, 101, 101, (1500 * 1000), NULL),
(112, 11, 201, 201, (1500 * 1000), NULL),
(113, 11, 401, 401, (1500 * 1000), NULL),

(121, 12, 102, 102, (1500 * 1000), NULL),
(122, 12, 301, 301, (1500 * 1000), NULL),
(123, 12, 402, 402, (1500 * 1000), NULL),

(131, 13, 101, 103, (1500 * 1000), NULL),
(132, 13, 203, 202, (0900 * 1000), NULL),
(133, 13, 305, 302, (1500 * 1000), NULL),
(134, 13, 404, 403, (1500 * 1000), NULL),

(151, 15, 302, 303, (0500 * 1000), NULL),
(152, 15, 302, 306, (0500 * 1000), NULL),
(153, 15, 302, 307, (0500 * 1000), NULL),

(161, 16, 303, 304, (0500 * 1000), NULL),

(181, 18, 201, 203, (0500 * 1000), NULL),
(182, 18, 304, 305, (0500 * 1000), NULL),

(191, 19, 206, 204, (1500 * 1000), NULL),
(192, 19, 207, 205, (1500 * 1000), NULL)
GO

SELECT *
FROM [Buy]
    INNER JOIN [User_] ON ([Buy].user_id = [User_].id)
    INNER JOIN [Insurance] ON ([Buy].ins_id = [Insurance].id)
    INNER JOIN [Inqury] ON ([Buy].inq_id = [Inqury].id )

SELECT * FROM [User_]

-- user, count buy
SELECT u.id, COUNT(b.id)
FROM [User_] u LEFT OUTER JOIN Buy b ON (b.user_id = u.id) 
GROUP BY u.id

SELECT health_inq_id, Member.id, BaseIns.insurance, AgeRange.range, head_id, Relation.relation
FROM [Member]
    INNER JOIN [BaseIns] ON ([Member].[base_ins] = [BaseIns].[id])
    INNER JOIN [AgeRange] ON ([Member].[age_range] = [AgeRange].[id])
    INNER JOIN [Relation] ON ([Member].[relation] = [Relation].[id]);

SELECT
    [Property_inq].[id],
    [inq_id],
    [Province].[name],
    [City].[name],
    [StructureType].[type],
    [uinit_count],
    [BuildingMaterial].[material],
    [life_building],
    [meterage],
    [cost_per_meter],
    [appliance_price]
FROM
    [Property_inq]
    INNER JOIN [Province] ON ([province_id] = [Province].[id])
    INNER JOIN [City] ON ([city_id] = [City].[id])
    INNER JOIN [StructureType] ON ([structure_type] = [StructureType].[id])
    INNER JOIN [BuildingMaterial] ON ([building_material] = [BuildingMaterial].[id]);


-- SELECT * FROM [Province];
-- SELECT * FROM [City];
-- SELECT * FROM [Type];
-- SELECT * FROM [User_];
-- SELECT * FROM [Reminder];
-- SELECT * FROM [Inqury];
-- SELECT * FROM [Life_inq];
-- SELECT * FROM [Health_inq];
-- SELECT * FROM [BaseIns];
-- SELECT * FROM [Relation];
-- SELECT * FROM [AgeRange];
-- SELECT * FROM [Member];
-- SELECT * FROM [StructureType];
-- SELECT * FROM [BuildingMaterial];
-- SELECT * FROM [Property_inq];
-- SELECT * FROM [Company];
-- SELECT * FROM [Insurance];
-- SELECT * FROM [Life_insurance];
-- SELECT * FROM [Health_insurance];
-- SELECT * FROM [Property_ins];
-- SELECT * FROM [Buy];