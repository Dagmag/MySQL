/* Урок 3. SQL – выборка данных, сортировка, агрегатные функции
Условие:
Таблица для работы на слайде.
1. Отсортируйте поле “зарплата” (salary) в порядке убывания
2. Отсортируйте поле “зарплата” (salary) в порядке возрастания
3. Выведите 5 максимальных зарплат (salary)
4. Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)
5. Найти количество сотрудников по специальности “Рабочий” (speciality) в возрасте от 24 до 42 лет.
6. Найти количество специальностей
7. Вывести специальности, у которых средний возраст сотрудника меньше 44 лет */


CREATE DATABASE Lesson_3;
use Lesson_3;

-- Создаем таблицу.

create table staff (
	id int primary key auto_increment,
    name varchar (20) not null,
    surname varchar (20) not null,
    speciality varchar (20) not null,
    seniority int not null,
    salary int not null,
    age int not null
);

insert staff( name, surname, speciality, seniority, salary, age)
values
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
    ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
    ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

select * from staff;

-- 1.Отсортируйте поле “зарплата” (salary) в порядке убывания
select *
from staff
order by salary desc;

-- 2.Отсортируйте поле “зарплата” (salary) в порядке убывания
select *
from staff
order by salary;

-- 3. Выведите 5 максимальных зарплат (salary)
select *
from staff
order by salary desc
limit 5;


-- 4. Подсчитать суммарную зарплату(salary) по каждой специальности (speciality)
select speciality, sum(salary)
from staff
group by speciality;

-- 5. Найти количество сотрудников по специальности “Рабочий” (speciality) в возрасте от 24 до 42 лет.
select count(*)
from staff
where speciality='рабочий' and age between 24 and 42;

-- 6. Найти количество специальностей
select count(*)
from (select distinct speciality from staff) as temp;

-- 7. Вывести специальности, у которых средний возраст сотрудника меньше 44 лет
select speciality, avg(age)
from staff
group by speciality
having avg(age)<44;