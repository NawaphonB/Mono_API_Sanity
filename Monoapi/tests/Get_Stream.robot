*** Settings ***
Resource    ../resources/_settings.resource

*** Test Cases ***
Test case Get Match Live Stream Monomax
    Get Match Live Stream Monomax    ${match_id}

Test case Get VOD Stream Monomax
    Get VOD Stream Monomax    ${vod_id}
