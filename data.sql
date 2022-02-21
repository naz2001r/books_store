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
INSERT INTO supplier_info
VALUES ('0001','Видавництво Лева','по четвергах'),
('0002','НФ','по вівторках'), 
('0003','Фоліо','по вівторках'),
('0004','Ранок','по понеділках'),
('0005','Рідна мова','по четвергах');
Select * From supplier_info;

Alter TABLE group_info
    Alter  COLUMN group_name TYPE VARCHAR(40);

INSERT INTO group_info
VALUES ('0001','Саморозвиток.Мотивація','А1'),
('0002','Фантастика','А2'), 
('0003','Дитячі','А3'),
('0004','Художня література','Б1'),
('0005','Історичні','Б2'),
('0006','Детективи','Б3'),
('0007','Бізнес','А4');
Select * From group_info;


Alter TABLE product
    Alter  COLUMN prod_name TYPE VARCHAR(100);

INSERT INTO product
VALUES ('0001','0001','0002','Кафе на краю світу',150.00,20),
('0002','0001','0002','Атомні звички',185.00,30),
('0003','0001','0001','Мистецтво говорити',220.00,55),
('0004','0001','0002','Стіни в моїй голові',150.00,20),
('0005','0001','0003','12 правил життя',210.00,28),
('0006','0002','0005','Війна старого',229.00,27),
('0007','0002','0001','Колесо часу',399.00,26),
('0008','0002','0001','Гаррі Поттер і філософський камінь',480.00,50),
('0009','0002','0002','Клітка короля',250.00,30),
('0010','0002','0002','Небо сингулярності',299.00,25),
('0011','0003','0001','Уроки без мороки',175.00,60),
('0012','0003','0001','Різдвяна свинка',260.00,20),
('0013','0003','0003','Червона шапочка',158.00,60),
('0014','0003','0004','Неймовірні пригоди Івана Сили',120.00,40),
('0015','0003','0004','Фунтик',150.00,20),
('0016','0004','0004','Атлант розправив плечі',700.00,30),
('0017','0004','0004','Янгол пітьми',230.00,35),
('0018','0004','0001','Джерело',20.00,35),
('0019','0004','0003','Сліди на дорозі',310.00,50),
('0020','0004','0003','Клітка короля',215.00,20),
('0021','0004','0003','Захар Беркут',130.00,50),
('0022','0004','0004','Юпак',262.00,40),
('0023','0004','0004','Дюна',290.00,50),
('0024','0004','0004','Ланселот',359.00,30),
('0025','0004','0003','Відьмак',165.00,20),
('0026','0005','0002','Справа Василя Стуса',260.00,70),
('0027','0005','0002','Після війни',490.00,30),
('0028','0005','0002','Перспективи української революції',330.00,45),
('0029','0005','0001','Останній командир УПА',210.00,33),
('0030','0005','0001','Паритура революції',220.00,30),
('0031','0005','0001','Людина розумна',270.00,30),
('0032','0006','0003','Розшифровка',176.00,NULL),
('0033','0006','0003','Ферія',350.00,30),
('0034','0006','0003','Бот',200.00,25),
('0035','0006','0005','Білий попіл',150.00,40),
('0036','0006','0001','Протистояння',205.00,28),
('0037','0006','0002','Протистояння',205.00,28),
('0038','0007','0005','Емпатія в бізнесі',240.00,32),
('0039','0007','0001','Диво пятої ранку',175.00,30),
('0040','0007','0001','Розумний інвестор',400.00,40),
('0041','0007','0002','Сам собі стартап',185.00,30),
('0042','0007','0002','Менеджмент у стилі Манчестер Юнайтед',195.00,30),
('0043','0007','0003','Глобальний занепад',215.00,NULL),
('0044','0007','0002','Обдурені випадковістю',300.00,25),
('0045','0007','0005','Шкура у грі',250.00,30),
('0046','0007','0005','Смерть митця',205.00,28);
SELECT * FROM product;


