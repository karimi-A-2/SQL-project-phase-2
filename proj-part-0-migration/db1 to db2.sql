/*
Run this script on:

        (localdb)\local.db1    -  This database will be modified

to synchronize it with:

        (localdb)\local.db2

You are recommended to back up your database before running this script

Script created by SQL Compare version 14.10.8.22508 from Red Gate Software Ltd at 1/4/2023 1:25:45 PM

*/
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL Serializable
GO
BEGIN TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Buy]'
GO
ALTER TABLE [dbo].[Buy] DROP CONSTRAINT [FK__Buy__inq_id__3B75D760]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Buy] DROP CONSTRAINT [FK__Buy__ins_id__3A81B327]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Buy] DROP CONSTRAINT [FK__Buy__userid__398D8EEE]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Earthquake_Insurance]'
GO
ALTER TABLE [dbo].[Earthquake_Insurance] DROP CONSTRAINT [FK__Earthquak__in_id__29572725]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Fire_Insurance]'
GO
ALTER TABLE [dbo].[Fire_Insurance] DROP CONSTRAINT [FK__Fire_Insu__in_id__2C3393D0]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[health_inq]'
GO
ALTER TABLE [dbo].[health_inq] DROP CONSTRAINT [FK__health_in__inqid__1CF15040]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Health_insurance]'
GO
ALTER TABLE [dbo].[Health_insurance] DROP CONSTRAINT [FK__Health_in__hinq___20C1E124]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Health_insurance] DROP CONSTRAINT [FK__Health_in__in_id__1FCDBCEB]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[inqury]'
GO
ALTER TABLE [dbo].[inqury] DROP CONSTRAINT [FK__inqury__userID__164452B1]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Insurance]'
GO
ALTER TABLE [dbo].[Insurance] DROP CONSTRAINT [FK__Insurance__inqid__1A14E395]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Insurance] DROP CONSTRAINT [FK__Insurance__useri__1920BF5C]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Life_inq]'
GO
ALTER TABLE [dbo].[Life_inq] DROP CONSTRAINT [FK__Life_inq__inqid__32E0915F]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Life_insurance]'
GO
ALTER TABLE [dbo].[Life_insurance] DROP CONSTRAINT [FK__Life_insu__in_id__239E4DCF]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Member]'
GO
ALTER TABLE [dbo].[Member] DROP CONSTRAINT [FK__Member__in_id__2F10007B]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Member] DROP CONSTRAINT [FK__Member__mem_id__300424B4]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Property_inq]'
GO
ALTER TABLE [dbo].[Property_inq] DROP CONSTRAINT [FK__Property___inqid__36B12243]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_inq] DROP CONSTRAINT [FK__Property___useri__35BCFE0A]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Property_ins]'
GO
ALTER TABLE [dbo].[Property_ins] DROP CONSTRAINT [FK__Property___in_id__267ABA7A]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping foreign keys from [dbo].[Reminder]'
GO
ALTER TABLE [dbo].[Reminder] DROP CONSTRAINT [FK__Reminder__userID__1367E606]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Buy]'
GO
ALTER TABLE [dbo].[Buy] DROP CONSTRAINT [PK__Buy__F8F9DBAE980330DA]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Earthquake_Insurance]'
GO
ALTER TABLE [dbo].[Earthquake_Insurance] DROP CONSTRAINT [PK__Earthqua__3213E83FEF4D922E]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Fire_Insurance]'
GO
ALTER TABLE [dbo].[Fire_Insurance] DROP CONSTRAINT [PK__Fire_Ins__3213E83F22CE491D]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[health_inq]'
GO
ALTER TABLE [dbo].[health_inq] DROP CONSTRAINT [PK__health_i__3213E83FE9412E7F]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Health_insurance]'
GO
ALTER TABLE [dbo].[Health_insurance] DROP CONSTRAINT [PK__Health_i__3213E83F148F12EA]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[inqury]'
GO
ALTER TABLE [dbo].[inqury] DROP CONSTRAINT [PK__inqury__3213E83FD4F2D349]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Insurance]'
GO
ALTER TABLE [dbo].[Insurance] DROP CONSTRAINT [PK__Insuranc__1CD08BE9B536407C]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Life_inq]'
GO
ALTER TABLE [dbo].[Life_inq] DROP CONSTRAINT [PK__Life_inq__3213E83F509B2263]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Life_insurance]'
GO
ALTER TABLE [dbo].[Life_insurance] DROP CONSTRAINT [PK__Life_ins__3213E83F096DB3B1]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Member]'
GO
ALTER TABLE [dbo].[Member] DROP CONSTRAINT [PK__Member__3213E83FB1629EFF]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Property_inq]'
GO
ALTER TABLE [dbo].[Property_inq] DROP CONSTRAINT [PK__Property__3213E83F5BCBE4CD]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Property_ins]'
GO
ALTER TABLE [dbo].[Property_ins] DROP CONSTRAINT [PK__Property__3213E83FB2B5DC1E]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[Reminder]'
GO
ALTER TABLE [dbo].[Reminder] DROP CONSTRAINT [PK__Reminder__3213E83F564ED827]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[User_]'
GO
ALTER TABLE [dbo].[User_] DROP CONSTRAINT [UQ__User___B43B145FC36F2A57]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping constraints from [dbo].[User_]'
GO
ALTER TABLE [dbo].[User_] DROP CONSTRAINT [PK__User___3213E83F85127A50]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping [dbo].[Fire_Insurance]'
GO
DROP TABLE [dbo].[Fire_Insurance]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Dropping [dbo].[Earthquake_Insurance]'
GO
DROP TABLE [dbo].[Earthquake_Insurance]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Inqury]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Inqury].[userID]', N'inq_type', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Inqury__3213E83F2BC34E6B] on [dbo].[Inqury]'
GO
ALTER TABLE [dbo].[Inqury] ADD CONSTRAINT [PK__Inqury__3213E83F2BC34E6B] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Rebuilding [dbo].[Buy]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_Buy]
(
[id] [int] NOT NULL,
[user_id] [int] NULL,
[ins_id] [int] NULL,
[inq_id] [int] NULL,
[final_price] [bigint] NOT NULL,
[discount_code] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO [dbo].[RG_Recovery_1_Buy]([id], [user_id], [ins_id], [inq_id], [discount_code]) SELECT [buy_id], [userid], [ins_id], [inq_id], [discount_code] FROM [dbo].[Buy]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TABLE [dbo].[Buy]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_Buy]', N'Buy', N'OBJECT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Buy__3213E83F93D61296] on [dbo].[Buy]'
GO
ALTER TABLE [dbo].[Buy] ADD CONSTRAINT [PK__Buy__3213E83F93D61296] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Insurance]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Insurance] ADD
[discount] [tinyint] NULL CONSTRAINT [DF__Insurance__disco__5535A963] DEFAULT ((0))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Insurance] DROP
COLUMN [ins_name],
COLUMN [company]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Insurance].[in_id]', N'id', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Insurance].[inqid]', N'ins_type', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Insurance].[userid]', N'company_id', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Insurance] ALTER COLUMN [price] [bigint] NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Insuranc__3213E83F63556F13] on [dbo].[Insurance]'
GO
ALTER TABLE [dbo].[Insurance] ADD CONSTRAINT [PK__Insuranc__3213E83F63556F13] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[User_]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[User_] ADD
[is_logged_in] [bit] NULL CONSTRAINT [DF__User___is_logged__1A14E395] DEFAULT ((1))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[User_] DROP
COLUMN [isLogedIn]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[User_] ALTER COLUMN [phone] [nvarchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[User_] ALTER COLUMN [code] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[User_] ALTER COLUMN [fname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[User_] ALTER COLUMN [lname] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[User_] ALTER COLUMN [invatation] [tinyint] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[User_]'
GO
ALTER TABLE [dbo].[User_] ADD CONSTRAINT [DF__User___invatatio__1920BF5C] DEFAULT ((10)) FOR [invatation]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__User___3213E83FC8E6DC90] on [dbo].[User_]'
GO
ALTER TABLE [dbo].[User_] ADD CONSTRAINT [PK__User___3213E83FC8E6DC90] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[User_]'
GO
ALTER TABLE [dbo].[User_] ADD CONSTRAINT [UQ__User___B43B145F30231A4B] UNIQUE NONCLUSTERED ([phone])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[User_]'
GO
ALTER TABLE [dbo].[User_] ADD CONSTRAINT [UQ__User___357D4CF999B00C55] UNIQUE NONCLUSTERED ([code])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Province]'
GO
CREATE TABLE [dbo].[Province]
(
[id] [int] NOT NULL,
[name] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Province__3213E83F80D3CEA4] on [dbo].[Province]'
GO
ALTER TABLE [dbo].[Province] ADD CONSTRAINT [PK__Province__3213E83F80D3CEA4] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[City]'
GO
CREATE TABLE [dbo].[City]
(
[id] [int] NOT NULL,
[name] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[province_id] [int] NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__City__3213E83F986803AD] on [dbo].[City]'
GO
ALTER TABLE [dbo].[City] ADD CONSTRAINT [PK__City__3213E83F986803AD] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Rebuilding [dbo].[Health_inq]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_Health_inq]
(
[id] [int] NOT NULL,
[inq_id] [int] NULL,
[is_family] [bit] NULL,
[count_of_memeber] [tinyint] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO [dbo].[RG_Recovery_2_Health_inq]([id], [inq_id], [is_family]) SELECT [id], [inqid], CAST([is_family] AS [bit]) FROM [dbo].[health_inq]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TABLE [dbo].[health_inq]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_Health_inq]', N'Health_inq', N'OBJECT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Health_i__3213E83F05111303] on [dbo].[Health_inq]'
GO
ALTER TABLE [dbo].[Health_inq] ADD CONSTRAINT [PK__Health_i__3213E83F05111303] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Health_insurance]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Health_insurance] ADD
[ins_service] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Health_insurance] DROP
COLUMN [in_service],
COLUMN [hinq_id]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Health_insurance].[in_id]', N'ins_id', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Health_insurance] ALTER COLUMN [child_birth] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Health_insurance] ALTER COLUMN [chronic_disease] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Health_insurance] ALTER COLUMN [share_of_costs] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Health_insurance]'
GO
ALTER TABLE [dbo].[Health_insurance] ADD CONSTRAINT [DF__Health_in__child__5CD6CB2B] DEFAULT ((9)) FOR [child_birth]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Health_insurance] ADD CONSTRAINT [DF__Health_in__chron__5DCAEF64] DEFAULT ((3)) FOR [chronic_disease]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Health_insurance] ADD CONSTRAINT [DF__Health_in__share__5EBF139D] DEFAULT ((10)) FOR [share_of_costs]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Health_i__3213E83F9E61F7BC] on [dbo].[Health_insurance]'
GO
ALTER TABLE [dbo].[Health_insurance] ADD CONSTRAINT [PK__Health_i__3213E83F9E61F7BC] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Type]'
GO
CREATE TABLE [dbo].[Type]
(
[id] [int] NOT NULL,
[type] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Type__3213E83FA1A49D07] on [dbo].[Type]'
GO
ALTER TABLE [dbo].[Type] ADD CONSTRAINT [PK__Type__3213E83FA1A49D07] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Company]'
GO
CREATE TABLE [dbo].[Company]
(
[id] [int] NOT NULL,
[name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Company__3213E83F2E11633F] on [dbo].[Company]'
GO
ALTER TABLE [dbo].[Company] ADD CONSTRAINT [PK__Company__3213E83F2E11633F] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Rebuilding [dbo].[Life_inq]'
GO
CREATE TABLE [dbo].[RG_Recovery_3_Life_inq]
(
[id] [int] NOT NULL,
[inq_id] [int] NULL,
[birth_date] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[contract_period] [tinyint] NOT NULL CONSTRAINT [DF__Life_inq__contra__276EDEB3] DEFAULT ((5)),
[payment_way] [tinyint] NOT NULL,
[monthly_payment] [bigint] NOT NULL,
[premiums_increase] [tinyint] NULL CONSTRAINT [DF__Life_inq__premiu__2B3F6F97] DEFAULT ((25)),
[capital_increase] [tinyint] NULL CONSTRAINT [DF__Life_inq__capita__2D27B809] DEFAULT ((10)),
[death_coefficient] [tinyint] NULL CONSTRAINT [DF__Life_inq__death___2F10007B] DEFAULT ((20))
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO [dbo].[RG_Recovery_3_Life_inq]([id], [inq_id], [payment_way], [premiums_increase], [capital_increase], [death_coefficient]) SELECT [id], [inqid], CAST([payment_way] AS [tinyint]), CAST([premiums_increase] AS [tinyint]), CAST([capital_increase] AS [tinyint]), CAST([death_coefficient] AS [tinyint]) FROM [dbo].[Life_inq]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TABLE [dbo].[Life_inq]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[RG_Recovery_3_Life_inq]', N'Life_inq', N'OBJECT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Life_inq__3213E83FDD3F42AB] on [dbo].[Life_inq]'
GO
ALTER TABLE [dbo].[Life_inq] ADD CONSTRAINT [PK__Life_inq__3213E83FDD3F42AB] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Life_insurance]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Life_insurance].[in_id]', N'ins_id', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Life_insurance] ALTER COLUMN [redemption_value] [bigint] NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Life_insurance] ALTER COLUMN [death_capital] [bigint] NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Life_insurance] ALTER COLUMN [medical_expences] [bigint] NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Life_ins__3213E83FD9EF478D] on [dbo].[Life_insurance]'
GO
ALTER TABLE [dbo].[Life_insurance] ADD CONSTRAINT [PK__Life_ins__3213E83FD9EF478D] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[AgeRange]'
GO
CREATE TABLE [dbo].[AgeRange]
(
[id] [int] NOT NULL,
[range] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__AgeRange__3213E83F4F0959A8] on [dbo].[AgeRange]'
GO
ALTER TABLE [dbo].[AgeRange] ADD CONSTRAINT [PK__AgeRange__3213E83F4F0959A8] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Member]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Member] ADD
[head_id] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Member] DROP
COLUMN [base_in],
COLUMN [head]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Member].[in_id]', N'health_inq_id', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Member].[mem_id]', N'base_ins', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Member] ALTER COLUMN [age_range] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Member] ALTER COLUMN [relation] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Member__3213E83F5CA36421] on [dbo].[Member]'
GO
ALTER TABLE [dbo].[Member] ADD CONSTRAINT [PK__Member__3213E83F5CA36421] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[BaseIns]'
GO
CREATE TABLE [dbo].[BaseIns]
(
[id] [int] NOT NULL,
[insurance] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__BaseIns__3213E83F3952A2B7] on [dbo].[BaseIns]'
GO
ALTER TABLE [dbo].[BaseIns] ADD CONSTRAINT [PK__BaseIns__3213E83F3952A2B7] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[Relation]'
GO
CREATE TABLE [dbo].[Relation]
(
[id] [int] NOT NULL,
[relation] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Relation__3213E83F3BBBA959] on [dbo].[Relation]'
GO
ALTER TABLE [dbo].[Relation] ADD CONSTRAINT [PK__Relation__3213E83F3BBBA959] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[BuildingMaterial]'
GO
CREATE TABLE [dbo].[BuildingMaterial]
(
[id] [int] NOT NULL,
[material] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Building__3213E83FD3ED289A] on [dbo].[BuildingMaterial]'
GO
ALTER TABLE [dbo].[BuildingMaterial] ADD CONSTRAINT [PK__Building__3213E83FD3ED289A] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Rebuilding [dbo].[Property_inq]'
GO
CREATE TABLE [dbo].[RG_Recovery_4_Property_inq]
(
[id] [int] NOT NULL,
[inq_id] [int] NULL,
[province_id] [int] NULL,
[city_id] [int] NULL,
[structure_type] [int] NULL,
[uinit_count] [int] NULL CONSTRAINT [DF__Property___uinit__4AB81AF0] DEFAULT ((1)),
[building_material] [int] NULL,
[life_building] [tinyint] NOT NULL,
[meterage] [int] NOT NULL,
[cost_per_meter] [tinyint] NOT NULL,
[appliance_price] [bigint] NOT NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
INSERT INTO [dbo].[RG_Recovery_4_Property_inq]([id], [inq_id], [province_id], [city_id], [structure_type], [uinit_count], [building_material], [meterage], [cost_per_meter], [appliance_price]) SELECT [id], [in_id], [inqid], [userid], [structure_type], [uinit#], [life_bulding], [meterage], [cost_per_meter], [appliance_price] FROM [dbo].[Property_inq]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
DROP TABLE [dbo].[Property_inq]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[RG_Recovery_4_Property_inq]', N'Property_inq', N'OBJECT'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Property__3213E83F1AA18F54] on [dbo].[Property_inq]'
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [PK__Property__3213E83F1AA18F54] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Property_ins]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Property_ins].[in_id]', N'ins_id', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_ins] ALTER COLUMN [rating] [decimal] (2, 1) NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_ins] ALTER COLUMN [ability] [tinyint] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_ins] ALTER COLUMN [satisfaction] [decimal] (2, 1) NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_ins] ALTER COLUMN [branch] [int] NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Property__3213E83FBC680348] on [dbo].[Property_ins]'
GO
ALTER TABLE [dbo].[Property_ins] ADD CONSTRAINT [PK__Property__3213E83FBC680348] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating [dbo].[StructureType]'
GO
CREATE TABLE [dbo].[StructureType]
(
[id] [int] NOT NULL,
[type] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Structur__3213E83F0948DC33] on [dbo].[StructureType]'
GO
ALTER TABLE [dbo].[StructureType] ADD CONSTRAINT [PK__Structur__3213E83F0948DC33] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Altering [dbo].[Reminder]'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Reminder] ADD
[city_id] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Reminder] DROP
COLUMN [location_provience],
COLUMN [location_city]
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Reminder].[Rem#]', N'user_id', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
EXEC sp_rename N'[dbo].[Reminder].[userID]', N'province_id', N'COLUMN'
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Reminder] ALTER COLUMN [ins_type] [int] NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Reminder] ALTER COLUMN [due_date] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Reminder] ALTER COLUMN [ins_period] [tinyint] NOT NULL
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Creating primary key [PK__Reminder__3213E83F47C3BBA0] on [dbo].[Reminder]'
GO
ALTER TABLE [dbo].[Reminder] ADD CONSTRAINT [PK__Reminder__3213E83F47C3BBA0] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Health_inq]'
GO
ALTER TABLE [dbo].[Health_inq] ADD CONSTRAINT [CK__Health_in__count__33D4B598] CHECK (((1)<=[count_of_memeber] AND [count_of_memeber]<=(10)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Health_insurance]'
GO
ALTER TABLE [dbo].[Health_insurance] ADD CONSTRAINT [CK__Health_in__share__5FB337D6] CHECK (((0)<=[share_of_costs] AND [share_of_costs]<=(100)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Insurance]'
GO
ALTER TABLE [dbo].[Insurance] ADD CONSTRAINT [CK__Insurance__disco__5629CD9C] CHECK (((0)<=[discount] AND [discount]<=(100)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Life_inq]'
GO
ALTER TABLE [dbo].[Life_inq] ADD CONSTRAINT [CK__Life_inq__contra__286302EC] CHECK (((5)<=[contract_period] AND [contract_period]<=(30)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Life_inq] ADD CONSTRAINT [CK__Life_inq__paymen__29572725] CHECK (([payment_way]=(12) OR [payment_way]=(6) OR [payment_way]=(3)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Life_inq] ADD CONSTRAINT [CK__Life_inq__monthl__2A4B4B5E] CHECK (([monthly_payment]>=(50000)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Life_inq] ADD CONSTRAINT [CK__Life_inq__premiu__2C3393D0] CHECK (((0)<=[premiums_increase] AND [premiums_increase]<=(25)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Life_inq] ADD CONSTRAINT [CK__Life_inq__capita__2E1BDC42] CHECK (((0)<=[capital_increase] AND [capital_increase]<=(20)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Life_inq] ADD CONSTRAINT [CK__Life_inq__death___300424B4] CHECK (((3)<=[death_coefficient] AND [death_coefficient]<=(25)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Property_inq]'
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [CK__Property___uinit__4BAC3F29] CHECK (([uinit_count]>=(1)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [CK__Property___life___4D94879B] CHECK (((0)<=[life_building] AND [life_building]<=(35)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [CK__Property___cost___4E88ABD4] CHECK (((0)<=[cost_per_meter] AND [cost_per_meter]<=(10)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Property_ins]'
GO
ALTER TABLE [dbo].[Property_ins] ADD CONSTRAINT [CK__Property___ratin__6383C8BA] CHECK (((0.0)<=[rating] AND [rating]<=(5.0)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_ins] ADD CONSTRAINT [CK__Property___abili__6477ECF3] CHECK (((0)<=[ability] AND [ability]<=(5)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
ALTER TABLE [dbo].[Property_ins] ADD CONSTRAINT [CK__Property___satis__656C112C] CHECK (((0.0)<=[satisfaction] AND [satisfaction]<=(5.0)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding constraints to [dbo].[Reminder]'
GO
ALTER TABLE [dbo].[Reminder] ADD CONSTRAINT [CK__Reminder__ins_pe__1ED998B2] CHECK (([ins_period]=(12) OR [ins_period]=(6) OR [ins_period]=(3) OR [ins_period]=(1) OR [ins_period]=(0)))
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Buy]'
GO
ALTER TABLE [dbo].[Buy] ADD CONSTRAINT [FK__Buy__inq_id__6A30C649] FOREIGN KEY ([inq_id]) REFERENCES [dbo].[Inqury] ([id])
GO
ALTER TABLE [dbo].[Buy] ADD CONSTRAINT [FK__Buy__ins_id__693CA210] FOREIGN KEY ([ins_id]) REFERENCES [dbo].[Insurance] ([id])
GO
ALTER TABLE [dbo].[Buy] ADD CONSTRAINT [FK__Buy__user_id__68487DD7] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User_] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[City]'
GO
ALTER TABLE [dbo].[City] ADD CONSTRAINT [FK__City__province_i__1273C1CD] FOREIGN KEY ([province_id]) REFERENCES [dbo].[Province] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Health_inq]'
GO
ALTER TABLE [dbo].[Health_inq] ADD CONSTRAINT [FK__Health_in__inq_i__32E0915F] FOREIGN KEY ([inq_id]) REFERENCES [dbo].[Inqury] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Health_insurance]'
GO
ALTER TABLE [dbo].[Health_insurance] ADD CONSTRAINT [FK__Health_in__ins_i__5BE2A6F2] FOREIGN KEY ([ins_id]) REFERENCES [dbo].[Insurance] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Inqury]'
GO
ALTER TABLE [dbo].[Inqury] ADD CONSTRAINT [FK__Inqury__inq_type__239E4DCF] FOREIGN KEY ([inq_type]) REFERENCES [dbo].[Type] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Insurance]'
GO
ALTER TABLE [dbo].[Insurance] ADD CONSTRAINT [FK__Insurance__compa__5441852A] FOREIGN KEY ([company_id]) REFERENCES [dbo].[Company] ([id])
GO
ALTER TABLE [dbo].[Insurance] ADD CONSTRAINT [FK__Insurance__ins_t__534D60F1] FOREIGN KEY ([ins_type]) REFERENCES [dbo].[Type] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Life_inq]'
GO
ALTER TABLE [dbo].[Life_inq] ADD CONSTRAINT [FK__Life_inq__inq_id__267ABA7A] FOREIGN KEY ([inq_id]) REFERENCES [dbo].[Inqury] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Life_insurance]'
GO
ALTER TABLE [dbo].[Life_insurance] ADD CONSTRAINT [FK__Life_insu__ins_i__59063A47] FOREIGN KEY ([ins_id]) REFERENCES [dbo].[Insurance] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Member]'
GO
ALTER TABLE [dbo].[Member] ADD CONSTRAINT [FK__Member__age_rang__3E52440B] FOREIGN KEY ([age_range]) REFERENCES [dbo].[AgeRange] ([id])
GO
ALTER TABLE [dbo].[Member] ADD CONSTRAINT [FK__Member__base_ins__3D5E1FD2] FOREIGN KEY ([base_ins]) REFERENCES [dbo].[BaseIns] ([id])
GO
ALTER TABLE [dbo].[Member] ADD CONSTRAINT [FK__Member__health_i__3C69FB99] FOREIGN KEY ([health_inq_id]) REFERENCES [dbo].[Health_inq] ([id])
GO
ALTER TABLE [dbo].[Member] ADD CONSTRAINT [FK__Member__head_id__3F466844] FOREIGN KEY ([head_id]) REFERENCES [dbo].[Member] ([id])
GO
ALTER TABLE [dbo].[Member] ADD CONSTRAINT [FK__Member__relation__403A8C7D] FOREIGN KEY ([relation]) REFERENCES [dbo].[Relation] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Property_inq]'
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [FK__Property___build__4CA06362] FOREIGN KEY ([building_material]) REFERENCES [dbo].[BuildingMaterial] ([id])
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [FK__Property___city___48CFD27E] FOREIGN KEY ([city_id]) REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [FK__Property___inq_i__46E78A0C] FOREIGN KEY ([inq_id]) REFERENCES [dbo].[Inqury] ([id])
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [FK__Property___provi__47DBAE45] FOREIGN KEY ([province_id]) REFERENCES [dbo].[Province] ([id])
GO
ALTER TABLE [dbo].[Property_inq] ADD CONSTRAINT [FK__Property___struc__49C3F6B7] FOREIGN KEY ([structure_type]) REFERENCES [dbo].[StructureType] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Property_ins]'
GO
ALTER TABLE [dbo].[Property_ins] ADD CONSTRAINT [FK__Property___ins_i__628FA481] FOREIGN KEY ([ins_id]) REFERENCES [dbo].[Insurance] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
PRINT N'Adding foreign keys to [dbo].[Reminder]'
GO
ALTER TABLE [dbo].[Reminder] ADD CONSTRAINT [FK__Reminder__city_i__20C1E124] FOREIGN KEY ([city_id]) REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[Reminder] ADD CONSTRAINT [FK__Reminder__provin__1FCDBCEB] FOREIGN KEY ([province_id]) REFERENCES [dbo].[Province] ([id])
GO
ALTER TABLE [dbo].[Reminder] ADD CONSTRAINT [FK__Reminder__ins_ty__1DE57479] FOREIGN KEY ([ins_type]) REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[Reminder] ADD CONSTRAINT [FK__Reminder__user_i__1CF15040] FOREIGN KEY ([user_id]) REFERENCES [dbo].[User_] ([id])
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
COMMIT TRANSACTION
GO
IF @@ERROR <> 0 SET NOEXEC ON
GO
-- This statement writes to the SQL Server Log so SQL Monitor can show this deployment.
IF HAS_PERMS_BY_NAME(N'sys.xp_logevent', N'OBJECT', N'EXECUTE') = 1
BEGIN
    DECLARE @databaseName AS nvarchar(2048), @eventMessage AS nvarchar(2048)
    SET @databaseName = REPLACE(REPLACE(DB_NAME(), N'\', N'\\'), N'"', N'\"')
    SET @eventMessage = N'Redgate SQL Compare: { "deployment": { "description": "Redgate SQL Compare deployed to ' + @databaseName + N'", "database": "' + @databaseName + N'" }}'
    EXECUTE sys.xp_logevent 55000, @eventMessage
END
GO
DECLARE @Success AS BIT
SET @Success = 1
SET NOEXEC OFF
IF (@Success = 1) PRINT 'The database update succeeded'
ELSE BEGIN
	IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
	PRINT 'The database update failed'
END
GO
