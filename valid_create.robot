*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Create
    Open Browser To Create class Page
    Input Title    yoga class
    Input Description    description
    Select Difficulty  Beginner     #Intermediate  Advanced
    Select Language  Cantonese      #English  Mandarin
    Submit Creation
    Result Page Should Be Open
    [Teardown]    Close Browser