INSERT INTO post_info
VALUES ('0001', 'Нова Пошта', 'Київ', 32),
       ('0002', 'УкрПошта', 'Львів',23),
	   ('0003', 'Інтайм', 'Рівне',5),
	   ('0004', 'Делівері', 'Харків',2),
	   ('0005', 'Міст Експрес', 'Одеса',3),
	   ('0006', 'Нова Пошта', 'Львів', 64),
	   ('0007', 'Нова Пошта', 'Чернівці', 15),
	   ('0008', 'Укрпошта', 'Одеса', 8),
	   ('0009', 'Нова Пошта', 'Київ', 65),
	   ('0010', 'Нова Пошта', 'Суми', 18),
	   ('0011', 'Міст Експрес', 'Київ',2),
	   ('0012', 'Нова Пошта', 'Рівне', 64),
	   ('0013', 'Інтайм', 'Чернівці', 5),
	   ('0014', 'Укрпошта', 'Київ', 18),
	   ('0015', 'Нова Пошта', 'Київ', 25);
SELECT * FROM post_info;


Alter TABLE position_info
    Alter  COLUMN position TYPE VARCHAR(40);

Alter TABLE employees
    Alter  COLUMN position TYPE VARCHAR(40);

INSERT INTO position_info
VALUES ('Директор', 15000.00, 'Керівник магазину'),
       ('Бухгалтер', 11000.00, 'Веде облік діяльності магазину'),
	   ('Касовий працівник', 10000.00, 'Займається прийманням та видачею грошових коштів'),
	   ('Маркетолог', 11000.00, 'Займається просуванням товару'),
	   ('Менеджер з продажу', 8000.00, 'Обслуговує клієнтів'),
	   ('Комплектувальник', 7500.00, 'Займається пакуванням та розіщенням товару');
SELECT * FROM position_info;


INSERT INTO employees
VALUES ('2301', 'Олена', 'Сидоренко', 'Менеджер з продажу', '2020-02-05', '2468086008'),
       ('2302', 'Петро', 'Мельник', 'Маркетолог', '2019-06-07', '7865890967'),
	   ('2303', 'Андрій', 'Коваль', 'Менеджер з продажу', '2021-04-07', '8653790896'),
	   ('2304', 'Валентина', 'Петренко', 'Бухгалтер', '2020-11-20', '3289800766'),
	   ('2305', 'Олександра', 'Стецюк', 'Директор', '2020-02-16', '6654324676'),
	   ('2306', 'Станіслав', 'Рудковський', 'Комплектувальник', '2021-02-14', '9987543687'),
	   ('2307', 'Петро', 'Ковальчук', 'Комплектувальник', '2020-12-04', '8864732567'),
	   ('2308', 'Володимир', 'Якимчук', 'Касовий працівник', '2020-05-04', '6564732576');
SELECT * FROM employees;


INSERT INTO card_info
VALUES ('GOLD', 10.00),
       ('SILVER', 5.00),
	   ('PLATINUM',15.00),
	   ('NAN',0.00);
SELECT * FROM card_info


