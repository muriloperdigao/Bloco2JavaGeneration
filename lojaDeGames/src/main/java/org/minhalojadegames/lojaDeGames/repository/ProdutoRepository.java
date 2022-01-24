package org.minhalojadegames.lojaDeGames.repository;

import java.util.List;

import org.minhalojadegames.lojaDeGames.model.Produto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

//criação do repositório para categoria
//repository sempre com nome diferente da model

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long> {
	public List<Produto> findAllByNomeContainingIgnoreCase(String nome);
}
