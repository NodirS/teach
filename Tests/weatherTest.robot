*** Settings ***
Documentation       Simple API test: weather API
Library             SeleniumLibrary
Library             RequestsLibrary
Library             JSONLibrary
Library             Collections


*** Test Cases ***
Get request and validate response code and body
    [Documentation]     This test case verifies response code of GET request is 200
                        ...  response body contains the title key with value "Helsinki"
                        ...  and response body contains the key "location_type"

    [Tags]              smoke  weather  Helsinki

    Create Session      mySession               https://www.metaweather.com             verify=true
    ${response}=        GET On Session          mySession  /api/location/search/        params=query=Helsinki
    Status Should Be    200                     ${response}
    Log To Console      Status code PASS

    ${title}=           Get Value From Json     ${response.json()}[0]       title
    ${titleFromList}=   Get From List           ${title}                    0
    Should Be Equal     ${titleFromList}        Helsinki

    ${body}=            Convert To String       ${response.content}
    Should Contain      ${body}                 location_type
    
    Log To Console      ${body}

    # change 1
    # change 2
    # WIP change 3
    # real WIP change 5