INSERT INTO client
VALUES ('0001', 'Валентина', 'Сергійчук', '+380974341423', 'valentuna220@gmail.com', '2000-05-03', 'SILVER'),
       ('0002', 'Тетяна', 'Василюк', '+380663457552', 'vasiluktet@gmail.com', '1998-03-26', 'PLATINUM'),
	   ('0003', 'Микола', 'Табачук', '+380975432075', 'tabachuk0202@gmail.com', '1888-09-10', 'GOLD'),
	   ('0004', 'Вадим', 'Притула', '+380669762745', 'pritulavadum@gmail.com', '1999-12-12', 'NAN'),
	   ('0005', 'Мирослава', 'Гойда', '+380658443287', 'goida1111@gmail.com', '1998-03-26', 'GOLD'),
	   ('0006', 'Світлана', 'Ващук', '+380965311276', 'vashchuk23@gmail.com', '1991-05-09', 'NAN'),
	   ('0007', 'Василь', 'Недбало', '+380974433221', 'vasil0306@gmail.com', '2002-10-06', 'GOLD'),
	   ('0008', 'Леонід', 'Конончук', '+380970366789', 'kononchuk@gmail.com', '1886-03-23', 'SILVER'),
	   ('0009', 'Інна', 'Назарчук', '+380669854334', 'natharchuk12@gmail.com', '1995-06-30', 'NAN'),
	   ('0010', 'Аліна', 'Левандовська', '+380977664423', 'alinka1111@gmail.com', '1998-07-05', 'GOLD'),
	   ('0011', 'Анна', 'Процик', '+380660553223', 'annaprotsik@gmail.com', '1976-03-02', 'GOLD'),
	   ('0012', 'Валерія', 'Войтюк', '+380967663228', 'valeria2000@gmail.com', '1996-08-12', 'PLATINUM'),
	   ('0013', 'Катерина', 'Мельник', '+380978667889', 'katemelnuk@gmail.com', '2001-11-11', 'NAN'),
	   ('0014', 'Ігор', 'Кравчук', '+380976554478', 'kravchuk677@gmail.com', '2000-12-23', 'NAN'),
	   ('0015', 'Мирослав', 'Кравець', '+380668587643', 'kravets000@gmail.com', '1994-10-15', 'GOLD'),
	   ('0016', 'Арсен', 'Поліщук', '+380930662869', 'arsenkooo@gmail.com', '1985-10-23', 'SILVER'),
	   ('0017', 'Любов', 'Левченко', '+380935699532', 'lubov888@gmail.com', '2000-06-28', 'SILVER'),
	   ('0018', 'Богдан', 'Костенко', '+380978443256', 'kostenkobog@gmail.com', '1980-05-10', 'GOLD'),
	   ('0019', 'Юрій', 'Іванов', '+380938554467', 'ivanov789@gmail.com', '1977-03-28', 'NAN'),
	   ('0020', 'Анна', 'Гончарук', '+380938775433', 'annagonchar@gmail.com', '1999-09-22', 'NAN'),
	   ('0021', 'Ігор', 'Конончук', '+380978865587', 'kononchuk098@gmail.com', '1995-04-23', 'GOLD'),
	   ('0022', 'Андрій', 'Жук', '+380978865432', 'andriykoo@gmail.com', '1889-09-09', 'NAN'),
	   ('0023', 'Андрій', 'Сорока', '+380665442298', 'sorokaandriy@gmail.com', '1993-02-05', 'SILVER'),
	   ('0024', 'Віолета', 'Голуб', '+380970765954', 'violla@gmail.com', '2001-05-02', 'GOLD'),
	   ('0025', 'Евеліна', 'Білик', '+380938600745', 'evelina@gmail.com', '2003-03-07', 'NAN'),
	   ('0026', 'Анатолій', 'Панасюк', '+380937885438', 'panasuk3998@gmail.com', '1991-12-08', 'PLATINUM'),
	   ('0027', 'Олександр', 'Гнатюк', '+380978553678', 'gnatuk111@gmail.com', '1993-10-10', 'PLATINUM'),
	   ('0028', 'Олег', 'Ільчук', '+380658433898', 'olegoff@gmail.com', '1992-05-23', 'GOLD'),
	   ('0029', 'Ірина', 'Чайка', '+380938664580', 'ira070222@gmail.com', '2001-10-26', 'GOLD'),
	   ('0030', 'Андріана', 'Петрова', '+380936880954', 'andriannna01@gmail.com', '2000-07-09', 'SILVER');
SELECT * FROM client;



