CREATE DATABASE atmonit;

USE atmonit;

CREATE TABLE IF NOT EXISTS company(
  id_company INT PRIMARY KEY auto_increment,
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

CREATE TABLE IF NOT EXISTS terminal(
  id_terminal INT PRIMARY KEY AUTO_INCREMENT,
  processor VARCHAR(50) NOT NULL,
  ram_memory VARCHAR(50) NOT NULL,
  terminal_storage VARCHAR(50) NOT NULL,
  cpu_model VARCHAR(50) NOT NULL,
  mac_address VARCHAR(45) NOT NULL,
  fk_terminal_address INT NOT NULL,
  fk_company INT NOT NULL,
  FOREIGN KEY (fk_company) REFERENCES company (id_company),
  FOREIGN KEY (fk_terminal_address) REFERENCES terminal_address(id_terminal_address)
 );
 
 CREATE TABLE IF NOT EXISTS employee(
  id_employee INT PRIMARY KEY AUTO_INCREMENT,
  employee_name VARCHAR(150),
  office VARCHAR(150) NULL,
  fk_company INT NOT NULL,
  login VARCHAR(150) NULL,
  password VARCHAR(255) NULL,
  FOREIGN KEY (fk_company) REFERENCES company(id_company)
);

CREATE TABLE IF NOT EXISTS component_registration (
  id_component_registration INT PRIMARY KEY AUTO_INCREMENT,
  nome_component VARCHAR(150) NOT NULL,
  percentage_usage DOUBLE NOT NULL,
  date_time DATETIME DEFAULT CURRENT_TIMESTAMP,
  frequency DOUBLE NULL,
  temperature DOUBLE NULL,
  fk_terminal INT NOT NULL,
  FOREIGN KEY (fk_terminal) REFERENCES terminal(id_terminal)
);

CREATE TABLE IF NOT EXISTS activity_log (
  id_activity_log INT PRIMARY KEY AUTO_INCREMENT,
  active_terminal boolean default false,
  activity_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fk_terminal INT NOT NULL,
  FOREIGN KEY (fk_terminal) REFERENCES terminal(id_terminal)
);

CREATE TABLE IF NOT EXISTS usage_log (
  id_usage_log INT PRIMARY KEY AUTO_INCREMENT,
  fk_terminal INT NOT NULL,
  average_usage_time TIME NULL,
  average_disuse_time TIME NULL,
  usage_frequency DOUBLE NULL,
  percentage_usage_day DOUBLE NULL,
  percentage_usage_week DOUBLE NULL,
  percentage_usage_month DOUBLE NULL,
  FOREIGN KEY (fk_terminal) REFERENCES terminal(id_terminal)
);







