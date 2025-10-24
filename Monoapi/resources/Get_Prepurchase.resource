*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get Pre-purchase Monomax
    [Arguments]    ${platform_prepurchase}    ${SKU} 
    Create Session    GET_Pre-purchase    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${params}=    Create Dictionary
    ...    platform=${platform_prepurchase}
    ...    buying_sku=${SKU}
    ${response}=    GET On Session    GET_Pre-purchase    ${Pre_purchase_path}    params=${params}    headers=${headers}
    Validate Pre-purchase Response    ${response}

Validate Pre-purchase Response
    [Arguments]    ${response}
    Log To Console    Status Code: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    ${EXPECTED_STATUS_CODE}
    
    ${json_response}=    Set Variable    ${response.json()}
    ${allow_flag}=       Json Value    ${json_response}    $.data.allow
    
    IF    ${allow_flag}==True
        Log Success    Allowed to purchase
    ELSE
        ${reason}=           Json Value    ${json_response}    $.data.reason
        Log Warning    Not allowed to purchase | Reason: ${reason}
    END