*** Settings ***
Documentation        Valida login e compra de produto no site https://www.saucedemo.com/
Resource             login_compra_resources.robot
Test Setup           Abrir o navegador
# Test Teardown        Fechar o navegador


*** Test Cases ***

Teste 01 - Login na pagina
    [Tags]            menus
    Given acesse a pagina de login
    When preencher as credenciais de acesso
    Then é direcionado para a pagina com sucesso
    And seleciona o produto
    And informacoes preenchidas
    And compra realizada com sucesso

    


   
   
    