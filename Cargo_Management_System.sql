-- CREATING THE DATABASE

CREATE DATABASE cargo_management_system;

-- USING THE DATABASE
USE Cargo_Management_System;

-- DEFINING THE TABLES

CREATE TABLE CARGO(
	Cargo_ID varchar(20) not null,
	Sender varchar(20) not null,
	Descrip varchar(150),
	Cost double not null,
	Receiver varchar(20) not null,
	Weight double,
	Dep_date date,
	Arv_date date,
	primary key(Cargo_ID)
);
 
CREATE TABLE CUSTOMER(
	Customer_ID varchar(20) not null,
	Customer_Name varchar(20) not null,
	Street varchar(50) not null,
	City varchar(50) not null,
	Country varchar(20) not null,
	Mail varchar(50),
	Contact_no varchar(10) not null,
	primary key(Customer_ID)
);

CREATE TABLE EMPLOYEE(
	Empl_ID varchar(20) not null,
	NIC varchar(15) not null,
	Empl_name varchar(25) not null,
	Occupation varchar(25),
	Mail varchar(30),
	Contact_no varchar(10) not null,
	primary key(Empl_ID)
);
 
 CREATE TABLE SHIPPER(
	 Shipper_ID varchar(20) not null,
	 Shipper_name varchar(20) not null,
	 Mail varchar(30),
	 Contact_no varchar(10) not null,
	 primary key(Shipper_ID)
 );
 
CREATE TABLE PAYMENT(
	Payment_ID varchar(20) not null,
	Pay_amount double not null,
	Payment_method varchar(15),
	Payment_date date,
	primary key(Payment_ID)
);
 
CREATE TABLE CARRIER(
	Carrier_ID varchar(10) not null,
	Carrier_name varchar(50) not null,
	Email varchar(50),
	primary key(Carrier_ID)
);

CREATE TABLE CARRIER_TELEPHONE(
	Carrier_ID varchar(10) not null,
	Phone_type varchar(20) not null,
	Contact_No varchar(10),
    primary key(Carrier_ID, Phone_type),
	constraint fk_carrier_contact foreign key (Carrier_ID) references CARRIER(Carrier_ID)
);

CREATE TABLE WAREHOUSE(
	Warehouse_ID varchar(10) not null,
	Location varchar(50) not null,
	Capacity double,
	Email varchar(50),
	Contact_no varchar(10) not null,
	primary key (Warehouse_ID)
);
 
CREATE TABLE ROUTE(
	Route_ID varchar(30) not null,
	Start_loc varchar(50) not null,
	End_loc varchar(50) not null,
	primary key (Route_ID)
);

CREATE TABLE INSURANCE_INFO(
	Cargo_ID varchar(20) not null,
	Policy_no varchar(20) not null,
	Cover_amount double ,
	Issued_date date,
	Expire_date date not null,
	constraint fk_insurance_id foreign key (Cargo_ID) REFERENCES cargo(Cargo_ID),
	primary key (Policy_no,Cargo_ID)
);

CREATE TABLE TRACKING_INFO(
	Cargo_ID varchar(20) not null,
	Tracking_no varchar(15) not null,
	Location varchar(50),
	Status_update varchar(20) not null,
	constraint fk_tracking_id foreign key (Cargo_ID) REFERENCES cargo(Cargo_ID),
	primary key(Tracking_no, Cargo_ID)
);

CREATE TABLE CARGO_DETAILS(
    Cargo_ID varchar(20) not null,
    Descrip varchar(150),
    Sender varchar(20) not null,
    Receiver varchar(20) not null,
    Dep_date date,
    Arv_date date,
    primary key(Cargo_ID)
);

CREATE TABLE CARGO_WEIGHT(
    Cargo_ID varchar(20) not null,
    Descrip varchar(150),
    Weight double,
    primary key(Cargo_ID, Descrip),
    constraint fk_cargo_weight foreign key (Cargo_ID) references Cargo_Details(Cargo_ID)
);

CREATE TABLE CARGO_COST(
    Cargo_ID varchar(20) not null,
    Weight double,
    Cost double,
    primary key(Cargo_ID, Weight),
    constraint fk_cargo_cost foreign key (Cargo_ID) references Cargo_Details(Cargo_ID)
);

-- Foreign Key Constraints 

