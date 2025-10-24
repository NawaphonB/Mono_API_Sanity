*** Settings ***
Resource     ../resources/_settings.resource   

*** Keywords ***
Get Package Category Monomax
    FOR    ${platform}      IN    @{Platform}
        ${Package_category_path}=    Catenate    SEPARATOR=    ${PACKAGES_PATH_PREFIX}    ${platform}

        FOR    ${category_id}   IN    @{CATEGORY_IDS}
        RequestsLibrary.Create Session    GET_Package_Category    ${Base_url}    verify=${Verify_flag}    disable_warnings=${Warning_flag}    
        ${params}=    Create Dictionary
        ...    category_id=${category_id}
        ${response}=    RequestsLibrary.GET On Session    GET_Package_Category    ${Package_category_path}    params=${params}
        Validate Package Category Response    ${response}    ${platform}    ${category_id} 
        END
    END

Validate Package Category Response
    [Arguments]    ${response}    ${platform}    ${category_id} 
    Log To Console     Get Package Category Response code: ${response.status_code}
    Should Be Equal As Integers    ${response.status_code}    200

    FOR    ${index}    IN RANGE    ${category_id} 
        ${json_response}=   Set Variable   ${response.json()}
        ${package_id}=      Json Value    ${json_response}    $.data.[${index}].id
        ${package_type}=    Json Value    ${json_response}    $.data.[${index}].package_type
        ${package_name}=    Json Value    ${json_response}    $.data.[${index}].name
        ${devices}=         Json Value    ${json_response}    $.data.[${index}].devices
        ${package_price}=   Json Value    ${json_response}    $.data.[${index}].price
        ${android_sku}=     Json Value    ${json_response}    $.data.[${index}].android_sku
        ${androidtv_sku}=   Json Value    ${json_response}    $.data.[${index}].androidtv_sku
        ${ios_sku}=         Json Value    ${json_response}    $.data.[${index}].ios_sku 
    
        Should Be True         ${package_id} > 0
        Should Not Be Empty    ${package_type}
        Should Not Be Empty    ${package_name}
        Should Be True         ${package_price} > 0
        Should Be True         ${devices} > 0
        Should Not Be Empty    ${android_sku}
        Should Not Be Empty    ${androidtv_sku}
        Should Not Be Empty    ${ios_sku}
    END
    Log To Console        Get Package Category ${category_id} ${platform} 
