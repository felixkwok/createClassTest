*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_create.robot file.
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Valid Create
    Given browser is opened to Create class page
    When Title "yoga class" is typed in
    And Description "description" is typed in
    And Difficulty "Beginner" is selected
    And Language "Cantonese" is selected
    Then Submit Creation
    Then Result Page should be open

*** Keywords ***
Browser is opened to Create class page
    Open browser to Create class page

User "${username}" logs in with password "${password}"
    Input username    ${username}
    Input password    ${password}
    Submit credentials

Title "${title}" is typed in
    Input title     ${title}

Description "${description}" is typed in
    Input description     ${description}

Difficulty "${difficulty}" is selected
    Select Difficulty  ${difficulty}

Language "${language}" is selected
    Select Language  ${language}