ALTER TABLE insurance_info DROP FOREIGN KEY fk_insurance_id;
ALTER TABLE insurance_info
ADD CONSTRAINT fk_insurance_id FOREIGN KEY (Cargo_ID) REFERENCES cargo_details(Cargo_ID);
ALTER TABLE tracking_info DROP FOREIGN KEY fk_tracking_id;
ALTER TABLE tracking_info
ADD CONSTRAINT fk_tracking_id FOREIGN KEY (Cargo_ID) REFERENCES cargo_details(Cargo_ID);
drop table cargo;

-- POPULATING THE DATABASE WITH INSERT OPERATION

INSERT INTO CUSTOMER VALUES
('Cus001', 'John Doe', '123 Main St', 'Anytown', 'USA', 'john.doe@gmail.com', '1234567890'),
('Cus002', 'Alice Johnson', '456 Elm St', 'Otherville', 'Canada', 'alice.johnson@gmail.com', '2345678901'),
('Cus003', 'Emily Wang', '789 Maple St', 'Smalltown', 'England', 'emily.wang@yahoo.com', '3456789012'),
('Cus004', 'David Lee', '101 Oak St', 'Bigcity', 'USA', 'david.lee@gmail.com', '4567890123'),
('Cus005', 'Emily Davis', '111 Pine St', 'Metropolis', 'Australia', 'Emily.davis@yahoo.com', '5678901234'),
('Cus006', 'Michael Brown', '222 Cedar St', 'Megatown', 'Netherland', 'michael.brown@gmail.com', '6789012345');

INSERT INTO EMPLOYEE VALUES
('Emp001', '1234567890123', 'Emma Johnson', 'Manager', 'emma.johnson@yahoo.com', '1243576890'),
('Emp002', '2345678901234', 'Michael Smith', 'Salesperson', 'michael.smith@gmail.com', '6723458901'),
('Emp003', '3456789012345', 'Jennifer Lee', 'Accountant', 'jennifer.lee@gmail.com', '9013456782'),
('Emp004', '4567890123456', 'William Davis', 'Supervisor', 'william.davis@gmail.com', '8945612703'),
('Emp005', '5678901234567', 'Jessica Wilson', 'Assistant', 'jessica.wilson@gmail.com', '5623478901'),
('Emp006', '6789012345678', 'David Brown', 'Clerk', 'david.brown@yahoo.com', '6907845123');

INSERT INTO SHIPPER VALUES
('S001', 'ABC Electronics', 'sales@abcelectronics.com', '1234467870'),
('S002', 'XYZ Furniture', 'info@xyzfurniture.com', '1634567901'),
('S003', 'Global Apparel', 'contact@globalapparel.com', '3416780012'),
('S004', 'Best Books', 'support@bestbooks.com', '4557890143'),
('S005', 'FoodMart', 'orders@foodmart.com', '5676601254'),
('S006', 'Green Grocer', 'info@greengrocer.com', '6769012645');

INSERT INTO PAYMENT VALUES
('P001', 150.00, 'Credit Card', '2024-03-01'),
('P002', 200.00, 'PayPal', '2024-02-15'),
('P003', 180.00, 'Cash', '2024-03-24'),
('P004', 250.00, 'Bank Transfer', '2024-03-01'),
('P005', 175.00, 'Credit Card', '2024-01-30'),
('P006', 220.00, 'PayPal', '2024-02-06');

INSERT INTO CARRIER VALUES
('Crr001', 'FastFleet Logistics', 'info@fastfleetlogistics.com'),
('Crr002', 'QuickShip Express', 'support@quickshipexpress.com'),
('Crr003', 'SwiftCargo Solutions', 'contact@swiftcargosolutions.com'),
('Crr004', 'RapidTransit Shipping', 'sales@rapidtransitshipping.com'),
('Crr005', 'SpeedyFreight Services', 'customerservice@speedyfreightservices.com'),
('Crr006', 'ExpressHaul Logistics', 'info@expresshaullogistics.com');

INSERT INTO WAREHOUSE VALUES
('W001', 'Warehouse A, Industrial Area', 5000, 'warehouseA@gamil.com', '3234667890'),
('W002', 'Warehouse B, Business Park', 7000, 'warehouseB@yahoo.com', '1345678901'),
('W003', 'Warehouse C, Logistics Center', 10000, 'warehouseC@yahoo.com', '2256789012'),
('W004', 'Warehouse D, Port Area', 8000, 'warehouseD@yahoo.com', '4556789013'),
('W005', 'Warehouse E, Suburban Area', 6000, 'warehouseE@gmail.com', '5678991224'),
('W006', 'Warehouse F, Downtown', 9000, 'warehouseF@gmail.com', '6788812349');

