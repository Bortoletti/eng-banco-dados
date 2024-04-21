
-- logar com usuario root

-- executar o script abaixo

CREATE USER 'trabalho'@'localhost' IDENTIFIED BY 'Trabalho!2024#01';

CREATE DATABASE trabalho;

grant all privileges on trabalho.* to 'trabalho'@'localhost';

flush privileges;

show databases;



