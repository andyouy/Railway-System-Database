-- script name: insert.sql
-- Author:	Andy Ouyang
-- Purpose:	Inserts  sample data to test the integrity of RailwaySystemDB
USE RailwaySystemDB;

-- Company table inserts
INSERT INTO Company (company_name) VALUES ("NA Railway");
INSERT INTO Company (company_name) VALUES ("CA Railway");
INSERT INTO Company (company_name) VALUES ("Eastern Railway");

-- Station table inserts
INSERT INTO Station (station_name) VALUES ("South Station");
INSERT INTO Station (station_name) VALUES ("North Station");
INSERT INTO Station (station_name) VALUES ("East Station");

-- Train table inserts
INSERT INTO Train (company) VALUES ((SELECT company_id From Company WHERE company_id = 1));
INSERT INTO Train (company) VALUES ((SELECT company_id From Company WHERE company_id = 2)); 
INSERT INTO Train (company) VALUES ((SELECT company_id From Company WHERE company_id = 3)); 

-- Seats table inserts
-- inserts are done by a trigger when train's are inserted

-- FirstClassSeatInsert
INSERT INTO FirstClassSeat (first_seat_number, seat) VALUES ("1A", (SELECT seat_id from Seats WHERE seat_id = 1));
INSERT INTO FirstClassSeat (first_seat_number, seat) VALUES ("1B", (SELECT seat_id from Seats WHERE seat_id = 2));
INSERT INTO FirstClassSeat (first_seat_number, seat) VALUES ("1C", (SELECT seat_id from Seats WHERE seat_id = 3));

-- CoachClassSeat
INSERT INTO CoachClassSeat (coach_seat_number, seat) VALUES ("2A", (SELECT seat_id from Seats WHERE seat_id = 1));
INSERT INTO CoachClassSeat (coach_seat_number, seat) VALUES ("2B", (SELECT seat_id from Seats WHERE seat_id = 2));
INSERT INTO CoachClassSeat (coach_seat_number, seat) VALUES ("2C", (SELECT seat_id from Seats WHERE seat_id = 3));

-- Employee table inserts
INSERT INTO Employee (first_name, last_name, company) VALUES ("Bob", "Lee", (SELECT company_id From Company WHERE company_id = 1));
INSERT INTO Employee (first_name, last_name,company) VALUES ("Sam", "Miller", (SELECT company_id From Company WHERE company_id = 3));
INSERT INTO Employee (first_name, last_name, company) VALUES ("John", "Creed", (SELECT company_id From Company WHERE company_id = 1));
INSERT INTO Employee (first_name, last_name, company) VALUES ("Brad", "Hartley", (SELECT company_id From Company WHERE company_id = 2));
INSERT INTO Employee (first_name, last_name,company) VALUES ("Caludia", "Muir", (SELECT company_id From Company WHERE company_id = 2));
INSERT INTO Employee (first_name, last_name, company) VALUES ("Chelsey", "Webb", (SELECT company_id From Company WHERE company_id = 2));
INSERT INTO Employee (first_name, last_name, company) VALUES ("Kenon", "Vinson", (SELECT company_id From Company WHERE company_id = 1));
INSERT INTO Employee (first_name, last_name,company) VALUES ("Oriana", "Ellis", (SELECT company_id From Company WHERE company_id = 1));
INSERT INTO Employee (first_name, last_name, company) VALUES ("Alex", "Davies", (SELECT company_id From Company WHERE company_id = 1));

-- RailwayPolice table inserts
INSERT INTO RailwayPolice (employee_id, station_id) VALUES (
		(SELECT employee_id FROM Employee WHERE employee_id = 1), (SELECT station_id from Station WHERE station_id = 1));
INSERT INTO RailwayPolice (employee_id, station_id) VALUES (
		(SELECT employee_id FROM Employee WHERE employee_id = 2), (SELECT station_id from Station WHERE station_id = 2));
INSERT INTO RailwayPolice (employee_id, station_id) VALUES (
		(SELECT employee_id FROM Employee WHERE employee_id = 4), (SELECT station_id from Station WHERE station_id = 3));

