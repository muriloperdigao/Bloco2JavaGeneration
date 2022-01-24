CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classe(
	id bigint auto_increment,
    nome varchar(255) not null,
    arma varchar(255) not null,
    atributo enum ("dex", "str", "int") not null,
    primary key (id)
    );
    
CREATE TABLE tb_personagem(
	id bigint auto_increment,
    nome varchar(255) not null,
    raca enum ("humano", "elfo", "goblin") not null,
    poder int not null,
    origem varchar(255) not null,
    classe_id bigint not null,
    
    primary key (id),
    foreign key (classe_id) references tb_classe (id)
    );
    
DROP TABLE tb_personagem;

INSERT INTO tb_classe(nome, arma, atributo) VALUES ("arqueiro", "arco e flecha", "dex");
INSERT INTO tb_classe(nome, arma, atributo) VALUES ("guerreiro", "espada e escudo", "str");
INSERT INTO tb_classe(nome, arma, atributo) VALUES ("mago", "cajado", "int");

SELECT * FROM tb_classe;

INSERT INTO tb_personagem(nome, raca, poder, origem, classe_id) VALUES ("Carla", "humano", 1500, "Brasil", 1);
INSERT INTO tb_personagem(nome, raca, poder, origem, classe_id) VALUES ("Cléber", "humano", 2500, "Russia", 2);
INSERT INTO tb_personagem(nome, raca, poder, origem, classe_id) VALUES ("Sidnei", "humano", 8000, "Brasil", 3);
INSERT INTO tb_personagem(nome, raca, poder, origem, classe_id) VALUES ("Kerline", "goblin", 20, "Japão", 1);
INSERT INTO tb_personagem(nome, raca, poder, origem, classe_id) VALUES ("Karol", "goblin", 7400, "EUA", 2);
INSERT INTO tb_personagem(nome, raca, poder, origem, classe_id) VALUES ("Eduardo", "elfo", 1300, "Japão", 1);
INSERT INTO tb_personagem(nome, raca, poder, origem, classe_id) VALUES ("Eduarda", "elfo", 4500, "Japão", 3);

SELECT * FROM tb_personagem WHERE poder > 2000;
SELECT * FROM tb_personagem WHERE poder < 2000;

SELECT * FROM tb_personagem WHERE poder > 1000 AND poder < 2000;

SELECT * FROM tb_personagem WHERE nome LIKE "%C%";

SELECT * FROM tb_personagem inner join tb_classe on tb_classe.id = tb_personagem.classe_id;

SELECT tb_personagem.nome, tb_personagem.raca, tb_personagem.poder, tb_personagem.origem, tb_classe.nome, tb_classe.arma, tb_classe.atributo FROM tb_personagem 
	inner join tb_classe on tb_classe.id = tb_personagem.classe_id;

SELECT tb_personagem.nome, tb_personagem.raca, tb_personagem.poder, tb_personagem.origem, tb_classe.nome, tb_classe.arma, tb_classe.atributo FROM tb_personagem 
	inner join tb_classe on tb_classe.id = tb_personagem.classe_id
    WHERE tb_classe.nome = "arqueiro";





