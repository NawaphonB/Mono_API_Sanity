*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get Home Page Monomax
    Create Session    GET_Home_Page    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    GET On Session    GET_Home_Page    /home    headers=${headers}
    Validate Home Page Response Sport Content    ${response}
    Validate Home Page Response Action button    ${response}

Validate Home Page Response Sport Content
    [Arguments]    ${response}
    Log To Console     Get Profile Response code: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200
    
    ${json_response}=    Set Variable    ${response.json()}
    ${data}=             Json Value      ${json_response}    $.data
    ${sports}=           Evaluate    [x for x in ${data} if "sport" in str(x.get("type","")).lower()]
    IF    ${sports}
          ${pairs}=      Evaluate    [(i.get("title"), i.get("watch_tier_allowed")) for x in ${sports} for i in x.get("items", []) if "watch_tier_allowed" in i]
        FOR    ${pair}    IN    @{pairs}
               ${title}=    Set Variable    ${pair}[0]
               ${tier}=     Set Variable    ${pair}[1]
               Log To Console    ${title} | watch_tier_allowed = ${tier}
        END
    ELSE
        Log To Console    ไม่มี content sport
    END

Validate Home Page Response Action button
    [Arguments]    ${response}
    ${json_response}=    Set Variable    ${response.json()}
    ${action_button}=    Json Value      ${json_response}    $.data[0].items[0].content.actions[0].label
    Log To Console    \nAction button | ${action_button}
    # IF    '${action_button}'=='สมัครแพ็กเกจ'
    #     Log To Console    \nAction button | ${action_button}
    # ELSE    
    #     Log To Console    \nUser tier XXX action button ควรเป็น XXX
    # END