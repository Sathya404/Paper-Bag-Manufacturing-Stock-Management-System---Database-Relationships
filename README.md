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

## 📌 Future Enhancements

- Database integration (SQLite, MySQL, or PostgreSQL)

- Web interface with Flask or Django

- Export reports in Excel or PDF

- Barcode scanning support

## 🎯 Conclusion

- The Paperbag Stock Management System (IMDB) demonstrates how simple Python logic can solve real-world problems in stock and business management. It is clean, extendable, and a great starting point for building larger business applications.