INSERT INTO Orders
VALUES ('0001', '0019', '0001', '2301', 'НОВЕ', '2021-10-15', '2021-10-18'),
       ('0002', '0001', '0015', '2303', 'Успішно', '2021-09-25', '2021-09-28'),
	   ('0003', '0003', '0002', '2301', 'Успішно', '2021-10-02', '2021-10-04'),
	   ('0004', '0005', '0001', '2303', 'Успішно', '2021-10-03', '2021-10-06'),
	   ('0005', '0007', '0007', '2303', 'Успішно', '2021-10-09', '2021-10-11'),
	   ('0006', '0009', '0015', '2301', 'Неуспішно', '2021-10-08', '2021-10-10'),
	   ('0007', '0002', '0001', '2301', 'Доставляється', '2021-10-13', '2021-10-16'),
	   ('0008', '0012', '0003', '2303', 'НОВЕ', '2021-10-15', '2021-10-18'),
	   ('0009', '0014', '0008', '2303', 'Успішно', '2021-09-29', '2021-10-01'),
	   ('0010', '0018', '0011', '2301', 'Неуспішно', '2021-10-06', '2021-10-08'),
	   ('0011', '0020', '0015', '2303', 'Успішно', '2021-10-11', '2021-10-13'),
	   ('0012', '0021', '0004', '2301', 'Доставляється', '2021-10-11', '2021-10-15'),
	   ('0013', '0023', '0008', '2303', 'Успішно', '2021-10-05', '2021-10-08'),
	   ('0014', '0025', '0004', '2303', 'НОВЕ', '2021-10-15', '2021-10-18'),
	   ('0015', '0027', '0006', '2303', 'Доставляється', '2021-10-14', '2021-10-16'),
	   ('0016', '0029', '0010', '2301', 'НОВЕ', '2021-10-15', '2021-10-17'),
	   ('0017', '0022', '0012', '2301', 'Успішно', '2021-10-10', '2021-10-12'),
	   ('0018', '0024', '0006', '2301', 'Успішно', '2021-10-10', '2021-10-13'),
	   ('0019', '0030', '0013', '2303', 'Успішно', '2021-10-08', '2021-10-11'),
	   ('0020', '0014', '0008', '2303', 'НОВЕ', '2021-10-15', '2021-10-17'),
	   ('0021', '0001', '0001', '2301', 'Успішно', '2021-10-07', '2021-10-10'),
	   ('0022', '0009', '0015', '2303', 'Неуспішно', '2021-09-27', '2021-09-30'),
	   ('0023', '0020', '0015', '2301', 'Успішно', '2021-09-23', '2021-09-27'),
	   ('0024', '0002', '0009', '2301', 'Успішно', '2021-09-26', '2021-09-29'),
	   ('0025', '0028', '0014', '2303', 'Успішно', '2021-10-02', '2021-10-04'),
	   ('0026', '0001', '0009', '2303', 'Доставляється', '2021-10-11', '2021-10-15'),
	   ('0027', '0008', '0009', '2303', 'Успішно', '2021-09-26', '2021-09-28'),
	   ('0028', '0001', '0015', '2301', 'Успішно', '2021-10-06', '2021-10-08'),
	   ('0029', '0018', '0011', '2301', 'Успішно', '2021-10-02', '2021-10-05'),
	   ('0030', '0022', '0012', '2303', 'Успішно', '2021-10-09', '2021-10-11'),
	   ('0031', '0005', '0001', '2301', 'НОВЕ', '2021-10-15', '2021-10-18'),
	   ('0032', '0018', '0011', '2301', 'Доставляється', '2021-10-14', '2021-10-16'),
	   ('0033', '0014', '0008', '2303', 'Успішно', '2021-09-27', '2021-09-30'),
	   ('0034', '0020', '0014', '2301', 'Успішно', '2021-10-12', '2021-10-14'),
	   ('0035', '0016', '0010', '2303', 'НОВЕ', '2021-10-15', '2021-10-18'),
	   ('0036', '0001', '0008', '2301', 'Доставляється', '2021-10-13', '2021-10-16'),
	   ('0037', '0009', '0015', '2301', 'Успішно', '2021-09-30', '2021-10-02'),
	   ('0038', '0016', '0010', '2303', 'Успішно', '2021-09-30', '2021-10-03'),
	   ('0039', '0020', '0015', '2303', 'Доставляється', '2021-10-13', '2021-10-15'),
	   ('0040', '0030', '0007', '2301', 'Доставляється', '2021-10-13', '2021-10-16'),
	   ('0041', '0022', '0012', '2303', 'Успішно', '2021-10-10', '2021-10-13'),
	   ('0042', '0025', '0004', '2303', 'Доставляється', '2021-10-13', '2021-10-16'),
	   ('0043', '0005', '0001', '2301', 'Доставляється', '2021-10-14', '2021-10-16'),
	   ('0044', '0015', '0005', '2303', 'Доставляється', '2021-10-12', '2021-10-15'),
	   ('0045', '0003', '0002', '2303', 'В обробці', '2021-10-15', '2021-10-18'),
	   ('0046', '0014', '0008', '2301', 'В обробці', '2021-10-14', '2021-10-17'),
	   ('0047', '0001', '0015', '2301', 'Доставляється', '2021-09-12', '2021-09-15'),
	   ('0048', '0005', '0001', '2301', 'НОВЕ', '2021-10-15', '2021-10-17'),
	   ('0049', '0010', '0003', '2301', 'Доставляється', '2021-10-13', '2021-10-15'),
	   ('0050', '0005', '0001', '2301', 'Успішно', '2021-10-08', '2021-10-11'),
	   ('0051', '0029', '0001', '2301', 'НОВЕ', '2021-10-15', '2021-10-17'),
	   ('0052', '0028', '0001', '2301', 'Доставляється', '2021-10-14', '2021-10-16'),
	   ('0053', '0004', '0001', '2303', 'Успішно', '2021-09-26', '2021-10-02'),
	   ('0054', '0027', '0001', '2301', 'В обробці', '2021-10-14', '2021-10-17'),
	   ('0055', '0026', '0001', '2303', 'НОВЕ', '2021-10-15', '2021-10-18'),
	   ('0056', '0017', '0001', '2303', 'Доставляється', '2021-10-13', '2021-10-16'),
	   ('0057', '0013', '0005', '2303', 'Неуспішно', '2021-10-02', '2021-10-04'),
	   ('0058', '0011', '0001', '2301', 'НОВЕ', '2021-10-15', '2021-10-18'),
	   ('0059', '0006', '0009', '2303', 'Успішно', '2021-09-27', '2021-09-30'),
	   ('0060', '0004', '0001', '2301', 'Успішно', '2021-10-02', '2021-10-05');
