*** Settings ***

Documentation  Esse teste adiciona itens ao carrinho
Resource      amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador


*** Test Cases ***
#não esquecer JAMAIS


Caso de Teste 01 - Adicionar itens ao carrinho
      [Documentation]  Esse teste adiciona itens ao carrinho
      [Tags]           menus  carinho

      Acessar a home page do site Amazon.com.br
      Buscar livro de nome "Harry Potter" no campo de pesquisa
      Clicar no botão de pesquisa
      Verificar se o resultado da pesquisa lista o produto "Harry Potter e a Pedra Filosofal: 1"
      Adicionar livro de HP Pedra Filosofal no Carrinho

Caso de Teste 02 - Remover itens do carrinho
      [Documentation]  Esse teste adiciona itens ao carrinho
      [Tags]           menus  carinho

      Acessar a home page do site Amazon.com.br
      Buscar livro de nome "Harry Potter" no campo de pesquisa
      Clicar no botão de pesquisa
      Verificar se o resultado da pesquisa lista o produto "Harry Potter e a Pedra Filosofal: 1"
      Adicionar livro de HP Pedra Filosofal no Carrinho
      Remover item do carrinho