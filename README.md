# Projeto Rails bank

## Descrição
O Projeto Rails bank é uma aplicação web que inicialmente consiste em uma API para fornecer serviços de gerenciamento de contas e transações financeiras. No entanto, está em desenvolvimento um frontend completo para interação dos usuários com a plataforma.

## Funcionalidades Principais
- Gerenciamento de contas de usuário
- Realização de transações financeiras
- Interface de usuário para interação e visualização de dados (em desenvolvimento)

## Rotas da API
- `/contas`: Rota para criação e exibição de contas de usuário.
- `/transacoes`: Rota para criação e exibição de transações financeiras.
- `/transferir`: Rota para realizar transferências entre contas.

## Apipie
A documentação da API é gerada utilizando o Apipie, uma ferramenta que facilita a documentação de APIs em Ruby on Rails. O Apipie permite descrever detalhadamente cada endpoint da API, incluindo os parâmetros esperados, exemplos de requisições e respostas, e informações sobre autenticação e autorização.

http://localhost:3000/documentacao

# Configuração do Projeto

## Instruções para configurar e rodar o projeto localmente

### Dependências principais
- Docker (Caso queira utilizar o postgres)
- asdf com plugins do Ruby e Nodejs

### Caso não queira usar asdf
- Ruby 3.1.2
- Rails ~> 7.1.3
- Bundler
- Nodejs 20.5.1
- Yarn
- Postgres ~> 15 ou (docker-compose up -d)

1. Configure o arquivo `.env.development`.
2. Execute o setup do projeto pelo comando `./bin/setup` (ou `RAILS_ENV=production ./bin/setup` para ambiente de produção).
3. Instale as dependências do Node.js com o comando `yarn`.
4. Rode o projeto bin/dev

## Testes

Execute o comando `rspec`.

## Testes de Endpoint
`curl -X POST http://localhost:3000/conta -H "Content-Type: application/json" -d '{"email": "test@example.com", "saldo": 180.37, "name": "Test User"}'`

`curl -X POST http://localhost:3000/api/transferir -H "Content-Type: application/json" -d '{"forma_pagamento": "D", "conta_envio_id": 2, "conta_recebimento_id": 2, "valor": 10}'`