-- StationManager table inserts
INSERT INTO StationManager(employee_id, station) VALUES(
		(SELECT employee_id FROM Employee WHERE employee_id = 3), (SELECT station_id from Station WHERE station_id = 1));
INSERT INTO StationManager(employee_id, station) VALUES(
		(SELECT employee_id FROM Employee WHERE employee_id = 5), (SELECT station_id from Station WHERE station_id = 3));
INSERT INTO StationManager(employee_id, station) VALUES(
		(SELECT employee_id FROM Employee WHERE employee_id = 6), (SELECT station_id from Station WHERE station_id = 2));

-- Conductor table inserts
INSERT INTO Conductor(employee_id, train_id) VALUES(
		(SELECT employee_id FROM Employee WHERE employee_id = 7), (SELECT train_id FROM Train WHERE train_id = 1));
INSERT INTO Conductor(employee_id, train_id) VALUES(
		(SELECT employee_id FROM Employee WHERE employee_id = 8), (SELECT train_id FROM Train WHERE train_id = 2));
INSERT INTO Conductor(employee_id, train_id) VALUES(
		(SELECT employee_id FROM Employee WHERE employee_id = 9), (SELECT train_id FROM Train WHERE train_id = 3));
        
-- Email table inserts
INSERT INTO Email (email) VALUES ("customer3@gmail.com");
INSERT INTO Email (email) VALUES ("customer54@gmail.com");
INSERT INTO Email (email) VALUES ("customer76@gmail.com");

-- Customer table inserts
INSERT INTO Customer (last_name, first_name, dob, email) VALUES ("Turner", "Andy", '1996-02-05', (SELECT email_id FROM Email WHERE email_id = 1));
INSERT INTO Customer (last_name, first_name, dob, email) VALUES ("Gale", "Leen", '1999-01-25', (SELECT email_id FROM Email WHERE email_id = 2));
INSERT INTO Customer (last_name, first_name, dob, email) VALUES ("Burners", "Aminah", '1995-08-15', (SELECT email_id FROM Email WHERE email_id = 3));

-- Route table inserts
INSERT INTO Route (arrival_time, departure_time, departure_station, arrival_station) VALUES ('2021-05-21 11:35:09', '2021-05-21 06:35:09', "South Station", "North Station");
INSERT INTO Route (arrival_time, departure_time, departure_station, arrival_station) VALUES ('2021-03-21 11:35:09', '2021-03-21 04:35:09', "South Station", "North Station");
INSERT INTO Route (arrival_time, departure_time, departure_station, arrival_station) VALUES ('2021-03-20 06:35:09', '2021-03-19 04:35:09', "East Station", "North Station");

-- Ticket table inserts
INSERT INTO Ticket (price, train, route, customer, company) VALUES ('154.23', 
	(SELECT train_id FROM Train WHERE train_id = 1), 
    (SELECT route_id FROM Route WHERE route_id = 1),
    (SELECT customer_id FROM Customer WHERE customer_id = 1),
    (SELECT company_id FROM Company WHERE company_id = 1));
INSERT INTO Ticket (price, train, route, customer, company) VALUES ('200.27', 
	(SELECT train_id FROM Train WHERE train_id = 2), 
    (SELECT route_id FROM Route WHERE route_id = 2),
    (SELECT customer_id FROM Customer WHERE customer_id = 2),
    (SELECT company_id FROM Company WHERE company_id = 2));
INSERT INTO Ticket (price, train, route, customer, company) VALUES ('210.27', 
	(SELECT train_id FROM Train WHERE train_id = 1), 
    (SELECT route_id FROM Route WHERE route_id = 1),
    (SELECT customer_id FROM Customer WHERE customer_id = 3),
    (SELECT company_id FROM Company WHERE company_id = 1));

-- CoachClassTicket table inserts
INSERT INTO CoachClassTicket (coach_class_ticket_id, ticket, coach_class_seat_num) VALUES
	("1", (SELECT ticket_id FROM Ticket WHERE ticket_id = 1), "2A");
INSERT INTO CoachClassTicket (coach_class_ticket_id, ticket, coach_class_seat_num) VALUES
	("2", (SELECT ticket_id FROM Ticket WHERE ticket_id = 2), "2B");
