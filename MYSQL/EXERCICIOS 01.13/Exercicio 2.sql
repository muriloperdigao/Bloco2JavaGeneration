CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categoria(
	id bigint auto_increment,
    categoria character(1) not null,
    preco double(4,2) not null,
    tamanho enum ("P", "M", "G") not null,
    primary key (id)
    );
    
CREATE TABLE tb_pizza(
	id bigint auto_increment,
    sabor varchar(255) not null,
    massa enum ("fermentacaoNat", "tradicional", "integral") not null,
    azeitonas boolean not null,
    borda boolean not null,
    categoria_id bigint not null,
    
    primary key (id),
    foreign key (categoria_id) references tb_categoria (id)
    );
    
DROP TABLE tb_categoria;

INSERT INTO tb_categoria(categoria, preco, tamanho) VALUES ("A", "20", "P");
INSERT INTO tb_categoria(categoria, preco, tamanho) VALUES ("B", "50", "M");
INSERT INTO tb_categoria(categoria, preco, tamanho) VALUES ("C", "80", "G");

SELECT * FROM tb_categoria;

INSERT INTO tb_pizza(sabor, massa, azeitonas, borda, categoria_id) VALUES ("Calabresa", "fermentacaoNat", true, false, 1);
INSERT INTO tb_pizza(sabor, massa, azeitonas, borda, categoria_id) VALUES ("Mussarela", "fermentacaoNat", true, false, 2);
INSERT INTO tb_pizza(sabor, massa, azeitonas, borda, categoria_id) VALUES ("Napolitana", "fermentacaoNat", true, true, 3);
INSERT INTO tb_pizza(sabor, massa, azeitonas, borda, categoria_id) VALUES ("Portuguesa", "tradicional", true, true, 1);
INSERT INTO tb_pizza(sabor, massa, azeitonas, borda, categoria_id) VALUES ("Marguerita", "tradicional", false, false, 2);
INSERT INTO tb_pizza(sabor, massa, azeitonas, borda, categoria_id) VALUES ("Atum", "integral", false, false, 2);
INSERT INTO tb_pizza(sabor, massa, azeitonas, borda, categoria_id) VALUES ("4 Queijos", "integral", false, true, 3);


SELECT tb_pizza.sabor, tb_pizza.massa, tb_pizza.azeitonas, tb_pizza.borda, tb_categoria.categoria, tb_categoria.preco, tb_categoria.tamanho FROM tb_pizza 
	inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id
    WHERE tb_categoria.preco > 45;
    
SELECT tb_pizza.sabor, tb_pizza.massa, tb_pizza.azeitonas, tb_pizza.borda, tb_categoria.categoria, tb_categoria.preco, tb_categoria.tamanho FROM tb_pizza 
	inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id
    WHERE tb_categoria.preco > 29 AND tb_categoria.preco < 60;
    
SELECT tb_pizza.sabor, tb_pizza.massa, tb_pizza.azeitonas, tb_pizza.borda, tb_categoria.categoria, tb_categoria.preco, tb_categoria.tamanho FROM tb_pizza 
	inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id
    WHERE tb_pizza.sabor LIKE "%C%";
    
SELECT tb_pizza.sabor, tb_pizza.massa, tb_pizza.azeitonas, tb_pizza.borda, tb_categoria.categoria, tb_categoria.preco, tb_categoria.tamanho FROM tb_pizza 
	inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id
    WHERE tb_pizza.massa LIKE "%tr%";