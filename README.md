# 📦 Paperbag Stock Management System (IMDB)

The **Paperbag Stock Management System (IMDB)** is a lightweight inventory management solution developed in Python and designed to run inside Jupyter Notebook. It helps manage suppliers, customers, and product stock levels while keeping the implementation simple and extendable.  

This project is ideal for:
- Small businesses that want a simple inventory tracker  
- Students learning Python and inventory management concepts  
- Beginners who want to practice data structures and business logic  

---

## ✨ Features

- ✅ Supplier Management – Add, update, and view supplier details  
- ✅ Customer Management – Maintain records of customers  
- ✅ Stock Management – Add products and track available quantities  
- ✅ Purchase & Sales Recording – Log stock inflows (purchases) and outflows (sales)  
- ✅ Automatic Stock Updates – Real-time updates on inventory  
- ✅ Easy to Extend – Code structured for further enhancements  

---

## Database
### Table Relationships

| Parent Table     | Child Table      | Foreign Key(s)                                  | Description                                                                                     |
|------------------|------------------|-------------------------------------------------|-------------------------------------------------------------------------------------------------|
| `Models`         | `Sales`          | `Sales.Model` → `Models.Model_ID`               | Defines the relationship between the models of bags and sales orders.                            |
| `Goods_Stock`    | `Purchase_order` | `Purchase_order.G_ID` → `Goods_Stock.G_ID`      | Specifies which goods are being restocked through purchase orders.                              |
| `Goods_Stock`    | `pallet_info`    | `pallet_info.Goods` → `Goods_Stock.G_ID`        | Defines which goods are required for producing pallets of each model of bags.                    |
| `Models`         | `pallet_info`    | `pallet_info.Model_ID` → `Models.Model_ID`      | Specifies which models of bags require which goods to produce a full pallet.                     |
| `Sales`          | `Sales`          | `Sales.SO_ID` → `Sales.SO_ID` (Primary Key)     | Each sales order is uniquely identified by the sales order ID.                                   |
| `Goods_Stock`    | `Goods_Stock`    | `Goods_Stock.G_ID` → `Goods_Stock.G_ID` (Primary Key) | Goods and raw materials are uniquely identified in the stock system.                              |
| `Models`         | `Models`         | `Models.Model_ID` → `Models.Model_ID` (Primary Key) | Bag models are uniquely identified in the system.                                                |
| `Purchase_order` | `Purchase_order` | `Purchase_order.PO` → `Purchase_order.PO` (Primary Key) | Each purchase order is uniquely identified by the purchase order ID.                            |

### Relationships Diagram

  ```plaintext

     +----------------+      +---------------------+     +------------------+
     |  Models        |      |  Sales              |     |  Goods_Stock     |
     |----------------|      |---------------------|     |------------------|
+-->| Model_ID (PK)  |<-----| Model (FK)          |     | G_ID (PK)        |<---+
|   |                |      | SO_ID (PK)          |     | Type             |    |
|   |                |      | Order_Qty           |     | Specification    |    |
|   +----------------+      +---------------------+     | Quantity         |    |
|                                                       +------------------+    |
|                                                                               | 
|                                 +-------+------------------------------------+
|                                 |       |
|   +------------------+          |       |               +----------------------+
|   |  Pallet_Info     |          |       |               |  Purchase_Order      |
|   |------------------|          |       |               |----------------------|
|   | SLNO (PK)        |          |       |               | PO (PK)              |
+---| Model_ID (FK)    |          |       +---------------| G_ID (FK)            |
     | Goods (FK)       |----------+                       | Status               |
     | Goods_Qty        |                                  +----------------------+
     +------------------+



## 🛠️ Tech Stack

- **Python 3.x** – Programming language  
- **Jupyter Notebook** – For running and demonstrating the code  
- **Built-in Data Structures** – Dictionaries and lists to handle stock, suppliers, and customers  

---

## 🚀 Installation & Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/paperbag-stock-management.git
   cd paperbag-stock-management
2. Open the notebook:
    ```bash
    jupyter notebook paperbag_stock_management.ipynb
3. Run cells step by step and use the functions to:
    Add suppliers & customers
    Add stock items
    Record purchases and sales
    View current stock levels

## 📊 Example Functions
 - Add a new stock item
    add_stock_item("PAPERBAG01", "Brown Paper Bag", 100, "ABC Suppliers")

 - Record a purchase
    record_purchase("PAPERBAG01", 50, "ABC Suppliers")

  - Record a sale
    record_sale("PAPERBAG01", 30, "XYZ Retailer")

  - Check stock levels
    view_stock()
- A complete example description is found in [Paperbag.sql](https://github.com/Sathya404/Paper-Bag-Production-Stock-Management-System/blob/main/Paperbag.sql) file

## 📌 Future Enhancements

- Interact with Database like MysQl

- Web interface with Flask or Django

- Export reports in Excel or PDF

- Barcode scanning support

## 🎯 Conclusion

- The Paperbag Stock Management System (IMDB) demonstrates how simple Python logic can solve real-world problems in stock and business management. It is clean, extendable, and a great starting point for building larger business applications.
