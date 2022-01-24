CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_funcionaries(
	id bigint auto_increment,
    nome varchar(255) not null,
    numero int not null,
    funcao varchar(255) not null,
    salario double(6,2) not null,
    primary key (id)
    );
    
INSERT INTO tb_funcionaries(nome, numero, funcao, salario) VALUES ("Marcia", 1234, "CEO", 1500.00);
INSERT INTO tb_funcionaries(nome, numero, funcao, salario) VALUES ("Francisco", 5678, "Operador de telemarketing", 8000.00);
INSERT INTO tb_funcionaries(nome, numero, funcao, salario) VALUES ("Camila", 4321, "Limpeza", 7500.00);

SELECT * FROM tb_funcionaries;

SELECT * FROM tb_funcionaries where salario > 2000;
SELECT * FROM tb_funcionaries where salario < 2000;

UPDATE tb_funcionaries SET salario = 1750.00 where id = 1;