package com.aprendizagem.Aprendizagem.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/aprendizagem")
public class AprendizagemController {
	@GetMapping
	public String aprendizagem() {
		return "Esta semana preciso tirar todas as minhas dúvidas e ser mais pontual.";
	}

}
