*** Settings ***

Resource    ../pages/login_page.robot
Resource    ../pages/home_page.robot
Test Setup    Dado que eu acesse o site do twitter
Test Teardown    Fechar navegador

*** Test Cases ***
Verificar se o usuário consegue realizar buscas na barra de pesquisa
    Quando o usuario tentar entrar com as credenciais corretas
    E insere um nome de usuário na barra de pesquisa
    E confirma a busca
    Então o usuário buscado deve aparecer no topo da página

Verificar se o usuário consegue enviar mensagens diretas a outros usuários
    Quando o usuario tentar entrar com as credenciais corretas
    E clica no icone de mensagens
    E envia uma nova mensagem
    Então a mensagem enviada deve constar na conversa

#Funcionalidade postar

Verificar se o usuario consegue realizar uma nova postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E escrever uma nova postagem
    E clicar no botao de postar
    Então deverá aparecer uma notificação confirmando a postagem

Verificar se o usuario consegue excluir uma postagem
    Quando o usuario tentar entrar com as credenciais corretas
    E vai até o seu perfil
    E clica na ultima postagem
    E abre as opções do post
    E clica no botão delete
    E confirmar a exclusão do post
    Então deverá aparecer uma notificação confirmando a exclusão

Verificar se o usuario consegue postar uma foto
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E adicionar uma foto a ser postada
    E escrever uma nova postagem
    E clicar no botao de postar
    Então a postagem deve constar no perfil do usuario
    
Verificar se o usuario consegue postar uma mensagem sem escrever nada 
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E tentar postar uma mensagem sem digitar nada
    Então o botao de postagem deve estar inativo, impedindo a postagem

Verificar se o usuario consegue curtir uma postagem 
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
    Quando o usuario tentar entrar com as credenciais corretas
    E clicar no botão de nova postagem
    E escrever uma nova postagem
    E clicar no botao de postar
    E vai até o seu perfil
    E clica na ultima postagem
    E reposte esse post 
    Então o botao de repostar deve mudar de cor, indicando a repostagem