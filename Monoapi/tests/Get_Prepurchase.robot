*** Settings ***
Resource    ../resources/_settings.resource

*** Test Cases ***
Test case Get Pre-purchase Monomax
    Get Pre-purchase Monomax     ${platform_prepurchase}    ${SKU} 

