*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get LiveTV Monomax
    [Documentation]    
    RequestsLibrary.Create Session    Get_LiveTV    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}        
    ${headers}=     Authorization Monomax
    ${response}=    RequestsLibrary.GET On Session    Get_LiveTV    ${live_tv_path}    headers=${headers}    expected_status=200
     
