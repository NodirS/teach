*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library    DateTime

*** Variables ***
${current_time}
${modified_time}


*** Test Cases ***
Time check
#    ${current_time}=    Get Time
#    Log To Console    ${current_time}
#    ${modified_time}=        Add Time To Time    ${current_time}    ${120}
#
#    Log To Console    ${modified_time}

    ${time}     Convert Time    1 hour    result_format=compact
    Log To Console    Current time ${time}

    ${time2}=    Add Time To Time    ${time}       1 hour 3 mins     timer       exclude_millis=true
    Log To Console    ${time2}

    Log To Console    ***************************************************
    ${current_date}=    Get Current Date
    Log To Console    Current Date: ${current_date}

    ${future_date}=     Add Time To Date    ${current_date}    14 days      exclude_millis=true     result_format=%d.%m.%Y
    Log To Console    Future Date: ${future_date}

    # some randome text
