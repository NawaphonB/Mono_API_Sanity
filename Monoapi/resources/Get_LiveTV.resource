*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***

Get LiveTV Monomax
    [Documentation]    Keyword ยิงเช็ค profile ของ data นั้นๆ
    RequestsLibrary.Create Session    Get_LiveTV    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    RequestsLibrary.GET On Session    Get_LiveTV    ${Get_profile_path}    headers=${headers}
    Validate Get Profile Response    ${response}    
