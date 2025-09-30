-- ================================================================
-- SQL Schema for Paper Bag Manufacturing Stock Management System
-- ================================================================
-- This script creates a database to manage stock, sales, and 
-- purchase orders for a paper bag manufacturing company. The system 
-- automatically updates stock levels when sales are made and triggers 
-- a purchase order for raw materials when stock is low.

-- =====================
-- Database Creation
-- =====================
-- The database `paperbag` is created to handle all the operations
-- related to stock, sales, and orders of the firm.


create database paperbag;
use paperbag;

-- =====================
-- Table: Models
-- =====================
-- This table stores information about different models of paper bags 
-- produced in the factory.
-- 
-- Columns:
-- - Model_ID: Unique identifier for each model.
-- - Guzzet: Whether the bag has a gusset.
-- - Handle: Whether the bag has a handle.
-- - Ink: Whether the bag has ink on it.
-- - Length_cm, Width_cm, Height_cm: Dimensions of the bag.
-- - Product_Quantity_per_pallet: Number of units per pallet.

create table Models(
Model_ID varchar(3),
Guzzet	varchar(3),
Handle varchar(3),
Ink varchar(3),
Length_cm int default 210,
Width_cm int,
Height_cm int default 380,
Product_Quantity_per_pallet int,
primary key (Model_ID));

-- Sample data for Models table.

insert into Models (Model_ID, Guzzet, Handle, Ink, Length_cm, Width_cm, Height_cm, Product_Quantity_per_pallet)
values
("D_1", "yes", "yes", "No", 210, 120, 380, 105000),
("D_2", "yes", "No", "yes", 210, 120, 380, 210000),
("D_3", "yes", "No", "No", 210, 120, 380, 105000),
("D_4", "No", "yes", "No", 210, 0, 380, 210000),
("D_5", "No", "No", "No", 210, 0, 380, 210000),
("D_6", "yes", "yes", "yes", 230, 120, 400,	210000),
("D_7", "yes", "yes", "yes", 230, 120, 400,	210000),
("D_8", "yes", "yes", "yes", 230, 120, 400, 210000);


-- =====================
-- Table: Goods_Stock
-- =====================
-- This table maintains records of all the goods and raw materials
-- present in the warehouse.
-- 
-- Columns:
-- - G_ID: Unique identifier for goods.
-- - Type: Type of material (e.g., paper, ink).
-- - Specification: Specific properties (e.g., gsm or color).
-- - Quantity: Current stock quantity.

create table Goods_Stock(
G_ID varchar(4) not null,
Type varchar(45),
Specifiction varchar(15),
Quantity int,
primary key (G_ID));

-- Sample data for Goods_Stock table.

insert into Goods_Stock (G_ID, Type, Specifiction, Quantity)
values
("G_1", "Brown Paper", "100gsm", 500),
("G_2", "White Paper", "100gsm", 200),
("G_3", "Transperant paper", "20gsm", 800),
("G_4", "Ink", "Green", 40),
("G_5", "Gum", "liquid", 30),
("G_9", "Ink", "Blue", 10),
("G_10", "Ink", "yellow", 40),
("G_11", "Pallets", "European", 100),
("G_12", "Carboard boxes", "280ccm", 1000),
("G_13", "Lables", "8x5cm", 800),
("G_14", "Pallets", "Chep", 200);

-- =====================
-- Table: Purchase_order
-- =====================
-- This table records the purchase orders for replenishing stock.
-- 
-- Columns:
-- - PO: Unique purchase order ID.
-- - G_ID: The ID of the good being purchased.
-- - Quantity: Quantity ordered.
-- - Status: Status of the order (e.g., 'Started', 'Completed').

create table Purchase_order(
PO varchar(45) not null,
G_ID varchar(4),
Type varchar(45),
Specifiction varchar(15),
Quantity varchar(4),
Status varchar(10),
constraint check_status check (Status = "Started" or Status = "Completed"),
primary key (PO));

-- Sample data for Purchase_order table.

