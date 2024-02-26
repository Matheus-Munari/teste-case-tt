*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${BOTAO-ENTRAR}    //*[@href="/login"]
${INPUT-USER}    //*[@autocomplete="username"]
${BOTAO-AVANCAR}    //*[text()="Avançar"]
${INPUT-SENHA}    //*[@autocomplete="current-password"]
${BOTAO-LOGIN}    //*[text()="Entrar"]
${ELEMENTO-NOTIFICACOES}    //*[@href="/notifications"]

*** Keywords ***
Quando o usuario clica no botão entrar
    Wait Until Element Is Visible    ${BOTAO-ENTRAR}
    Scroll Element Into View    ${BOTAO-ENTRAR}
    Click Element    ${BOTAO-ENTRAR}
E digita as credenciais corretas
    Wait Until Element Is Enabled    ${INPUT-USER}
    Input Text  ${INPUT-USER}    usuariomatteste
    Click Element    ${BOTAO-AVANCAR}
    Wait Until Element Is Visible    ${INPUT-SENHA}
    Input Text    ${INPUT-SENHA}    teste@1234
    
E aciona o botão de logar
    Click Element    ${BOTAO-LOGIN}

Então devo ser redirecionado para a página inicial do aplicativo
    Element Should Be Visible    ${ELEMENTO-NOTIFICACOES}

Quando o usuario tentar entrar com as credenciais corretas 
    Wait Until Element Is Visible    ${BOTAO-ENTRAR}
    Scroll Element Into View    ${BOTAO-ENTRAR}
    Click Element    ${BOTAO-ENTRAR}
    Wait Until Element Is Enabled    ${INPUT-USER}
    Input Text  ${INPUT-USER}    usuariomatteste
    Click Element    ${BOTAO-AVANCAR}
    Wait Until Element Is Visible    ${INPUT-SENHA}
    Input Text    ${INPUT-SENHA}    teste@1234
    Click Element    ${BOTAO-LOGIN}
    Wait Until Element Is Visible    ${ELEMENTO-NOTIFICACOES}