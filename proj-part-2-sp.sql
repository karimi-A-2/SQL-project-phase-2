-- 1 -- ok
DROP PROCEDURE userNotOrder;
GO

CREATE PROCEDURE userNotOrder
AS
SELECT [fname], [lname]
FROM [User_]
WHERE id NOT IN (
    SELECT b.user_id
    FROM Buy b
        INNER JOIN User_ u ON (b.user_id = u.id)
        INNER JOIN Insurance i ON (b.ins_id = i.id)
    WHERE ins_type = (SELECT id FROM [Type] WHERE [type] = 'Life')
    );
GO

EXEC userNotOrder;
GO

-- 2 -- ok
DROP PROCEDURE userMaxInsurance;
GO

CREATE PROCEDURE userMaxInsurance 
    @maxprice BIGINT
AS 
SELECT u.fname, u.lname
FROM Buy b
    INNER JOIN User_ u ON (b.user_id = u.id)
    INNER JOIN Insurance i ON (b.ins_id = i.id)
WHERE i.ins_type = (SELECT id FROM [Type] WHERE [type] = 'Health') and b.final_price <= @maxprice;
GO

EXECUTE userMaxInsurance @maxprice = 900000;
GO

-- 3 -- ok
DROP PROCEDURE userReminder;
GO

CREATE PROCEDURE userReminder 
    @ins_period TINYINT
AS
SELECT u.fname
FROM User_ u
    INNER JOIN Reminder r ON (u.id = r.user_id)
WHERE r.ins_period = @ins_period AND r.ins_type = (SELECT id FROM [Type] WHERE [type] = 'Life');
GO

EXECUTE userReminder @ins_period = 6;
GO

-- 4 -- ok
DROP PROCEDURE avgName;
GO

CREATE PROCEDURE avgName 
    @baseinsurance NVARCHAR(30), 
    @number_of_insurance INT
AS
SELECT AVG(LEN(u.lname)) AS avg_len_lname
FROM Buy b
    INNER JOIN [User_] u ON (b.user_id = u.id) 
    INNER JOIN [Insurance] i ON (b.ins_id = i.id) 
    INNER JOIN [Inqury] inq ON (b.inq_id = inq.id)  
    INNER JOIN [Health_inq] hinq ON (inq.id = hinq.inq_id)  
    INNER JOIN Member m ON (m.health_inq_id = hinq.id)  
WHERE 
i.ins_type = (SELECT id FROM [Type] WHERE [type] = 'Health') AND 
hinq.is_family = 0 AND
hinq.count_of_memeber = 1 AND
m.base_ins = (SELECT id FROM [BaseIns] WHERE BaseIns.insurance = @baseinsurance) AND
@number_of_insurance >= (
    SELECT COUNT(b.id)
    FROM [User_] u1 LEFT OUTER JOIN Buy b ON (b.user_id = u1.id) 
    WHERE u1.id = u.id
)
GO

EXEC avgName @baseinsurance = 'Bank ha', @number_of_insurance = 3
GO

-- 5 -- ok
DROP PROCEDURE nameCompanyAsc;
GO

CREATE PROCEDURE nameCompanyAsc 
	@province NVARCHAR(35)
AS 
SELECT ins.id, comp.name, ins.price, ins.discount
FROM [Buy] b
    INNER JOIN [Insurance] ins ON (b.ins_id = ins.id)
	INNER JOIN [Company] comp ON (ins.company_id = comp.id)
    INNER JOIN [inqury] inq ON (b.inq_id = inq.id)
    INNER JOIN [Property_inq] pinq ON (pinq.inq_id = inq.id)
    INNER JOIN [Province] p ON (pinq.province_id = p.id)
WHERE 
ins.ins_type = (SELECT id FROM [Type] WHERE [type] = 'Fire') and 
inq.inq_type = (SELECT id FROM [Type] WHERE [type] = 'Fire') and 
p.name = @province
ORDER BY ins.price ASC;
GO

EXEC nameCompanyAsc @province = 'Tehran'
GO

-- 6 -- ok
DROP PROCEDURE userInvitation;
GO

