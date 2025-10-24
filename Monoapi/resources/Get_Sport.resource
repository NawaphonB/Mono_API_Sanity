*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get Sport Home Page Monomax
    Create Session    GET_Sport_Home    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    GET On Session    GET_Sport_Home     /sports/home    headers=${headers}
    Validate Sport Home Response    ${response}

Validate Sport Home Response
    [Arguments]    ${response}
    ${json_response}=    Set Variable    ${response.json()}
    ${tiers}=    JSONLibrary.Get Value From Json    ${json_response}    $..watch_tier_allowed

    ${true_count}=     Evaluate    len([x for x in ${tiers} if x == True])
    ${false_count}=    Evaluate    len([x for x in ${tiers} if x == False])

    Log To Console    \n===== Watch Tier Allowed Summary =====
    Log To Console    ✅ True → ${true_count} รายการ
    Log To Console    ❌ False → ${false_count} รายการ

Get Match Live Stream Monomax
    [Arguments]     ${MatchID}
    Create Session    GET_Match_Live    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    GET On Session    GET_Match_Live      /sports/matches/${MatchID}/streams    headers=${headers}
    Validate Match/VOD Response Match details    ${response}
    Validate Match/VOD Response Upsell action    ${response}


Log Upsell Block
    [Arguments]    ${json}    ${title}    ${base_path}
    ${msg}=      Json Value    ${json}    ${base_path}.message
    ${label}=    Json Value    ${json}    ${base_path}.action.cta1.label
    ${link}=     Json Value    ${json}    ${base_path}.action.cta1.deeplink
    Log To Console    \n${title}:
    Log To Console    message: ${msg}
    Log To Console    label:   ${label}
    Log To Console    deeplink:${link}

Validate Match/VOD Response Upsell action
    [Arguments]    ${response}
    ${json_response}=    Set Variable    ${response.json()}

    ${upsell_flag}=   Json Value    ${json_response}    $.extra.is_show_upsell
    IF    ${upsell_flag} == True
        Log Upsell Block    ${json_response}    Upsell Player          $.extra.upsell
        Log Upsell Block    ${json_response}    Upsell End Player      $.extra.upsell_ended
    ELSE
        Log To Console      No Upsell
    END

Validate Match/VOD Response Match details
    [Arguments]    ${response}
    ${json_response}=    Set Variable    ${response.json()}

    ${title}=       Json Value    ${json_response}    $.data.streams.track_data.video_title
    ${user_tier}=   Json Value    ${json_response}    $.data.streams.track_data.viewer_plan_category
    Log To Console      \nMatch title: ${title}
    Log To Console      User tier: ${user_tier}



Get VOD Stream Monomax
    [Arguments]     ${VodID}
    Create Session    GET_VOD    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    GET On Session    GET_VOD      /sports/vods/${VodID}/streams    headers=${headers}
    Validate Match/VOD Response Match details    ${response}
    Validate Match/VOD Response Upsell action    ${response}
