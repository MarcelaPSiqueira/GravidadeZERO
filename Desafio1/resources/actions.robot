*Settings*
Documentation       Ações customizadas do NBank

*Keywords*
Clicar fazer PIX
    Click                      text=Fazer PIX

Validar se está na página
    Wait For Elements State    css=.modal-card-title >> text=PIX
    ...                        visible         5

Enviar PIX
    Click                      css=button >> text=Enviar PIX

Mensagem de Erro
    [Arguments]     ${error_message}

    Get Text                   css=.media-content >> text=${error_message}



    
