*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    XML
Resource    ../resources/main.robot


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
    Wait Until Element Is Visible    ${BOTAO-NOVA-POSTAGEM}
    Click Element    ${BOTAO-NOVA-POSTAGEM}

E escrever uma nova postagem
    Wait Until Element Is Visible    ${BOTAO-POSTAR}
    ${DATA-HORA}    Execute Javascript     return new Date().toLocaleString()
    Set Global Variable    ${MENSAGEM-POST}    Teste de postagem de foto. Data e hora:${DATA-HORA}  
    Set Global Variable    ${ULTIMA-POSTAGEM}     //*[text()="${MENSAGEM-POST}"]
    Input Text    ${AREA-POSTAGEM}    ${MENSAGEM-POST}
E clicar no botao de postar
    Wait Until Element Is Visible    ${BOTAO-POSTAR}
    Click Element    ${BOTAO-POSTAR}

Então deverá aparecer uma notificação confirmando a postagem
    Wait Until Element Is Visible    ${NOTIFICACAO-POST}
    Element Should Be Visible    ${NOTIFICACAO-POST}

E vai até o seu perfil
    Wait Until Element Is Visible    ${PERFIL}
    Click Element    ${PERFIL}
    #Input Text    ${INPUT-BUSCA}    usuariomatheusteste
    #Press Keys    none     ENTER
    #Wait Until Element Is Visible    ${PERFIL}
    #Click Element    ${PERFIL}

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

E adicionar uma foto a ser postada 
    Wait Until Element Is Visible    ${BOTAO-POSTAR}
    Choose File    ${BOTAO-MIDIA}    C:\\Users\\v8\\Desktop\\projeto-teste-twitter\\teste-case-tt\\resources\\Imagens\\2150829065.jpg
    Sleep    2s

Então a postagem deve constar no perfil do usuario
    Wait Until Element Is Enabled    ${PERFIL}
    Click Element    ${PERFIL}
    Wait Until Element Is Visible    ${BOTAO-EDITAR-PERFIL}
    Log To Console    ${ULTIMA-POSTAGEM}
    Sleep    1s
    Scroll Element Into View    ${USER-NAME-PERFIL}
    Element Should Be Visible    ${ULTIMA-POSTAGEM}

E tentar postar uma mensagem sem digitar nada 
    Wait Until Element Is Visible    ${BOTAO-POSTAR}
    Input Text    ${AREA-POSTAGEM}    ${POST-EM-BRANCO}

Então o botao de postagem deve estar inativo, impedindo a postagem
    Element Attribute Value Should Be    ${BOTAO-POSTAR}    aria-disabled    true

E curta uma postagem
    Wait Until Element Is Visible    ${BOTAO-CURTIR}
    Click Element    ${BOTAO-CURTIR}

E vai ate a aba de likes
    Wait Until Element Is Visible    ${ABA-LIKES}
    Click Element    ${ABA-LIKES}