Create DataBase Book_shop;

-- create tables
Create TABLE supplier_info(
	supplier_id VARCHAR(4) not null primary key,
	sup_name VARCHAR(20) not null,
	deliv_day VARCHAR(20) not null
);

Create TABLE group_info(
	group_id VARCHAR(4) not null primary key,
	group_name VARCHAR(20) not null,
	stock_place VARCHAR(20) not null
);

Create TABLE product(
	product_id VARCHAR(4) not null primary key,
	group_id VARCHAR(4) not null REFERENCES group_info,
	supplier_id VARCHAR(4) not null REFERENCES supplier_info,
	prod_name VARCHAR(20) not null,
	prod_price money,
	count_stock Integer
);

Create TABLE post_info(
	post_id VARCHAR(4) not null primary key,
	post_name VARCHAR(20) not null ,
	city VARCHAR(30) not null ,
	post_number Integer not null
);

Create TABLE position_info(
	position VARCHAR(20) not null primary key,
	salary money not null,
	descriptions VARCHAR(50)
);

Create TABLE employees(
	employee_id VARCHAR(4) not null primary key,
	emp_name VARCHAR(20) not null ,
	surname VARCHAR(20) not null ,
	position VARCHAR(20) not null REFERENCES position_info,
	date_startwork DATE NOT NULL DEFAULT CURRENT_DATE,
	tax_number VARCHAR(20) not null
);

Create TABLE card_info(
	card_name VARCHAR(20) not null primary key,
	discount FLOAT(2) not null
);

Create TABLE client(
	client_id VARCHAR(4) not null primary key,
	cli_name VARCHAR(20) not null ,
	surname VARCHAR(20) not null ,
	tel_number VARCHAR(13) not null,
	email VARCHAR(30),
	birthday DATE NOT NULL,
	bonus_card VARCHAR(20)  REFERENCES card_info
);

Create TABLE Orders(
	order_id VARCHAR(4) not null primary key,
	client_id VARCHAR(4) not null REFERENCES client,
	post_id VARCHAR(4) not null REFERENCES post_info,
	employee_id VARCHAR(4) not null REFERENCES employees,
	order_status VARCHAR(30),
	order_date DATE NOT NULL DEFAULT CURRENT_DATE,
	order_finish DATE NOT NULL
);

Create TABLE orders_prod(
	order_id VARCHAR(4) not null REFERENCES Orders,
	product_id VARCHAR(4) not null REFERENCES product,
	product_count Integer
);

--load data
INSERT INTO card_info
VALUES ('GOLD', 10.00),
       ('SILVER', 5.00),
	   ('PLATINUM',15.00),
	   ('NAN',0.00);
SELECT * FROM card_info

INSERT INTO client
VALUES ('0001', 'Іван','Сидоренко','+380665437243','ivan@gmail.com','2021-10-01','GOLD'),
       ('0002', 'Петро','Коваль','+380675487449','kovpetro@gmail.com','2021-10-09','NAN');
SELECT * FROM client
