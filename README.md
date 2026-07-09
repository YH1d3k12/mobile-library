![Atividade](https://img.shields.io/badge/Atividade-Flutter-blue)
![Dart](https://img.shields.io/badge/Linguagem-Dart-00b4ab)
![UI](https://img.shields.io/badge/UI-Material_Design_3-purple)

# 📚 Biblioteca de Alexandria - App de Busca e Organização de Livros
> Atividade Avaliativa em Flutter

**Curso:** Análise e Desenvolvimento de Sistemas  
**Unidade Curricular:** Desenvolvimento de Dispositivos Mobile  

**Equipa de Desenvolvimento:**
* 👩‍💻 [Cristhian Mazon](https://github.com/CristhianMazon)
* 👨‍💻 [Djalma Hideki Yamamoto](https://github.com/YH1d3k12)
* 👩‍💻 [Eloize Aiume](https://github.com/ATalDaAiume)

Repositório criado para armazenar o projeto completo da atividade prática de criação de uma aplicação móvel para explorar o consumo de APIs, armazenamento local de dados, gestão de estado e navegação.

---

## 📖 Sobre o Projeto

A **Biblioteca de Alexandria** foi construída em Flutter com o objetivo de permitir que o utilizador pesquise livros por título, autor ou palavras-chave através de uma API pública (Open Library). O utilizador pode visualizar informações básicas e detalhadas das obras e guardar os seus favoritos localmente para consulta posterior. 

O projeto garante uma experiência simples, fluida e funcional, com uma identidade visual temática (dourado imperial, púrpura real e mármore) e uma interface responsiva, adequada para pequenos e médios ecrãs.

## 📸 Capturas de Ecrã

*(Nota: Substitua os links abaixo pelas imagens reais da sua aplicação)*

| 🔍 Ecrã de Busca | 📖 Detalhes do Livro | ⭐ Favoritos | ⚙️ Configurações |
| :---: | :---: | :---: | :---: |
| <img src="https://via.placeholder.com/200x400.png?text=Pesquisa" width="200"> | <img src="https://via.placeholder.com/200x400.png?text=Detalhes" width="200"> | <img src="https://via.placeholder.com/200x400.png?text=Lista+Favoritos" width="200"> | <img src="https://via.placeholder.com/200x400.png?text=Dark+Mode" width="200"> |

## ✨ Principais Funcionalidades

* **Consulta de Livros:** Integração com a API pública *Open Library*, exibindo o nome do livro, autor, capa e um curto resumo.
* **Visão Detalhada:** Ecrã dedicado para exibir os detalhes do livro selecionado (editora, ano de publicação, idioma, etc.).
* **Gestão de Favoritos:** Funcionalidade para favoritar, remover e listar obras guardadas para acesso *offline*.
* **Personalização de Tema:** Ecrã de configurações que permite ao utilizador alternar em tempo real entre o **Tema Claro** e o **Tema Escuro (Dark Mode)**.
* **Feedback de Estado:** Interface reativa com indicadores de carregamento (*loading*), mensagens de erro adequadas (falhas de rede) e avisos de "nenhum resultado encontrado".
* **Fluxo de Navegação:** Transições estruturadas de forma intuitiva: Busca → Detalhes → Favoritos → Configurações.

## 🧠 Escolhas Técnicas e Ferramentas

Para atender aos requisitos do projeto com o melhor desempenho possível, utilizámos as seguintes tecnologias:

1. **Interface com `Flutter` e `Material Design 3`:**
   Garante uma apresentação limpa, moderna e responsiva. A paleta de cores e a estilização dos componentes tiram partido máximo do MD3 para assegurar consistência visual.
2. **Consumo de API com `http`:**
   Responsável pelas requisições REST à API pública, permitindo desserializar os dados JSON e tratar exceções ou falhas de conectividade de forma segura.
3. **Persistência Local com `sqflite` (SQLite):**
   Em vez de soluções simples, optou-se por uma base de dados relacional robusta. O `sqflite` guarda os livros favoritados de forma eficiente, permitindo um carregamento instantâneo quando a aplicação é reaberta.
4. **Gestão de Estado com `ValueNotifier`:**
   Uma solução nativa e leve do Flutter para gerir alterações na interface gráfica (como a alternância imediata do Dark Mode) sem necessidade de instalar pacotes pesados de terceiros.
5. **Otimização de Imagens com `cached_network_image`:**
   Guarda as capas dos livros em cache no dispositivo, poupando o consumo de dados móveis e acelerando o carregamento visual nas próximas pesquisas.

## 🤝 Organização do Trabalho em Equipa

Para assegurar uma boa colaboração e cumprir os critérios de avaliação, o projeto foi versionado no GitHub com base na criação de *Pull Requests*. As contribuições foram revistas em grupo antes de serem integradas na *branch* principal, divididas da seguinte forma:

*(Pode ajustar os nomes abaixo conforme a divisão real que fizeram)*
* **Membro 1:** Estrutura inicial do projeto, navegação e integração com a API pública (HTTP).
* **Membro 2:** Configuração do `sqflite`, lógica de armazenamento local (Favoritos) e modelos de dados.
* **Membro 3:** Interface visual (UI/UX), implementação do Tema Claro/Escuro (`ValueNotifier`), gestão de exceções e documentação (README).

## 🚀 Como Executar o Projeto

Siga os passos abaixo para correr a aplicação no seu ambiente local:

1. Certifique-se de que tem o **Flutter SDK** instalado na sua máquina.
2. Clone este repositório:
   ```bash
   git clone [URL-DO-SEU-REPOSITORIO]
