*** Variables ***

${FILE_PATH}             /home/adminroot/ICLeaf_Robot/Course_Process_2024-02-22T12_12_59.pdf
${ERESOURCE_LINK}        xpath=//a[@href='#/EResource']
${REACT_SELECT_INPUT}    xpath=//input[@id="react-select-2-input"]
${TEST_SELENIUM}         xpath=//div[text()='Test Selenium']
${TOPIC_INPUT}           xpath=//input[@id="react-select-3-input"]
${TOPIC_INTRO}           xpath=//div[text()='Intro']
${LAUNCH_BUTTON}         xpath=//button[text()="Launch Course"]
${PRE_COURSE_TAB}        xpath=//text[contains(@class, 'tab_btn_text') and contains(text(), 'Pre Course Readiness')]
${PDF_ICON}              xpath=//div[contains(@class, 'tab_pdf_container')]//img[contains(@class, 'tab_pdf_img') and @alt='xx']
${INSTRUCTOR_TOOL}       xpath=//div[contains(@class, 'tab_btn_text') and text()='PPT']
${PDF_IMAGE}             xpath=//img[@class='tab_pdf_img']
${TRAINER_IN_ACTION}     xpath=//text[contains(@class, 'tab_btn_text') and contains(text(), 'Video')]
${PPT_CONTAINER}         xpath=(//div[@class="tab_ppt_container"])[1]
${VIDEO_ELEMENT}         xpath=//video[@class='video_styling']
${MODAL_CLOSE_ICON}      css:svg.qqv_modal_icon
${LISTEN_TO_TRAINERS}    xpath=//text[@class='tab_btn_text' and text()='Audio']
${CHECK_READINESS}       xpath=//text[@class='tab_btn_text' and contains(text(), 'Quiz')]
${QUIZ_ANSWER_RADIO}     css=input.quiz_answer_radio[value='2']
${CHECK_BUTTON}          xpath=//button[contains(@class, 'MuiButton-root') and contains(text(), 'Check')]
${NEXT_BUTTON}           xpath=//button[contains(@class, 'MuiButton-root') and contains(text(), 'Next')]
${KEY_TERMS_TAB}         xpath=//text[@class='tab_btn_text' and contains(text(), 'Flash Cards')]
${SLIDER_NEXT_ICON}      css=.slider_next_icon
${Zoom_Contol}           xpath=//div[@class='zoom-controls']
${key_terms}             xpath=//div[@ class="key_terms_card"]

*** Keywords ***
E-Resource
    sleep   2s
    Run Keyword And Continue On Failure    Select Subject
    Select Topic
    Click Launch Course Button
    Scroll To Bottom
    #Run Keyword And Continue On Failure    Select PDF
    #Run Keyword And Continue On Failure    Select PPT
    Run Keyword And Continue On Failure    Select Flash Cards
    #Run Keyword And Continue On Failure    Select Video
    #Run Keyword And Continue On Failure    Select Audio
    #Run Keyword And Continue On Failure    Select Quiz
Select Subject
    Wait Until Element Is Visible    ${ERESOURCE_LINK}    timeout=10s
    Click Element    ${ERESOURCE_LINK}
    Wait Until Element Is Visible    ${REACT_SELECT_INPUT}    timeout=5s
    Click Element    ${REACT_SELECT_INPUT}
    Wait Until Element Is Visible    ${TEST_SELENIUM}    timeout=10s
    Click Element    ${TEST_SELENIUM}

Select Topic
    Wait Until Element Is Visible    ${TOPIC_INPUT}    timeout=5s
    Click Element    ${TOPIC_INPUT}
    Wait Until Element Is Visible    ${TOPIC_INTRO}    timeout=10s
    Click Element    ${TOPIC_INTRO}

Click Launch Course Button
    Wait Until Element Is Visible    ${LAUNCH_BUTTON}
    Click Button    ${LAUNCH_BUTTON}
    Sleep    5s

Scroll To Bottom
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    5s

Select PDF
    #Wait Until Element Is Visible    ${PRE_COURSE_TAB}    timeout=10s
    #Click Element    ${PRE_COURSE_TAB}
    #Sleep    3s
    Wait Until Element Is Visible    ${PDF_ICON}    timeout=10s
    Click Element    ${PDF_ICON}
    Sleep    5s
    Wait Until Element Is Visible    ${Zoom_Contol}     timeout=20s
    Execute JavaScript    return document.querySelectorAll("svg.close_icon").length > 0 && document.querySelector("svg.close_icon").offsetParent !== null;
    ${icon_visible}=    Get Variable Value    ${icon_visible}
    Log    Close icon visibility: ${icon_visible}
    Wait Until Element Is Visible    css=.zoom-controls .close_icon    timeout=20s
    ${close_icon}=    Get WebElement    css=.zoom-controls .close_icon
    Click Element    ${close_icon}
    Sleep    5s

Select PPT
    Wait Until Element Is Visible    ${INSTRUCTOR_TOOL}    timeout=10s
    Click Element    ${INSTRUCTOR_TOOL}
    Sleep    3s
    Wait Until Element Is Visible    ${PDF_IMAGE}    timeout=10s
    Click Element    ${PDF_IMAGE}
    Sleep    2s
    Wait Until Element Is Visible    ${Zoom_Contol}     timeout=20s
    Execute JavaScript    return document.querySelectorAll("svg.close_icon").length > 0 && document.querySelector("svg.close_icon").offsetParent !== null;
    ${icon_visible}=    Get Variable Value    ${icon_visible}
    Log    Close icon visibility: ${icon_visible}
    Wait Until Element Is Visible    css=.zoom-controls .close_icon    timeout=20s
    ${close_icon}=    Get WebElement    css=.zoom-controls .close_icon
    Click Element    ${close_icon}
    Sleep    5s

Select Video
    Wait Until Element Is Visible    ${TRAINER_IN_ACTION}    timeout=10s
    Click Element    ${TRAINER_IN_ACTION}
    Sleep    3s
    Wait Until Element Is Visible    ${PPT_CONTAINER}    timeout=10s
    Click Element    ${PPT_CONTAINER}
    Sleep    2s
    Wait Until Element Is Visible    ${VIDEO_ELEMENT}    timeout=20s
    Click Element    ${VIDEO_ELEMENT}
    Sleep    10s
    Wait Until Element Is Visible    ${MODAL_CLOSE_ICON}    timeout=10s
    Click Element    ${MODAL_CLOSE_ICON}

Select Audio
    Wait Until Element Is Visible    ${LISTEN_TO_TRAINERS}    timeout=10s
    Click Element    ${LISTEN_TO_TRAINERS}
    Sleep    3s
    Wait Until Element Is Visible    ${PPT_CONTAINER}    timeout=10s
    Click Element    ${PPT_CONTAINER}
    Sleep    2s
    Execute JavaScript    document.querySelector('audio').play()
    Sleep    4s
    Wait Until Element Is Visible    ${MODAL_CLOSE_ICON}    timeout=10s
    Click Element    ${MODAL_CLOSE_ICON}

Select Quiz
    Wait Until Element Is Visible    ${CHECK_READINESS}    timeout=30s
    Click Element    ${CHECK_READINESS}
    Sleep    3s
    Wait Until Element Is Visible    ${PPT_CONTAINER}    timeout=10s
    Click Element    ${PPT_CONTAINER}
    Sleep    3s
    Wait Until Element Is Visible    ${QUIZ_ANSWER_RADIO}    timeout=30s
    Click Element    ${QUIZ_ANSWER_RADIO}
    Sleep    1s
    Wait Until Element Is Visible    ${CHECK_BUTTON}    timeout=30s
    Click Element    ${CHECK_BUTTON}
    Sleep    3s
    Wait Until Element Is Visible    ${NEXT_BUTTON}    timeout=30s
    Click Element    ${NEXT_BUTTON}
    Sleep    1s
    Wait Until Element Is Visible    ${MODAL_CLOSE_ICON}    timeout=10s
    Click Element    ${MODAL_CLOSE_ICON}
    sleep  2s

Select Flash Cards
    Wait Until Element Is Visible    ${KEY_TERMS_TAB}    timeout=30s
    Click Element    ${KEY_TERMS_TAB}
    sleep  2s
    Wait Until Element Is Visible    ${key_terms}     timeout=30s
    Click Element    ${key_terms}
    sleep  2s
    #Press Key    ${key_terms}    TAB
    #Press keys    //*    ENTER
    Click Element   (//*[name()='svg'][@class="slider_next_icon"])[2]
    sleep  5s
    #Wait Until Element Is Visible    ${key_terms}     timeout=30s
    #Click Element    ${key_terms}
    #sleep  2s
