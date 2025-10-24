***Settings***
Resource     ../resources/_settings.resource   

*** Keywords ***
Authorization Monomax
    [Documentation]    Create header โดยใช้ token
    ${headers}=     Create Dictionary
    ...       Authorization=Bearer ${ACCESS_TOKEN}
    RETURN    ${headers}

Ensure Logged In
    [Documentation]    มี token และยังใช้ได้ → ข้าม; ไม่มี/หมดอายุ → login ใหม่
    #run keyword Should Not Be Empty เพื่อเช็คว่ามี access token ใน test suite นี้มั้ย ถ้ามีใช้ค่านั้น ถ้าไม่มี run keyword POST Login Monomax เพื่อประกาศ access token
    ${has_token}=    Run Keyword And Return Status    Should Not Be Empty    ${ACCESS_TOKEN}    
    IF    not ${has_token}
        POST Login Monomax
    END

Json Value
    [Documentation]    Return ค่าจาก response โดยใช้ jsonpath
    #ดึงค่าจาก json response โดยจะดึงค่าตาม jsonpath(key) ที่เราต้องการ
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

