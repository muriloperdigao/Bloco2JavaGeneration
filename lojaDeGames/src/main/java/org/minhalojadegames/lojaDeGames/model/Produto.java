package org.minhalojadegames.lojaDeGames.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//criação da tabela e o nome dado a mesma

@Entity
@Table(name = "tb_produto")
public class Produto {

	//criação da ID e geração de número automático
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	//nome do produto
	
	@NotBlank (message = "O atributo nome é obrigatório!")
	@Size(min = 2, max = 50, message = "O atributo título deve conter no mínimo 2 e no máximo 50 caracteres")
	private String nome;
	
	//descrição do produto
	
	@Size(min = 10, max = 255, message = "O atributo descricao deve conter no mínimo 10 e no máximo 255 caracteres")
	private String descricao;
	
	//anotação necessária para que a aplicação não retorne informações em loop
	//definição de chave estrangeira
	
	@ManyToOne
	@JsonIgnoreProperties("produto")
	private Categoria categoria;
	
	@ManyToOne
	@JsonIgnoreProperties("produto")
	private Usuario usuario;

	//getters e setters
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
}
