*** Settings ***
#Library
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     BuiltIn
Library     DateTime
Library     String
Library     OperatingSystem
Library     yaml

#Resources 
Resource    common.resource
Resource    Post_Login.resource
Resource    Get_Home.resource
Resource    Get_Package.resource
Resource    Get_Prepurchase.resource
Resource    Get_Profile.resource
Resource    Get_Sport.resource
Resource    Get_LiveTV.resource

#Variables 
Variables   ../variables/${ENV}_data.yaml

*** Variables ***
#เลือก ENV โดยการเปลี่ยนValue
${ENV}    prod        #staging/prod
