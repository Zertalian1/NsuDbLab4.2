CREATE TABLE IF NOT EXISTS suppliers(
    id serial PRIMARY KEY,
    name varchar(20) not null
);

CREATE TABLE IF NOT EXISTS product_types(
    id serial PRIMARY KEY,
    type varchar(10) not null
);

CREATE TABLE IF NOT EXISTS products(
    id serial PRIMARY KEY,
    name text not null,
    productTypeId int not null,
    FOREIGN KEY (productTypeId) REFERENCES product_types(id)
);

CREATE TABLE IF NOT EXISTS posts(
    id int PRIMARY KEY,
    postName varchar(15)
);

CREATE TABLE IF NOT EXISTS workers(
    id serial PRIMARY KEY,
    firstName varchar(15) not null,
    lastName varchar(15) not null,
    dateOfBirth date not null,
    postId int not null,
    FOREIGN KEY (postId) REFERENCES posts(id)
);


CREATE TABLE IF NOT EXISTS orders(
    id serial PRIMARY KEY,
    productID int not null,
    supplierID int not null,
    managerId int not null,
    quantity int not null,
    date timestamp not null,
    FOREIGN KEY (productID) REFERENCES products(id),
    FOREIGN KEY (supplierID) REFERENCES suppliers(id),
    FOREIGN KEY (managerId) REFERENCES workers(id)
);

CREATE TABLE IF NOT EXISTS point_of_sale_types(
    id serial PRIMARY KEY,
    name varchar(20) not null
);

CREATE TABLE IF NOT EXISTS points_of_sale(
    id serial PRIMARY KEY,
    square int not null,
    rentPrice int not null,
    hallsNum int not null,
    countersNum int not null,
    pointOfSaleTypeId int not null,
    managerId int,
    FOREIGN KEY (managerId) REFERENCES workers(id),
    FOREIGN KEY (pointOfSaleTypeId) REFERENCES point_of_sale_types(id)
);

CREATE TABLE IF NOT EXISTS products_points_of_sales(
    id int PRIMARY KEY,
    productId int not null,
    pointOfSaleId int not null,
    price int not null ,
    quantity int not null ,
    FOREIGN KEY (pointOfSaleId) REFERENCES points_of_sale(id),
    FOREIGN KEY (productId) REFERENCES products(id)
);


CREATE TABLE IF NOT EXISTS customers
(
    id serial PRIMARY KEY,
    firstName varchar(15) not null,
    lastName varchar(15) not null,
    dateOfBirth date not null,
    phoneNumber text not null
);

CREATE TABLE IF NOT EXISTS purchases(
    id serial PRIMARY KEY,
    buyerId int,
    workerId int not null,
    pointOfSaleId int not null,
    productId int not null,
    price int not null,
    square int not null,
    dateOfSale timestamp not null,
    FOREIGN KEY (buyerId) REFERENCES customers (id),
    FOREIGN KEY (workerId) REFERENCES workers(id),
    FOREIGN KEY (pointOfSaleId) REFERENCES points_of_sale(id),
    FOREIGN KEY (productId) REFERENCES products(id)
);



CREATE TABLE IF NOT EXISTS workers_points_of_sale(
    id serial PRIMARY KEY,
    workerId int not null,
    pointOfSaleId int,
    startWork date,
    endWork date,
    salary int,
    FOREIGN KEY (workerId) REFERENCES workers(id),
    FOREIGN KEY (pointOfSaleId) REFERENCES points_of_sale(id)
)



