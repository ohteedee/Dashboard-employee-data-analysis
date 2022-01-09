
DROP TABLE categories;
CREATE TABLE categories (categoryID integer, 
                        categoryName varchar, 
                        descriptioncol varchar, 
                        picture text);
COPY categories
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/categories.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE customers;
CREATE TABLE customers (customerID varchar(100), 
                        companyName varchar(50), 
                        contactName varchar(50), 
                        contactTitle varchar(50), 
                        addresses text, 
                        city varchar(50), 
                        region varchar, 
                        postalCode text, 
                        country varchar(20), 
                        phone varchar, 
                        fax text);
COPY customers
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/customers.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE employee_territories;
CREATE TABLE employee_territories (employeeID integer, territoryID integer);
COPY employee_territories
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/employee_territories.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE employees;
CREATE TABLE employees (employeeID integer, 
                        lastName varchar(50), 
                        firstName varchar(50), 
                        title varchar, 
                        titleOfCourtesy varchar, 
                        birthdate timestamp, 
                        hireDate timestamp, 
                        addresses varchar, 
                        city varchar, 
                        region varchar, 
                        postalCode text, 
                        country varchar, 
                        homePhone text, 
                        extension integer, 
                        photo text, 
                        notes text, 
                        reportsTo integer, 
                        photopath text
                        );
COPY employees
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/employees.csv'
with NULL as 'NULL'
DELIMITER ','
CSV HEADER;

DROP TABLE order_details;
CREATE TABLE order_details (orderID integer, 
                            productID integer, 
                            unitPrice float(6), 
                            quantity integer, 
                            discount float(5)
                            );
COPY order_details
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/order_details.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE orders;
CREATE TABLE orders (orderID integer, 
                    customerID varchar(20), 
                    employeeID integer, 
                    orderDate timestamp, 
                    requiredDate timestamp, 
                    shippedDate timestamp, 
                    shipVia integer, 
                    freight float(10), 
                    shipName varchar(50), 
                    shipAddress varchar(100),
                    shipCity varchar(50), 
                    shipRegion varchar(50), 
                    shipPostalCode varchar(50), 
                    shipCountry varchar(15)
                    );
COPY orders
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/orders.csv'
with NULL as 'NULL'
DELIMITER ','
CSV HEADER;

DROP TABLE products;
CREATE TABLE products (productID integer, 
                        productName varchar(100), 
                        supplierID integer, 
                        categoryID integer, 
                        quantityPerUnit varchar, 
                        unitPrice float(10), 
                        unitsInStock integer, 
                        unitsOnOrder integer, 
                        reorderLevel integer, 
                        discontinued integer
                        );
COPY products
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/products.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE regions;
CREATE TABLE regions (regionID integer, regionDescription varchar(20));
COPY regions
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/regions.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE shippers;
CREATE TABLE shippers (shipperID integer, 
                        companyName varchar(20), 
                        phone varchar(50));
COPY shippers 
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/shippers.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE suppliers;
CREATE TABLE suppliers (supplierID varchar(50), 
                        companyName varchar(100), 
                        contactNAme varchar(100),
                        contactTitle varchar(200), 
                        addresses varchar(300), 
                        city varchar(50), 
                        region varchar(100), 
                        postalCode varchar(50), 
                        country varchar(50), 
                        phone varchar(20), 
                        fax varchar(20), 
                        homepage varchar(500)
                        );
COPY suppliers
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/suppliers.csv'
DELIMITER ','
CSV HEADER;

DROP TABLE territories;
CREATE TABLE territories (territoryID integer, 
                            territoryDescription varchar(50), 
                            regionID integer);
COPY territories
FROM '/Users/tosinoyewale/Desktop/Spiced/Spice_projects/week_5/northwind_data_clean-master/data/territories.csv'
DELIMITER ','
CSV HEADER;
