# Overview

Essa é uma aplicação para gerenciar seus estudos no Infnet


## Getting Started

### Docker

A aplicação está configura para rodar com Docker e Docker Compose. Se você não possui o docker engine instalado, siga o tutorial de instalação na [documentação oficial](https://docs.docker.com/get-started/get-docker/).

Após instalar o docker engine:
```
# Rode esse comando se pretende rodar a aplicação em production mode
docker-compose up

# Rode esse comando se pretende rodar a aplicação em development mode
# Nesse modo o desenvolvedor tem acesso a hotreload feature
docker-compose up -f docker-compose.development.yaml
```