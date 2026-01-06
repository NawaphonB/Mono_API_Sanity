*** Settings ***
Resource    ../resources/_settings.resource

*** Test Cases ***


PK_004 สมัคร Basic 99 รายเดือนแบบ Recurring ด้วย In app purchase สำเร็จ
    POST Login Monomax and Get token    ${PK_004_Data.Username}     ${PK_004_Data.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_004_Data.SKU_IOS_004}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_004_Data.SKU_Android_004}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_004_Data.SKU_Android_004}

PK_005 สมัคร Basic 699 รายปีแบบ Recurring ด้วย In app purchase สำเร็จ
    POST Login Monomax and Get token    ${PK_005_Data.Username}     ${PK_005_Data.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_005_Data.SKU_IOS_005}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_005_Data.SKU_Android_005}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_005_Data.SKU_Android_005}

PK_030 สมัคร Standard 299 รายเดือนแบบ Recurring ด้วย In app purchase สำเร็จ
    POST Login Monomax and Get token    ${PK_030_Data.Username}     ${PK_030_Data.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_030_Data.SKU_IOS_030}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_030_Data.SKU_Android_030}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_030_Data.SKU_Android_030}

PK_031 สมัคร Standard 2999 รายปีแบบ Recurring ด้วย In app purchase สำเร็จ
    POST Login Monomax and Get token    ${PK_031_Data.Username}     ${PK_031_Data.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_031_Data.SKU_IOS_031}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_031_Data.SKU_Android_031}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_031_Data.SKU_Android_031}

PK_043 Upgrade จาก Basic ไป Standard ด้วย In app purchase สำเร็จ รายเดือน -> รายเดือน
    POST Login Monomax and Get token    ${PK_043_Data.Username}     ${PK_043_Data.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_043_Data.SKU_IOS_031}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_043_Data.SKU_Android_031}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_043_Data.SKU_Android_031}

PK_044 Upgrade จาก Basic ไป Standard ด้วย In app purchase สำเร็จ รายเดือน -> รายปี
    POST Login Monomax and Get token    ${PK_044_Data.Username}     ${PK_044_Data.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_044_Data.SKU_IOS_044}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_044_Data.SKU_Android_044}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_044_Data.SKU_Android_044}

PK_045 Upgrade จาก Basic ไป Standard ด้วย In app purchase สำเร็จ รายปี -> รายปี
    POST Login Monomax and Get token    ${PK_045_Data.Username}     ${PK_045_Data.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_045_Data.SKU_IOS_045}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_045_Data.SKU_Android_045}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_045_Data.SKU_Android_045}

PK_046 Upgrade จาก Basic ไป Standard ด้วย In app purchase สำเร็จ รายปี -> รายเดือน
    POST Login Monomax and Get token    ${PK_046_Data.Username}     ${PK_046_Data.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_046_Data.SKU_IOS_046}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_046_Data.SKU_Android_046}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_046_Data.SKU_Android_046}