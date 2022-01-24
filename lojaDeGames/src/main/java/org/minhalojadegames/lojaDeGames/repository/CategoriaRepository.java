package org.minhalojadegames.lojaDeGames.repository;

import java.util.List;

import org.minhalojadegames.lojaDeGames.model.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

//criação do repositório para categoria
//repository sempre com nome diferente da model

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {
	public List<Categoria> findAllByNomeContainingIgnoreCase(String nome);
}
