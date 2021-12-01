CREATE DATABASE atmonit;

USE atmonit;

CREATE TABLE IF NOT EXISTS company (
    id_company INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(150) NOT NULL,
    cnpj CHAR(14) NOT NULL
);

CREATE TABLE IF NOT EXISTS terminal_address (
    id_terminal_address INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(150) NOT NULL,
    city VARCHAR(150) NOT NULL,
    state VARCHAR(150) NOT NULL,
    district VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS terminal (
    id_terminal INT PRIMARY KEY AUTO_INCREMENT,
    processor VARCHAR(50) NOT NULL,
    ram_memory VARCHAR(50) NOT NULL,
    terminal_storage VARCHAR(50) NOT NULL,
    cpu_model VARCHAR(50) NOT NULL,
    mac_address VARCHAR(45) NOT NULL,
    fk_terminal_address INT NOT NULL,
    fk_company INT NOT NULL,
    FOREIGN KEY (fk_company)
        REFERENCES company (id_company),
    FOREIGN KEY (fk_terminal_address)
        REFERENCES terminal_address (id_terminal_address)
      	place_id VARCHAR(300)

);
 
 CREATE TABLE IF NOT EXISTS employee (
    id_employee INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(150),
    office VARCHAR(150) NULL,
    fk_company INT NOT NULL,
    login VARCHAR(150) NULL,
    password VARCHAR(255) NULL,
    FOREIGN KEY (fk_company)
        REFERENCES company (id_company)
);

CREATE TABLE IF NOT EXISTS component_registration (
    id_component_registration INT PRIMARY KEY AUTO_INCREMENT,
    name_component VARCHAR(150) NOT NULL,
    percentage_usage DECIMAL NOT NULL,
    date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    fk_terminal INT NOT NULL,
    FOREIGN KEY (fk_terminal)
        REFERENCES terminal (id_terminal)
);

desc company;

select * from company;

insert into company values (null, "teste", "12312312312312");

desc employee;

insert into employee values (null, "admin", "admin", 1, "admin", "admin");

DELETE FROM component_registration 
WHERE
    id_component_registration < 50000; 
    
delete from terminal where id_terminal = 2;
select * from company;
select * from terminal;

delete from company where id_company = 2;
select * from component_registration;

UPDATE company 
SET 
    company_name = 'bandtec'
WHERE
    id_company = 1;
    
select * from company;

SELECT 
    *
FROM
    component_registration
ORDER BY id_component_registration DESC
LIMIT 1;