-- DROP DATABASE lesson_1;
-- CREATE DATABASE lesson_1;
use lesson_1;

-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
CREATE TABLE mobile_phones (
  id_mobile INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_name_phone VARCHAR(45) NOT NULL,
  manufacturer_phone VARCHAR(45) NOT NULL,
  product_count_phone INT NOT NULL,
  prise_phone INT NOT NULL);

insert into mobile_phones (product_name_phone, manufacturer_phone, product_count_phone, prise_phone) value 
('iPhone X', 'Apple', 3, 76000),
('iPhone', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P 20 Pro', 'Huawei', 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2
select product_name_phone, prise_phone
from mobile_phones 
where product_count_phone > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *  
from mobile_phones 
where manufacturer_phone = 'Samsung';

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT * 
from mobile_phones 
where product_count_phone * prise_phone > 100000 and product_count_phone * prise_phone < 145000;


/* 5.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
	5.1. Товары, в которых есть упоминание "Iphone"
	5.2. "Galaxy"
	5.3.  Товары, в которых есть ЦИФРЫ
	5.4.  Товары, в которых есть ЦИФРА "8" */
    
SELECT * from mobile_phones
where product_name_phone LIKE '%iPhone%';

SELECT * from mobile_phones
where product_name_phone LIKE '%Galaxy%';

SELECT * from mobile_phones
WHERE product_name_phone REGEXP '[0-9]';

SELECT * from mobile_phones
where product_name_phone LIKE '%8%';
