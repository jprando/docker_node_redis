## make

exibira os comando possiveis e uma descricao deles

```sh
Usage:
  make <target>
  help             Display this help

Bruno F DalCol
  setup            preparar pasta node_modules
  clean            limpa o ambiente

Docker Redis
  run_redis        iniciar o container redis-srv
  stop_redis       parar o container redis-srv
  _rm_redis        destroi o container redis-srv

Docker Node Pub
  run_pub          inciar o container pub-node-srv
  stop_pub         parar o container pub-node-srv
  _rm_pub          destroi o container pub-node-srv

Docker Node Sub
  run_sub          iniciar o container sub-node-srv
  stop_sub         parar o container sub-node-srv
  _rm_sub          destroi o container sub-node-srv

```

## make setup

prepara para rodar o sistema, este comando deve ser executado antes dos outros

## make run_sub

iniciar o processo subscribe que ao receber uma mensagem exibe no console o conteudo dela

## make run_pub

iniciar o processo que fica mandando mensagens de 1 em 1 segundo