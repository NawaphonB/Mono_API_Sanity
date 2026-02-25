*** Settings ***
Resource    ../resources/_settings.resource
Suite Teardown    Teardown Suite

*** Test Cases ***
SP_001 ตรวจสอบว่าไม่สามารถดูถ่ายทอดสดฟุตบอล, ไฮไลท์ และการแข่งขันฟุตบอลย้อนหลังได้ หากไม่เข้าสู่ระบบ
    Get VOD Stream Monomax non login    ${SP_001_Data.VodID}
    Get VOD Stream Monomax non login    ${SP_001_Data.HighlightID}

SP_002 ตรวจสอบว่าไม่สามารถดูถ่ายทอดสดฟุตบอล, ไฮไลท์และการแข่งขันฟุตบอลย้อนหลังได้ หากไม่มีแพ็กเกจ
    POST Login Monomax and Get token   ${Freetier.Username}   ${Freetier.Password}
    Get VOD Stream Monomax     ${SP_002_Data.VodID}
    Get VOD Stream Monomax     ${SP_002_Data.HighlightID}

SP_003 ตรวจสอบว่าไม่สามารถดูถ่ายทอดสดฟุตบอล, ไฮไลท์และการแข่งขันฟุตบอลย้อนหลังได้ หากมีแพ็กเกจ starter แต่ยังไม่มีแพ็กเกจ standard (EPL)
    POST Login Monomax and Get token   ${Starter.Username}   ${Starter.Password}
    Get VOD Stream Monomax     ${SP_003_Data.VodID}
    Get VOD Stream Monomax     ${SP_003_Data.HighlightID}

SP_004 ตรวจสอบว่าไม่สามารถดูถ่ายทอดสดฟุตบอล, ไฮไลท์และการแข่งขันฟุตบอลย้อนหลังได้ หากมีแพ็กเกจ basic แต่ยังไม่มีแพ็กเกจ standard (EPL)
    POST Login Monomax and Get token   ${Basic_Monthly_IOS.Username}   ${Basic_Monthly_IOS.Password}
    Get VOD Stream Monomax     ${SP_004_Data.VodID}
    Get VOD Stream Monomax     ${SP_004_Data.HighlightID}

SP_005 ตรวจสอบว่าสามารถดูถ่ายทอดสดฟุตบอล, ไฮไลท์และการแข่งขันฟุตบอลย้อนหลังได้ หากมีแพ็กเกจ standard (EPL)
    POST Login Monomax and Get token   ${Standard_Monthly_IOS.Username}   ${Standard_Monthly_IOS.Password}
    Get VOD Stream Monomax     ${SP_005_Data.VodID}
    Get VOD Stream Monomax     ${SP_005_Data.HighlightID}

SP_036 ตรวจสอบว่าไม่สามารถดูถ่ายทอดสดฟุตบอล, Match upcoming และการแข่งขันฟุตบอลย้อนหลังได้ หากแพ็กเกจ standard (EPL) หมดอายุ
    POST Login Monomax and Get token   ${Standard_Expired.Username}   ${Standard_Expired.Password}
    Get Match Live Stream Monomax     ${SP_036_Data.LiveID}
    Get VOD Stream Monomax     ${SP_036_Data.VodID}
    Get VOD Stream Monomax     ${SP_036_Data.HighlightID}