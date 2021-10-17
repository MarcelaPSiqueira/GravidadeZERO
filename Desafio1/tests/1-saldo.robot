*** Settings ***
Documentation    Suite de testes para verificar o saldo

Resource    ${EXECDIR}/Resources/base.robot

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***
Exibir meu saldo inicial
    Wait For Elements State    css=.navbar-item >> text= Olá Papito, seu saldo é R$ 1000    visible    5
