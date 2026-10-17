# Devnology Store Challenge

Personal implementation of a Flutter store challenge, with product and cart modules, dependency injection and automated test files.

## Project scope

A study or technical-challenge implementation from its original development period. It is shared as a portfolio reference; the original implementation and commit history are preserved.

## Stack and SDK

- Flutter and Dart.
- Main declared packages: `google_fonts`, `get_it`, `flutter_svg`.
- Dart SDK constraint from `pubspec.yaml`: `>=2.17.6 <3.0.0`.

Use a Flutter release with a Dart SDK inside that range. Dependency modernization is a separate change from publishing this historical example.

## Run

```bash
flutter pub get
flutter run
```

## Tests

The repository contains 15 Dart test files matching `*_test.dart`. Run the existing suite with a compatible SDK:

```bash
flutter test
```

Test files are learning artifacts; their presence is not a claim that they have passed on a current Flutter release.

## Original project notes

## Layout

![WhatsApp-Video-2022-07-28-at-17 25 48](https://user-images.githubusercontent.com/91624613/181631264-27551faa-7926-4905-a164-8655c64a57ab.gif)

## Definição e Padrões de Projetos

# Flutter Version
A Versão do flutter que é utilizada neste projeto foi a 3.0.5.

# Apresentão geral da Arquitetura
O sistema foi dividido de forma modular, esses mesmo modulos podem conter submodules e cada modulo contém seu proprio sistema de arquitetura, cujo o utilizado neste projeto foi o Clean Dart.

![](https://user-images.githubusercontent.com/53379557/175559723-dafd93a1-2420-46c5-b1e7-ac814bcf4f2e.png)

# Composite pattern (Container)

Baseado no design pattern Composite apliquei um padrão de roteamento.

![](https://miro.medium.com/max/1200/1*87h2uhCJ5qztBNwfck2b6g.jpeg)

#Dependency inversion principle (DiP)

Pensando na manutenibilidade e desacoplamento, apliquei o princípio do DiP, um dos princípios do SOLID, onde as classes devem seguir uma interface (abstração) e serem uma implementação dessa interface e outras classes não devem depender da implementação e sim da interface.

# Service pattern

Utilize design pattern Service tanto para implementar as interfaces do HttpClient fazer a comunicação.

# Routers 

Baseado no sistema de rotas do Modular e Nuvigator, apliquei um padrão de sistema de roteadores, em suas respctivas camadas, no Core vai ter um Router principal para fazer a comunicação e roteamento entre os módulos, e dento de cada modulo vou ter respectivos roteadores, no caso MovieRouter, a qual tem a responsabilidade de fazer um roteamento interno no modular chamando Containers como HomeContainer ou Routes como DetailRoute, a qual chama o DetailPage, com a necessidade de passagem de Argumentos entre esses Widgets, fiz uma classe DetailArguments para fazer a passagem de múltiplos argumentos e poder ter maior controle de tipagem.

# Tratamento de Erros 

Como um dos aspectos mais importante durante o desenvolvimento de software, fiz o tratamento de error em suas respctivas camadas com classes criadas denominando possibilidades de erros e suas respctivas necessidades.

# Testes Unitários 

Para verificar o comportamento das unidades na aplicação e manter um desenvolvimento conciso e com maior quantidade de tratamento de erros e exceções apliquei testes unitários utilizando mocks para não criar dependência de dados externos.

## Attribution

Original project notes and any third-party credits are retained. Third-party services, assets and dependencies remain subject to their respective terms and licenses.
