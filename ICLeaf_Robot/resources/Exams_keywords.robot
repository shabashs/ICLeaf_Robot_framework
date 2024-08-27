*** Variables ***
${Exam}              //a[@href="#/activeExams"]
${filter}            //div[@class="pack-filter-icon"]
${drop down}         //div[@id="demo-multiple-checkbox"]
${TAB}               (//span[@class="MuiTypography-root MuiTypography-body1 MuiListItemText-primary css-yb0lig"])[2]
${OPTIONS}           xpath= //label[text()='Incomplete Pack']/preceding-sibling::input[@type='checkbox']
${FILTER_BTN}        xpath=//button[contains(text(), 'Filter')]
${EXAM_VIEW}         (//text[text()='View Exams'])[2]
${Exam_filter}       //div[@class="exams-filter-icon"]
${practice}          //input[@type="checkbox" and @id="practiceCheckbox"]
${Final}             xpath=//input[@type="checkbox" and @id="finalCheckbox"]
${incomplete}        xpath=//input[@type="checkbox" and @id="pack2"]
${Start_Exam}        xpath=//button[@type="button" and text()="Start Exam"]
${Okay_Button}       xpath=//button[text()="Okay"]
${RADIO_BUTTON_XPATH}  //div[@class="answers"]//input[@class="start-exam-radio"]
${Question box}      //div[@class="question-txt"]//input[@type="text"]
${selector}          //div[@class="answers"]//div[@class="option-label"]
${MATCH_THE_FOLLOWING_CSS}  div.matchthefollwoing.match-container
${Un Answer}         //div[text()='Unanswered']
${Give Answer}       (//span[@class="option-label-txt undefined"])[2]
${right}             (//span[@class="option-label-txt undefined"])[1]
${Next_button_1}       //span[contains(.,'Next')]
${Answer}            //div[text()='Answered']
${Verify}            //div[@class="num-item"]
${okay}              //button[text()='Okay']
${book mark}         //button[text()='Bookmark']
${bookmark filter}   //div[text()='Bookmarks']
${Justified filter}  //div[text()='Justified']
${justify}           //button[text()='Justify']
${Finish}            //button[text()='Finish']
${Submit}            //div[text()='Submit']
${Disabled Next}     //button[@type="button" and @tabindex="-1"]//span[contains(.,'Next')]
${Yes}               //button[text()='Yes']
${ELEMENT_LOCATOR}   (//input[@type="text"])[2]
${TEXT_TO_SEND}      Automated text
${DRAG_SOURCE}       (//div[@class="part-b match-column"]//div[@class="draggable-item match-item"])[1]
${DRAG_TARGET}       (//div[@class="part-b match-column"]//div[@class="draggable-item match-item"])[2]
${sc_dp}        (//div[@class="draggable-item match-item"])[3]
${Desck_Area}   //div[@class="ql-container ql-snow"]
*** Keywords ***
Exams
    sleep   2s
    Run Keyword And Continue On Failure    Select Exam
    Run Keyword And Continue On Failure   Start Exam

Select Exam
    Wait Until Element Is Visible      ${Exam}        timeout=10s
    Click Element    ${Exam}
    Wait Until Element Is Visible      ${filter}        timeout=10s
    Click Element    ${filter}
    Wait Until Element Is Visible     ${drop down}      timeout=10s
    Click Element    ${drop down}
    sleep    2
    Press Escape Key
    sleep    2
    Wait Until Element Is Visible     ${OPTIONS}        timeout=10s
    Click Element  ${OPTIONS}
    sleep    2s
    Wait Until Element Is Visible    ${FILTER_BTN}    timeout=10s
    Click Element    ${FILTER_BTN}
    Wait Until Element Is Visible      ${EXAM_VIEW}           timeout=10s
    Click Element   ${EXAM_VIEW}
    sleep   3s
    Wait Until Element Is Visible      ${Exam_filter}         timeout=10s
    Click Element    ${Exam_filter}
    sleep  2s
    sleep  2s
    Wait Until Element Is Visible      ${practice}         timeout=10
    Click Element    ${practice}
    #Wait Until Element Is Visible     ${incomplete}        timeout=10s
    #Click Element    ${incomplete}
    Wait Until Element Is Visible    ${FILTER_BTN}    timeout=10s
    Click Element    ${FILTER_BTN}

Press Escape Key
    Press Keys  ${TAB}  ESC

Start Exam
    Wait Until Element Is Visible      ${Start_Exam}         timeout=10s
    ${element_text}=    Get Text    xpath=//div[@class='exam-footer-box' and contains(.,'Questions')]
    ${value}=    Evaluate    int('${element_text}'.split()[0])
    Run Keyword And Ignore Error  Click Element   ${Start_Exam}
    Perform Exam    ${value}

Perform Exam
    [Arguments]    ${value}
    ${exam_finished}=    Run Keyword And Return Status    Check If Exam Finished
    Run Keyword If    '${exam_finished}' == 'True'    Exam loop    ${value}
    ${exam_finished}=    Run Keyword And Return Status    Check If Exam Finished
    Run Keyword If    '${exam_finished}' == 'False'    finsh the exam

Exam loop
    [Arguments]    ${value}
    FOR    ${i}    IN RANGE    ${value}
        Try To Answer The Field
    END
    Run Keyword And Ignore Error  Click Element  ${justify}
    Run Keyword And Ignore Error  Click Element  ${Justified filter}
    Run Keyword And Ignore Error  Click Element  ${Yes}
    finsh the exam
Exit For Loop
    RETURN    True

Check If Exam Finished
    ${Disabled_Next}=    Run Keyword And Return Status    Click Element    ${Disabled Next}
    Return From Keyword If    ${Disabled_Next}    True

Try To Answer The Field
    Run Keyword And Ignore Error  Click Element  ${Un Answer}

    ${radio_is_present}=    Run Keyword And Return Status    Element Should Be Visible    ${RADIO_BUTTON_XPATH}
    Run Keyword If    ${radio_is_present}    Answer Radio

    ${text_input_is_present}=    Run Keyword And Return Status    Element Should Be Visible    ${Question box}
    Run Keyword If    ${text_input_is_present}    Answer Blanks


    ${match_container_is_present}=    Run Keyword And Return Status    Element Should Be Visible    ${MATCH_THE_FOLLOWING_CSS}
    Run Keyword If    ${match_container_is_present}    Answer Match

    ${selector_is_present}=    Run Keyword And Return Status    Element Should Be Visible    ${selector}
    Run Keyword If    ${selector_is_present}     Answer Selector

    ${Desc_is_present}=  Run Keyword And Return Status    Element Should Be Visible      ${Desck_Area}
    Run Keyword If  ${Desc_is_present}  Answe Command

Answer Radio
    sleep   2s
    ${script_element}=    Get WebElement   ${Give Answer}
    Scroll Element Into View    ${script_element}
    Run Keyword And Ignore Error  Click Element  ${right}
    Click Element    ${Next_button_1}

Answer Selector
    sleep   2s
    ${script_element}=    Get WebElement   ${Give Answer}
    Scroll Element Into View    ${script_element}
    Run Keyword And Ignore Error  Click Element  ${Give Answer}
    Click Element    ${Next_button_1}


Answer Match
    sleep   4s
    ${script_element}=    Get WebElement   ${sc_dp}    timeout=10s
    Scroll Element Into View    ${script_element}
    sleep   3s
    Run Keyword And Ignore Error  Drag And Drop  ${DRAG_SOURCE}  ${DRAG_TARGET}
    Click Element    ${Next_button_1}


Answe Command
    Run Keyword And Ignore Error  Input Text  ${Desck_Area}     ${TEXT_TO_SEND}
    Run Keyword And Ignore Error  Click Element  ${Next_button_1}

Answer Blanks
    sleep   2s
    ${script_element}=    Get WebElement   ${ELEMENT_LOCATOR}
    Scroll Element Into View    ${script_element}
    Run Keyword And Ignore Error  Input Text  ${ELEMENT_LOCATOR}  ${TEXT_TO_SEND}
    Run Keyword And Ignore Error  Click Element  ${book mark}
    Run Keyword And Ignore Error  Click Element  ${bookmark filter}
    Run Keyword And Ignore Error  Click Element  ${Next_button_1}
    Run Keyword And Ignore Error  Click Element  ${okay}
    Run Keyword And Ignore Error  Click Element  ${Un Answer}
    Run Keyword And Ignore Error  Click Element  ${Next_button_1}


finsh the exam
    Run Keyword And Ignore Error  Click Element    ${Finish}
    Run Keyword And Ignore Error  Click Element    ${Submit}
    Run Keyword And Ignore Error  Click Element    ${Yes}