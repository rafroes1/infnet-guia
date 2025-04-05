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

### Projeto é um fork do colega de classe com ajustes no dockerfile para adicionar o HEALTHCHECK que simula o readness do k8 no docker swarm.

### Deployment file também foi adicionado e ajustado para que a esteira rode corretamente no github action.

### Toda e qualquer outra explicação do projeto se encontra no PDF entregável do projeto.