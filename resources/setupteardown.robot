*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://twitter.com/

*** Keywords ***
Dado que eu acesse o site do twitter
    Open Browser  url=${URL}  browser=chrome
    Maximize Browser Window

Fechar navegador
    Close Browser