insert into Purchase_order (PO,	G_ID, Type, Specifiction, Quantity, Status)
values
("PO_1", "G_1", "Brown Paper", "100gsm", 500, "Completed"),
("PO_2", "G_2", "White Paper", "100gsm", 200, "Completed"),
("PO_3", "G_3", "Transperant paper", "20gsm", 800, "Completed"),
("PO_4", "G_4", "Ink", "Green", 40, "Completed"),
("PO_5", "G_5", "Gum", "liquid", 30, "Completed"),
("PO_6", "G_9", "Ink", "Blue", 10, "Completed"),
("PO_7", "G_10", "Ink", "yellow", 40, "Completed"),
("PO_8", "G_11", "Pallets", "European", 100, "Completed"),
("PO_9", "G_12", "Carboard boxes", "280ccm", 1000, "Completed"),
("PO_10", "G_13", "Lables", "8x5cm", 800, "Completed"),
("PO_11", "G_14", "Pallets", "Chep", 200, "Completed"),
("PO_12", "G_12", "Carboard boxes", "280ccm", 500, "Started"),
("PO_13", "G_9", "Ink", "Blue", 5, "Started"),
("PO_14", "G_5", "Gum", "liquid", 10, "Started"),
("PO_15", "G_1", "Brown Paper",	"100gsm", 200, "Completed"),
("PO_16", "G_3", "Transperant paper", "20gsm", 500, "Completed"),
("PO_17", "G_13", "Lables", "8x5cm", 1000, "Completed"),
("PO_18", "G_8", "Ink", "Red", 30, "Started"),
("PO_19", "G_10", "Ink", "yellow", 20, "Started");

-- =====================
-- Table: pallet_info
-- =====================
-- This table contains the information about the goods required to produce
-- a pallet full of bags for each model. Each model of bag requires a specific 
-- combination of raw materials and quantities, and this table outlines that 
-- relationship for the production process.
--
-- Columns:
-- - SLNO: Serial number and unique identifier for each row.
-- - Model_ID: The ID of the paper bag model, which references the `Models` table.
-- - Goods: The goods or raw material required to produce one pallet of bags, referencing the `Goods_Stock` table.
-- - Goods_Quantity_per_pallet: The quantity of the specific good required to produce one pallet for that model.

 create table pallet_info (
 SLNO varchar(4) not null,
 Model_ID varchar(3),
 Goods varchar(4),
 Goods_Quantity_per_pallet int,
 primary key (SLNO),
 foreign key (Model_ID) references models(Model_ID),
 foreign key (Goods) references Goods_Stock(G_ID)
 );

-- Sample data for pallet_info table.

 insert into pallet_info (SLNO, Model_ID, Goods, Goods_Quantity_per_pallet)
 values
 ("P_1", "D_1", "G_1", 105),
 ("P_2", "D_1", "G_5", 1),
 ("P_3", "D_1", "G_12", 70),
 ("P_4", "D_1", "G_13", 70),
 ("P_5", "D_2", "G_2", 143),
 ("P_6", "D_2", "G_3", 25),
 ("P_7", "D_2", "G_5", 1),
 ("P_8", "D_2",	"G_12",	75),
 ("P_9", "D_2",	"G_13",	75),
 ("P_10", "D_2", "G_9",	5),
 ("P_11", "D_3", "G_1",	105),
 ("P_12", "D_3", "G_5", 1),
 ("P_13", "D_3", "G_12", 70),
 ("P_14", "D_3", "G_13", 70),
 ("P_15", "D_4", "G_2", 105),
 ("P_16", "D_4", "G_5", 105),
 ("P_17", "D_4", "G_12", 70),
 ("P_18", "D_4", "G_13", 70),
 ("P_19", "D_5", "G_1", 143),
 ("P_20", "D_5", "G_3", 25),
 ("P_21", "D_5", "G_5", 1),
 ("P_22", "D_5", "G_12", 75),
 ("P_23", "D_5", "G_13", 75);

-- =====================
-- Table: Sales
-- =====================
-- This table records the sales orders.
-- 
-- Columns:
-- - SO_ID: Unique sales order ID.
-- - Order_Qty: Quantity ordered.
-- - Design: Design file associated with the order.
-- - Model: Model of the paper bag sold.

