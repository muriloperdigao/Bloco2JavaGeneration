CREATE DATABASE db_notas;

USE db_notas;

CREATE TABLE tb_alunos(
	id bigint auto_increment,
    nome varchar(255) not null,
    classe enum('A', 'B', 'C') not null,
    matricula int not null,
    media double(4,2) not null,
    primary key (id)
    );
    
INSERT INTO tb_alunos(nome, classe, matricula, media) VALUES ("Daniel", 'A', 11111, 7.25);
INSERT INTO tb_alunos(nome, classe, matricula, media) VALUES ("Danilo", 'A', 22222, 7.82);
INSERT INTO tb_alunos(nome, classe, matricula, media) VALUES ("Daniela", 'B', 33333, 6.24);
INSERT INTO tb_alunos(nome, classe, matricula, media) VALUES ("Dani", 'B', 44444, 10);
INSERT INTO tb_alunos(nome, classe, matricula, media) VALUES ("Danila", 'B', 55555, 9.89);
INSERT INTO tb_alunos(nome, classe, matricula, media) VALUES ("Dalila", 'C', 66666, 2.0);
INSERT INTO tb_alunos(nome, classe, matricula, media) VALUES ("Dan", 'C', 77777, 0.02);

SELECT * FROM tb_alunos;

SELECT * FROM tb_alunos where media > 7;
SELECT * FROM tb_alunos where media < 7;

UPDATE tb_alunos SET classe = 'C' where id = 3;