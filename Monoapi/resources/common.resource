***Settings***
Resource     ../resources/_settings.resource   

*** Keywords ***
Authorization Monomax
    ${headers}=     Create Dictionary
    ...       Authorization=Bearer ${ACCESS_TOKEN}
    RETURN    ${headers}

Ensure Logged In
    [Documentation]    มี token และยังใช้ได้ → ข้าม; ไม่มี/หมดอายุ → login ใหม่
    ${has_token}=    Run Keyword And Return Status    Should Not Be Empty    ${ACCESS_TOKEN}
    IF    not ${has_token}
        POST Login Monomax
    END

Json Value
    [Arguments]    ${body}    ${jsonpath}
    ${value}=    JSONLibrary.Get Value From Json    ${body}    ${jsonpath}
    [Return]    ${value[0]}

Log Success
    [Documentation]    Log success message
    [Arguments]    ${message}
    Log To Console    ✅ ${message}
    Log    ${message}    INFO

Log Warning
    [Documentation]    Log warning message
    [Arguments]    ${message}
    Log To Console    ⚠ ${message}
    Log    ${message}    WARN

Log Error
    [Documentation]    Log error message
    [Arguments]    ${message}
    Log To Console    ❌ ${message}
    Log    ${message}    ERROR

Log Info
    [Documentation]    Log info message
    [Arguments]    ${message}
    Log To Console    ${message}
    Log    ${message}    INFO

