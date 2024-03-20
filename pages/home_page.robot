*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    XML
Library    String
Library    Collections
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
    Set Global Variable    ${MENSAGEM-POST}    Teste de nova postagem. Data e hora:${DATA-HORA}  
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
    Wait Until Element Is Visible    ${INPUT-NOVA-MENSAGEM}
    Click Element    ${INPUT-NOVA-MENSAGEM}
    ${DATA-HORA}    Execute Javascript     return new Date().toLocaleString()
    Set Global Variable    ${MENSAGEM-TESTE}    Teste de nova mensagem. Data e hora:${DATA-HORA}  
    Set Global Variable    ${ULTIMA-MENSAGEM}     //div[@data-testid="tweetText"]//*[text()="${MENSAGEM-TESTE}"]
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

E verifica se a postagem curtida esta la
    Wait Until Element Is Visible    ${ULTIMA-POSTAGEM}
    Element Should Be Visible    ${ULTIMA-POSTAGEM}

E reposte esse post 
    Wait Until Element Is Visible    ${BOTAO-RETWEET-ANTES}
    Click Element    ${BOTAO-RETWEET-ANTES}
    Wait Until Element Is Visible    ${BOTAO-CONFIRMAR-RETWEET}
    Click Element    ${BOTAO-CONFIRMAR-RETWEET}

Então o botao de repostar deve mudar de cor, indicando a repostagem
    Wait Until Element Is Visible    ${BOTAO-RETWEET-DEPOIS}
    Element Should Be Visible    ${BOTAO-RETWEET-DEPOIS}

E pesquisar uma hashtag na barra de pesquisa 
    Wait Until Element Is Visible    ${INPUT-BUSCA}
    Click Element    ${INPUT-BUSCA}
    Press Keys    none    ${TESTE}
    Press Keys    none    ENTER

Então a primeira postagem deve conter a hashtag procurada
    Wait Until Element Is Visible    ${BOTAO-ULTIMAS-PESQUISA}
    Sleep    2s
    Scroll Element Into View    ${TEXTO-POSTAGEM}
    ${GET-TEXTO}    Get Text    ${TEXTO-POSTAGEM}
    Log To Console    ${GET-TEXTO}
    Element Should Contain    ${TEXTO-POSTAGEM}    v8
    

E pesquisar uma palavra chave na barra de pesquisa 
    Wait Until Element Is Visible    ${INPUT-BUSCA}
    Click Element    ${INPUT-BUSCA}
    Press Keys    none    ferrari
    Press Keys    none    ENTER

Então a primeira postagem deve conter a palavra chave procurada
    Wait Until Element Is Visible    ${BOTAO-ULTIMAS-PESQUISA}
    Scroll Element Into View    ${TEXTO-POSTAGEM}
    ${GET-TEXTO}    Get Text    ${TEXTO-POSTAGEM}
    Log To Console    ${GET-TEXTO}
    Element Should Contain    ${TEXTO-POSTAGEM}    Ferrari

E abre o menu de pesquisa avancada
    Wait Until Element Is Visible    ${MENU-PONTOS}
    Click Element    ${MENU-PONTOS}
    Wait Until Element Is Visible    ${BUSCA-AVANCADA}
    Click Element    ${BUSCA-AVANCADA}
    
E seleciona a opcao ingles na busca por idioma
    Wait Until Element Is Visible    ${ELEMENTO-LOCALIZADOR-BUSCA}
    Scroll Element Into View    ${LABEL-ACCOUNTS}
    Click Element    ${SELECT-LINGUA}
    Click Element    ${OPTION-LINGUA}
    Click Element    ${SELECT-LINGUA}
    Press Keys    none     ENTER

Então o primeiro post deve estar em ingles
    Sleep    3s
    Scroll Element Into View    ${TEXTO-POSTAGEM}
    ${GET-TEXTO}    Get Text    ${TEXTO-POSTAGEM}
    Log To Console    ${GET-TEXTO}
    Element Attribute Value Should Be    ${TEXTO-POSTAGEM}    lang    en

E clica em uma tag que esta em alta 
    Wait until element is visible    ${BOTAO-EXPLORAR}
    Click Element    ${BOTAO-EXPLORAR}
    Wait Until Element Is Visible    ${TAG-EM-ALTA}
    Click Element    ${TAG-EM-ALTA}
    Sleep    3s
    ${GET-VALOR-INPUT}    Get Value    ${INPUT-BUSCA}
    Log To Console    ${GET-VALOR-INPUT}
    ${PALAVRAS}    Split String    ${GET-VALOR-INPUT}[1:-1]   
    Log To Console    ${PALAVRAS}
    Set Global Variable    ${STRING-BUSCA}     ${PALAVRAS}
    #${REMOVE-ASPAS-ULTIMO}    Execute Javascript    return arguments[0]    ${PALAVRAS[-1]}
    #${ULTIMAS-PALAVRAS}    Get From List    ${PALAVRAS}[1:-2]    -2 

Então o ultimo post deve ter a tag em alta buscada
    Sleep    3s
    Scroll Element Into View    ${TEXTO-POSTAGEM}
    ${TAMANHO-LISTA}    Get Length    ${STRING-BUSCA}
    Log To Console    ${STRING-BUSCA}
    ${GET-TEXTO-POSTAGEM}    Get Text    ${TEXTO-POSTAGEM}
    FOR    ${counter}    IN RANGE    0    ${TAMANHO-LISTA}    
        Element Should Contain    ${TEXTO-POSTAGEM}    ${STRING-BUSCA}[${counter}]    ignore_case=True
        #Log To Console    ${GET-TEXTO-POSTAGEM}
        #Log To Console    ${STRING-BUSCA}[${counter}]
    END    

