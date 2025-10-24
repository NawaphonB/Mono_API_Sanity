*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get Profile Monomax
    [Documentation]    Keyword ยิงเช็ค profile ของ data นั้นๆ
    RequestsLibrary.Create Session    Get_Profile    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    ${headers}=     Authorization Monomax
    ${response}=    RequestsLibrary.GET On Session    Get_Profile    ${Get_profile_path}    headers=${headers}
    Validate Get Profile Response    ${response}    

Validate Get Profile Response
    [Documentation]    Keyword log ค่าจาก get profile
    [Arguments]        ${response} 
    Log To Console     Get Profile Response code: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200

    #ดึงค่าแต่ละ key มาตรวจสอบ
    ${json_response}=   Set Variable           ${response.json()}
    ${member_id}=       Json Value    ${json_response}    $.data.id
    ${username}=        Json Value    ${json_response}    $.data.username
    ${package_registered}=    Json Value    ${json_response}    $.data.package_registered
    ${member_tier}=      Json Value    ${json_response}    $.data.member_tier

    #ถ้าเป็น free tier จะ log แค่นี้
    IF  ${package_registered}==${None}
        Log Success    \nProfile | User=${username} | Tier=${member_tier}
    #ถ้าเป็น tier ที่มี package จะ log ผลตามนี้
    ELSE
        ${expire_flag}=     Json Value    ${json_response}    $.data.package_registered.is_expired
        ${cancel_flag}=     Json Value    ${json_response}    $.data.package_registered.is_canceled
        ${package_id}=      Json Value    ${json_response}    $.data.package_registered.package.id
        ${package_type}=    Json Value    ${json_response}    $.data.package_registered.package.package_type
        ${package_name}=    Json Value    ${json_response}    $.data.package_registered.package.name
        ${package_price}=   Json Value    ${json_response}    $.data.package_registered.package.price
        ${devices}=         Json Value    ${json_response}    $.data.package_registered.package.devices
        ${tier}=            Json Value    ${json_response}    $.data.package_registered.tier
        Should Be Equal        ${member_id}    ${MEMBER_ID}
        Should Not Be Empty    ${username}
        Variable Should Exist  ${expire_flag}
        Variable Should Exist  ${cancel_flag}
        Should Be True         ${package_id} > 0
        Should Not Be Empty    ${package_type}
        Should Be True         ${devices} > 0
        Should Not Be Empty    ${tier}
        Log Success    \nProfile | User=${username} | Package=${package_name} | Tier=${tier}
    END

    #Set Suite Variable    ${ACCESS_TOKEN}    ${access_token}
