*** Variables ***
# Login
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

# Home Page
${INPUT-BUSCA}    //*[@placeholder="Search"]
${BUSCAR-USER}    //*[text()="Marcelo Bechler"]
${USUARIO-BUSCADO}    //*[@href="/marcelobechler"] 
${BOTAO-NOVA-POSTAGEM}    //*[@href="/compose/post"]
${JANELA-POST}    //*[text()="What is happening?!"]
${BOTAO-POSTAR}    //*[@data-testid="tweetButton"]
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
${POST-EM-BRANCO}     
${AREA-POSTAGEM}    //*[@data-testid="tweetTextarea_0"]
${BOTAO-MIDIA}    //*[@data-testid="fileInput"]
${MIDIA}    //*[@aria-label="Media"]
${MENSAGEM-POST}    "Teste de postagem de foto. Data e hora do teste: "
${ULTIMA-POSTAGEM}    ""
${BOTAO-EDITAR-PERFIL}    //*[@href="/settings/profile"]
${USER-NAME-PERFIL}    //*[@data-testid="tweetText"]
${BOTAO-MAIS-MENU}    //*[@data-testid="AppTabBar_More_Menu"]
${BOTAO-BOOKMARKS}    //*[@href="/i/bookmarks"]
${BOTAO-CURTIR}    //div[@data-testid="like"]
${ABA-LIKES}    //*[@href="/usuariomatteste/likes"]
${BOTAO-RETWEET-ANTES}    //*[@data-testid="retweet"]
${BOTAO-CONFIRMAR-RETWEET}    //*[@data-testid="retweetConfirm"]
${BOTAO-RETWEET-DEPOIS}    //*[@data-testid="unretweet"]
${TESTE}    .#v8
${BOTAO-ULTIMAS-PESQUISA}    //*[text()="Latest"]
${TEXTO-POSTAGEM}    //*[@data-testid="tweetText"]
${MENU-PONTOS}    //*[@data-testid="searchBoxOverflowButton"]
${BUSCA-AVANCADA}    //*[@href="/search-advanced"]
${ELEMENTO-LOCALIZADOR-BUSCA}    //*[text()="Example: what’s happening · contains both “what’s” and “happening”"]
${LABEL-ACCOUNTS}    //*[text()="Accounts"]
${SELECT-LINGUA}    //select[contains(., 'English')]
${OPTION-LINGUA}    //option[contains(., 'English')]
${BOTAO-EXPLORAR}    //*[@href="/explore"]
${INPUT-BUSCA}    //input[@data-testid="SearchBox_Search_Input"]
${TAG-EM-ALTA}    //*[@data-testid="trend"]
${POST-CONTEM}    
${STRING-BUSCA}
${BOTAO-FECHAR-POST}    //*[@data-testid="app-bar-close"]
${BOTAO-SALVAR-RASCUNHO}    //*[@data-testid="confirmationSheetConfirm"]
${ULTIMO-RASCUNHO}    //*[@data-testid="unsentTweet"]
${BOTAO-RASCUNHOS}    //*[@data-testid="unsentButton"]
${BOTAO-SALVAR}    //*[@data-testid="bookmark"]
${POST-BOOKMARK}    
${BOTAO-CITAÇÃO}    //*[@href="/compose/post"]
${BOTAO-REPLY}    //*[@data-testid="reply"]
${BOTAO-REAGIR}    //div[@aria-label="Add reaction"]
${BOTAO-ENVIAR-DM}    //*[@data-testid="dmComposerSendButton"]
${BOTAO-ADICIONAR-GIF}    //*[@aria-label="Add a GIF"]
${GIF}    //*[@data-testid="gifSearchGifImage"]
${BOTAO-SCROLL}    //*[@data-testid="DmScrollToNewestButton"]
${BOTAO-MAIS-CONVERSA}    //*[@data-testid="conversation"]//*[@aria-label="More"]
${BOTAO-SILENCIAR-CONVERSA}    //*[text()="Snooze conversation"]
${BOTAO-TIRAR-SILENCIADA}    //*[text()="Take conversation off snooze"]

