*** Settings ***
Library    Keyboard
*** Variables ***
${BUY_COURSE_LINK}      //span[text()='Buy Courses']
${SEARCH_OPTION}        //input[@placeholder='Search course here']
${PAID_COURSE_NAME}     BasicPrograms
${paid_VIEW_BUTTON}     //text[@class='course_name' and text()='BasicPrograms']/ancestor::div[contains(@class, 'course_content_container')]//button[text()='View']
${Free_VIEW_BUTTON}     //text[@class='course_name' and text()='DASM Assessment']/ancestor::div[contains(@class, 'course_content_container')]//button[text()='View']
${ENROLL_BUTTON}        //button[contains(@class, 'MuiButtonBase-root') and text()='Enroll Now']
${CARD_NUMBER_VALUE}    4111 1111 1111 1111 0945456644546
${PAY_NOW_BUTTON}       (//button[text()='Pay now'])[2]
${TEXT_MESSAGE}         //span[text()='Your Payment Succeeded']
${OKAY_BUTTON}          //button[text()='Okay']
${FREE_COURSE_NAME}     DASM Assessment


*** Keywords ***
Buy course
    sleep   2s
    #Run Keyword And Continue On Failure    Buy Courses paid course
    sleep   2s
    Run Keyword And Continue On Failure    Buy Courses free course


Buy Courses paid course
    Set Selenium Implicit Wait    2 seconds
    Click Element    ${BUY_COURSE_LINK}
    Wait Until Element Is Visible    ${SEARCH_OPTION}
    Input Text    ${SEARCH_OPTION}    ${PAID_COURSE_NAME}
    sleep   1
    Click Element    ${paid_VIEW_BUTTON}
    Click Element    ${ENROLL_BUTTON}
    sleep   3
    Press Key    //input    NONE
    Press Key    //input    ${CARD_NUMBER_VALUE}

    #press keys    NONE    ENTER
    sleep   3
    Run Keyword And Ignore Error  Click Element    ${OKAY_BUTTON}

Buy Courses free course
    Set Selenium Implicit Wait    2 seconds
    Click Element    ${BUY_COURSE_LINK}
    Wait Until Element Is Visible    ${SEARCH_OPTION}
    Input Text    ${SEARCH_OPTION}    ${FREE_COURSE_NAME}

    sleep   3
    Click Element    ${Free_VIEW_BUTTON}
    #Run Keyword And Ignore Error  Click Element    ${ENROLL_BUTTON}
