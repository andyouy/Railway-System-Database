-- Script name: tests.sql
-- Author:      Andy Ouyang
-- Purpose:     test the integrity of this database system

USE RailwaySystemDB;

-- Testing Company table
DELETE FROM Company WHERE company_name = "NA Railway";
UPDATE Company SET company_id = 1 WHERE company_name = ("Eastern Railway");

-- Testing Station table
DELETE FROM Station WHERE station_name = "South Station";
UPDATE Station SET station_id = 1 WHERE station_name = ("East Station");


-- Testing Train table
DELETE FROM Train WHERE train_id = 1;
UPDATE Train SET train_id = 1 WHERE company = 2;


-- Testing Seats table
DELETE FROM Seats WHERE seat_id = 1;
UPDATE Seats SET seat_capacity = 200 WHERE seat_id = 2;

-- Testing FirstClassSeat table
DELETE FROM FirstClassSeat WHERE seat = 1;
UPDATE FirstClassSeat SET first_seat_number = '3A' WHERE seat = 2;

-- Testing CoachClassSeat table
DELETE FROM CoachClassSeat WHERE coach_seat_number = '2C';
UPDATE CoachClassSeat SET coach_seat_number = '2C' WHERE seat = 2;

-- Testing Employee table
DELETE FROM Employee WHERE first_name = "Bob";
UPDATE Employee SET last_name = "test" WHERE first_name = "Sam";

-- Testing RailwayPolice table
DELETE FROM RailwayPolice WHERE employee_id = 4;
UPDATE RailwayPolice SET station_id = 1 WHERE employee_id = 1;

-- Testing StationManger table
DELETE FROM StationManager WHERE employee_id = 2;
UPDATE StationManager SET station = 3 WHERE employee_id = 3;

-- Testing Conductor table
DELETE FROM Conductor WHERE employee_id = 3;
UPDATE Conductor SET train_id = 2 WHERE employee_id = 9;

-- Testing Email table
DELETE FROM Email WHERE email_id = 1;
UPDATE Email SET email = "dwadaddwa23@gmail.com" WHERE email_id = 2;

-- Testing Customer table
DELETE FROM Customer WHERE customer_id = 2;
UPDATE Customer SET dob = '1996-08-15' WHERE first_name = "Burners";

-- Testing Route table
DELETE FROM Route WHERE route_id = 1;
UPDATE Route SET arrival_time = "2021-03-20 09:35:09" WHERE route_id = 3;

-- Testing Ticket table
DELETE FROM Ticket WHERE train = 2;
UPDATE Ticket SET train = 3 WHERE train = 1;

-- Testing CoachClassTicket table
DELETE FROM CoachClassTicket WHERE ticket = 2;
UPDATE CoachClassTicket SET coach_class_seat_num = "4B" WHERE ticket = 3;

-- Testing FirstClassTicket table
DELETE FROM FirstClassTicket WHERE ticket = 1;
UPDATE CoachClassTicket SET coach_class_seat_num = "A5" WHERE ticket = 2;

-- Testing Passenger table
DELETE FROM Passenger WHERE ticket = 1;
UPDATE Passenger SET train = 1 WHERE train = 2;

-- Testing Accounts table
DELETE FROM Accounts WHERE customer = 1;
UPDATE Accounts SET passwords = "newpassword" WHERE customer = 2;

-- Testing EasyTripsApp table
DELETE FROM EasyTripsApp WHERE accounts = 1;
-- 1. Error in EasyTripsApp UPDATE 
-- query EasyTripsApp SET accounts = 2 WHERE app_id = 3;
-- Error: Cannot add or update a child row

-- Testint Smartphone table
DELETE FROM Smartphone WHERE app = 3;
-- 2. Erro in Smartphone 
-- query UPDATE Smartphone SET app = 2 WHERE smartphone_id = 1;
-- Error: Cannot add or update a child row

-- Test BillingAddress table
DELETE FROM BillingAddress WHERE billing_id = 1;
UPDATE BillingAddress SET street = "30th Street" WHERE billing_id = 3;

-- Test PaymentType table
DELETE FROM PaymentType WHERE payment_type_id = 2;
UPDATE PaymentType SET billing_address = 3 WHERE billing_address = 2;

-- Test CreditCard table
DELETE FROM CreditCard WHERE credit_card_id = 3;
UPDATE CreditCard SET cvv = "254" WHERE credit_card_id = 2;

-- Test DebitCard table
DELETE FROM DebitCard WHERE debit_card_id = 3;
UPDATE DebitCard SET debit_card_number = "6011251525430602" WHERE debit_card_id = 2;

-- Test CustomerPayment table
DELETE FROM CustomerPayment WHERE customer_id = 3;
UPDATE CustomerPayment SET payment_id = 1 WHERE customer_id = 2;


