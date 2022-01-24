CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
	id bigint auto_increment,
    nome varchar(255) not null,
    tipo enum("lapis", "caneta", "papel", "caderno") not null,
    peso double(5,2) not null,
    preco double(5,2) not null,
    primary key (id)
    );
    
INSERT INTO tb_produtos(nome, tipo, peso, preco) VALUES ("Lápis Faber Castell 24 cores", "lapis", "100.00", 50.00);
INSERT INTO tb_produtos(nome, tipo, peso, preco) VALUES ("Lápis Faber Castell 48 cores", "lapis", "190.50", 92.50);
INSERT INTO tb_produtos(nome, tipo, peso, preco) VALUES ("Caneta Bic Azul", "caneta", "12.00", 2.50);
INSERT INTO tb_produtos(nome, tipo, peso, preco) VALUES ("Papel Sulfite A4 100 folhas", "papel", "250.00", 12.00);
INSERT INTO tb_produtos(nome, tipo, peso, preco) VALUES ("Papel Canson A4 20 folhas", "papel", "150.00", 20.00);
INSERT INTO tb_produtos(nome, tipo, peso, preco) VALUES ("Caderno Ben10 5 matérias 500 folhas", "caderno", "500.00", 35.00);


SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos where preco > 50;
SELECT * FROM tb_produtos where preco < 50;

UPDATE tb_produtos SET preco = 60.00 where id = 1;

DROP TABLE tb_produtos;