*** Settings ***
Documentation  Essa suite teste o site da Amazon
Resource   amazon_resources.robot
Test Setup     Abrir o navegador
# Test Teardown  Fechar o navegador



*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Mais vendidos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site dda Amzon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu Mais vendidoS    # Verificar se aparece a frase "Mais vendidos"
    Verificar se aparece a frase "Mais vendidos"
    Verificar se o título da página fica Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon
#     Verificar se aparece a categoria "Computadores e Informática


Caso de teste 02 - "Pesquisa de Produto"
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa listando o produto

Caso de teste 03 - "Pesquisa livro de Harrt Potter"
    [Documentation]    Esse teste busca meu livro favorito
    [Tags]    busca_livro   hp
    Acessar a home page do site Amazon.com.br
    Buscar livro de nome "Harry Potter" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o resultado da pesquisa lista o produto "Harry Potter e a Pedra Filosofal: 1"