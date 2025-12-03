*** Settings ***
Resource    ../resources/_settings.resource

*** Test Cases ***

LN_001 Success- Login Success with E-mail
    POST Login Monomax      ${LN_001_Data.Username}   ${LN_001_Data.Password}    


LN_002 Success-Login success with mobile
    POST Login Monomax      ${LN_002_Data.Username}     ${LN_002_Data.Password}


LN_006 Fail-Login fail with E-mail password incorrect
    POST Login Monomax Fail  ${LN_006_Data.Username}    ${LN_006_Data.Password}


LN_007 Fail-Login fail with mobile password incorrect
    POST Login Monomax Fail  ${LN_007_Data.Username}    ${LN_007_Data.Password}

LN_008 Fail-Login fail E-mail not found
    POST Login Monomax Fail  ${LN_008_Data.Username}    ${LN_008_Data.Password}

LN_009 Fail-Login fail mobile not found
    POST Login Monomax Fail  ${LN_009_Data.Username}    ${LN_009_Data.Password}