SELECT * FROM Orders;
 
INSERT INTO orders_prod
VALUES ('0001', '0043', 1),
	   ('0001', '0004', 1),
	   ('0001', '0046', 3),
	   ('0002', '0002', 2),
	   ('0002', '0011', 1),
	   ('0003', '0003', 4),
	   ('0004', '0001', 2),
	   ('0004', '0027', 1),
	   ('0004', '0017', 1),
	   ('0005', '0014', 3),
	   ('0005', '0033', 1),
	   ('0006', '0024', 1),
	   ('0006', '0036', 1),
	   ('0007', '0001', 3),
	   ('0008', '0030', 1),
	   ('0008', '0008', 1),
	   ('0009', '0005', 1),
	   ('0009', '0039', 2),
	   ('0010', '0036', 1),
	   ('0010', '0041', 1),
	   ('0010', '0017', 1),
	   ('0011', '0004', 4),
	   ('0011', '0013', 1),
	   ('0012', '0039', 1),
	   ('0012', '0020', 2),
	   ('0013', '0040', 1),
	   ('0013', '0010', 1),
	   ('0013', '0037', 3),
	   ('0014', '0030', 1),
	   ('0014', '0041', 1),
	   ('0015', '0011', 1),
	   ('0016', '0006', 2),
	   ('0016', '0029', 1),
	   ('0017', '0040', 1),
	   ('0017', '0026', 2),
	   ('0018', '0020', 1),
	   ('0018', '0031', 1),
	   ('0019', '0023', 3),
	   ('0019', '0016', 1),
	   ('0020', '0037', 2),
	   ('0021', '0006', 4),
	   ('0021', '0004', 1),
	   ('0022', '0033', 1),
	   ('0022', '0006', 1),
	   ('0023', '0006', 3),
	   ('0023', '0031', 1),
	   ('0024', '0022', 1),
	   ('0024', '0032', 1),
	   ('0025', '0012', 1),
	   ('0025', '0006', 1),
	   ('0026', '0018', 1),
	   ('0026', '0024', 1),
	   ('0027', '0021', 1),
	   ('0027', '0005', 2),
	   ('0028', '0015', 1),
	   ('0029', '0006', 1),
	   ('0029', '0019', 1),
	   ('0030', '0028', 3),
	   ('0031', '0042', 1),
	   ('0031', '0034', 1),
	   ('0032', '0038', 4),
	   ('0033', '0004', 1),
	   ('0034', '0035', 2),
	   ('0035', '0027', 1),
	   ('0036', '0019', 3),
	   ('0036', '0038', 2),
	   ('0037', '0029', 4),
	   ('0038', '0007', 1),
	   ('0038', '0006', 1),
	   ('0039', '0021', 1),
	   ('0039', '0034', 3),
	   ('0040', '0032', 1),
	   ('0041', '0008', 3),
	   ('0041', '0012', 1),
	   ('0042', '0025', 2),
	   ('0043', '0013', 2),
	   ('0044', '0003', 1),
	   ('0044', '0038', 1),
	   ('0045', '0001', 1),
	   ('0045', '0028', 1),
	   ('0046', '0026', 1),
	   ('0046', '0004', 2),
	   ('0047', '0022', 1),
	   ('0048', '0015', 2),
	   ('0049', '0002', 1),
	   ('0050', '0009', 1),
	   ('0051', '0018', 2),
	   ('0052', '0025', 1),
	   ('0052', '0023', 2),
	   ('0053', '0010', 1),
	   ('0054', '0007', 3),
	   ('0055', '0009', 2),
	   ('0056', '0035', 3),
	   ('0057', '0016', 4),
	   ('0057', '0023', 1),
	   ('0057', '0024', 1),
	   ('0058', '0039', 4),
	   ('0058', '0036', 1),
	   ('0059', '0009', 1),
	   ('0059', '0014', 1),
	   ('0060', '0005', 3);
