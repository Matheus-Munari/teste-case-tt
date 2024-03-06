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
${PERFIL}    //*[@href="/usuariomatteste"]
${ULTIMO-POST}    //*[@data-testid="tweet"]
${BOTAO-OPCAO-POST}    //div[@data-testid="primaryColumn"]//*[contains(@aria-label, "More")]
${BOTAO-DELETE-POST}    //*[text()="Delete"]
${NOTIFICACAO-DELETE-POST}    //*[text()="Your post was deleted"]
${BOTAO-MENSAGENS}    //*[@data-testid="AppTabBar_DirectMessage_Link"]
${INPUT-NOVA-MENSAGEM}    //*[@data-testid="dmComposerTextInput_label"]
${CONVERSA}    //*[@data-testid="conversation"]
${MENSAGEM-TESTE}    "Teste de nova mensagem"
${ULTIMA-MENSAGEM}    ""



*** Keywords ***
E insere um nome de usuário na barra de pesquisa
    Wait Until Element Is Visible    ${INPUT-BUSCA}
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

E vai até o seu perfil
    Input Text    ${INPUT-BUSCA}    usuariomatheusteste
    Press Keys    none     ENTER
    Wait Until Element Is Visible    ${PERFIL}
    Click Element    ${PERFIL}

E clica na ultima postagem
    Wait Until Element Is Visible    ${ULTIMO-POST}
    Click Element    ${ULTIMO-POST}

E abre as opções do post 
    Wait Until Element Is Visible    ${BOTAO-OPCAO-POST}
    Click Element    ${BOTAO-OPCAO-POST} 

E clica no botão delete
    Wait Until Element Is Visible    ${BOTAO-DELETE-POST}
    Click Element    ${BOTAO-DELETE-POST}

E confirmar a exclusão do post 
    Wait Until Element Is Visible    ${BOTAO-DELETE-POST}
    Click Element    ${BOTAO-DELETE-POST}

Então deverá aparecer uma notificação confirmando a exclusão
    Wait Until Element Is Visible    ${NOTIFICACAO-DELETE-POST}
    Element Should Be Visible    ${NOTIFICACAO-DELETE-POST}
    Sleep    2s

E clica no icone de mensagens
    Wait Until Element Is Visible    ${BOTAO-MENSAGENS}
    Click Element    ${BOTAO-MENSAGENS}

E envia uma nova mensagem 
    Wait Until Element Is Visible    ${CONVERSA}
    Click Element    ${CONVERSA}
    Wait Until Element Is Visible    ${INPUT-NOVA-MENSAGEM}
    Click Element    ${INPUT-NOVA-MENSAGEM}
    ${DATA-HORA}    Execute Javascript     return new Date().toLocaleString()
    Set Global Variable    ${MENSAGEM-TESTE}    Teste de nova mensagem. Data e hora:${DATA-HORA}  
    Set Global Variable    ${ULTIMA-MENSAGEM}     //*[text()="${MENSAGEM-TESTE}"]
    Press Keys    None       ${MENSAGEM-TESTE}
    Press Keys    None     ENTER
    Sleep    2s

Então a mensagem enviada deve constar na conversa 
    
    Wait Until Element Is Visible    ${ULTIMA-MENSAGEM}