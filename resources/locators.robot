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