SELECT * FROM orders_prod;


SELECT * From Orders;
Alter Table Orders
Add Check(order_finish>order_date)

SELECT * FROM Orders


Select * From client
Where left(tel_number,4)='+380';


Alter Table client
Add Check(left(tel_number,4)='+380');


--1
SELECT sup_name FROM supplier_info
WHERE  deliv_day = 'по вівторках';

--2
SELECT cli_name, tel_number,email FROM client
WHERE birthday = CURRENT_DATE;

--3
SELECT cli_name, tel_number,email FROM client
WHERE EXTRACT(MONTH FROM birthday)= EXTRACT(MONTH FROM CURRENT_DATE)
AND EXTRACT(DAY FROM birthday)= EXTRACT(DAY FROM CURRENT_DATE);

--4
SELECT emp_name,surname FROM employees
WHERE EXTRACT(MONTH FROM date_startwork)= EXTRACT(MONTH FROM CURRENT_DATE)
AND EXTRACT(DAY FROM date_startwork)= EXTRACT(DAY FROM CURRENT_DATE);

--5
SELECT * FROM post_info
WHERE city = 'Львів';

--6
SELECT * FROM client
WHERE bonus_card ='GOLD' OR bonus_card = 'PLATINUM';

--7
SELECT * FROM product
WHERE prod_price < '$200.00' AND count_stock>20;

--8
SELECT cli_name, tel_number,email FROM client
WHERE cli_name IN ('Ігор','Олег');

--9
SELECT prod_name, prod_price, count_stock FROM product
WHERE prod_name LIKE '%Війн%' or prod_name Like '%війн%';

--10
SELECT * FROM client
WHERE tel_number LIKE '+380[6,9][7,8]%' OR tel_number LIKE '+38096%';

--11
SELECT g.group_name,SUM(p.count_stock) as sum_book FROM product as p
LEFT JOIN group_info AS g
ON p.group_id=g.group_id
GROUP BY g.group_name
ORDER BY sum_book;

--12
SELECT order_id,SUM(product_count) as sum_book FROM orders_prod
GROUP BY order_id
ORDER BY sum_book;

--13
SELECT client_id, COUNT(order_id) FROM Orders
GROUP BY client_id;

--14
SELECT employee_id,
	AVG(DATE_PART('day', order_finish::timestamp - order_date::timestamp)) as mean_day
FROM Orders
GROUP BY employee_id
ORDER BY mean_day DESC;

--15
SELECT city, COUNT(post_id) FROM post_info
GROUP BY city
ORDER BY COUNT(post_id) DESC;

--16
SELECT * FROM product
WHERE count_stock BETWEEN 20 AND 30 AND group_id='0004'
ORDER BY prod_price;

--17
SELECT cli_name, tel_number,email, bonus_card FROM client
WHERE DATE_PART('year', AGE(CURRENT_DATE,birthday))
BETWEEN 18 And 23;

--18
SELECT product_id FROM orders_prod
GROUP BY product_id
HAVING SUM(product_count)>5
ORDER BY SUM(product_count) DESC
LIMIT 3;

--19
SELECT DISTINCT city FROM post_info;

--20
SELECT bonus_card, COUNT(*) FROM client
GROUP BY bonus_card;

--21
SELECT prod_name,
(SELECT sup_name
FROM supplier_info AS s
WHERE p.supplier_id=s.supplier_id)
FROM product AS p;

--22
SELECT p.prod_name, s.sup_name
FROM product AS p
FULL OUTER JOIN supplier_info AS s
ON s.supplier_id=p.supplier_id;

--23
SELECT c.client_id, c.email, b.discount 
FROM client AS c
LEFT JOIN card_info AS b 
ON c.bonus_card=b.card_name
WHERE b.discount>0
ORDER BY b.discount DESC;

--24
SELECT e.emp_name, p.position,p.salary
FROM employees AS e 
INNER JOIN position_info AS p
ON e.position=p.position;

--25
SELECT p.product_id,p.prod_name,p.count_stock
FROM product AS p
LEFT JOIN group_info AS g
ON g.group_id=p.group_id
WHERE g.stock_place='А2';

--26
SELECT e.employee_id, e.emp_name,o.order_id
FROM employees AS e 
RIGHT JOIN Orders AS o
ON e.employee_id=o.employee_id
WHERE o.order_status='В обробці';

