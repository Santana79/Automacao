*** Settings ***
Library    SeleniumLibrary
Library    Process


*** Variables ***
${URL}               https://www.saucedemo.com/
${BROWSER}           chrome
${CAMPO_LOGIN}       //input[contains(@placeholder,'Username')]
${NAME_LOGIN}        visual_user
${CAMPO_PASSWORD}    //input[contains(@placeholder,'Password')]
${PASSWORD}          secret_sauce
${BOTAO_LOGIN}       login-button
${PRODUTO}           //div[@class='inventory_item_name '][contains(.,'Sauce Labs Bike Light')]
${BTN_PRODUTO}       //button[@class='btn btn_primary btn_small btn_inventory'][contains(.,'Add to cart')]
${CARRINHO}          //span[@class='shopping_cart_badge'][contains(.,'1')]
${CHECKOUT}          //button[@class='btn btn_action btn_medium checkout_button btn_visual_failure'][contains(.,'Checkout')]
${FIRST_NAME}        //input[contains(@placeholder,'First Name')]
${LAST_NAME}         //input[contains(@placeholder,'Last Name')]
${POSTAL_CODE}       //input[contains(@placeholder,'Zip/Postal Code')]
${BTN_SUBMIT}        //input[contains(@type,'submit')]
${BTS_FINISH}            //button[@class='btn btn_action btn_medium cart_button'][contains(.,'Finish')]
                     




*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window

Fechar o navegador
    Close Browser


Given acesse a pagina de login
    Go To     url=${URL}

preencher as credenciais de acesso
    Click Element    locator=${CAMPO_LOGIN}
    Input Text       locator=${CAMPO_LOGIN}    text=${NAME_LOGIN}
    Click Element    locator=${CAMPO_PASSWORD}
    Input Password   locator=${CAMPO_PASSWORD}  password=${PASSWORD}

    
    
é direcionado para a pagina com sucesso
    Click Button     locator=${BOTAO_LOGIN}
    Capture Page Screenshot


seleciona o produto
    Click Element    locator=${PRODUTO}
    Click Button     locator=${BTN_PRODUTO}
    Click Element    locator=${CARRINHO}
    Click Button     locator=${CHECKOUT}


informacoes preenchidas
    Click Element            locator=${FIRST_NAME}
    Input Text               locator=${FIRST_NAME}    text=Teste
    Input Text               locator=${LAST_NAME}     text=Automação
    Click Element            locator=${POSTAL_CODE}
    Input Text               locator=${POSTAL_CODE}   text=08830780
    Execute Javascript       window.scrollBy(0, 500)
    Click Button             locator=${BTN_SUBMIT}


compra realizada com sucesso
    Click Button             locator=${BTS_FINISH}
    Capture Page Screenshot