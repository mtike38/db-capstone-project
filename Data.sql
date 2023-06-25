USE LittleLemonDB;

INSERT INTO `littlelemondb`.`menuitems` (`MenuItemsID`, `CourseName`, `StarterName`, `DesertName`)
VALUES 
('1', 'Bean soup', 'Flatbread', 'Ice cream'),
('2', 'Greek salad', 'Hummus', 'Greek yoghurt'),
('3', 'Pizza', 'Olives', 'Cheesecake'),
('4', 'Shwarma', 'Tomato bread', 'Baklava'),
('5', 'Kabasa', 'Falafel', 'Turkish yoghurt');


INSERT INTO `littlelemondb`.`menus` (`MenuID`, `MenuItemsID`, `MenuName`, `Cuisine`)
VALUES
('1', '1', 'Maharage', 'Italian'),
('2', '1', 'Kongoro', 'Turkish'),
('3', '2', 'Kabichi', 'Greek'),
('4', '2', 'Tembele', 'Italian'),
('5', '3', 'Chapati', 'Greek'),
('6', '3', 'Sambusa', 'Italian'),
('7', '4', 'Mbuzi', 'Italian'),
('8', '4', 'Kondoo', 'Turkish'),
('9', '5', 'Wali', 'Greek'),
('10', '5', 'Pilau', 'Italian');


INSERT INTO `littlelemondb`.`customers` (`CustomerID`, `FullName`, `ContactNumber`, `Email`)
VALUES
(1, 'Laney Fadden',	'0673187755', 'Laney.Fadden@gmail.com'),
(2, 'Giacopo Bramich', '0778198833', 'Giacopo.Bramich@gmail.com'),
(3,	'Lia Bonar', '0719202223', 'Lia.Bonar@gmail.com'),
(4,	'Merrill Baudon',	'0623456781', 'Merrill.Baudon@gmail.com'),
(5,	'Tasia Fautly', '0654989807', 'Tasia.Fautly@gmail.com'),
(6,	'Angel Veschambre', '0659878760', 'Angel.Veschambre@gmail.com'),
(7,	'Sheilah Maestro', '0731262588', 'Sheilah.Maestro@gmail.com'),
(8,	'Audie Willcocks', '0756890971', 'Audie.Willcocks@gmail.com'),
(9,	'Mart Malsher',	'0745678060', 'Mart.Malsher@gmail.com'),
(10, 'Magdalen Lacheze', '0789011418', 'Magdalen.Lacheze@gmail.com');


INSERT INTO `littlelemondb`.`orders` (`OrderID`, `OrderDate`, `MenuID`, `Quantity`, `TotalCost`, `CustomerID`)
VALUES
(1,	'2022-01-15', 5, 2, 187.5, 10),
(2, '2022-01-25', 3, 1, 352.5, 2),
(3, '2022-02-14', 3, 3, 112.5, 3),
(4, '2022-02-17', 2, 3, 330, 10),
(6, '2022-03-01', 9, 1, 315, 8),
(7, '2022-03-04', 7, 2, 465, 10),
(8, '2022-04-09', 7, 3, 337.5, 2),
(9, '2022-04-27', 6, 2, 285, 5),
(10, '2022-05-05', 6, 1, 147, 6),
(11, '2022-05-20', 2, 3, 252.40 ,3),
(12, '2022-06-26', 2, 3, 152.4, 4),
(13, '2022-07-03', 2, 2, 139.7, 2),
(14, '2022-08-13', 1, 1, 66.8, 7),
(15, '2022-08-22', 10, 2, 137.76, 1),
(16,'2022-09-30', 5, 3, 199.75, 10),
(17, '2022-10-04', 7, 2, 78.12, 5),
(18, '2022-10-29', 10, 1, 125.985, 3),
(19, '2022-11-14', 4, 3, 104.07, 9),
(20, '2022-11-24', 9, 3, 179.7, 6),
(21, '2022-12-30', 6, 2, 187.5, 4),
(22, '2023-02-08', 4, 1, 352.5, 8),
(23, '2023-03-01', 2, 2, 112.5, 2),
(24, '2023-03-03', 1, 3, 330, 1),
(25, '2023-04-02', 10, 2, 480, 5),
(26, '2023-04-13', 2, 1, 315, 9),
(27, '2023-05-17', 4, 3, 465, 7),
(28, '2023-05-22', 6, 3, 337.5, 10),
(29, '2023-06-09', 1 ,2, 285, 3),
(30, '2023-06-12', 1, 1, 147, 4);

