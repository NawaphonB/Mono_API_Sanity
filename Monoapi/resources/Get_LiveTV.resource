*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get LiveTV Monomax
    [Documentation]    
    RequestsLibrary.Create Session    Get_LiveTV    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}        
    ${headers}=     Authorization Monomax
    ${response}=    RequestsLibrary.GET On Session    Get_LiveTV    ${live_tv_path}    headers=${headers}    expected_status=200
    
Get LiveTV Stream Monomax
    [Documentation]    
    [Arguments]    ${channel_id}
    RequestsLibrary.Create Session    Get_LiveTV_Stream    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}        
    ${headers}=     Authorization Monomax
    ${response}=    RequestsLibrary.GET On Session    Get_LiveTV_Stream    ${live_tv_stream_path}${channel_id}/stream    headers=${headers}    expected_status=200
    
    Log To Console    ${response.status_code}
    Log To Console    ${response.text}
    RETURN    ${response}

Get LiveTV Stream Monomax No header
    [Documentation]    
    [Arguments]    ${channel_id}
    RequestsLibrary.Create Session    Get_LiveTV_Stream    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}        
    ${response}=    RequestsLibrary.GET On Session    Get_LiveTV_Stream    ${live_tv_stream_path}${channel_id}/stream    headers=${headers}    expected_status=200
    
    Log To Console    ${response.status_code}
    Log To Console    ${response.text}
    RETURN    ${response}