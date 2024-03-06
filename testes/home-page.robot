*** Settings ***
Resource    ../resources/setupteardown.robot
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


Verificar se o usuário consegue enviar mensagens diretas a outros usuários
    Quando o usuario tentar entrar com as credenciais corretas
    E clica no icone de mensagens
    E envia uma nova mensagem
    Então a mensagem enviada deve constar na conversa