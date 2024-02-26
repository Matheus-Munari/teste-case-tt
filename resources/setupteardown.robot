*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://twitter.com/

*** Keywords ***
Dado que eu acesse o site do twitter
    Open Browser  url=${URL}  browser=chrome

Fechar navegador
    Close Browser