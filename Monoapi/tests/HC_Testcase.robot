*** Settings ***
Resource    ../resources/_settings.resource

*** Test Cases ***
HC_Login_Free_tier_API
    POST Login Monomax and Get token  ${username_freetier}    ${password_freetier}
    Ensure Logged In

HC_Home_API_Free_tier
    Get Home Page Monomax

#HC_Get_Prepurchase_API
    #Get Pre-purchase Monomax     ${platform_prepurchase}    ${SKU}

HC_Login_Basic_tier_API
    POST Login Monomax  ${username_basic}    ${default_password}
    Ensure Logged In

HC_Home_API_Basic_tier
    Get Home Page Monomax

HC_Login_Standard_tier_API
    POST Login Monomax  ${username_standard}    ${default_password}
    Ensure Logged In

HC_Home_API_Standard_tier
    Get Home Page Monomax

HC_Get_Package_API
    Get Package Category Monomax

HC_Get_Profile_API
    Get Profile Monomax

HC_Get_Sport_Home_API
    Get Sport Home Page Monomax

HC_Get_LiveTV_Home_API
    Get LiveTV Monomax

HC_Get_Series_detail_API
    Get Product detail      ${series_id}

