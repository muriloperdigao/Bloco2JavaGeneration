package org.minhalojadegames.lojaDeGames.controller;

import java.util.List;

import javax.validation.Valid;

import org.minhalojadegames.lojaDeGames.model.Produto;
import org.minhalojadegames.lojaDeGames.repository.ProdutoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//primeiro end-point

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
@RequestMapping("/produto")
public class ProdutoController {
	
	//informa que puxará do repositorio
	
	@Autowired
	private ProdutoRepository repository;
	
	//apresentará a lista de produtos e informará que está "ok"
	
	@GetMapping
	public ResponseEntity<List<Produto>> getAll(){
		return ResponseEntity.ok(repository.findAll());
	}
	
	//end-point para caso eu insira o ID do produto
	//apresentará o produto de ID específico ou "not found" caso o ID não esteja cadastrado
	
	@GetMapping("/{id}")
	public ResponseEntity<Produto> getById(@PathVariable long id){
		return repository.findById(id)
			.map(resp -> ResponseEntity.ok(resp))
			.orElse(ResponseEntity.notFound().build());
	}
	
	//end-point para que apresente o produto caso eu escreva o nome dele na URL após /nome/
	
	@GetMapping("/nome/{nome}")
	public ResponseEntity<List<Produto>> getByName(@PathVariable String nome){
		return ResponseEntity.ok(repository.findAllByNomeContainingIgnoreCase(nome));
	}
	
	
	//end-point para realizar postagens e popular a tabela de produtos
	//apresentará o httpstatus de "criado" quando inserir o dado
	
	@PostMapping
	public ResponseEntity<Produto> post(@RequestBody Produto produto){
		return ResponseEntity.status(HttpStatus.CREATED)
				.body(repository.save(produto));
	}
	
	//end-point para substituir algum dado da tabela produto
	
	@PutMapping
	public ResponseEntity<Produto> put(@Valid @RequestBody Produto produto){
		return ResponseEntity.ok(repository.save(produto));
	}
	
	//deleta alguma linha da tabela de acordo com a informação encaminhada
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable long id) {
		repository.deleteById(id);
	}
}
