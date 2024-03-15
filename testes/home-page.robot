*** Settings ***

Resource    ../pages/login_page.robot
Resource    ../pages/home_page.robot
Test Setup    Dado que eu acesse o site do twitter
Test Teardown    Fechar navegador

*** Test Cases ***

Verificar se o usuário consegue enviar mensagens diretas a outros usuários
    Quando o usuario tentar entrar com as credenciais corretas
    E clica no icone de mensagens
    E envia uma nova mensagem
    Então a mensagem enviada deve constar na conversa

#Funcionalidade postar

Verificar se o usuario consegue postar uma foto
    [Tags]    Postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E adicionar uma foto a ser postada
    E escrever uma nova postagem
    E clicar no botao de postar
    Então a postagem deve constar no perfil do usuario

Verificar se o usuario consegue realizar uma nova postagem
    [Tags]    Postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E escrever uma nova postagem
    E clicar no botao de postar
    Então deverá aparecer uma notificação confirmando a postagem

Verificar se o usuario fazer uma postagem com 280 caracteres
    [Tags]    Postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem 
    E digita 280 caracteres
    Então o botao de postar deve estar habilitado, possibilitando a postagem
    
Verificar se o usuario consegue fazer uma postegm com 281 caracteres
    [Tags]    Postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem 
    E digita 281 caracteres
    Então o botao de postar deve estar desabilitado, impossibilitando a postagem
    
Verificar se o usuario consegue postar uma mensagem sem escrever nada 
    [Tags]    Postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E tentar postar uma mensagem sem digitar nada
    Então o botao de postagem deve estar inativo, impedindo a postagem

Verificar se o usuario consegue salvar uma postagem como rascunho
    [Tags]    Postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E escrever uma nova postagem
    E cancelar o envio do post 
    E salvar o post nos rascunhos
    E clicar no botão de nova postagem
    Então o post salvo deve estar na parte de rascunhos 

#Funcionalidade de interação com posts

Verificar se o usuario consegue excluir uma postagem
    [Tags]    Interacao
    Quando o usuario tentar entrar com as credenciais corretas
    E vai até o seu perfil
    E clica na ultima postagem
    E abre as opções do post
    E clica no botão delete
    E confirmar a exclusão do post
    Então deverá aparecer uma notificação confirmando a exclusão

Verificar se o usuario consegue curtir uma postagem 
    [Tags]    Interacao 
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E escrever uma nova postagem
    E clicar no botao de postar
    E vai até o seu perfil
    E clica na ultima postagem
    E curta uma postagem
    E vai até o seu perfil
    E vai ate a aba de likes
    E clica na ultima postagem
    E verifica se a postagem curtida esta la

Verificar se o usuario consegue repostar uma postagem
    [Tags]    Interacao
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E escrever uma nova postagem
    E clicar no botao de postar
    E vai até o seu perfil
    E clica na ultima postagem
    E reposte esse post 
    Então o botao de repostar deve mudar de cor, indicando a repostagem

Verificar se o usuario consegue salvar uma postagem
    [Tags]    Interacao
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E escrever uma nova postagem
    E clicar no botao de postar
    E vai até o seu perfil
    E clica na ultima postagem
    E salva a postagem
    E vai até a pagina de posts salvos
    Sleep    4s

# Funcionalidade pesquisar
Verificar se o usuário consegue buscar um usuario na barra de pesquisa
    [Tags]    Pesquisar
    Quando o usuario tentar entrar com as credenciais corretas
    E insere um nome de usuário na barra de pesquisa
    E confirma a busca
    Então o usuário buscado deve aparecer no topo da página

Verificar se o usuario consegue buscar uma hashtag
    [Tags]    Pesquisar
    Quando o usuario tentar entrar com as credenciais corretas
    E pesquisar uma hashtag na barra de pesquisa 
    Então a primeira postagem deve conter a hashtag procurada
    Sleep    2s

Verificar se o usuario consegue buscar uma palavra chave
    [Tags]    Pesquisar
    Quando o usuario tentar entrar com as credenciais corretas
    E pesquisar uma palavra chave na barra de pesquisa
    Então a primeira postagem deve conter a palavra chave procurada

Verificar se o usuario consegue realizar uma busca apenas por postagens em ingles
    [Tags]    Pesquisar
    Quando o usuario tentar entrar com as credenciais corretas
    E pesquisar uma palavra chave na barra de pesquisa
    E abre o menu de pesquisa avancada
    E seleciona a opcao ingles na busca por idioma
    Então o primeiro post deve estar em ingles

Verificar se o usuario consegue buscar por postagens em alta
    [Tags]    Pesquisar
    Quando o usuario tentar entrar com as credenciais corretas
    E clica em uma tag que esta em alta
    Então o ultimo post deve ter a tag em alta buscada
    Sleep    2s
