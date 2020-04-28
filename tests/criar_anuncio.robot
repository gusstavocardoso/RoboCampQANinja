*** Settings ***
Documentation   Criar Anúncio
...             Para que eu possa disponibilizar bikes para locação
...             Sendo um anúnciante
...             Quero poder cadastar um novo anúncio

Resource        ../resources/steps_kw.robot

Suite Setup      Logged with "eu@papito.io"
Suite Teardown   End Session

Test Teardown    End Test

*** Variables ***
${bike}=        {"thumb": "elleven.jpg", "name": "Elleven Rocker 26 Marchas", "brand": "Shimano", "price": "15" }

*** Test Cases ***
Anunciar minha bike
    Dado que eu tenho uma "${bike}" muito bonita
    Quando eu faço o anúncio dessa bike
    Então devo ver minha bike na lista de anúncios
    E o valor para locação deve ser igual a "R$15/dia"