create table Sales(
SO_ID varchar(4) not null,
Order_Qty int,
Design varchar(25),
Model char(3),
primary key (SO_ID),
foreign key (Model) references models(Model_ID)
);

-- Sample data for sales table.

insert into sales
(SO_ID, Order_Qty, Design, Model)
values
("S_1", 315000, "Betsy's.pdf", "D_2"),
("S_2", 210000, "Lidil.pdf", "D_5"),
("S_3", 105000, "Morrisons.pdf", "D_3"),
("S_4", 120000, "Starbucks Large.pdf", "D_1"),
("S_5", 240000, "Starbucks Medium.pdf", "D_1"),
("S_6", 360000, "Aldi.pdf", "D_3"),
("S_7",	315000,	"Tesco.pdf", "D_4"),
("S_8",	210000,	"Popyes Large",	"D_5");

-- ==========================================================================================================
-- below are the Queries, uncomment them to get some useful information from the tables of Paperbag Database
-- ==========================================================================================================

-- ***1 joins to know if any PO raised to new Goods Item so that it will be easy to plan for its location***

-- select p.G_ID, p.Quantity from purchase_order as p where G_ID not in
-- (select g.G_ID from Goods_Stock as g left join purchase_order as p on p.G_ID=g.G_ID);

-- ==========================================================================================================
-- ***2 joins to know the list of models used till now***

-- select distinct s.Model from Sales as s inner join Models as m on s.Model=m.Model_ID order by s.Model;

-- ===========================================================================================================
-- ***3 orderby Order_Qty in Sales to know the most valued customer***

-- select s.Design, sum(s.Order_Qty) as Qty_per_customer from Sales as s group by s.Design order by Qty_per_customer DESC;

-- ============================================================================================================
-- ***4 orderby G_ID in Purchase_order to know the most required goods***

-- select p.G_ID, count(p.G_ID) as frequency from Purchase_order as p group by p.G_ID order by frequency DESC;

-- =============================================================================================================
-- ***5 Goods_Quantity_per_pallet about starbucks***

-- select s.SO_ID, s.Design, s.Model, m.Guzzet, m.Handle, m.Ink, m.Length_cm, m.Width_cm, m.Height_cm, p.Goods, p.Goods_Quantity_per_pallet
-- from sales as s inner join Models as m on s.Model = m.Model_ID
-- inner join Pallet_info as p on s.Model = p.Model_ID where (SELECT SUBSTRING(s.Design, 1, 9)) = "Starbucks" ;
-- =============================================================================================================


-- =============================================================
-- Trigger: after_sales_insert
-- =============================================================
-- Purpose:
-- This trigger is designed to automatically update the goods stock
-- when a new sales order is inserted into the 'Sales' table. After
-- a new sales order is added, the trigger will call the stored 
-- procedure `update_goods` to adjust the stock levels of the raw 
-- materials (goods) required to fulfill the order.
--
-- Trigger Timing:
-- - This trigger is activated **AFTER INSERT** on the 'Sales' table.
-- - The trigger fires for each row inserted into the 'Sales' table.
--
-- Trigger Logic:
-- - Once a new row is inserted into the 'Sales' table, it calls the 
--   stored procedure `update_goods` to update the stock of goods 
--   based on the model and quantity ordered.
--
-- Parameters Passed to Procedure:
-- - `NEW.Model`: The model of the paper bag specified in the new sales order.
-- - `NEW.Order_Qty`: The quantity ordered in the new sales order.
--
-- Dependencies:
-- - The procedure `update_goods` must be predefined in the database. 
--   It handles the logic for reducing stock levels and potentially 
--   creating new purchase orders when stock is insufficient.
-- =============================================================

DELIMITER $$

CREATE TRIGGER after_sales_insert
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    -- Call the procedure and pass the values of NEW.Model and NEW.Order_Qty
    CALL update_goods(NEW.Model, NEW.Order_Qty);
END $$

DELIMITER ;

-- =====================
-- Stored Procedure: update_goods_stock
-- =====================
-- This stored procedure is triggered after a new sales order is made. 
-- It automatically updates the `Goods_Stock` table based on the quantity 
-- used in the sales order and generates a new purchase order if the stock 
-- of any raw material falls below the required level.

