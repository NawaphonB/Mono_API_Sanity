*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
POST Login Monomax
    RequestsLibrary.Create Session    POST_login    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${Data}=        Create Dictionary    
    ...    username=${Username}    
    ...    password=${Password}
    ${response}=    RequestsLibrary.POST On Session    POST_login    ${Login_path}    data=${Data}
    Validate Post Login Response    ${response}

Validate Post Login Response
    [Arguments]        ${response}
    Log To Console    Post Login Response code: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200

    ${json_response}=   Set Variable           ${response.json()}
    ${status}=          Json Value    ${json_response}    $.status
    ${access_token}=    Json Value    ${json_response}    $.data.access_token
    ${member_id}=       Json Value    ${json_response}    $.data.member_id

    Should Be Equal       ${status}    ok
    Should Not Be Empty   ${access_token}
    Should Be True        ${member_id} > 0 

    Log To Console        Login Success | member_id=${member_id}      
    Log To Console        Token=${access_token}
    Set Global Variable    ${ACCESS_TOKEN}    ${access_token}
    Set Global Variable    ${MEMBER_ID}    ${member_id}

