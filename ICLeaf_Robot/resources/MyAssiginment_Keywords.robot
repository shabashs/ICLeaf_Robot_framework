*** Variables ***
${FILE_PATH}                    /home/adminroot/ICLeaf_Robot/Course_Process_2024-02-22T12_12_59.pdf
${MY_ASSIGNMENTS_LINK}          xpath=//a[.//span[text()="My Assignments"]]
${REACT_SELECT_INPUT}           xpath=//input[@id="react-select-2-input"]
${TEST_SELENIUM_OPTION}         xpath=//div[text()='Test Selenium']
${GET_ASSIGNMENTS_BUTTON}       xpath=//button[text()="Get Assignments"]
${UPLOAD_ICON}                  css:.upload-icon-asgn
${FILE_INPUT}                   css=input[type="file"]
${UPLOAD_ASSIGNMENT_BUTTON}     xpath=//button[text()="Upload Assignment"]
${OKAY_BUTTON}                  xpath=//button[normalize-space(text())='Okay']
${SUBMIT_ASSIGNMENT_BUTTON}     xpath=//button[text()="Submit Assignment"]


*** Keywords ***
Select Assignment Topic
    # Click on the "My Assignments" link
    Wait Until Element Is Visible    ${MY_ASSIGNMENTS_LINK}    timeout=10s
    Click Element    ${MY_ASSIGNMENTS_LINK}
    Wait Until Element Is Visible    ${REACT_SELECT_INPUT}   timeout=10s
    Click Element    ${REACT_SELECT_INPUT}
    Wait Until Element Is Visible    ${TEST_SELENIUM_OPTION}     timeout=10s
    Click Element   ${TEST_SELENIUM_OPTION}
My Assignment
    sleep   2s
    Select Assignment Topic
    Click Get Assignments Button
    Upload File
Click Get Assignments Button
    Wait Until Element Is Visible    ${GET_ASSIGNMENTS_BUTTON}       timeout=10s
    Click Button    ${GET_ASSIGNMENTS_BUTTON}
    # Wait for a specific condition or element after clicking the button
    # Wait for a specific result or confirmation after clicking
    Sleep    5s

Scroll To Bottom
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    5s


Upload File
    #Scroll To Bottom
    # Ensure the upload icon is visible and clickable
    Wait Until Element Is Visible    css:.upload-icon-asgn    timeout=10s
    Click Element    css:.upload-icon-asgn
    # Ensure file input is visible and clickable
    Execute JavaScript    document.querySelector('input[type="file"]').style.display = 'block'; document.querySelector('input[type="file"]').style.visibility = 'visible';    # no need to use CSS class for file input
    Sleep    1s
    # Use Choose File keyword to upload the file
    Choose File    css=input[type="file"]    ${FILE_PATH}
    Sleep    1s
    # Click on the upload assignment button
    Wait Until Element Is Visible   ${UPLOAD_ASSIGNMENT_BUTTON}    timeout=10s
    Click Element    ${UPLOAD_ASSIGNMENT_BUTTON}
    Sleep    5s
    Wait Until Element Is Visible    ${OKAY_BUTTON}     timeout=10s
    Click Element    ${OKAY_BUTTON}

    Wait Until Element Is Visible    ${SUBMIT_ASSIGNMENT_BUTTON}    timeout=10s
    Click Element    ${SUBMIT_ASSIGNMENT_BUTTON}

    Wait Until Element Is Visible   ${OKAY_BUTTON}     timeout=10s
    Click Element   ${OKAY_BUTTON}
