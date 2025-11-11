*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
POST Login Monomax
    [Arguments]    ${username}    ${password}
    [Documentation]    Keyword ยิง post login เพื่อ get token
    RequestsLibrary.Create Session    POST_login    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    #login จะไม่มี header แต่จะใช้ data แทน เนื่องจากเส้น post login ไม่มี header และส่งข้อมูลแบบ data
    ${Data}=        Create Dictionary    
    ...    username=${username}    
    ...    password=${password}
    ${response}=    RequestsLibrary.POST On Session    POST_login    ${Login_path}    data=${Data}    expected_status=200

POST Login Monomax and Get token
    [Arguments]    ${username}    ${password}
    [Documentation]    Keyword ยิง post login เพื่อ get token
    RequestsLibrary.Create Session    POST_login    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
    #login จะไม่มี header แต่จะใช้ data แทน เนื่องจากเส้น post login ไม่มี header และส่งข้อมูลแบบ data
    ${Data}=        Create Dictionary    
    ...    username=${username}    
    ...    password=${password}
    ${response}=    RequestsLibrary.POST On Session    POST_login    ${Login_path}    data=${Data}
    Validate Post Login Response    ${response}

Validate Post Login Response
    [Documentation]    Keyword log ค่าจาก response post login
    [Arguments]        ${response}
    Log To Console    Post Login Response code: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200

    #ดึงค่าแต่ละ key มาตรวจสอบ
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