INSERT INTO ROUTE VALUES
('R001', 'Warehouse A, Industrial Area', 'Warehouse B, Business Park'),
('R002', 'Warehouse B, Business Park', 'Warehouse C, Logistics Center'),
('R003', 'Warehouse C, Logistics Center', 'Warehouse D, Port Area'),
('R004', 'Warehouse D, Port Area', 'Warehouse E, Suburban Area'),
('R005', 'Warehouse E, Suburban Area', 'Warehouse F, Downtown'),
('R006', 'Warehouse F, Downtown', 'Warehouse A, Industrial Area');

INSERT INTO CARGO_DETAILS VALUES
('C001', 'Electronics', 'John Doe', 'Jane Smith', '2024-03-02', '2024-03-07'),
('C002', 'Books', 'Alice Johnson', 'Bob Brown', '2024-02-16', '2024-02-21'),
('C003', 'Clothing', 'Emily Wang', 'Michael Jones', '2024-03-25', '2024-03-30'),
('C004', 'Furniture', 'David Lee', 'Sarah Clark', '2024-03-02', '2024-03-07'),
('C005', 'Appliances', 'Karen Davis', 'Chris Wilson', '2024-01-31', '2024-02-05'),
('C006', 'Toys', 'Michael Brown', 'Jessica Taylor', '2024-02-07', '2024-02-12');

INSERT INTO CARGO_WEIGHT VALUES
('C001', 'Electronics', 20.5),
('C002', 'Books', 15.2),
('C003', 'Clothing', 30.8),
('C004', 'Furniture', 50.3),
('C005', 'Appliances', 45.9),
('C006', 'Toys', 25.6);

INSERT INTO CARGO_COST VALUES
('C001', 20.5, 500.00),
('C002', 15.2, 300.00),
('C003', 30.8, 700.00),
('C004', 50.3, 1000.00),
('C005', 45.9, 800.00),
('C006', 25.6, 400.00);

INSERT INTO INSURANCE_INFO VALUES
('C001', 'POL874523', 5000.00, '2024-03-02', '2024-06-02'),
('C002', 'POL235689', 7000.00, '2024-02-16', '2024-05-16'),
('C003', 'POL761094', 6000.00, '2024-03-25', '2024-06-25'),
('C004', 'POL458723', 8000.00, '2024-03-02', '2024-06-02'),
('C005', 'POL901234', 9000.00, '2024-01-31', '2024-05-01'),
('C006', 'POL567890', 10000.00, '2024-02-07', '2024-05-07');

INSERT INTO TRACKING_INFO VALUES
('C001', 'TRK320987', 'Warehouse A, Industrial Area', 'In transit'),
('C002', 'TRK987654', 'Warehouse B, Business Park', 'In transit'),
('C003', 'TRK223456', 'Warehouse C, Logistics Center', 'In transit'),
('C004', 'TRK456789', 'Warehouse D, Port Area', 'In transit'),
('C005', 'TRK287654', 'Warehouse E, Suburban Area', 'Delivered'),
('C006', 'TRK654321', 'Warehouse F, Downtown', 'In transit');

INSERT INTO CARRIER_TELEPHONE VALUES
('Crr001', 'Landline', '9984815936'),
('Crr001', 'Primary Mobile', '3346541835'),  
('Crr001', 'Secondary Mobile', NULL),  
('Crr002', 'Landline', '1021375521'),  
('Crr002', 'Primary Mobile', NULL),  
('Crr002', 'Secondary Mobile', '7740203368'), 
('Crr003', 'Landline', NULL),  
('Crr003', 'Primary Mobile', '2002458483'), 
('Crr003', 'Secondary Mobile', '6719362371'), 
('Crr004', 'Landline', NULL), 
('Crr004', 'Primary Mobile', '2395007920'), 
('Crr004', 'Secondary Mobile', '7471773960'),  
('Crr005', 'Landline', '1128952421'),  
('Crr005', 'Primary Mobile', '5553791856'), 
('Crr005', 'Secondary Mobile', NULL),  
('Crr006', 'Landline', '8831132846'),  
('Crr006', 'Primary Mobile', NULL),
('Crr006', 'Secondary Mobile', NULL);

