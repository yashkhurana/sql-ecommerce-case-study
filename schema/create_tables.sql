-- // customers_Table
CREATE TABLE CUSTOMERS (
	CUSTOMER_ID INT PRIMARY KEY,
	CUSTOMER_NAME VARCHAR(100),
	EMAIL VARCHAR(100),
	SIGNUP_DATE DATE,
	CITY VARCHAR(50)
);

-- Products table
CREATE TABLE PRODUCTS (
	PRODUCT_ID INT PRIMARY KEY,
	PRODUCT_NAME VARCHAR(100),
	CATEGORY VARCHAR(50),
	PRICE DECIMAL(10, 2)
);

-- orders table
CREATE TABLE ORDERS (
	ORDER_ID INT PRIMARY KEY,
	CUSTOMER_ID INT,
	ORDER_DATE DATE,
	ORDER_STATUS VARCHAR(20),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
);

-- order items
CREATE TABLE ORDER_ITEMS (
	ORDER_ITEM_ID INT PRIMARY KEY,
	ORDER_ID INT,
	PRODUCT_ID INT,
	QUANTITY INT,
	DISCOUNT DECIMAL(10, 2),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID),
	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID)
);

-- payments
CREATE TABLE PAYMENTS (
	PAYMENT_ID INT PRIMARY KEY,
	ORDER_ID INT,
	PAYMENT_DATE DATE,
	PAYMENT_METHOD VARCHAR(20),
	PAYMENT_STATUS VARCHAR(20),
	AMOUNT DECIMAL(10, 2),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ORDER_ID)
);

-- Insert Customer Data
INSERT INTO
	CUSTOMERS (
		CUSTOMER_ID,
		CUSTOMER_NAME,
		EMAIL,
		SIGNUP_DATE,
		CITY
	)
VALUES
	(
		1,
		'Amit Sharma',
		'amit@gmail.com',
		'2023-01-10',
		'Delhi'
	),
	(
		2,
		'Neha Verma',
		'neha@gmail.com',
		'2023-01-15',
		'Mumbai'
	),
	(
		3,
		'Rohit Singh',
		'rohit@gmail.com',
		'2023-02-01',
		'Bangalore'
	),
	(
		4,
		'Pooja Mehta',
		'pooja@gmail.com',
		'2023-02-20',
		'Pune'
	),
	(
		5,
		'Ankit Gupta',
		'ankit@gmail.com',
		'2023-03-05',
		'Delhi'
	),
	(
		6,
		'Sneha Iyer',
		'sneha@gmail.com',
		'2023-03-18',
		'Chennai'
	);
	
	-- Insert Product Data
INSERT INTO
	PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE)
VALUES
	(101, 'Laptop', 'Electronics', 60000),
	(102, 'Headphones', 'Electronics', 3000),
	(103, 'Smartphone', 'Electronics', 40000),
	(201, 'Office Chair', 'Furniture', 8000),
	(202, 'Desk Table', 'Furniture', 12000),
	(301, 'Running Shoes', 'Fashion', 5000),
	(302, 'Jacket', 'Fashion', 7000);

-- Insert Orders Data
INSERT INTO
	ORDERS (ORDER_ID, CUSTOMER_ID, ORDER_DATE, ORDER_STATUS)
VALUES
	(1001, 1, '2023-01-12', 'Completed'),
	(1002, 2, '2023-01-20', 'Completed'),
	(1003, 1, '2023-02-05', 'Completed'),
	(1004, 3, '2023-02-10', 'Cancelled'),
	(1005, 4, '2023-02-25', 'Completed'),
	(1006, 2, '2023-03-02', 'Completed'),
	(1007, 5, '2023-03-10', 'Completed'),
	(1008, 1, '2023-03-15', 'Completed'),
	(1009, 6, '2023-04-05', 'Completed'),
	(1010, 3, '2023-04-18', 'Completed');

-- Insert order_items data
INSERT INTO
	ORDER_ITEMS (
		ORDER_ITEM_ID,
		ORDER_ID,
		PRODUCT_ID,
		QUANTITY,
		DISCOUNT
	)
VALUES
	(1, 1001, 101, 1, 2000),
	(2, 1001, 102, 2, 500),
	(3, 1002, 103, 1, 3000),
	(4, 1003, 301, 1, 0),
	(5, 1003, 302, 1, 1000),
	(6, 1004, 201, 1, 0),
	(7, 1005, 202, 1, 1500),
	(8, 1006, 101, 1, 2500),
	(9, 1007, 301, 2, 500),
	(10, 1008, 103, 1, 4000),
	(11, 1009, 102, 1, 0),
	(12, 1010, 201, 1, 1000);

-- Insert Payment Data
INSERT INTO
	PAYMENTS (
		PAYMENT_ID,
		ORDER_ID,
		PAYMENT_DATE,
		PAYMENT_METHOD,
		PAYMENT_STATUS,
		AMOUNT
	)
VALUES
	(
		1,
		1001,
		'2023-01-12',
		'Credit Card',
		'Success',
		64500
	),
	(2, 1002, '2023-01-20', 'UPI', 'Success', 37000),
	(
		3,
		1003,
		'2023-02-05',
		'Debit Card',
		'Success',
		11000
	),
	(4, 1004, '2023-02-10', 'UPI', 'Failed', 8000),
	(
		5,
		1005,
		'2023-02-25',
		'Credit Card',
		'Success',
		10500
	),
	(6, 1006, '2023-03-02', 'UPI', 'Success', 57500),
	(
		7,
		1007,
		'2023-03-10',
		'Debit Card',
		'Success',
		9500
	),
	(
		8,
		1008,
		'2023-03-15',
		'Credit Card',
		'Success',
		36000
	),
	(9, 1009, '2023-04-05', 'UPI', 'Success', 3000),
	(
		10,
		1010,
		'2023-04-18',
		'Credit Card',
		'Success',
		7000
	);
