*** Settings ***

Library           SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_MAIS_VENDIDOS}    //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${HEADER_MAIS_VENDIDOS}    //span[contains(@class,'a-size-extra-large a-color-base _p13n-zg-banner-landing-page-header_style_zgLandingPageBannerText__3HlJo')]
${TEXTO_HEADER_MAIS_VENDIDOS}    Mais vendidos
# ${TITULO}    Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon
${ELETRONICO}    //a[@href='/gp/bestsellers/electronics/ref=zg_bs_nav_0'][contains(.,'Eletrônicos')],
${X_BOX}    Xbox Series X
${CAMPO_PESQUISA}    //input[contains(@type,'text')]
${BTN_SUBMIT}    //input[contains(@type,'submit')]
${LIVRO_HARRY_POTTER}    harry potter e a pedra filosofal

*** Keywords ***
Abrir o navegador
    Open Browser   ##browser=firefox  options=add_experimental_option("detach", True)
    ##Maximize Browser Window

Fechar o navegador
    Close Browser
    Capture Page Screenshot

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_MAIS_VENDIDOS}

Entrar no Menu Mais Vendidos
    Click Element   locator=${MENU_MAIS_VENDIDOS}

Verificar se aparece a frase "Mais vendidos"
    Wait Until Page Contains    text=${TEXTO_HEADER_MAIS_VENDIDOS}
    Wait Until Element Is Visible    locator=${HEADER_MAIS_VENDIDOS}


Verificar se o título da página fica ${TITULO}
    Title Should Be    title=${TITULO}

Digitar o nome de produto ${produto} no campo de pesquisa
    Click Element    locator=//input[contains(@type,'text')]
    Input Text    locator=${CAMPO_PESQUISA}    text=${X_BOX}

Clicar no botão de pesquisa
    Click Button    locator=${BTN_SUBMIT}


Verificar se o título da página eh ${TITULO_Xbox}
    Title Should Be    title={TITULO_Xbox}

Verificar o resultado da pesquisa listando o produto
    Wait Until page Contains    text=${X_BOX}


Buscar livro de nome ${produto} no campo de pesquisa
    Click Element    locator=//input[contains(@type,'text')]
    Input Text    locator=${CAMPO_PESQUISA}    text=${LIVRO_HARRY_POTTER}

Verificar se o resultado da pesquisa lista o produto "${LIVRO}"
    Wait Until Element Is Visible    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${LIVRO}')])[1]


################################ GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica Amazon.com.br | Tudo pra você, de A a Z.

Quando acessar o menu "Mais Vendidos"
    Entrar no Menu Mais Vendidos

Então o título da página deve ficar Mais Vendidos | Amazon.com.br"
    Verificar se aparece a frase "Mais vendidos"

Quando pesquisar pelo produto "Xbox Series X"
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series X" no campo de pesquisa
    Clicar no botão de pesquisa

Então o produto da linha "Xbox Series X" deve ser mostrado na página
    Verificar o resultado da pesquisa listando o produto

Adicionar livro de HP Pedra Filosofal no Carrinho
    Click Element    locator=//img[@data-image-index='1']
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]
    Element Should Be Enabled    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Clicar no livro e adicionar no Carrinho
    Adicionar livro de HP Pedra Filosofal no Carrinho