-- UPDATING AND DELETING ROWS

UPDATE CUSTOMER set City = 'New Jersey' where Customer_ID = 'Cus001';
UPDATE CUSTOMER set Customer_Name = 'David Ayer', City = 'Utah', Mail = 'david.ayer@gmail.com' where Customer_ID = 'Cus004';
DELETE FROM CUSTOMER where Customer_ID = 'Cus001';

UPDATE EMPLOYEE set Empl_name = 'Emma Watson', Mail = 'emma.watson@yahoo.com' where Empl_ID = 'Emp001';
UPDATE EMPLOYEE set NIC = '2345678901541', Empl_name = 'Michael Scott', Occupation = 'Accountant', Mail = 'michael.scott@gmail.com', 
Contact_no = '6723458331' where Empl_ID = 'Emp002';
DELETE FROM EMPLOYEE where Empl_ID = 'Emp003';

UPDATE SHIPPER set Shipper_name = 'A2Z Furniture', Mail = 'info@a2zfurniture.com' where Shipper_ID = 'S002';
UPDATE SHIPPER set Shipper_name = 'Book Haven', Mail = 'support@bookhaven.com', Contact_no = '4589057143' where Shipper_ID = 'S004';
DELETE FROM SHIPPER where Shipper_ID = 'S005';

UPDATE PAYMENT set Payment_method = 'Bank Transfer' where Payment_ID = 'P001';
UPDATE PAYMENT set Pay_amount = 170.00, Payment_date = '2024-01-31' where Payment_ID = 'P005';
DELETE FROM PAYMENT where Payment_ID = 'P003';

UPDATE CARRIER set Carrier_name = 'Quick Express' where Carrier_ID = 'Crr002';
UPDATE CARRIER set Carrier_name = 'Fast Logistics', Email = 'info@fastlogistics.com' where Carrier_ID = 'Crr001';
DELETE FROM CARRIER_TELEPHONE where Carrier_ID = 'Crr005';
DELETE FROM CARRIER where Carrier_ID = 'Crr005';

UPDATE WAREHOUSE set Location = 'Warehouse A, Industrial District' where Warehouse_ID = 'W001';
UPDATE WAREHOUSE set Location = 'Warehouse B, Business Area', Capacity = 7500, Email = 'warehouse.B@yahoo.com'
where Warehouse_ID = 'W002';
DELETE FROM WAREHOUSE where Warehouse_ID = 'W006';

UPDATE ROUTE set Start_loc = 'Warehouse A, Industrial District', End_loc = 'Warehouse B, Business Area' where Route_ID = 'R001';
UPDATE ROUTE set Start_loc = 'Warehouse B, Business Area' where Route_ID = 'R002';
DELETE FROM ROUTE where Route_ID = 'R006';

UPDATE INSURANCE_INFO set Cover_amount = 7500 where Cargo_ID = 'C004';
UPDATE INSURANCE_INFO set Cover_amount = 8500, Issued_date = '2024-02-01', Expire_date = '2024-02-06' where Cargo_ID = 'C005';
DELETE FROM INSURANCE_INFO where Cargo_ID = 'C001';

UPDATE TRACKING_INFO set Status_update = 'Delivered' where Cargo_ID = 'C002';
UPDATE TRACKING_INFO set Location = 'Warehouse C, Logistics Center' where Cargo_ID = 'C006';
DELETE FROM TRACKING_INFO where Cargo_ID = 'C001';

UPDATE CARGO_DETAILS set Descrip = 'Fashion', Sender = 'David Ayer' where Cargo_ID = 'C004';
UPDATE CARGO_DETAILS set Descrip = 'Accessories', Sender = 'Emily Davis', Receiver = 'Chris Evans' where Cargo_ID = 'C005';
UPDATE CARGO_WEIGHT set Descrip = 'Fashion', Weight = 10.5 where Cargo_ID = 'C004';
UPDATE CARGO_WEIGHT set Descrip = 'Accessories', Weight = 40.8 where Cargo_ID = 'C005';
UPDATE CARGO_COST set Weight = 10.5, Cost = 200.00 where Cargo_ID = 'C004';
UPDATE CARGO_COST set Weight = 40.8, Cost = 750.00 where Cargo_ID = 'C005';
DELETE FROM CARGO_COST where Cargo_ID = 'C001';
DELETE FROM CARGO_WEIGHT where Cargo_ID = 'C001';
DELETE FROM CARGO_DETAILS where Cargo_ID = 'C001';

