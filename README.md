![Atividade](https://img.shields.io/badge/Atividade-Flutter-blue)
![Dart](https://img.shields.io/badge/Linguagem-Dart-00b4ab)

# 📚 App de Busca e Organização de Livros
> Atividade Avaliativa em Flutter

**Curso:** Análise e Desenvolvimento de Sistemas
**Unidade Curricular:** Desenvolvimento de Dispositivos Mobile

**Equipe de Desenvolvimento:**
* 👩‍💻 [Cristhian Mazon](https://github.com/CristhianMazon)
* 👨‍💻 [Djalma Hideki Yamamoto](https://github.com/YH1d3k12)
* 👩‍💻 [Eloize Aiume](https://github.com/ATalDaAiume)

Repositório criado para armazenar o projeto completo da atividade prática de criação de um aplicativo móvel para explorar o consumo de APIs, armazenamento local e navegação.

## 📖 Sobre o Projeto

Este aplicativo foi construído em Flutter com o objetivo de permitir que o utilizador pesquise livros por título, autor ou palavras-chave, visualize informações básicas e detalhadas, e salve os seus favoritos localmente para consulta posterior. O projeto garante uma experiência simples, organizada e funcional, com uma interface responsiva adequada para telas pequenas e médias.

## 📸 Capturas de Ecrã (Screenshots)

Abaixo estão as demonstrações do aplicativo a funcionar em diferentes ecrãs *(substitua pelas imagens reais do seu app)*:

| 🔍 Ecrã de Busca | 📖 Detalhes do Livro | ⭐ Lista de Favoritos |
| :---: | :---: | :---: |
| <img src="https://via.placeholder.com/250x500.png?text=Tela+de+Busca" width="250"> | <img src="https://via.placeholder.com/250x500.png?text=Detalhes+do+Livro" width="250"> | <img src="https://via.placeholder.com/250x500.png?text=Favoritos" width="250"> |

## ✨ Principais Funcionalidades

* **Consulta de Livros:** Integração com uma API pública (ex: Open Library) exibindo nome do livro, autor, capa e um resumo curto.
* **Visão Detalhada:** Tela de detalhes do livro selecionado mostrando editora, ano ou idioma.
* **Gestão de Favoritos:** Funcionalidade para favoritar, visualizar em tela dedicada e remover livros da lista localmente.
* **Feedback de Estado:** Pesquisa com indicador de *loading*, mensagens de erro (falhas de rede ou ausência de dados) e aviso quando não há resultados.
* **Fluxo de Navegação:** Navegação clara estruturada em: busca → detalhes → favoritos.

## 🧠 Escolhas Técnicas e Ferramentas

Para atender aos requisitos do projeto, foram utilizadas as seguintes tecnologias:

1. **Por que foi escolhido o `Flutter` com `Material Design 3`?**
   Para a criação de uma interface limpa, intuitiva e responsiva, garantindo que a aplicação rode de forma estável em dispositivos Android, utilizando componentes visuais elaborados (como *cards* e ícones) com alto nível de reutilização de *widgets*.

2. **Por que foi escolhido o pacote `HTTP`?**
   Responsável pelas requisições à API pública de livros, permitindo receber e tratar adequadamente os dados da internet, além de lidar com os erros de rede e falhas de resposta.

3. **Por que foi escolhido o `SharedPreferences` (ou `SQFlite`)?**
   Para garantir a persistência dos dados entre as execuções do aplicativo. Ele permite que os livros favoritados sejam salvos de forma eficiente e acessados instantaneamente assim que o app é reaberto.

## 🤝 Organização do Trabalho em Equipe

Para garantir a colaboração e atender aos critérios avaliativos, o projeto foi versionado no GitHub com base na criação de *Pull Requests*. As contribuições foram revisadas em grupo antes de integrar ao projeto principal e divididas da seguinte forma:
* **Aluno 1:** Estrutura inicial do app e navegação.
* **Aluno 2:** Integração com a API pública.
* **Aluno 3:** Armazenamento local e favoritos.
* **Aluno 4:** Interface visual, README e ajustes finais.

## 🚀 Como Executar o Projeto

Siga os passos abaixo para rodar o aplicativo no seu ambiente local:

1. Certifique-se de que tem o **Flutter SDK** instalado.
2. Clone este repositório.
3. Acesse a pasta do projeto através do terminal.
4. Execute o projeto usando o comando adequado no terminal, com um emulador Android ou dispositivo físico conectado.

```bash
flutter pub get
flutter run
```