DELIMITER //

CREATE PROCEDURE update_goods(IN p_Model CHAR(3), IN p_Order_Qty INT)
BEGIN
    -- Declare variables
    DECLARE v_Product_Quantity_per_pallet INT;
    DECLARE v_Goods_ID VARCHAR(10);
    DECLARE v_Goods_Quantity_per_pallet DECIMAL(10, 2);
    DECLARE v_Total_Pallets INT;
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE absolute_quantity INT;
    DECLARE p_Qty INT DEFAULT 0;
    DECLARE f_Qty INT;
    DECLARE PO_position INT;

    -- Declare the cursor and handler (must be before any other statement)
    DECLARE goods_cursor CURSOR FOR
        SELECT Goods, Goods_Quantity_per_pallet
        FROM Pallet_info
        WHERE Model_ID = p_Model;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

    -- Get the Product_Quantity_per_pallet for the Model_ID from the Models table
    SELECT Product_Quantity_per_pallet INTO v_Product_Quantity_per_pallet
    FROM Models
    WHERE Model_ID = p_Model;

    -- Calculate the total number of pallets required for the sales order
    SET v_Total_Pallets = CEIL(p_Order_Qty / v_Product_Quantity_per_pallet);

    -- Open the cursor
    OPEN goods_cursor;

    -- Loop through the cursor results
    read_loop: LOOP
        FETCH goods_cursor INTO v_Goods_ID, v_Goods_Quantity_per_pallet;
        IF finished THEN
            LEAVE read_loop;
        END IF;

        -- Deduct the necessary quantity from the Goods_Stock based on the number of pallets
        UPDATE Goods_Stock
        SET Quantity = Quantity - (v_Total_Pallets * v_Goods_Quantity_per_pallet)
        WHERE G_ID = v_Goods_ID;

        -- Check if the quantity is <= 0
        IF (SELECT Quantity FROM Goods_Stock WHERE G_ID = v_Goods_ID) <= 0 THEN
            -- Delete from Goods_Stock if quantity is 0 or less
            DELETE FROM Goods_Stock WHERE G_ID = v_Goods_ID;

            -- Calculate the absolute quantity (remaining shortfall after stock is used up)
            SELECT ABS(Quantity) INTO absolute_quantity
            FROM Goods_Stock
            WHERE G_ID = v_Goods_ID;

            -- Check if there is an absolute shortfall that requires replenishment
            IF absolute_quantity > 0 THEN
                -- Check the total quantity of the purchase order in "Started" status
                SELECT SUM(p.Quantity) INTO p_Qty
                FROM Purchase_order p
                WHERE p.G_ID = v_Goods_ID AND p.Status = 'Started';

                -- If the total purchase order quantity is less than the shortfall, create a new purchase order
                IF p_Qty < absolute_quantity THEN
                    SET f_Qty = absolute_quantity - p_Qty;

                    -- Generate a new purchase order position (assuming it uses an auto-increment or sequential strategy)
                    SELECT COUNT(*) + 1 INTO PO_position FROM Purchase_order;

                    -- Insert a new purchase order for the missing quantity
                    INSERT INTO Purchase_order (PO, G_ID, Quantity, Status)
                    VALUES (PO_position, v_Goods_ID, f_Qty, 'Started');
                END IF;
            END IF;
        END IF;
    END LOOP;

    -- Close the cursor
    CLOSE goods_cursor;
END //

DELIMITER ;

-- ==================================================================
-- Checking the performance of the trigger and the stored procedure.
-- ==================================================================

-- *** uncomment the next 4 lines to check how the stored procedure works ***
-- insert into sales
-- (SO_ID, Order_Qty, Design, Model)
-- values
-- ("S_9", 240000, "Starbucks Medium.pdf", "D_1");
-- ===================================================================
-- *** uncomment the below line to have a look at table goods_stock after a new SO ***
-- select * from goods_stock;
-- ====================================================================
-- *** uncomment the below line to have a look at table purchase_order after a new SO ***
-- Select * from purchase_order;
-- =======================================================================