CREATE PROCEDURE userInvitation 
    @invatation int,
    @numofinsurance int
AS
SELECT u.fname
FROM [User_] u
WHERE u.invatation <= (10 - @invatation)
and u.id in (
    SELECT [user_id]
    FROM [Buy]
    GROUP BY [user_id]
    HAVING COUNT(*) >= @numofinsurance);
GO

EXEC userInvitation @invatation = 3, @numofinsurance = 2
GO

-- 7 -- ok
DROP PROCEDURE userCompanyInsurance;
GO

CREATE PROCEDURE userCompanyInsurance 
    @type nvarchar(30), 
    @company nvarchar(35)
AS 
SELECT u.*
FROM Buy b
    INNER JOIN User_ u ON (b.user_id = u.id)
    INNER JOIN Insurance i ON (b.ins_id = i.id)
    INNER JOIN Company c ON (i.company_id = c.id)
WHERE c.[name] = @company AND i.ins_type = (SELECT id FROM [Type] WHERE [type] = @type)
GO

EXEC userCompanyInsurance @type = 'Life', @company = 'Saman'
GO

-- 8 -- ok
DROP PROCEDURE usersMaxMin;
GO

CREATE PROCEDURE usersMaxMin
AS
WITH count_ins AS (
    SELECT u.id, COUNT(b.id) AS count
    FROM [User_] u LEFT OUTER JOIN [Buy] b ON (b.user_id = u.id)
    GROUP BY u.id
)
SELECT u.fname, u.lname, count
FROM User_ u INNER JOIN count_ins c_i ON (u.id = c_i.id)
WHERE 
[count] = (SELECT MAX([count]) FROM count_ins) OR
[count] = (SELECT MIN([count]) FROM count_ins)
ORDER BY count DESC
GO

EXEC usersMaxMin;
GO

-- 9 -- ok
DROP PROCEDURE mobileCount;
GO

CREATE PROCEDURE mobileCount 
    @begining nvarchar(11)
AS 
SELECT COUNT(*) AS number_of_phonenumbers
FROM [User_]
WHERE phone LIKE @begining + '%'
GO

EXEC mobileCount @begining = '0937';
GO

-- 10 -- ok
DROP PROCEDURE ageRangeFamilyInsurance;
GO

CREATE PROCEDURE ageRangeFamilyInsurance
    @familycount int
AS
SELECT [range], COUNT(price) count, SUM(price) sum
FROM AgeRange
    LEFT OUTER JOIN (
        SELECT age_range, price
        FROM Member m 
            INNER JOIN [Health_inq] hinq ON (hinq.id = m.health_inq_id) 
            INNER JOIN [inqury] inq ON (inq.id = hinq.inq_id)
            INNER JOIN [Buy] b ON (b.inq_id = inq.id)
            INNER JOIN [Insurance] ins ON (ins.id = b.ins_id)
        WHERE 
            m.head_id IS NULL AND 
            m.relation = 0 AND 
            hinq.is_family = 1 AND 
            hinq.count_of_memeber = @familycount
    ) T ON (age_range = AgeRange.id)
GROUP BY [range]
GO

EXECUTE ageRangeFamilyInsurance @familycount = 3;
GO

-- 11 -- ok
DROP PROCEDURE twoInsurances;
GO

CREATE PROCEDURE twoInsurances 
    @A nvarchar(15), 
    @B nvarchar(15)
AS 
SELECT DISTINCT fname, lname
FROM Buy b
    INNER JOIN [User_] u ON (b.user_id = u.id) 
    INNER JOIN [Insurance] i ON (b.ins_id = i.id) 
WHERE 
EXISTS (
    SELECT fname, lname
    FROM Buy b
        INNER JOIN [User_] u1 ON (b.user_id = u1.id) 
        INNER JOIN [Insurance] i ON (b.ins_id = i.id)
    WHERE u1.id = u.id AND i.ins_type = (SELECT id FROM [Type] WHERE [type] = @A))
