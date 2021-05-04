*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID Title}     yoga class
${VALID Description}    description
${VALID Difficulty}  	Beginner  #Intermediate  Advanced
${VALID Language}       Cantonese    #English  Mandarin
${UNSELECT}    	        Please select
${CREATECLASS URL}      http://${SERVER}/createClass.html
${CREATE URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
Open Browser To Create class Page
    Open Browser    ${CREATECLASS URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create Class Page Should Be Open

Create Class Page Should Be Open
    Title Should Be    Create class 

Go To Create Class Page
    Go To    ${CREATECLASS URL}
    Create Class Page Should Be Open

Input Title
    [Arguments]    ${title}
    Input Text     title_field    ${title}

Input Description
    [Arguments]    ${description}
    Input Text    description_field    ${description}

Select Difficulty
    [Arguments]    ${difficulty}
    Select From List By Label   difficulty_field    ${difficulty}

Select Language
    [Arguments]    ${language}
    Select From List By Label   language_field    ${language}

Submit Creation
    Click Button    submit_button

Result Page Should Be Open
    Location Should Be    ${CREATE URL}
    Title Should Be    Result Page