E digita 280 caracteres
    Sleep    1s
    Press Keys    none     Teste de limite de caracteres (280)
    FOR    ${counter}    IN RANGE    0    245  
        Press Keys    none     l
        
    END     

Então o botao de postar deve estar habilitado, possibilitando a postagem
    Element Attribute Value Should Be    ${BOTAO-POSTAR}    tabindex    0  

E digita 281 caracteres
    Sleep    1s
    Press Keys    none     Teste de limite de caracteres (281)
    FOR    ${counter}    IN RANGE    0    246  
        Press Keys    none     l
        
    END 

Então o botao de postar deve estar desabilitado, impossibilitando a postagem
    Element Attribute Value Should Be    ${BOTAO-POSTAR}    aria-disabled    true

E cancelar o envio do post
    Click Element    ${BOTAO-FECHAR-POST}

E salvar o post nos rascunhos
    Wait Until Element Is Visible    ${BOTAO-SALVAR-RASCUNHO}
    Click Element    ${BOTAO-SALVAR-RASCUNHO}

Então o post salvo deve estar na parte de rascunhos 
    Wait Until Element Is Visible    ${BOTAO-RASCUNHOS}
    Click Element    ${BOTAO-RASCUNHOS}
    Wait Until Element Is Visible    ${ULTIMO-RASCUNHO}
    Click Element    ${ULTIMO-RASCUNHO}
    Element Should Contain    ${AREA-POSTAGEM}    ${MENSAGEM-POST}

E salva a postagem
    Wait Until Element Is Visible    ${BOTAO-SALVAR}
    Click Element    ${BOTAO-SALVAR}

E vai até a pagina de posts salvos
    Click Element    ${BOTAO-MAIS-MENU}
    Wait Until Element Is Visible    ${BOTAO-BOOKMARKS}
    Click Element    ${BOTAO-BOOKMARKS}
    Wait Until Element is Visible    ${ULTIMO-POST} 
    Click Element    ${TEXTO-POSTAGEM}
    Element Should Contain    ${ULTIMO-POST}    ${MENSAGEM-POST}

E escreve uma citação para o post
    Wait Until Element Is Visible    ${BOTAO-RETWEET-ANTES}
    Click Element    ${BOTAO-RETWEET-ANTES}
    Wait Until Element Is Visible    ${BOTAO-CITAÇÃO}
    Click Element    ${BOTAO-CITAÇÃO}
    Wait Until Element Is Visible    ${BOTAO-POSTAR}
    Press Keys    none    Teste de citação
    Click Element    ${BOTAO-POSTAR}

Então o ultimo post deve conter a mensagem citada
    Sleep    2s
    Element Should Contain    ${ULTIMO-POST}    Teste de citação

E clica no botao de resposta
    Wait Until Element Is Visible    ${BOTAO-REPLY}
    Click Element    ${BOTAO-REPLY}

E escrever uma resposta
    Wait Until Element Is Visible    ${BOTAO-POSTAR}
    Press Keys    none    Teste de resposta 
    Click Element    ${BOTAO-POSTAR}

E reage a mensagem
    Mouse Over    ${ULTIMA-MENSAGEM}
    #Wait Until Element Is Enabled    ${BOTAO-REAGIR}

E adicione uma foto a ser mandada  
    #Wait Until Element Is Visible    ${BOTAO-MIDIA}  
    Sleep    1s
    Choose File    ${BOTAO-MIDIA}    C:\\Users\\v8\\Desktop\\projeto-teste-twitter\\teste-case-tt\\resources\\Imagens\\2150829065.jpg
    Click Element    ${INPUT-NOVA-MENSAGEM}
    ${DATA-HORA}    Execute Javascript     return new Date().toLocaleString()
    Set Global Variable    ${MENSAGEM-TESTE}    Teste de nova mensagem. Data e hora:${DATA-HORA}  
    Set Global Variable    ${ULTIMA-MENSAGEM}     //div[@data-testid="tweetText"]//*[text()="${MENSAGEM-TESTE}"]
    Press Keys    None       ${MENSAGEM-TESTE}
    Press Keys    None     ENTER
    Sleep    2s

E clica na conversa
    Wait Until Element Is Visible    ${CONVERSA}
    Click Element    ${CONVERSA}

E adiciona um gif para mandar
    Wait Until Element Is Visible    ${BOTAO-ADICIONAR-GIF}
    Click Element    ${BOTAO-ADICIONAR-GIF}
    Sleep    2s
    Press Keys    none     chess
    Wait Until Element Is Visible    ${GIF}
    Click Element    ${GIF}

E clica em mais opções da conversa
    Wait Until Element Is Visible    ${CONVERSA}
    Mouse Over    ${CONVERSA}
    Sleep    2s
    Click Element    ${BOTAO-MAIS-CONVERSA}

E clica em silenciar a conversa
    Wait Until Element Is Visible    ${BOTAO-SILENCIAR-CONVERSA}
    Click Element    ${BOTAO-SILENCIAR-CONVERSA}

Então a conversa deve estar silenciada
    Wait Until Element Is Visible    ${BOTAO-TIRAR-SILENCIADA}
    Element Should Be Visible    ${BOTAO-TIRAR-SILENCIADA}
    Click Element    ${BOTAO-TIRAR-SILENCIADA}