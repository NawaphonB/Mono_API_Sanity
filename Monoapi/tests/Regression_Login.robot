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

PK_004 สมัคร Basic 99 รายเดือนแบบ Recurring ด้วย In app purchase สำเร็จ
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_004_Data.SKU_IOS_004}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_004_Data.SKU_Android_004}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_004_Data.SKU_Android_004}

PK_005 สมัคร Basic 699 รายปีแบบ Recurring ด้วย In app purchase สำเร็จ
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_005_Data.SKU_IOS_005}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_005_Data.SKU_Android_005}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_005_Data.SKU_Android_005}

PK_030 สมัคร Standard 299 รายเดือนแบบ Recurring ด้วย In app purchase สำเร็จ
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_030_Data.SKU_IOS_030}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_030_Data.SKU_Android_030}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_030_Data.SKU_Android_030}
    
PK_031 สมัคร Standard 2999 รายปีแบบ Recurring ด้วย In app purchase สำเร็จ
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_031_Data.SKU_IOS_031}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_031_Data.SKU_Android_031}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_031_Data.SKU_Android_031}