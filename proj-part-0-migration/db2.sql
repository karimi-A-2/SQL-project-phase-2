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
	[user_id] INT FOREIGN KEY REFERENCES [User_](id),
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
	[inq_id] INT FOREIGN KEY REFERENCES Inqury(id),
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
	[user_id] INT FOREIGN KEY REFERENCES [User_](id),
	[ins_id] INT FOREIGN KEY REFERENCES [Insurance](id),
	[inq_id] INT FOREIGN KEY REFERENCES [inqury](id),
	[final_price] BIGINT NOT NULL,
	[discount_code] NVARCHAR(15)
);
GO