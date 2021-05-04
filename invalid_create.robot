*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Create class Page
Suite Teardown    Close Browser
Test Setup        Go To Create class Page
Test Template     Create class With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***                              TITLE              DESCRIPTION                 DIFFICULTY             LANGUAGE
Empty Title                                     ${EMPTY}            ${VALID DESCRIPTION}        ${VALID DIFFICULTY}     ${VALID LANGUAGE}
Empty Description                               ${VALID TITLE}      ${EMPTY}                    ${VALID DIFFICULTY}     ${VALID LANGUAGE}
Unselected Difficulty                           ${VALID TITLE}      ${VALID DESCRIPTION}        ${UNSELECT}             ${VALID LANGUAGE}
Unselected Language                             ${VALID TITLE}      ${VALID DESCRIPTION}        ${VALID DIFFICULTY}     ${UNSELECT}

Empty Title And Description                     ${EMPTY}            ${EMPTY}                    ${VALID DIFFICULTY}     ${VALID LANGUAGE}
Empty Title And Difficulty                      ${EMPTY}            ${VALID DESCRIPTION}        ${UNSELECT}             ${VALID LANGUAGE}
Empty Title And Language                        ${EMPTY}            ${VALID DESCRIPTION}        ${VALID DIFFICULTY}     ${UNSELECT}

Empty Description And Difficulty                ${VALID TITLE}      ${EMPTY}                    ${UNSELECT}             ${VALID LANGUAGE}
Empty Description And Language                  ${VALID TITLE}      ${EMPTY}                    ${VALID DIFFICULTY}     ${UNSELECT}

Empty Language And Difficulty                   ${VALID TITLE}      ${VALID DESCRIPTION}        ${UNSELECT}             ${UNSELECT}

Empty Title And Description And Difficulty      ${EMPTY}            ${EMPTY}                    ${UNSELECT}             ${VALID LANGUAGE}
Empty Title And Description And Language        ${EMPTY}            ${EMPTY}                    ${VALID DIFFICULTY}     ${UNSELECT}

Empty Description And Difficulty And Language   ${VALID TITLE}      ${EMPTY}                    ${UNSELECT}             ${UNSELECT}

Empty Title And Difficulty And Language         ${EMPTY}            ${VALID DESCRIPTION}        ${UNSELECT}             ${UNSELECT}

Valid Title only                                ${VALID TITLE}      ${EMPTY}                    ${UNSELECT}             ${UNSELECT}
Valid Description only                          ${EMPTY}            ${VALID DESCRIPTION}        ${UNSELECT}             ${UNSELECT}
Valid Difficulty only                           ${EMPTY}            ${EMPTY}                    ${VALID DIFFICULTY}     ${UNSELECT}
Valid Language only                             ${EMPTY}            ${EMPTY}                    ${UNSELECT}             ${VALID LANGUAGE}




*** Keywords ***
Create class With Invalid Credentials Should Fail
    [Arguments]    ${title}    ${description}       ${difficulty}       ${language}
    Input Title             ${title}
    Input Description       ${description}
    Select Difficulty       ${difficulty}     
    Select Language         ${language}      
    Submit Creation
    Creation Should Have Failed

Creation Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
