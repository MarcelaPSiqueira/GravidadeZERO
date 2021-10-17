*** Settings ***
Documentation    Suite de testes para fazer PIX 

Library     ${EXECDIR}/resources/factories/pix.py

Resource    ${EXECDIR}/resources/base.robot

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***
Fazer um PIX positivo
    [Tags]    pix_positivo
    
    Clicar fazer PIX
    Validar se está na página
    Opções para o PIX   Next/Babyyoda/700
    Enviar PIX
  
Tentar fazer PIX com Valor Zero
    [Tags]     pix_zero

    Clicar fazer PIX
    Validar se está na página
    Opções para o PIX   Neon/Babyyoda/0
    Enviar PIX
    Mensagem de Erro    Oops. Transferir ZERO é osso hein...
       
Tentar fazer PIX com Valor Negativo
    [Tags]    pix_negativo

    Clicar fazer PIX
    Validar se está na página
    Opções para o PIX   Nubank/Babyyoda/-1
    Enviar PIX
    Mensagem de Erro    Oops. Valor para PIX incorreto...
   
*Keywords*
Opções para o PIX
    [Arguments]     ${dados}

    @{PIX}      Split String    ${dados}        /

    Select Options By           css=.select select         value          ${PIX}[0]
    Fill Text                   id=chave-pix       ${PIX}[1]
    Fill Text                   css=input[placeholder^="Valor"]     ${PIX}[2]