-- 1
INSERT INTO [User_]
( [id], [phone], [code], [fname], [lname], [pass], [invatation], [is_logged_in])
VALUES
(1001, '09022226700', 'b00003ki', 'Zohre', 'Rasouli', 'pass3', 8, 1),
(1002, '09022221155', 'c0000ddd', 'Elham', 'Niyayeshi', 'pass4', 4, 1),
(1003, '09022222233', 'd0000eee', 'Reza', 'Maleki', 'pass5', 9, 1),
(1004, '09022220044', 'f0000kkk', 'Morteza', 'Molayee', 'pass6', 10, 1),
(1005, '09022220022', 'e0000jjj', 'Omid', 'Ahmadi', 'pass7', 10, 1),
(1006, '09022224466', 's0000bbb', 'Mohammad', 'Sajjadi', 'pass8', 10, 1)

SELECT * FROM [User_];
GO

-- 2
INSERT INTO [Insurance]
( [id], [ins_type], [company_id], [price], [discount])
VALUES
(451, 4, 1, 210 * 1000, 0),
(452, 4, 10, 220 * 1000, 0),
(453, 4, 3, 230 * 1000, 0),
(454, 4, 14, 240 * 1000, 0),
(455, 4, 20, 250 * 1000, 0)
GO

INSERT INTO [Property_ins]
( [id], [ins_id], [rating], [ability], [satisfaction], [branch])
SELECT *
FROM (VALUES
    (451, 451, 4.2, 5, 5.0, 10),
    (452, 452, 4.2, 5, 4.0, 30),
    (453, 453, 3.9, 5, 4.1, 7),
    (454, 454, 4.0, 5, 4.3, 5),
    (455, 455, 3.7, 4, 3.0, 30)
) AS Temp ( [id], [ins_id], [rating], [ability], [satisfaction], [branch])
ORDER BY [rating]
GO

SELECT [Insurance].[id], [Type].[type], [Company].[name], [price], [discount], [rating], [ability], [satisfaction], [branch]
FROM [Property_ins]
    INNER JOIN [Insurance] ON ([Insurance].id = [Property_ins].ins_id)
    INNER JOIN [Type] ON ([Insurance].ins_type = [Type].id)
    INNER JOIN [Company] ON ([Insurance].company_id = [Company].id)
GO

-- 3
DECLARE @comp_id AS INT = (SELECT id FROM Company WHERE Company.name = 'Pasargad')
PRINT @comp_id

INSERT INTO [Insurance]
( [id], [ins_type], [company_id], [price], [discount])
VALUES
(351, 3, @comp_id, 210 * 1000, 0)
GO

INSERT INTO [Property_ins]
( [id], [ins_id], [rating], [ability], [satisfaction], [branch])
VALUES
(351, 351, 4.2, 5, 5.0, 29)
GO

SELECT [Insurance].[id], [Type].[type], [Company].[name], [price], [discount], [rating], [ability], [satisfaction], [branch]
FROM [Property_ins]
    INNER JOIN [Insurance] ON ([Insurance].id = [Property_ins].ins_id)
    INNER JOIN [Type] ON ([Insurance].ins_type = [Type].id)
    INNER JOIN [Company] ON ([Insurance].company_id = [Company].id)
GO

-- 4
DECLARE @user_id AS INT = (SELECT id FROM [User_] WHERE [User_].fname = 'Mohammad' AND [User_].lname = 'Sajjadi')
PRINT @user_id
PRINT (@user_id * 10 + 1)

INSERT INTO [Inqury]
( [id], [inq_type])
VALUES
(251, 2)

INSERT INTO [Health_inq]
( [id], [inq_id], [is_family], [count_of_memeber])
VALUES
(251, 251, 0, 2)

INSERT INTO [Member]
( [id], [health_inq_id], [base_ins], [age_range], [head_id], [relation])
VALUES
(2511, 251, 2, 2, NULL, NULL),
(2512, 251, 3, 2, NULL, NULL)

INSERT INTO [Buy]
( [id], [user_id], [ins_id], [inq_id], [final_price], [discount_code] )
VALUES
((@user_id * 10 + 1), @user_id, 203, 251, (1500 * 1000), NULL)
GO

-- 5
DECLARE @reza_maleki_code AS NVARCHAR(8) = ( SELECT code FROM [User_]  WHERE [User_].fname = 'Reza' AND [User_].lname = 'Maleki')
PRINT @reza_maleki_code

