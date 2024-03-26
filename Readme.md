
Desafio 02:
O objetivo inicial é criar uma imagem com o build da aplicação flask. 
A aplicação gerador de senhas, depende de um redis para a sua execução.

A ideia principal é praticar os conceitos do docker, permitindo
a comunicação entre dois serviços, sem fazer o uso do docker-compose.

Como executar a aplicação após o build da imagem:
```bash
docker network create --attachable giropopus
docker run --env "REDIS_HOST=redis" --name giropops-senhas -p 5000:5000 --rm --network giropopus linuxtips-giropop
docker run -d --network dbd69a54913b -p 6379:6379 --name redis redis
```


Desafio 03:
Executar a aplicação utilizando a imagem python:latest e não mais a de desenvolvimento.
Para tal, foi utilizado o multistage. Foi adicionado um docker-compose ao repositório, para facilitar 
o processo de execução da aplicação.