-- SIMPLE QUERIES

-- Select Operation
SELECT * from CUSTOMER; 

-- Project Operation
SELECT Empl_ID, Empl_name, Mail, Occupation, Contact_no FROM EMPLOYEE; 

-- Cartesian Product Operation
SELECT * from CARGO_DETAILS cross join CARGO_WEIGHT; 

-- Creating a User View
CREATE VIEW UV1 as SELECT Cr.Carrier_ID, Cr.Carrier_name from CARRIER as Cr natural join CARRIER_TELEPHONE as Ct 
where Ct.Phone_type = 'Landline' and Contact_No is not null; 
SELECT * from UV1;

-- Renaming Operation
SELECT C.Cargo_ID as CARGO_ID, C.Descrip as CARGO_DESCRIPTION from CARGO_DETAILS as C; 

-- Use of an Aggregation Function
SELECT Cargo_ID as Max_weight_ID, count(Cargo_ID) as Cargo_count, max(Weight) as Max_weight from CARGO_WEIGHT 
group by Cargo_ID order by Max_weight desc limit 1;

-- Use of LIKE Keyword
SELECT Customer_ID, Customer_name, Country, Mail, Contact_no from CUSTOMER where 
((Customer_name like 'Emily%') and (Mail like '%yahoo%')); 

-- COMPLEX QUERIES

-- Union Operation
SELECT C1.Cargo_ID, C1.Descrip from CARGO_DETAILS as C1 natural join CARGO_COST as Co where Co.Cost > 300
UNION
SELECT C2.Cargo_ID, C2.Descrip from CARGO_DETAILS as C2 natural join CARGO_WEIGHT as Cw where Cw.Weight > 30;

-- Intersection operation
SELECT distinct C1.Cargo_ID, C1.Descrip from CARGO_DETAILS as C1 inner join CARGO_COST as Co on C1.Cargo_ID = Co.Cargo_ID 
where Co.Cost > 300 and C1.Cargo_ID in 
(SELECT distinct C2.Cargo_ID from CARGO_DETAILS as C2 inner join CARGO_WEIGHT as Cw on C2.Cargo_ID = Cw.Cargo_ID where Cw.Weight < 40);

-- Set Difference Operation
SELECT E1.Empl_ID, E1.Empl_name, E1.Occupation, E1.Mail from EMPLOYEE as E1 where E1.Mail like '%gmail%' 
and E1.Empl_ID not in (SELECT E2.Empl_ID from EMPLOYEE as E2 where E2.Occupation = 'Assistant');

UPDATE CARRIER_TELEPHONE set Contact_no = '3418435635' where Carrier_ID = 'Crr001' and Phone_type = 'Secondary Mobile';
UPDATE CARRIER_TELEPHONE set Contact_no = '2793950020' where Carrier_ID = 'Crr004' and Phone_type = 'Landline';
UPDATE TRACKING_INFO set Status_update = 'Delivered' where Cargo_ID = 'C006';

-- Division Operation
SELECT distinct T1.Location from (SELECT distinct Location from TRACKING_INFO where Status_update = 'In transit') as T1
join (SELECT distinct Location from TRACKING_INFO where Status_update = 'Delivered') as T2 on T1.Location = T2.Location;
 
-- Inner Join
CREATE VIEW CustomerCargoView as SELECT Cg.Cargo_ID, Cg.Descrip, Cg.Sender, Cg.Receiver, C.Contact_no as Sender_no from CUSTOMER as C
inner join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender;
SELECT * from CustomerCargoView;

-- Natural Join 
CREATE VIEW CargoDetailsCostView as SELECT Cg.Cargo_ID, Cg.Descrip, Cg.Sender, Cg.Receiver, Co.Cost from CARGO_DETAILS as Cg 
natural join CARGO_COST as Co;
SELECT * from CargoDetailsCostView;

UPDATE CARGO_DETAILS set Sender = 'Mark Ruffalo' where Cargo_ID = 'C004';
UPDATE CARGO_DETAILS set Sender = 'Peter Parker' where Cargo_ID = 'C006';

