# marvel_deck

App para desafio Find Soluctions

Link do APK do APP: https://drive.google.com/file/d/1zfB_NgK7wyNqdAahyTZTav5B1e4RPz6Z/view?usp=sharing
<p float="left">
<img src="https://user-images.githubusercontent.com/57848633/180387998-8ec40245-9dd9-42c7-a097-334643df22f4.jpg" width="200">  
<img src="https://user-images.githubusercontent.com/57848633/180388002-5adb7956-a39a-4438-95ee-221be6f2eaff.jpg" width="200">  
<img src="https://user-images.githubusercontent.com/57848633/180388004-85a775c7-9ba6-461d-9987-fd76ad1cb6a9.jpg" width="200">  

</p>
# Documentação

Olá! você está no projeto MarvelDeck, um app feito para um desafio proposto pela empresa Find Soluções, aqui você vai encontrar tudo que precisa saber sobre o projeto, desde a sua estrutura, tecnologias e recursos.

* Tecnologias e Recursos
  - Flutter
  - Flutter Modular
  - Dio
  - Listagem dos personagem da marvel
  - Visualização das informações dos personagens
  - Search de personagens


* Estrutura:
  - Para a estrutura do projeto decidi utilizar o Flutter modular e o Repository patern assim facilitando na criando singletons utilizados por todo o app, além de separar as requisições por arquivos com contratos assim centralizando todas as informações das requisições.
* Controle de estado:
  - Para o controle do estado de cada widget na tela o Mobx cuida de atualizar somente o widget necessário para cada momento assim otimizando o gasto de processamento.
* Requisições:
  - Para as requisições externas o projeto utiliza o package Dio que permite fazer as requisições de forma simples e descomplicadas.
