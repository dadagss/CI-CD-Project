# CI-CD-Project
Projeto de Continuos integration e Continuoes Deployment proporcionado pela RocketSeat, o objetivo deste desafio e criar uma pipeline usando git actions onde eu consiga buildar a minha aplicação, e ela ira checar o repositorio do Github, logar nas credenciais da AWS, entrar nas credenciais do ECR, montar e postar a imagem, e a partir dessa imagem vai subir 2 maquinas em ambientes diferentes (Dev e Prod), o intuito deste projeto foi fazer diversos testes e aprender com um desafio bem pratico sobre o ambiente de desenvolvimento de pipelines, acredito que o resultado foi bem satisfatorio e muito desafiador


## Índice
- [CI-CD-Project](#ci-cd-project)
  - [Índice](#índice)
  - [Visão Geral](#visão-geral)
  - [Requisitos](#requisitos)
  - [Estrutura do Projeto](#estrutura-do-projeto)
  - [Como executar](#como-executar)
  - [Recursos Criados](#recursos-criados)
  - [Conclusão e Desafios](#conclusão-e-desafios)
  - [Referências](#referências)

## Visão Geral
Este projeto visa demonstrar a criação de uma Pipeline usando Git Action

A solução cria os seguintes recursos:
- Apprunner (ambiente Dev)
- Apprunner (ambiente Prod)
- Uma imagem ECR
- Algumas IAM's com permissões restritivas para maior segurança

## Requisitos
- Conta AWS com permissões para criação de ECR e Apprunner
- [Terraform instalado](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- [Git](https://git-scm.com/downloads)

## Estrutura do Projeto
```bash
CI-CD-Project/
├── .github/
│   └── workflows/
│       └── ci.yml
├── .terraform/
│   └── providers/
├── node_modules/
├── terraform/
│   ├── dev/
│   │   ├── .terraform/
│   │   ├── .terraform.lock.hcl
│   │   ├── dev.tfvars
│   │   ├── main.tf
│   │   ├── terraform.tfstate
│   │   └── variables.tf
│   ├── prod/
│   │   ├── main.tf
│   │   ├── prod.tfvars
│   │   └── variables.tf
│   └── modules/
│       └── apprunner/
│           ├── .terraform/
│           ├── .terraform.lock.hcl
│           ├── apprunner.tfvars
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
├── .gitignore
├── .releaserc
├── .terraform.lock.hcl
├── CHANGELOG.md
├── Dockerfile
├── ecr.tf
├── iam.tf
├── index.js
├── package-lock.json
├── package.json
└── README.md
```

## Como executar
1. Clone este repositório:
```bash
git clone https://github.com/dadagss/Iac-project-rocketseat.git
```

2. Adicione os arquivos ao Git:
```bash
git add .
```

3. git commit -m "Mensagem que você deseja passar no commit":
```bash
git commit -m "mensagem"
```

4. Git push:
```bash
Git push
```

obs. É importante que você configure as roles e os secrets para que o codigo funcione, no codigo iam.tf ja temos elas configuradas e basta aplica-las manualmente Sem contar que há partes do codigo que foram direcionadas para este repositorio, lembre-se de fazer as alterações necessárias

## Recursos Criados

**AppRunner (Dev e Prod):**: Dois ambientes de execução no AWS AppRunner, um para desenvolvimento e outro para produção.

**IAM**: Roles específicas para garantir a segurança e permissões restritivas.

**ECR**: Elastic Container Registry para armazenar as imagens Docker.

**Pipeline Ci.YML**: Pipeline automatizada usando GitHub Actions para build, teste e deploy.

## Conclusão e Desafios
Este projeto foi um grande desafio, mas também uma excelente oportunidade para aprender sobre automação de pipelines, infraestrutura como código com Terraform e integração contínua com GitHub Actions. Apesar das dificuldades, o resultado final foi muito satisfatório e trouxe um grande aprendizado.

## Referências

- [Documentação do Terraform](https://www.terraform.io/docs)
- [Github MarketPlace](https://github.com/marketplace?query=node+js&type=actions)

