*** Settings ***

Library           SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_MAIS_VENDIDOS}    //a[@href='/gp/bestsellers/?ref_=nav_cs_bestsellers'][contains(.,'Mais Vendidos')]
${HEADER_MAIS_VENDIDOS}    //span[contains(@class,'a-size-extra-large a-color-base _p13n-zg-banner-landing-page-header_style_zgLandingPageBannerText__3HlJo')]
${TEXTO_HEADER_MAIS_VENDIDOS}    Mais vendidos
# ${TITULO}    Amazon.com.br Mais Vendidos: Os itens mais populares na Amazon
${ELETRONICO}    //a[@href='/gp/bestsellers/electronics/ref=zg_bs_nav_0'][contains(.,'Eletrônicos')],


*** Keywords ***
Abrir o navegador
    Open Browser   browser=chrome  options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Close Browser

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
