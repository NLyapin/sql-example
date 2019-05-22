
-- example initialization
create table product(id int primary key, name nvarchar(100))
create table product_to_category(product_id int, category_id int)
create table category(id int primary key, name nvarchar(100))

insert into product (id, name) values(1, 'Samsung Galaxy S10e')
insert into product (id, name) values(2, 'Huawei MateBook')
insert into product (id, name) values(3, 'Jeffrey Richter CLR via C#')
insert into product (id, name) values(4, 'JetBrains Rider')

insert into category(id, name) values(1, 'Electronics')
insert into category(id, name) values(2, 'Book')
insert into category(id, name) values(3, 'Expensive')

insert into product_to_category(product_id, category_id) values(1, 1)
insert into product_to_category(product_id, category_id) values(1, 3)
insert into product_to_category(product_id, category_id) values(2, 1)
insert into product_to_category(product_id, category_id) values(2, 3)
insert into product_to_category(product_id, category_id) values(3, 2)

-- resulting query script 
select distinct p.name as ProductName, 
       ISNULL(c.name, 'No category') as CategoryName
         from product p
         left join product_to_category pc on p.id = pc.product_id
         left join category c on pc.category_id = c.id
order by 1
