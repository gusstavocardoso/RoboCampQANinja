*** Settings ***
Resource    base.robot
Library     ./lib/mongo.py

*** Keywords ***
## Login
Dado que acesso a página login
    Go To       ${BASE_URL}

Quando eu submeto minha credencial de login "${email}"
    Input Text          id:email       ${email}
    Click Element       xpath://button[contains(text(), 'Entrar')]

Então a área logada deve ser exibida
    Page Should Contain Element     class:dashboard

Então devo ver a mensagem de alerta "${expect_message}"
    Element Text Should Be     class:alert-dark     ${expect_message}

## Anúncios
Dado que eu tenho uma "${bike_string}" muito bonita
    # pega a massa de teste e converte de string para json de verdade
    ${bike_json}=       evaluate        json.loads($bike_string)    json
    Log                 ${bike_json}
    Set Test Variable   ${bike_json}
    # Nova Bike/ Não pode exisitir no meu ambiente
    Remove Bike         ${bike_json['name']}

Quando eu faço o anúncio dessa bike
    Click Link      /new

    Choose File     css:#thumbnail input            ${CURDIR}/images/${bike_json['thumb']}

    Input Text      id:name                         ${bike_json['name']}
    Input Text      id:brand                        ${bike_json['brand']}
    Input Text      css:input[placeholder$=dia]     ${bike_json['price']}
    Click Element   class:btn-red

Então devo ver minha bike na lista de anúncios
    Wait Until Element Is Visible   css:.bike-list li
    Element Should Contain          class:bike-list     ${bike_json['name']}

E o valor para locação deve ser igual a "${expect_price}"
    Element Should Contain      class:bike-list     ${expect_price}
