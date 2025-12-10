# 🎬 Modelagem de Dados em Grafos — Serviço de Streaming

Este projeto demonstra um modelo de dados em grafo para um serviço de streaming, implementado com Cypher para Neo4j.

## Nós e Relacionamentos

O modelo é composto pelos seguintes tipos de nós e relacionamentos:

### Nós

*   **User**: Representa um usuário do serviço.
    *   Propriedades: `userId`, `name`
*   **Actor**: Representa um ator.
    *   Propriedades: `actorId`, `name`
*   **Director**: Representa um diretor.
    *   Propriedades: `directorId`, `name`
*   **Movie**: Representa um filme.
    *   Propriedades: `movieId`, `title`, `year`
*   **Series**: Representa uma série.
    *   Propriedades: `seriesId`, `title`, `year`
*   **Genre**: Representa um gênero de filme ou série.
    *   Propriedades: `name`

### Relacionamentos

*   `[:WATCHED]`: Conecta um `User` a um `Movie` ou `Series` que ele assistiu.
    *   Propriedade: `rating` (avaliação do usuário)
*   `[:IN_GENRE]`: Conecta um `Movie` ou `Series` a um `Genre`.
*   `[:ACTED_IN]`: Conecta um `Actor` a um `Movie` ou `Series` em que atuou.
*   `[:DIRECTED]`: Conecta um `Director` a um `Movie` ou `Series` que dirigiu.

## Modelo Conceitual

O diagrama de modelo conceitual pode ser visualizado no Excalidraw através do seguinte link:

[https://excalidraw.com/#json=DdquWj211tIwxVLOVk54l,yyi6uDsuGRDDxZFEuNBvdw](https://excalidraw.com/#json=DdquWj211tIwxVLOVk54l,yyi6uDsuGRDDxZFEuNBvdw)

## Como Usar

Para popular o banco de dados Neo4j com os dados deste projeto, execute o script `streaming_data.cypher`. Este script irá:

1.  Criar as restrições (constraints) para garantir a unicidade dos nós.
2.  Criar os nós de `Genre`.
3.  Criar os nós de `User`, `Actor`, `Director`, `Movie` e `Series`.
4.  Criar os relacionamentos entre os nós.

Após executar o script, você terá um banco de dados Neo4j populado com os dados do serviço de streaming.
Para visualizar o grafo, execute o seguinte comando no Neo4j:
```cypher
MATCH (n) RETURN n;
```

Você pode executar o script no Neo4j Browser ou usando o `cypher-shell`.
