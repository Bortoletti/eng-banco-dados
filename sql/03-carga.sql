use trabalho;

LOAD DATA INFILE '/home/luis/usr/engenharia/eng-banco-dados/sql/doc/carga.csv'
INTO TABLE trabalho.carga
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(UF, Nome_UF, Mesorregião, Nome_Mesorregião, Microrregião, Nome_Microrregião, Município, Nome_Município, Distrito, Nome_Distrito, SubDistrito, Nome_SubDistrito );