INSERT INTO CoachClassTicket (coach_class_ticket_id, ticket, coach_class_seat_num) VALUES
	("3", (SELECT ticket_id FROM Ticket WHERE ticket_id = 3), "2C");    

-- FirstClassTicket
INSERT INTO FirstClassTicket (first_class_ticket_id, ticket, first_class_seat_num) VALUES
	("1", (SELECT ticket_id FROM Ticket WHERE ticket_id = 1), "1A");
INSERT INTO FirstClassTicket (first_class_ticket_id, ticket, first_class_seat_num) VALUES
	("2", (SELECT ticket_id FROM Ticket WHERE ticket_id = 2), "1B");
INSERT INTO FirstClassTicket (first_class_ticket_id, ticket, first_class_seat_num) VALUES
	("3", (SELECT ticket_id FROM Ticket WHERE ticket_id = 3), "1C");
    
-- Passenger table inserts
INSERT INTO Passenger (customer_id, train, ticket) VALUES (
    (SELECT customer_id FROM Customer WHERE customer_id = 1),
    (SELECT train_id FROM Train WHERE train_id = 1),
    (SELECT ticket_id FROM Ticket WHERE ticket_id = 1));
INSERT INTO Passenger (customer_id, train, ticket) VALUES (
    (SELECT customer_id FROM Customer WHERE customer_id = 2),
    (SELECT train_id FROM Train WHERE train_id = 2),
    (SELECT ticket_id FROM Ticket WHERE ticket_id = 2));
INSERT INTO Passenger (customer_id, train, ticket) VALUES (
    (SELECT customer_id FROM Customer WHERE customer_id = 3),
    (SELECT train_id FROM Train WHERE train_id = 1),
    (SELECT ticket_id FROM Ticket WHERE ticket_id = 3));

-- Account table inserts
INSERT INTO Accounts (passwords, customer, email, ticket) VALUES ("testpassword",
	(SELECT customer_id FROM Customer WHERE customer_id = 1),
    (SELECT email_id FROM Email WHERE email_id = 1),
    (SELECT ticket_id FROM Ticket WHERE ticket_id = 1));
INSERT INTO Accounts (passwords, customer, email, ticket) VALUES ("secondpassword",
	(SELECT customer_id FROM Customer WHERE customer_id = 2),
    (SELECT email_id FROM Email WHERE email_id = 2),
    (SELECT ticket_id FROM Ticket WHERE ticket_id = 2)); 
INSERT INTO Accounts (passwords, customer, email, ticket) VALUES ("213215435",
	(SELECT customer_id FROM Customer WHERE customer_id = 3),
    (SELECT email_id FROM Email WHERE email_id = 3),
    (SELECT ticket_id FROM Ticket WHERE ticket_id = 3));
    
-- EasyTripsApp table inserts
INSERT INTO EasyTripsApp (accounts) VALUES ((SELECT account_id FROM Accounts WHERE account_id = 1));
INSERT INTO EasyTripsApp (accounts) VALUES ((SELECT account_id FROM Accounts WHERE account_id = 2));
INSERT INTO EasyTripsApp (accounts) VALUES ((SELECT account_id FROM Accounts WHERE account_id = 3));

-- Smartphone table inserts
INSERT INTO Smartphone (app) VALUES ((SELECT app_id FROM EasyTripsApp WHERE app_id = 1));
INSERT INTO Smartphone (app) VALUES ((SELECT app_id FROM EasyTripsApp WHERE app_id = 2));
INSERT INTO Smartphone (app) VALUES ((SELECT app_id FROM EasyTripsApp WHERE app_id = 3));

-- CustomerSmartphone
INSERT INTO CustomerSmartphone (smartphone, customer) VALUES (
	(SELECT smartphone_id FROM Smartphone WHERE smartphone_id = 1),
	(SELECT customer_id FROM CustomER WHERE customer_id = 1));
INSERT INTO CustomerSmartphone (smartphone, customer) VALUES (
	(SELECT smartphone_id FROM Smartphone WHERE smartphone_id = 2),
	(SELECT customer_id FROM CustomER WHERE customer_id = 2));
