*** Settings ***
Documentation       Simple API test: POST request
Library             SeleniumLibrary
Library             RequestsLibrary
Library             JSONLibrary
Library             Collections

*** Test Cases ***
Do a POST reqest and validate reponse code, response body and response headers
    [Documentation]     This test case verifies that response code of post request is 201
                        ...  response body should contain "id" key with value "101"
                        ...  and response header "content_type" has value of "application/json; charset=utf-8"
    [Tags]              post  smoke  regression

    Create Session      mysession       https://jsonplaceholder.typicode.com        verify=true
    &{body}=            Create Dictionary   title=foo       body=bar        userId=9000
    &{header}=          Create Dictionary   Cache-Control=no-cache
    ${response}=        POST On Session     mysession       /posts          data=${body}  headers=${header}
    Status Should Be    201                 ${response}
    Log To Console      ${response.json()}

    # ID check from response body
    ${id}=                          Get Value From Json     ${response.json()}      id
    ${idFromList}=                  Get From List           ${id}                   0
    ${idFromListAsString}=          Convert To String       ${idFromList}
    Should Be Equal As Strings      ${idFromListAsString}   101

    # Header content-type check
    ${headerValue}=                 Get From Dictionary     ${response.headers}     Content-type
    Should Be Equal                 ${headerValue}          application/json; charset=utf-8