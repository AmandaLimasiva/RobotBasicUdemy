*** Settings ***
Documentation  Essa suite teste o site da Amazon
Resource   amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador



*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Mais vendidos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site dda Amzon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Mais Vendidos"
    Então o título da página deve ficar Mais Vendidos | Amazon.com.br"



Caso de teste 02 - "Pesquisa de Produto"
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series X"
    Então o produto da linha "Xbox Series X" deve ser mostrado na página
