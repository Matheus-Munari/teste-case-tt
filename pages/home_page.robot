*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${INPUT-BUSCA}    //*[@placeholder="Search"]
${BUSCAR-USER}    //*[text()="Marcelo Bechler"]
${USUARIO-BUSCADO}    //*[@href="/marcelobechler"] 
${BOTAO-NOVA-POSTAGEM}    //*[@href="/compose/post"]
${JANELA-POST}    //*[text()="What is happening?!"]
${BOTAO-POSTAR}    //*[text()="Post"]
${NOTIFICACAO-POST}    //*[text()="Your post was sent."]


*** Keywords ***
E insere um nome de usuário na barra de pesquisa
    Input Text    ${INPUT-BUSCA}    Marcelo Bechler

E confirma a busca
    Wait Until Element Is Visible    ${BUSCAR-USER}
    Press Keys    none    ENTER
    
Então o usuário buscado deve aparecer no topo da página
    Wait Until Element Is Visible    ${USUARIO-BUSCADO}
    Element Should Be Visible    ${USUARIO-BUSCADO}

E clicar no botão de nova postagem
    Click Element    ${BOTAO-NOVA-POSTAGEM}

E escrever uma nova postagem
    Wait Until Element Is Visible    ${BOTAO-POSTAR}
    ${DATA-HORA}    Execute Javascript     return new Date().toLocaleString()
    Press Keys    None    Data do teste ${DATA-HORA}   

E clicar no botao de postar
    Click Element    ${BOTAO-POSTAR}

Então deverá aparecer uma notificação confirmando a postagem
    Wait Until Element Is Visible    ${NOTIFICACAO-POST}
    Element Should Be Visible    ${NOTIFICACAO-POST}