# Rede Social

Aplicação *mobile* desenvolvida com Flutter para simular uma rede social consumindo uma *API* que apresenta publicações e comentários.

## Screenchots do Aplicativo
[![Screenshots do APP.](https://i.imgur.com/Lo8kcRZ.jpg "Screenshots do APP.")](https://i.imgur.com/Lo8kcRZ.jpg "Screenshots do APP.")
> Imagens das 3 páginas do aplicativo.

## Tecnologias utilizadas:

#### API
- [API de Posts](https://jsonplaceholder.typicode.com/posts)
- [API de Comentários](https://jsonplaceholder.typicode.com/comments)

#### Gerenciamento de Estado Flutter
- [MobX](https://pub.dev/packages/mobx)

#### Arquitetura Modular e Roteamento
- [Flutter Modular](https://pub.dev/packages/flutter_modular)

#### Cliente HTTP para consumo de API
- [Dio](https://pub.dev/packages/dio)

#### CLI para auxiliar no desenvolvimento
- [Slidy](https://pub.dev/packages/slidy)

## Arquitetura
O projeto é composto por dois módulos: o *app_module* é responsável apenas por iniciar a homepage e direcionar o usuário para o módulo de posts. O *PostsModule* é composto por cinco artefatos: 
- *posts_module*: módulo de controle do *flutter modular*;
- *posts_repository_interface*: interface do repositório de *posts* com as funções que deverão ser implementadas;
- *posts_repository*: classe que realiza o consumo da *API* com o cliente *HTTP Dio*.
- *posts_controller*:  classe que desenvolve o controle de estado com o pacote *MobX* implementando os *observers* e as *actions*;
- *posts_page*: widget que lista as publicações registradas na API e quando um post é clicado, direciona o usuário para os respectivos comentários;
- *comments_page*: *widget* que lista os comentários de um determinado post.

Além dos artefatos do módulo, existem ainda as pastas *models* e shared.
- *Models*: contém os esquemas das duas entidades do sistema: *Posts* e *Comments*. Possui também funções para preparar os dados que são recebidos em formato *JSON*;
- *Shared*: contém arquivos que podem ser compartilhados em toda a aplicação. Nesse caso, existe uma classe com a *URL* base para a *API* que está sendo consumida.

## Procedimento para testar
 Com o Flutter instalado em sua máquina, ao abrir o projeto, para baixar as dependências usadas no projeto basta executar:

`$ flutter pub get`

Para executar em um emulador ou dispositivo, execute o comando:

`$ flutter run`