*** Settings ***
Resource    ../resources/_settings.resource

*** Test Cases ***
HC_Login_API
    POST Login Monomax
    Ensure Logged In

HC_Home_API
    Get Home Page Monomax

HC_Get_Package_API
    Get Package Category Monomax

HC_Get_Profile_API
    Get Profile Monomax

HC_Get_Sport_Home
    Get Sport Home Page Monomax