--27
SELECT (
	SELECT e.emp_name
	FROM employees AS e 
	RIGHT JOIN Orders AS o
	ON e.employee_id=o.employee_id
	WHERE o.order_id=op.order_id
),o.order_id, op.product_id,op.product_count
FROM orders_prod AS op
LEFT JOIN Orders AS o
ON o.order_id=op.order_id
WHERE o.order_status='В обробці';

--28
SELECT  e.emp_name,o.order_id, op.product_id,op.product_count
FROM employees AS e 
RIGHT JOIN Orders AS o
ON e.employee_id=o.employee_id
INNER JOIN orders_prod AS op 
ON o.order_id=op.order_id
WHERE o.order_status='В обробці';

--27 and 28 work the same

--29
SELECT c.client_id,c.cli_name, 
CASE 
	WHEN COUNT(o.order_id)<=1 THEN 'Випадковий клієнт'
	WHEN (COUNT(o.order_id)>1 )
		AND (COUNT(o.order_id)<=3 )THEN 'Постійний клієнт'
	WHEN COUNT(o.order_id)>3 THEN 'Гуртовик' 
	ELSE NULL
END AS indep_year_group
FROM client AS c 
RIGHT JOIN Orders AS o 
ON c.client_id=o.client_id
GROUP BY c.client_id;

--30
SELECT emp_name,position,
CASE 
	WHEN DATE_PART('year', AGE(CURRENT_DATE,date_startwork))<=1 THEN 5.0
	WHEN DATE_PART('year', AGE(CURRENT_DATE,date_startwork))>1 
	AND DATE_PART('year', AGE(CURRENT_DATE,date_startwork))<=2 THEN 10.0
	WHEN DATE_PART('year', AGE(CURRENT_DATE,date_startwork))>2 THEN 15.0
	ELSE NULL
END AS bonus
FROM employees
ORDER BY bonus DESC;


Select p.prod_name, SUM(op.product_count)
From orders_prod as op
Left JOIN product as p 
ON op.product_id = p.product_id
GROUP BY p.prod_name
ORDER BY SUM(op.product_count) DESC
LIMIT 1;


--function & procedure & trigger

--function
CREATE OR REPLACE FUNCTION GetActualOrders()  
RETURNS table (
	emp_name Varchar,
	order_id Varchar,
	product_id Varchar,
	product_count Integer
)
LANGUAGE plpgsql   
AS   
$$  
BEGIN 
	return query
    SELECT  e.emp_name,o.order_id, op.product_id,op.product_count
	FROM employees AS e 
	RIGHT JOIN Orders AS o
	ON e.employee_id=o.employee_id
	INNER JOIN orders_prod AS op 
	ON o.order_id=op.order_id
	WHERE o.order_status='В обробці';
END;
$$

Select * FROM GetActualOrders() 

--trigger
CREATE OR REPLACE FUNCTION person()
    RETURNS TRIGGER
    SET SCHEMA 'public'
    LANGUAGE plpgsql
    AS $$
    BEGIN
    IF LENGTH(NEW.email) = 0 THEN
        RAISE EXCEPTION 'Email must not be empty.';
    END IF;
 
    IF POSITION(' ' IN NEW.email) > 0 THEN
        RAISE EXCEPTION 'Email must not include white space.';
    END IF;
 
    --INSERT INTO client (client_id, cli_name,surname,tel_number,
	--					email,birthday,bonus_card) 
    --    VALUES (NEW.client_id, NEW.cli_name,NEW.surname,NEW.tel_number,
	--					NEW.email,NEW.birthday,NEW.bonus_card) ;
 
    RETURN NEW;
    END;
    $$;

CREATE TRIGGER new_person1 
    BEFORE INSERT OR UPDATE ON client
    FOR EACH ROW EXECUTE PROCEDURE person();

INSERT INTO client
VALUES ('0031', 'Олег', 'Сергійчук', '+380974341423', 'nazar', '2000-03-03', 'SILVER');

Select * From client;

--procedure
create or replace procedure newpricecount(
   id Varchar(4),
   price money, 
   countt Integer
)
language plpgsql    
as $$
begin
    update product 
    set prod_price =  price,
		count_stock = countt
    where product_id = id;
    commit;
end;$$

Call newpricecount('0001','$130',14);

SELECT * FROM product
WHERE product_id ='0001';
