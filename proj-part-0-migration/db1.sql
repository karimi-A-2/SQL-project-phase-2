create table User_(
	id int primary key,
	phone varchar(11) unique,
	code nvarchar(20),
	fname nvarchar(25),
	lname nvarchar(20),
	pass nvarchar(25),
	invatation int, 
	isLogedIn int
	--PRIMARY KEY (id)
	--FOREIGN KEY (person_id) REFERENCES Person (phone)
);
create table Reminder(
	id int,
	Rem# int,
	ins_type nvarchar(15),
	due_date nvarchar(10),
	ins_period nvarchar(15),
	ins_description nvarchar(100),
	location_provience nvarchar(20),
	location_city nvarchar(25),
	PRIMARY KEY (id),
	userID int FOREIGN KEY REFERENCES User_(id)
);
CREATE TABLE inqury(
	id INT PRIMARY KEY,
	userID int FOREIGN KEY REFERENCES User_(id),
	
);
CREATE TABLE Insurance(
	in_id int PRIMARY KEY,
    ins_name nvarchar(20),
	company nvarchar(15),
	price int,
	userid int FOREIGN KEY REFERENCES User_ (id),
	inqid int FOREIGN KEY REFERENCES inqury (id)
);

CREATE TABLE health_inq(
	id int PRIMARY KEY,
	is_family int,
	count_of_member int,
	inqid int FOREIGN KEY REFERENCES inqury (id)
);

CREATE TABLE Health_insurance(
	id int PRIMARY KEY,
	in_service nvarchar(15),
	child_birth nvarchar(20),
	chronic_disease nvarchar(25),
	share_of_costs nvarchar(15),
	-- is_family nvarchar(20),
	in_id int FOREIGN KEY REFERENCES Insurance (in_id),
	hinq_id int FOREIGN KEY REFERENCES health_inq (id),
);

CREATE TABLE Life_insurance(
	id INT PRIMARY KEY,
	redemption_value nvarchar(30),
	death_capital nvarchar(40),
	medical_expences int,
	in_id int FOREIGN KEY REFERENCES Insurance (in_id)	
);

CREATE TABLE Property_ins(
	id int PRIMARY KEY,
	rating nvarchar(10),
	ability nvarchar(15),
	satisfaction nvarchar(15),
	branch nvarchar(20),
	in_id int FOREIGN KEY REFERENCES Insurance (in_id)	
);

CREATE TABLE Earthquake_Insurance(
	id int PRIMARY KEY,
	in_id int FOREIGN KEY REFERENCES Property_ins (id),
);

CREATE TABLE Fire_Insurance(
	id int PRIMARY KEY,
	in_id int FOREIGN KEY REFERENCES Property_ins (id),	
);
-- member ye done az ins dare
CREATE TABLE Member(
	id int PRIMARY KEY,
	base_in nvarchar(30),
	age_range nvarchar(25),
	head nvarchar(20),
	relation nvarchar(15),
	in_id int FOREIGN KEY REFERENCES Insurance (in_id),
	mem_id INT FOREIGN KEY REFERENCES Member (id)
);
CREATE TABLE Life_inq(
	id INT PRIMARY KEY,
	birth_date_day int,
	birth_date_month int,
	birth_date_year int,
	duration int,
	payment_way int,
	monthly_pay int,
	premiums_increase int,
	capital_increase int,
	death_coefficient int,
	inqid int FOREIGN KEY REFERENCES inqury (id)
);

CREATE TABLE Property_inq(
	id int PRIMARY KEY,
	provience nvarchar(15),
	city nvarchar(15),
	structure_type NVARCHAR(10), --NOT NULL CHECK (building_type IN('brick', 'metalic', 'concrete')),
	uinit# int,
	building_type NVARCHAR(21), --NOT NULL CHECK (building_type IN('one unit in apartment', 'one vila building', 'apartment or mojtame')),
	life_bulding int,
	meterage int,
	cost_per_meter nvarchar(25),
	appliance_price nvarchar(20),
	in_id int,
	userid int FOREIGN KEY REFERENCES User_ (id),
	inqid int FOREIGN KEY REFERENCES inqury (id)
);

CREATE TABLE Buy(
	buy_id INT PRIMARY KEY,
	userid int FOREIGN KEY REFERENCES User_ (id),
	ins_id int FOREIGN KEY REFERENCES Insurance (in_id),
	inq_id int FOREIGN KEY REFERENCES inqury (id),
	discount_code int
);

