DROP DATABASE IF EXISTS bamazon_DB;
CREATE DATABASE bamazon_DB;

USE bamazon_DB;

CREATE TABLE products(
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(150) NOT NULL,
  department_id INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock_quantity INT NOT NULL,
  product_sales DECIMAL(10,2) DEFAULT 0,
  PRIMARY KEY (item_id)
);

ALTER TABLE products AUTO_INCREMENT=1001;

CREATE TABLE departments(
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(45) NOT NULL,
  over_head_costs FLOAT NOT NULL,
  PRIMARY KEY (department_id)
);

ALTER TABLE departments AUTO_INCREMENT=10;

INSERT INTO departments (department_name, over_head_costs)
VALUES ("Blanket", 700);



INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Pure Warmth Fleece Electric Heated Blanket Queen Sage Green", 89, 39, department_id 
FROM departments
WHERE department_name = "Blanket"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Biddeford 2064-9032138-302 MicroPlush Sherpa Electric Heated Blanket King Claret", 89.95, 3, department_id
FROM departments
WHERE department_name = "Blanket"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Biddeford 2020-905291-711 Electric Heated Knit MicroPlush Blanket, Twin, Chocolate", 40.99, 110, department_id
FROM departments
WHERE department_name = "Blanket"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Sunbeam Fleece Heated Electric Throw Blanket with PrimeStyle Lighted Controller, Garnet Red", 34.98, 10, department_id
FROM departments
WHERE department_name = "Blanket"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Sunbeam Heated Blanket | 10 Heat Settings, Quilted Fleece, Mushroom, Queen", 67.93, 28, department_id
FROM departments
WHERE department_name = "Blanket"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Sunbeam Heated Throw Blanket | Reversible Sherpa/Royalmink Blanket with 3 Heat Settings, Honey ", 59.99, 80, department_id
FROM departments
WHERE department_name = "Blanket"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Sunbeam Quilted Heated Mattress Pad with Dual EasySet Pro Controllers, Queen", 69.99, 11, department_id
FROM departments
WHERE department_name = "Blanket"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Sunbeam Heated Throw Blanket (Navy Plaid)", 105, 5, department_id
FROM departments
WHERE department_name = "Blanket"
LIMIT 1;

SELECT * FROM products;

SELECT * FROM departments;