*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get Sport Home Page Monomax
    [Documentation]    Keyword ยิงเช็คหน้า sport home 
    Create Session    GET_Sport_Home    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    GET On Session    GET_Sport_Home     /sports/home    headers=${headers}    expected_status=200
    Validate Sport Home Response    ${response}

Validate Sport Home Response
    [Documentation]    Keyword log ค่า watch tier allowed แต่ละ content
    [Arguments]    ${response}
    ${json_response}=    Set Variable    ${response.json()}
    ${tiers}=    JSONLibrary.Get Value From Json    ${json_response}    $..watch_tier_allowed
    
    #count content ที่มี watch tier allowed แล้วมาแยก true/false
    ${true_count}=     Evaluate    len([x for x in ${tiers} if x == True])
    ${false_count}=    Evaluate    len([x for x in ${tiers} if x == False])

    Log To Console    \n===== Watch Tier Allowed Summary =====
    Log To Console    ✅ True → ${true_count} รายการ
    Log To Console    ❌ False → ${false_count} รายการ

Get Match Live Stream Monomax
    [Documentation]    Keyword ยิงเช็คหน้า match live โดยใช้ MatchID นั้นๆ
    [Arguments]     ${MatchID}
    Create Session    GET_Match_Live    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    GET On Session    GET_Match_Live      /sports/matches/${MatchID}/streams    headers=${headers}
    Validate Match/VOD Response Match details    ${response}
    Validate Match/VOD Response Upsell action    ${response}


Log Upsell Block
    [Documentation]    Keyword log ค่าใน upsell
    [Arguments]    ${json}    ${title}    ${base_path}
    ${msg}=      Json Value    ${json}    ${base_path}.message
    ${label}=    Json Value    ${json}    ${base_path}.action.cta1.label
    ${link}=     Json Value    ${json}    ${base_path}.action.cta1.deeplink
    Log To Console    \n${title}:
    Log To Console    message: ${msg}
    Log To Console    label:   ${label}
    Log To Console    deeplink:${link}

Validate Match/VOD Response Upsell action
    [Documentation]    Keyword log upsell player + end player
    [Arguments]    ${response}
    ${json_response}=    Set Variable    ${response.json()}

    #เช็คว่า content มี upsell มั้ยถ้ามี log ค่าใน upsell ถ้าไม่มี log ว่าไม่มี upsell
    ${upsell_flag}=   Json Value    ${json_response}    $.extra.is_show_upsell
    IF    ${upsell_flag} == True
        Log Upsell Block    ${json_response}    Upsell Player          $.extra.upsell
        Log Upsell Block    ${json_response}    Upsell End Player      $.extra.upsell_ended
    ELSE
        Log To Console      No Upsell
    END

Validate Match/VOD Response Match details
    [Documentation]    Keyword log details match นั้นๆ
    [Arguments]    ${response}
    ${json_response}=    Set Variable    ${response.json()}

    ${title}=       Json Value    ${json_response}    $.data.streams.track_data.video_title
    ${user_tier}=   Json Value    ${json_response}    $.data.streams.track_data.viewer_plan_category
    Log To Console      \nMatch title: ${title}
    Log To Console      User tier: ${user_tier}



Get VOD Stream Monomax
    [Documentation]    Keyword ยิงเช็คหน้า VOD โดยใช้ VodID นั้นๆ
    [Arguments]     ${VodID}
    Create Session    GET_VOD    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    GET On Session    GET_VOD      /sports/vods/${VodID}/streams    headers=${headers}
    Validate Match/VOD Response Match details    ${response}
    Validate Match/VOD Response Upsell action    ${response}

Get VOD Stream Monomax non login
    [Documentation]    Keyword ยิงเช็คหน้า VOD โดยใช้ VodID นั้นๆ ไม่ใช้ token
    [Arguments]     ${VodID}
    Create Session    GET_VOD    ${Base_url}       
    ${response}=    GET On Session    GET_VOD      /sports/vods/${VodID}/streams    expected_status=401  