DECLARE @omid_ahmadi_id AS INT =  (SELECT id FROM [User_] WHERE [User_].fname = 'Omid' AND [User_].lname = 'Ahmadi');
PRINT @omid_ahmadi_id

INSERT INTO [Inqury]
( [id], [inq_type])
VALUES
(151, 1)
INSERT INTO [Life_inq]
( [id], [inq_id], [birth_date], [contract_period], [payment_way], [monthly_payment], [premiums_increase], [capital_increase], [death_coefficient])
VALUES
(151, 151, '1400-10-10', 5, 3, (50 * 1000), 25, 10, 20)

INSERT INTO [Buy]
( [id], [user_id], [ins_id], [inq_id], [final_price], [discount_code] )
VALUES
((@omid_ahmadi_id * 10 + 1), @omid_ahmadi_id, 101, 151, (1500 * 1000), @reza_maleki_code);
SELECT * FROM [Buy];

SELECT * FROM [User_] WHERE [User_].fname = 'Reza' AND [User_].lname = 'Maleki';

UPDATE [User_]
SET invatation = invatation - 1
WHERE [User_].fname = 'Reza' AND [User_].lname = 'Maleki';

SELECT * FROM [User_] WHERE [User_].fname = 'Reza' AND [User_].lname = 'Maleki';
GO

-- 6
DECLARE @comp_id AS INT = ( SELECT id FROM [Company] WHERE [Company].name = 'Dey');
PRINT @comp_id;

INSERT INTO [Insurance]
( [id], [ins_type], [company_id], [price], [discount])
VALUES
(251, 2, @comp_id, 150 * 1000, 60);
SELECT * FROM [Insurance];
INSERT INTO [Health_insurance]
( [id], [ins_id], [ins_service], [child_birth], [chronic_disease], [share_of_costs])
VALUES
(251, 251, 'shakhs vahed 3 star', 9, 3, 10);
SELECT * FROM [Health_insurance];
GO

-- 7
DECLARE @user_id AS INT = (SELECT id FROM [User_] WHERE [User_].fname = 'Morteza' AND [User_].lname = 'Molayee')
PRINT @user_id

INSERT INTO [Reminder]
( [id], [user_id], [ins_type], [ins_description], [due_date], [ins_period], [province_id], [city_id])
VALUES
(((@user_id * 10) + 1) , @user_id, 1, 'rem 1', '1401-10-10', 6, 08, 0801),
(((@user_id * 10) + 2) , @user_id, 1, 'rem 2', '1401-11-11', 12, 08, 0801)
SELECT * FROM [Reminder]
GO


-- Delete
SELECT * FROM [User_];
SELECT DISTINCT user_id FROM [Buy];

DELETE FROM [User_]
WHERE NOT EXISTS (
    SELECT *
    FROM [Buy]
    WHERE [Buy].user_id = [User_].id
);

SELECT * FROM [User_];
GO

-- Insert
CREATE TABLE [Tmp_user](
	[id] INT NOT NULL PRIMARY KEY,
	[phone] NVARCHAR(11) NOT NULL UNIQUE,
	[code] NVARCHAR(8) NOT NULL UNIQUE,
	[fname] NVARCHAR(50),
	[lname] NVARCHAR(50),
	[pass] NVARCHAR(25),
	[invatation] TINYINT DEFAULT 10,
	[is_logged_in] BIT DEFAULT 1
);

INSERT INTO [Tmp_user]
SELECT u.*
FROM [Buy] b
    INNER JOIN [User_] u ON (b.user_id = u.id)
    INNER JOIN [Insurance] ins ON (b.ins_id = ins.id)
    INNER JOIN [inqury] inq ON (b.inq_id = inq.id)
    INNER JOIN [Property_inq] pinq ON (pinq.inq_id = inq.id)
    INNER JOIN [Province] p ON (pinq.province_id = p.id)
WHERE 
inq.inq_type = (SELECT id FROM [Type] WHERE [type] = 'Fire') AND
p.name IN ('khorasan Shomali', 'khorasan Razavi', 'khorasan Jonobi')

SELECT * FROM [Tmp_user]
GO

-- View
CREATE VIEW Family_Health_Ins_Users
AS
SELECT u.*
FROM [Buy] b
    INNER JOIN [User_] u ON (b.user_id = u.id)
    INNER JOIN [inqury] inq ON (b.inq_id = inq.id)
    INNER JOIN [Health_inq] hinq ON (hinq.inq_id = inq.id)
WHERE hinq.is_family = 1;
GO

SELECT * FROM Family_Health_Ins_Users
GO
