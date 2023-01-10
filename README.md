# Desafio Full Cycle - Docker

Criar uma imagem Docker para rodar a aplicação Go, com menos de 2MB.

O código desse desafio é baseado no exemplo ping do [Docker Language Guide](https://docs.docker.com/language/golang/).


Primeiro passo, copiei o exemplo do docker. A imagem resultante ficou com aproximadamente 20MB.

Então fui atras de outros exemplos e li um pouco mais sobre as "distroless images" do Google. Seguindo o exemplo [desse repositório](https://github.com/GoogleContainerTools/distroless/tree/main/examples/go), com isso consegui reduzir o tamanho da imagem para 8.8MB.

Depois usei a imagem do scratch, que é a mais leve possível, e consegui reduzir para 6.45MB.

Não estava vendo saída, então fui no discord para ver o que o pessoal falava sobre, e descobri que poderíamos usar as flags -ldflags "-s -w" para reduzir o tamanho do binário. Então, adicionei essas flags no Makefile e consegui reduzir para 4.5MB.

No final, vi que não estava fazendo o desafio corretamente. Eu estava tentando criar um webserver que retornava uma pagina html, mas não era isso que o desafio pedia. Então, reescrevi a aplicação go, removendo os pacotes e tudo mais que era necessário para o webserver, e com isso reduzi o tamanho da imagem para 1.22MB.


## link do repositório

https://hub.docker.com/r/capaci/fc-docker-go


Para rodar diretamente do docker hub, basta rodar `docker run capaci/fc-docker-go`