-- Left Outer Join 
CREATE VIEW CustomerCargoLeft as SELECT C.Customer_ID, C.Customer_Name, C.Country, Cg.Cargo_ID, Cg.Descrip, Cg.Sender 
from CUSTOMER as C left join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender;
SELECT * from CustomerCargoLeft;

-- Right Outer Join
CREATE VIEW CustomerCargoRight as SELECT C.Customer_ID, C.Customer_Name, C.Country, Cg.Cargo_ID, Cg.Descrip, Cg.Sender 
from CUSTOMER as C right join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender;
SELECT * from CustomerCargoRight;

-- Full Outer Join 
CREATE VIEW CustomerCargoFull as SELECT C.Customer_ID, C.Customer_Name, C.Country, Cg.Cargo_ID, Cg.Descrip, Cg.Sender 
from CUSTOMER as C left join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender
UNION
SELECT C.Customer_ID, C.Customer_Name, C.Country, Cg.Cargo_ID, Cg.Descrip, Cg.Sender 
from CUSTOMER as C right join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender;    
SELECT * from CustomerCargoFull;

-- Outer Union
CREATE VIEW  OuterUnion as SELECT C.Cargo_ID, C.Descrip, C.Sender, C.Receiver, C.Dep_date, C.Arv_date, Cw.Weight from CARGO_DETAILS as C
left join CARGO_WEIGHT as Cw on C.Cargo_ID = Cw.Cargo_ID
UNION
SELECT C.Cargo_ID, C.Descrip, C.Sender, C.Receiver, C.Dep_date, C.Arv_date, Cw.Weight from CARGO_WEIGHT as Cw
right join CARGO_DETAILS as C on Cw.Cargo_ID = C.Cargo_ID;
SELECT * from OuterUnion;

-- Nested Queries

-- Nested Query 1
SELECT * from (SELECT C.Cargo_ID, C.Descrip, C.Sender, C.Receiver, C.Dep_date, C.Arv_date, Cw.Weight from CARGO_DETAILS as C
left join CARGO_WEIGHT as Cw on C.Cargo_ID = Cw.Cargo_ID) as Query1;

-- Nested Query 2
SELECT * from (SELECT Cu.Customer_ID, Cu.Customer_name, Cu.Country, C.Cargo_ID, C.Descrip, C.Sender from CUSTOMER as Cu
right join CARGO_DETAILS as C on Cu.Customer_name = C.Sender) as Query2;

-- Nested Query 3
SELECT * from (SELECT C.Cargo_ID, C.Descrip, C.Sender, C.Receiver, P.Payment_ID, P.Pay_amount, P.Payment_method, P.Payment_date
from CARGO_DETAILS as C left join PAYMENT as P on C.Dep_date = P.Payment_date) as Query3;

-- DATABASE TUNING

-- Union Operation
EXPLAIN SELECT C1.Cargo_ID, C1.Descrip from CARGO_DETAILS as C1 natural join CARGO_COST as Co where Co.Cost > 300
UNION
SELECT C2.Cargo_ID, C2.Descrip from CARGO_DETAILS as C2 natural join CARGO_WEIGHT as Cw where Cw.Weight > 30;
CREATE INDEX Idx_Weight on CARGO_WEIGHT(Weight);
DROP INDEX Idx_Weight on CARGO_WEIGHT;

-- Division Operation
EXPLAIN SELECT distinct T1.Location from (SELECT distinct Location from TRACKING_INFO where Status_update = 'In transit') as T1
join (SELECT distinct Location from TRACKING_INFO where Status_update = 'Delivered') as T2 on T1.Location = T2.Location;
CREATE INDEX Idx_Status on TRACKING_INFO(Status_update);
DROP INDEX Idx_Status on TRACKING_INFO;

-- Inner Join
/* CREATE VIEW CustomerCargoView as SELECT Cg.Cargo_ID, Cg.Descrip, Cg.Sender, Cg.Receiver, C.Contact_no as Sender_no from CUSTOMER as C
inner join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender; */
EXPLAIN SELECT * from CustomerCargoView;
CREATE INDEX Idx_CusName on CUSTOMER(Customer_name);
DROP INDEX Idx_CusName on CUSTOMER;

-- Left Outer Join 
/* CREATE VIEW CustomerCargoLeft as SELECT C.Customer_ID, C.Customer_Name, C.Country, Cg.Cargo_ID, Cg.Descrip, Cg.Sender 
from CUSTOMER as C left join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender; */
EXPLAIN SELECT * from CustomerCargoLeft;
CREATE INDEX Idx_Sender on CARGO_DETAILS(Sender);
DROP INDEX Idx_Sender on CARGO_DETAILS;

