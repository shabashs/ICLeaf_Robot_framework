*** Variables ***
${Search first}    (//input[@placeholder="Search here"])[1]
${Search second}    (//input[@placeholder="Search here"])[2]
${complete button first}    (//text[contains(.,'Completed')])[1]
${complete button second}    (//text[contains(.,'Completed')])[2]
${Pending button first}    (//text[contains(.,'Pending')])[1]
${Pending button second}    (//text[contains(.,'Pending')])[2]
${Expired}    //div[@class="course-status-lbl-main"]//text[contains(.,'Expired')]
${view track}    svg.view-course-track
${view course}   svg.view-course
${view Exam}    (//div[@class="MuiStack-root css-1vp8jwk"])[2]
${course}    Aeroscience
${subject}    Test1
${Yours Exam}    (//div[@class="h1-dashboard-lbl"])[2]
${close track}    svg.qqv_modal_icon
${Schedule}    //text[contains(.,'Questions')]
${final Exam}   //text[text()='final3']/following-sibling::button[text()='View Exam']
*** Keywords ***
Dashboard
    Set Selenium Implicit Wait    2 seconds
    Scroll To Script Element    ${Yours Exam}
    sleep    1
    Click Element    ${complete button first}
    Click Element    ${Pending button first}
    Click Element    ${Expired}
    Click Element    ${Expired}
    Input Text    ${Search first}    ${course}

    Click Element    css:${view course}
    sleep    5
    Click Element    css:${close track}
    Scroll To Script Element    ${Schedule}
    sleep     2
    Click Element    ${complete button second}
    Click Element    ${Pending button second}
    Input Text    ${Search second}    ${subject}
    #Click Element    ${view Exam}
    #Need to develop
    Scroll To Script Element    ${final Exam}
    sleep   1
    Click Element   ${final Exam}
    #Need to develop

    sleep    2

Scroll To Script Element
    [Arguments]    ${argument}
    ${script_element}=    Get WebElement   ${argument}
    Scroll Element Into View    ${script_element}