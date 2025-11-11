*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get Product detail
    [Arguments]    ${product_id}
    [Documentation]    Keyword ยิงเช็คMovie หรือSeries
    RequestsLibrary.Create Session    Get_product    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    RequestsLibrary.GET On Session    Get_product    ${get_product_path}/${product_id}    headers=${headers}     expected_status=200