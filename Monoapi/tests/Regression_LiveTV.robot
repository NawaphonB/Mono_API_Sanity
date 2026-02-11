*** Settings ***
Resource    ../resources/_settings.resource

*** Test Cases ***

LiveTV_01 User ที่ไม่ได้ Login จะดูได้แค่ช่อง Tier 'ดูได้ทุกคน'  
    Get LiveTV Stream Monomax No header     ${LiveTV_001_Data.Channels}
LiveTV_02 User ที่ Login แต่ไม่มี Package จะดูได้แค่ช่อง Tier 'ดูได้ทุกคน'
    POST Login Monomax and Get token   ${Freetier.Username}   ${Freetier.Password}
    Get LiveTV Stream Monomax     ${LiveTV_002.Data.Channels}
LiveTV_03 User ที่ Login ด้วย Package Starter จะดูได้แค่ช่อง Tier 'ดูได้ทุกคน'
    POST Login Monomax and Get token   ${Starter.Username}   ${Starter.Password}
    Get LiveTV Stream Monomax     ${LiveTV_003.Data.Channels}
LiveTV_04 User ที่ Login ด้วย Package Basic จะดูได้ทุกช่องยกเว้นช่อง Tier Standard
    POST Login Monomax and Get token   ${Basic_Monthly_IOS.Username}   ${Basic_Monthly_IOS.Password}
    Get LiveTV Stream Monomax     ${LiveTV_004_Data.Channels}
LiveTV_05 User ที่ Login ด้วย Package Standard จะดูช่อง LiveTV ได้ทุกช่อง

LiveTV_06 User ที่ Login ด้วย Package Basic/Standard ที่ยกเลิกและหมดอายุแล้วจะดูได้แค่ช่อง Tier 'ดูได้ทุกคน'

LiveTV_07 User ที่ Login ด้วย Package Basic/Standard ที่หมดอายุจะดูได้แค่ช่อง Tier 'ดูได้ทุกคน'

LiveTV_08 User ที่ Login ด้วย Package Basic ที่ยกเลิกแล้วยังไม่หมดอายุจะดูได้ทุกช่องยกเว้นช่อง Tier Standard

LiveTV_09 User ที่ Login ด้วย Package Standard ที่ยกเลิกแล้วยังไม่หมดอายุจะดูช่อง LiveTV ได้ทุกช่อง