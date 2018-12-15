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
VALUES ("Electronics", 500);



INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Ultimate Ears WONDERBOOM Super Portable Waterproof Bluetooth Speaker", 78.99, 10, department_id 
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "DOSS Touch Wireless Bluetooth V4.0 Portable Speaker", 29.99, 30, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Anker SoundCore Bluetooth Speaker with 24-Hour Playtime", 25.99, 30, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Wireless Bluetooth Speaker, ZOEE S1 Outdoor Portable Stereo Speaker)", 19.98, 10, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "JBL Flip 3 Splashproof Portable Bluetooth Speaker", 73.68, 20, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Zosam Portable Wireless Bluetooth Speaker ", 11.99, 30, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Portable Bluetooth Speakers V4.0 Wireless Smart Touch Speakers", 29.98, 1, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "NEWBEING S5 Wireless Bluetooth Speaker", 12.99, 5, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "Mini Bluetooth Speaker,Lonchan Wireless Portable Sound Box Subwoofer Speaker", 9.99, 10, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

INSERT INTO products (product_name, price, stock_quantity, department_id)
SELECT "LINGYI Portable Wireless Bluetooth Speaker", 13.99, 20, department_id
FROM departments
WHERE department_name = "Electronics"
LIMIT 1;

SELECT * FROM products;

SELECT * FROM departments;