AND EXISTS (
    SELECT fname, lname
    FROM Buy b
        INNER JOIN [User_] u2 ON (b.user_id = u2.id) 
        INNER JOIN [Insurance] i ON (b.ins_id = i.id) 
    WHERE u2.id = u.id AND i.ins_type = (SELECT id FROM [Type] WHERE [type] = @B))
GO

EXECUTE twoInsurances 'Health', 'Fire';
GO

-- 12 -- ok
DROP PROCEDURE avgEarthquake;
GO

CREATE PROCEDURE avgEarthquake 
    @province NVARCHAR(50)
AS
SELECT c.name, avg_metrage
FROM (
    SELECT pinq.city_id, AVG(pinq.meterage) avg_metrage
    FROM Property_inq pinq 
        INNER JOIN Inqury i ON((pinq.inq_id = i.id) and (i.inq_type) = (SELECT id FROM [Type] WHERE [type] = 'Earthquake'))
        INNER JOIN Province p ON ((pinq.province_id = p.id) and (p.name = @province))
    WHERE pinq.life_building = 0
    GROUP BY pinq.city_id
) T 
    INNER JOIN city c ON (T.city_id = c.id);
GO

EXECUTE avgEarthquake @province = 'khorasan Razavi';
GO

-- 13 -- ok
DROP PROCEDURE updateInsurance;
GO

CREATE PROCEDURE updateInsurance
    @period INT
AS
UPDATE Life_inq
SET payment_way = 6
FROM Life_inq
WHERE contract_period < @period;
GO

SELECT * FROM Life_inq;
EXECUTE updateInsurance @period = 20;
SELECT * FROM Life_inq;
GO

-- 14 -- ok
DROP PROCEDURE DeleteInsurance;
GO

CREATE PROCEDURE DeleteInsurance
    @X BIGINT, 
    @Y BIGINT, 
    @Z BIGINT 
AS 
DELETE Inqury
FROM [Buy] b
    INNER JOIN [Insurance] ins ON (b.ins_id = ins.id)
    INNER JOIN [Life_insurance] lins ON (ins.id = lins.ins_id)
    INNER JOIN [inqury] inq ON (b.inq_id = inq.id)
    INNER JOIN [Life_inq] linq ON (linq.inq_id = inq.id)
WHERE 
linq.contract_period = 5 AND
linq.monthly_payment BETWEEN @X AND @Y AND
lins.redemption_value < @Z;
GO

SELECT * FROM Buy;
EXECUTE DeleteInsurance @X = 50000, @Y = 100000, @Z = 30000000;
SELECT * FROM Buy;
GO

-- 15  -- ok
DROP PROCEDURE fireInsurance;
GO

CREATE PROCEDURE fireInsurance
AS
SELECT *
FROM [User_] u
WHERE NOT EXISTS (
    SELECT *
    FROM StructureType st
    WHERE NOT EXISTS (
        SELECT *
        FROM [Buy] b
            INNER JOIN [inqury] inq ON (b.inq_id = inq.id)
            INNER JOIN [Property_inq] pinq ON (pinq.inq_id = inq.id)
        WHERE inq.inq_type = (SELECT id FROM [Type] WHERE [type] = 'Fire')
        AND b.user_id = u.id
        AND pinq.structure_type = st.id
    )
)
UNION
SELECT u.*
FROM [Buy] b
    INNER JOIN [User_] u ON (b.user_id = u.id)
    INNER JOIN [inqury] inq ON (b.inq_id = inq.id)
    INNER JOIN [Property_inq] pinq ON (pinq.inq_id = inq.id)
WHERE inq.inq_type = (SELECT id FROM [Type] WHERE [type] = 'Fire')
AND pinq.structure_type = (SELECT id FROM StructureType WHERE [type] =  'aparteman ya mojtama')
AND pinq.uinit_count > 10
AND NOT EXISTS (
    SELECT *
    FROM [Buy] b2
        INNER JOIN [inqury] inq2 ON (b2.inq_id = inq2.id)
    WHERE inq2.inq_type = (SELECT id FROM [Type] WHERE [type] = 'Fire')
    AND b2.user_id = u.id
    AND b2.id <> b.id
);
GO

EXECUTE fireInsurance;
GO