-- Right Outer Join
/* CREATE VIEW CustomerCargoRight as SELECT C.Customer_ID, C.Customer_Name, C.Country, Cg.Cargo_ID, Cg.Descrip, Cg.Sender 
from CUSTOMER as C right join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender; */
EXPLAIN SELECT * from CustomerCargoRight;
CREATE INDEX Idx_CusName on CUSTOMER(Customer_name);
DROP INDEX Idx_CusName on CUSTOMER;

-- Full Outer Join 
/* CREATE VIEW CustomerCargoFull as SELECT C.Customer_ID, C.Customer_Name, C.Country, Cg.Cargo_ID, Cg.Descrip, Cg.Sender 
from CUSTOMER as C left join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender
UNION
SELECT C.Customer_ID, C.Customer_Name, C.Country, Cg.Cargo_ID, Cg.Descrip, Cg.Sender 
from CUSTOMER as C right join CARGO_DETAILS as Cg on C.Customer_Name = Cg.Sender; */ 
EXPLAIN SELECT * from CustomerCargoFull;
CREATE INDEX Idx_CusName on CUSTOMER(Customer_name);
CREATE INDEX Idx_Sender on CARGO_DETAILS(Sender);
CREATE INDEX Idx_CargoID on CARGO_DETAILS(Cargo_ID);
CREATE INDEX Idx_Desc on CARGO_DETAILS(Descrip);
DROP INDEX Idx_CusName on CUSTOMER;
DROP INDEX Idx_Sender on CARGO_DETAILS;
DROP INDEX Idx_CargoID on CARGO_DETAILS;
DROP INDEX Idx_Desc on CARGO_DETAILS;

-- Outer Union
/* CREATE VIEW  OuterUnion as SELECT C.Cargo_ID, C.Descrip, C.Sender, C.Receiver, C.Dep_date, C.Arv_date, Cw.Weight from CARGO_DETAILS as C
left join CARGO_WEIGHT as Cw on C.Cargo_ID = Cw.Cargo_ID
UNION
SELECT C.Cargo_ID, C.Descrip, C.Sender, C.Receiver, C.Dep_date, C.Arv_date, Cw.Weight from CARGO_WEIGHT as Cw
right join CARGO_DETAILS as C on Cw.Cargo_ID = C.Cargo_ID; */
EXPLAIN SELECT * from OuterUnion;
CREATE INDEX Idx_CargoID on CARGO_DETAILS(Cargo_ID);
CREATE INDEX Idx_Weight on CARGO_WEIGHT(Weight);
DROP INDEX Idx_CargoID on CARGO_DETAILS;
DROP INDEX Idx_Weight on CARGO_WEIGHT;

-- Nested Queries

-- Nested Query 1
EXPLAIN SELECT * from (SELECT C.Cargo_ID, C.Descrip, C.Sender, C.Receiver, C.Dep_date, C.Arv_date, Cw.Weight from CARGO_DETAILS as C
left join CARGO_WEIGHT as Cw on C.Cargo_ID = Cw.Cargo_ID) as Query1;
CREATE INDEX Idx_Weight on CARGO_WEIGHT(Weight);
DROP INDEX Idx_Weight on CARGO_WEIGHT;

-- Nested Query 2
EXPLAIN SELECT * from (SELECT Cu.Customer_ID, Cu.Customer_name, Cu.Country, C.Cargo_ID, C.Descrip, C.Sender from CUSTOMER as Cu
right join CARGO_DETAILS as C on Cu.Customer_name = C.Sender) as Query2;
CREATE INDEX Idx_CusName on CUSTOMER(Customer_name);
DROP INDEX Idx_CusName on CUSTOMER;

-- Nested Query 3
EXPLAIN SELECT * from (SELECT C.Cargo_ID, C.Descrip, C.Sender, C.Receiver, P.Payment_ID, P.Pay_amount, P.Payment_method, P.Payment_date
from CARGO_DETAILS as C left join PAYMENT as P on C.Dep_date = P.Payment_date) as Query3;
CREATE INDEX Idx_PayDate on PAYMENT(Payment_date);
DROP INDEX Idx_PayDate on PAYMENT;