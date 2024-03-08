*** Settings ***
Library    SeleniumLibrary
Library    XML
*** Variables ***
${BOTAO-ENTRAR}    //*[@href="/login"]
${INPUT-USER}    //*[@autocomplete="username"]
${BOTAO-AVANCAR}    //*[text()="Avançar"]
${INPUT-SENHA}    //*[@autocomplete="current-password"]
${ELEMENTO-NOTIFICACOES}    //*[@href="/notifications"]
${USUARIO-CORRETO}    usuariomatteste
${SENHA-CORRETA}    teste@1234
${USUARIO-ERRADO}    testeusererrado
${SENHA-ERRADA}    senhaErrada
${NOTIFICACAO-USUARIO-NAO-ENCONTRADO}    //*[text()="Desculpe, mas não encontramos sua conta."]
${NOTIFICACAO-SENHA-INCORRETA}    //*[text()="Senha incorreta."]
${USUARIO-VAZIO}
${SENHA-VAZIA}
${BOTAO-OCULTAR-SENHA}    //*[@aria-label="Ocultar senha"]
${BOTAO-LOGIN}    //*[@data-testid="LoginForm_Login_Button"]
${INPUT-USER-LOGIN-POR-EMAIL}    //*[@data-testid="ocfEnterTextTextInput"]

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
    Input Text  ${INPUT-USER}    ${USUARIO-CORRETO}
    Click Element    ${BOTAO-AVANCAR}
    Wait Until Element Is Visible    ${INPUT-SENHA}
    Input Text    ${INPUT-SENHA}    ${SENHA-CORRETA}
    Click Element    ${BOTAO-LOGIN}
    Wait Until Element Is Visible    ${ELEMENTO-NOTIFICACOES}

Quando o usuario tentar entrar com o usuario errado
    Wait Until Element Is Visible    ${BOTAO-ENTRAR}
    Scroll Element Into View    ${BOTAO-ENTRAR}
    Click Element    ${BOTAO-ENTRAR}
    Wait Until Element Is Enabled    ${INPUT-USER}
    Input Text  ${INPUT-USER}    ${USUARIO-ERRADO}
    Click Element    ${BOTAO-AVANCAR}

Então o usuário deverá ser impedido de entrar no aplicativo
    Wait Until Element Is Visible    ${NOTIFICACAO-USUARIO-NAO-ENCONTRADO}
    Element Should Be Visible    ${NOTIFICACAO-USUARIO-NAO-ENCONTRADO}

Quando o usuario tentar entrar com a senha incorreta
    Wait Until Element Is Visible    ${BOTAO-ENTRAR}
    Scroll Element Into View    ${BOTAO-ENTRAR}
    Click Element    ${BOTAO-ENTRAR}
    Wait Until Element Is Enabled    ${INPUT-USER}
    Input Text  ${INPUT-USER}    ${USUARIO-CORRETO}
    Click Element    ${BOTAO-AVANCAR}
    Wait Until Element Is Visible    ${INPUT-SENHA}
    Input Text    ${INPUT-SENHA}    ${SENHA-ERRADA}
    Click Element    ${BOTAO-LOGIN}

Então o usuario será impedido de acessar a conta e uma notificação aparecerá
    Wait Until Element Is Visible    ${NOTIFICACAO-SENHA-INCORRETA}
    Element Should Be Visible    ${NOTIFICACAO-SENHA-INCORRETA}

Quando o usuario não preencher o nome de usuario
    Wait Until Element Is Visible    ${BOTAO-ENTRAR}
    Scroll Element Into View    ${BOTAO-ENTRAR}
    Click Element    ${BOTAO-ENTRAR}
    Wait Until Element Is Enabled    ${INPUT-USER}
    Input Text  ${INPUT-USER}    ${USUARIO-VAZIO}
    Click Element    ${BOTAO-AVANCAR}

Quando o usuario tentar entrar com a senha vazia
    Wait Until Element Is Visible    ${BOTAO-ENTRAR}
    Scroll Element Into View    ${BOTAO-ENTRAR}
    Click Element    ${BOTAO-ENTRAR}
    Wait Until Element Is Enabled    ${INPUT-USER}
    Input Text  ${INPUT-USER}    ${USUARIO-CORRETO}
    Click Element    ${BOTAO-AVANCAR}
    Wait Until Element Is Visible    ${INPUT-SENHA}
    Input Text    ${INPUT-SENHA}    ${SENHA-VAZIA}

Então o botao de entrar devera estar intivo, impedindo o login
    # ${ID}   SeleniumLibrary.Get Element Attribute    ${BOTAO-LOGIN}    aria-disabled
    # Log To Console    Antes da senha: ${ID}
    # Input Text    ${INPUT-SENHA}    ola
    # ${ID2}    SeleniumLibrary.Get Element Attribute    ${BOTAO-LOGIN}    aria-disabled
    # Log To Console    Depois da senha: ${ID2}
    Element Attribute Value Should Be    ${BOTAO-LOGIN}    aria-disabled    true
    # Element Attribute Value Should Be    ${BOTAO-LOGIN}    tabindex    -1

Quando o usuario tentar logar com o email
    Wait Until Element Is Visible    ${BOTAO-ENTRAR}
    Scroll Element Into View    ${BOTAO-ENTRAR}
    Click Element    ${BOTAO-ENTRAR}
    

E preencher o nome de usuario certo 
    Wait Until Element Is Enabled    ${INPUT-USER}
    Input Text  ${INPUT-USER}    matheusmunari00@gmail.com
    Click Element    ${BOTAO-AVANCAR}
    Wait Until Element Is Visible    ${INPUT-USER-LOGIN-POR-EMAIL}
    Input Text    ${INPUT-USER-LOGIN-POR-EMAIL}    ${USUARIO-CORRETO}
    Press Keys    none     ENTER
    Sleep    2s

E preencher a senha correta
    Wait Until Element Is Visible    ${INPUT-SENHA}
    Input Text    ${INPUT-SENHA}    ${SENHA-CORRETA}

E apertar "Enter"
    Press Keys    none     ENTER

Então o usuario devera ser redirecionado para a pagina inicial
    Wait Until Element Is Visible    ${ELEMENTO-NOTIFICACOES}
    Element Should Be Visible    ${ELEMENTO-NOTIFICACOES}