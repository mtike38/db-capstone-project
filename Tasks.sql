USE LittleLemonDB;

# Task 1
-- Create a virtual table called "OrdersView"
CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;


#Task 2
-- Create a virtual table called "BestOrders"
CREATE VIEW BestOrders AS
SELECT Customers.CustomerID AS "CustomerID", Customers.FullName AS "Full Name",
Orders.OrderID AS "OrderID", Orders.TotalCost AS "Cost",
Menus.MenuName AS "Menu Name", MenuItems.CourseName AS "Course Name", MenuItems.StarterName AS "Starter Name"
FROM Customers INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
INNER JOIN Menus
ON Orders.MenuID = Menus.MenuID
INNER JOIN MenuItems
ON Menus.MenuItemsID = MenuItems.MenuItemsID
WHERE Orders.TotalCost > 150
ORDER BY Orders.TotalCost ASC;


# Task 3
-- Create a virtual table called "BestMenus"
CREATE VIEW BestMenus AS
SELECT MenuName
FROM Menus 
WHERE MenuID IN (SELECT MenuID FROM Orders WHERE Quantity > 2);

# Task 4
-- Create a procedure that displays the maximum ordered quantity in the Orders table
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(Quantity) AS 'Max Quantity in Order'
	FROM Orders;
END //
DELIMITER ;


# Task 5
-- Create a prepared statement called "GetOrderDetail"
PREPARE GetOrderDetail FROM
		'SELECT
			OrderID, Quantity, TotalCost
		FROM Orders
        WHERE CustomerID = ?';


# Task 6
--  Create a stored procedure called "CancelOrder"
DELIMITER //
CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
	SELECT CONCAT("Order ", OrderID, " is cancelled") AS "Confirmation"
	FROM Orders WHERE OrderID = order_id;
    
	DELETE FROM Orders WHERE OrderID = order_id;
END //
DELIMITER ;


# Task 7
-- Adding the list of records to the Little Lemon booking table

/* INSERT INTO `littlelemondb`.`bookings` (`BookingID`, `TableNo`, `BookingDate`, `CustomerID`)
VALUES 
('1', '5', '2022-10-10', '1'),
('2', '3', '2022-11-12', '3'),
('3', '2', '2022-10-11', '2'),
('4', '2', '2022-10-13', '1');
*/


# Task 8
-- Creating a stored procedure called "CheckBooking" to check whether a table in the restaurant is already booked.
DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_no INT)
BEGIN
SELECT
CASE 
    WHEN BookingDate = booking_date AND TableNo = table_no 
    THEN  CONCAT("Table", TableNo," is already booked")
    ELSE CONCAT("Table ", TableNo,"  is not booked")
END AS 'Booking Status'
FROM Bookings
WHERE TableNo = table_no;
END //
DELIMITER ;


# Task 9
-- Create a new procedure called "AddValidBooking"
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN customer_name VARCHAR(100), IN booking_date DATE, IN table_no INT)
BEGIN
START TRANSACTION;

-- Get the latest BookingID and CustomerID
SELECT @id:=MAX(BookingID)+1 FROM Bookings;
SELECT @customer_id:= CustomerID FROM Customers WHERE FullName = customer_name;

-- Insert a new booking for a customer
INSERT INTO bookings (`BookingID`, `TableNo`, `BookingDate`, `CustomerID`)
VALUES (@id, table_no, booking_date, @customer_id);

-- Count number of duplicates
SELECT @duplicate:= COUNT(BookingID) FROM Bookings 
WHERE BookingDate = booking_date AND TableNo = table_no;

IF @duplicate > 1
	THEN
    ROLLBACK;
    SELECT CONCAT("Table ", table_no, " is already booked - booking cancelled") AS "Booking Status";
ELSE
	COMMIT;
    SELECT "Booking done" AS "Booking Status";
END IF;

END //
DELIMITER ;

# Task 10
-- Create a new procedure called "AddBooking" to add a new table booking record.
DELIMITER //
CREATE PROCEDURE AddBooking(IN booking_id INT, IN customer_id INT, IN table_no INT, IN booking_date DATE)
BEGIN
INSERT INTO `littlelemondb`.`bookings` (`BookingID`, `TableNo`, `BookingDate`, `CustomerID`)
VALUES (booking_id, table_no, booking_date, customer_id);

SELECT "New booking added" AS "Confirmation";
END //
DELIMITER ;


# Task 11
-- Create a new procedure called "UpdateBooking" to update existing bookings in the booking table
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
UPDATE `littlelemondb`.`bookings` SET BookingDate = booking_date WHERE BookingID = booking_id;

SELECT CONCAT("Booking ", booking_id, " updated") AS "Confirmation";
END //
DELIMITER ;


# Task 12
-- Create a new procedure called "CancelBooking" to cancel or remove a booking
 DELIMITER //
 CREATE PROCEDURE CancelBooking(IN booking_id INT)
 BEGIN
 DELETE FROM `littlelemondb`.`bookings` WHERE BookingID = booking_id;
SELECT CONCAT("Booking ", booking_id, " cancelled") AS "Confirmation";
END //
DELIMITER ;

