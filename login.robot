*** Settings ***
Documentation       Login
...                 Para que eu possa ter acesso a interface de gestão de anúncios
...                 Sendo um usuário que possui um email
...                 Quero poder iniciar uma nova sessão

Library     SeleniumLibrary

## ATDD ???? Acceptance Test-Driven Development
# (Desenvolvimento guiado por testes de aceitação)
# Obter requisitos de forma colaborativa

# Esquecer o tradicional (cenário step by step), pensar em ATDD / BDD

# BDD (Desenvolvimento guiado por comportamento)
# Foi feito em 2003 para aplicar um BDD melhor
# Gherkin

*** Test Cases ***
Usuário consegue logar
    Dado que acesso o Website
    Quando eu submeto minha credencial de login "eu@papito.io"
    Então a área logada deve ser exibida
    E saio do Website

Usuário não loga com email incorreto
    Dado que acesso o Website
    Quando eu submeto minha credencial de login "eupapito.io"
    Então devo ver a mensagem de alerta "Oops. Informe um email válido!"
    E saio do Website

Email deve ser obrigatório
    Dado que acesso o Website
    Quando eu submeto minha credencial de login "${EMPTY}"
    Então devo ver a mensagem de alerta "Oops. Informe um email válido!"
    E saio do Website

*** Keywords ***
Dado que acesso o Website
    Open Browser                    https://bikelov.herokuapp.com/      chrome
    Set Selenium Implicit Wait      5

Quando eu submeto minha credencial de login "${email}"
    Input Text          id:email       ${email}
    Click Element       xpath://button[contains(text(), 'Entrar')]

Então a área logada deve ser exibida
    Page Should Contain Element     class:dashboard

Então devo ver a mensagem de alerta "${expect_message}"
    Element Text Should Be     class:alert-dark     ${expect_message}

E saio do Website
    Close Browser