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
    POST Login Monomax and Get token   ${Basic_Monthly_IOS.Username}   ${Basic_Monthly_IOS.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_043_Data.SKU_IOS_031}
    POST Login Monomax and Get token   ${Basic_Monthly_Android.Username}   ${Basic_Monthly_Android.Password}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_043_Data.SKU_Android_031}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_043_Data.SKU_Android_031}

PK_044 Upgrade จาก Basic ไป Standard ด้วย In app purchase สำเร็จ รายเดือน -> รายปี
    POST Login Monomax and Get token   ${Basic_Monthly_IOS.Username}   ${Basic_Monthly_IOS.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_044_Data.SKU_IOS_044}
    POST Login Monomax and Get token   ${Basic_Monthly_Android.Username}   ${Basic_Monthly_Android.Password}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_044_Data.SKU_Android_044}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_044_Data.SKU_Android_044}

PK_045 Upgrade จาก Basic ไป Standard ด้วย In app purchase สำเร็จ รายปี -> รายปี
    POST Login Monomax and Get token   ${Basic_Yearly_IOS.Username}   ${Basic_Yearly_IOS.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_045_Data.SKU_IOS_045}
    POST Login Monomax and Get token   ${Basic_Yearly_Android.Username}   ${Basic_Yearly_Android.Password}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_045_Data.SKU_Android_045}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_045_Data.SKU_Android_045}

PK_046 Upgrade จาก Basic ไป Standard ด้วย In app purchase สำเร็จ รายปี -> รายเดือน
    POST Login Monomax and Get token   ${Basic_Yearly_IOS.Username}   ${Basic_Yearly_IOS.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_046_Data.SKU_IOS_046}
    POST Login Monomax and Get token   ${Basic_Yearly_Android.Username}   ${Basic_Yearly_Android.Password}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_046_Data.SKU_Android_046}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_046_Data.SKU_Android_046}

PK_048 Downgrade Standard รายปี -> Standard รายเดือน
    POST Login Monomax and Get token   ${Standard_Yearly_IOS.Username}   ${Standard_Yearly_IOS.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_046_Data.SKU_IOS_048}
    POST Login Monomax and Get token   ${Standard_Yearly_Android.Username}   ${Standard_Yearly_Android.Password}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_046_Data.SKU_Android_048}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_046_Data.SKU_Android_048}

PK_049 Downgrade Standard รายเดือน -> Basic รายเดือน
    POST Login Monomax and Get token   ${Standard_Monthly_IOS.Username}   ${Standard_Monthly_IOS.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_046_Data.SKU_IOS_049}
    POST Login Monomax and Get token   ${Standard_Monthly_Android.Username}   ${Standard_Monthly_Android.Password}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_049_Data.SKU_Android_049}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_049_Data.SKU_Android_049}

PK_050 Downgrade Standard รายปี -> Basic รายเดือน
    POST Login Monomax and Get token   ${Standard_Yearly_IOS.Username}   ${Standard_Yearly_IOS.Password}
    Get Pre-purchase Monomax     ${Platform_Data.IOS}    ${PK_050_Data.SKU_IOS_050}
    POST Login Monomax and Get token   ${Standard_Yearly_Android.Username}   ${Standard_Yearly_Android.Password}
    Get Pre-purchase Monomax     ${Platform_Data.Android}    ${PK_050_Data.SKU_Android_050}
    Get Pre-purchase Monomax     ${Platform_Data.AndroidTV}    ${PK_050_Data.SKU_Android_050}

PK_051 ลูกค้าที่ซื้อ Recurring ไม่อนุญาตให้ซื้อ Upgrade ต่อเป็นแบบ One time ได้
    POST Login Monomax and Get token   ${Basic_Monthly_IOS.Username}   ${Basic_Monthly_IOS.Password}
    POST Login Monomax and Get token   ${Basic_Monthly_Android.Username}   ${Basic_Monthly_Android.Password}
    POST Login Monomax and Get token   ${Basic_Yearly_IOS.Username}   ${Basic_Yearly_IOS.Password}
    POST Login Monomax and Get token   ${Basic_Yearly_Android.Username}   ${Basic_Yearly_Android.Password}
    POST Login Monomax and Get token   ${Standard_Monthly_IOS.Username}   ${Standard_Monthly_IOS.Password}
    POST Login Monomax and Get token   ${Standard_Monthly_Android.Username}   ${Standard_Monthly_Android.Password}
    POST Login Monomax and Get token   ${Standard_Yearly_IOS.Username}   ${Standard_Yearly_IOS.Password}
    POST Login Monomax and Get token   ${Standard_Yearly_Android.Username}   ${Standard_Yearly_Android.Password}


PK_052 ลูกค้าที่ซื้อ Recurring ไม่อนุญาตให้ซื้อ Downgrade ต่อเป็นแบบ One time ได้