INSERT INTO CustomerSmartphone (smartphone, customer) VALUES (
	(SELECT smartphone_id FROM Smartphone WHERE smartphone_id = 3),
	(SELECT customer_id FROM CustomER WHERE customer_id = 3));

-- BillingAddress table inserts
INSERT INTO BillingAddress (street, zipcode, city, state, country, house_number) VALUES ("25th Street", "94122", "San Francisco", "California", "US", "251");
INSERT INTO BillingAddress (street, zipcode, city, state, country, house_number) VALUES ("40th Street", "94116", "San Francisco", "California", "US", "2467");
INSERT INTO BillingAddress (street, zipcode, city, state, country, house_number) VALUES ("6th Street", "94116", "San Francisco", "California", "US", "1523");

-- PaymentType table inserts
INSERT INTO PaymentType (dates, billing_address) VALUES ("2021-05-21 06:35:09", (SELECT billing_id FROM BillingAddress WHERE billing_id = 1));
INSERT INTO PaymentType (dates, billing_address) VALUES ("2021-06-05 16:32:00", (SELECT billing_id FROM BillingAddress WHERE billing_id = 2));
INSERT INTO PaymentType (dates, billing_address) VALUES ("2021-07-30 02:35:34", (SELECT billing_id FROM BillingAddress WHERE billing_id = 1));

-- CreditCard table inserts
INSERT INTO CreditCard (card_number, cvv, expiration_date, payment_type) VALUES (
	"4476150253930051", "431", "2024-03-09", (SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 1));
INSERT INTO CreditCard (card_number, cvv, expiration_date, payment_type) VALUES (
	"4539458395248992", '584', '2024-08-25', (SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 2));
    INSERT INTO CreditCard (card_number, cvv, expiration_date, payment_type) VALUES (
	"4929276655217103", '409', '2025-03-01', (SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 2));
    
-- DebitCard table inserts
INSERT INTO DebitCard (debit_card_number, debit_cvv, debit_expiration_date, payment_type) VALUES (
	"4797977423759628", '314', '2023-01-26', (SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 1));
INSERT INTO DebitCard (debit_card_number, debit_cvv, debit_expiration_date, payment_type) VALUES (
	"4191665178928678", '971', '2023-11-27', (SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 1));
INSERT INTO DebitCard (debit_card_number, debit_cvv, debit_expiration_date, payment_type) VALUES (
	"4260124912921561", '438', '2022-05-17', (SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 1));
    
-- CustomerPayment table inserts
INSERT INTO CustomerPayment (payment_id, customer_id) VALUES (
	(SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 1),
    (SELECT customer_id FROM Customer WHERE customer_id = 1));
INSERT INTO CustomerPayment (payment_id, customer_id) VALUES (
	(SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 2),
    (SELECT customer_id FROM Customer WHERE customer_id = 2));
INSERT INTO CustomerPayment (payment_id, customer_id) VALUES (
	(SELECT payment_type_id FROM PaymentType WHERE payment_type_id = 3),
    (SELECT customer_id FROM Customer WHERE customer_id = 3));



-- SELECT routeDeparture("South Station");

/*
CALL availableSeats(1, @seat);
SELECT @seat as FreeSeats;

##INSERT INTO Seats (seat_id,train,seat_capacity) VALUES (1,(SELECT train_id FROM Train WHERE train_id = 1), 100);
##INSERT INTO Seats (seat_id,train,seat_capacity) VALUES (2,(SELECT train_id FROM Train WHERE train_id = 2), 100);

/*
INSERT INTO Ticket (company, price,train) VALUES ((SELECT company_id FROM Company WHERE company_id = 1), 153.00, (SELECT train_id FROM Train WHERE train_id = 1));
INSERT INTO Ticket (company, price,train) VALUES ((SELECT company_id FROM Company WHERE company_id = 1), 153.00, (SELECT train_id FROM Train WHERE train_id = 1));

CALL availableSeats(1, @seat);
SELECT @seat as FreeSeats;

SELECT * FROM Train;
SELECT * FROM Ticket;
SELECT * FROM Seats;
SELECT * FROM FirstClassSeat;
SELECT * FROM Customer;
SELECT * FROM Passenger;
*/