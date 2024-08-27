*** Variables ***
${my course}    //span[contains(.,'My Courses')]
${Search}    //input[@placeholder="Search course here"]
${course}    Sample English Course
${Resume Learning}    //text[contains(., 'Aeroscience')]/ancestor::div[contains(@class, 'course_content_container')]//button[contains(.,'Resume Learning')]
${Start Learning}   //text[contains(., 'Aeroscience')]/ancestor::div[contains(@class, 'course_content_container')]//button[contains(.,'Start Learning')]
${Forword}    (//div[@class="Right-icon-footer"])[3]
${Backword}    (//div[@class="Right-icon-footer"])[2]
${filter_icon}   //*[@class='filter-main']//*[name()='svg']
${course search}    //input[@class="Resume-Search"]
${Sample search}    PDF
${info}    //div[@class="col-2"]
${chart}    //div[@class="course-report-main filter-main"]
${Select PDF}    //label[.//span[text()='PDF']]
${select complete}    //label[.//span[text()='Completed']]
${CHECKBOX_ID}    //label[.//span[text()='PDF']]
${SIDEBAR}    //label[contains(.,'Status')]
${SCROLL_UP_BUTTON}    //svg[contains(@class, 'header-icon-box-img trycode-icon')]
${course click}    //text[contains(.,'Precourse Readiness')]
${PDF}    //span[@class="row"][contains(.,"PDF")]
${print statement}    //div[@class="ace_content"]
${yes button}    //button[contains(.,'Yes')]
${Message}    print('Hi')
${my course page}    //a[@href="#/myCourses"]

*** Keywords ***
My Course
    Set Selenium Implicit Wait    2 seconds
    Click Element    ${my course page}
    Sleep    2
    Input Text    ${Search}    ${course}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    1
    Run Keyword And Ignore Error  Click Element    ${Start Learning}
    sleep   1
    Run Keyword And Ignore Error  Click Element    ${Resume Learning}
    Sleep    3
    Click Element    ${info}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    3
    Click Element    css:svg.qqv_modal_icon
    sleep   1
    Click Element    ${Forword}
    Sleep    2
    Click Element    ${chart}
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Sleep    2
    Click Element    css:svg.qqv_modal_icon
    Run Keyword And Ignore Error  Click Element    ${Backword}
    Sleep    2
    Click Element    ${filter_icon}
    sleep   1
    Run Keyword And Ignore Error  Input Text    ${course search}    ${Sample search}
    sleep   1
    Click Element    ${select complete}
    Press Down Arrow Key Multiple Times    1   ${select complete}
    Sleep    2
    Click Element    ${Select PDF}
    Click Element    ${course click}
    Click Element    ${PDF}
    Click Element    ${Forword}
    Sleep    2
    Click Element    css:svg.close-filter
    Sleep    2
    Click Element    css:svg.course-close-icon
    Click Element    ${yes button}
    sleep   3


Press Down Arrow Key Multiple Times
    [Arguments]    ${times}    ${locator}
    FOR    ${i}    IN RANGE    ${times}
        Press Keys    ${locator}    PAGE_DOWN
    END



try code
    Click Element    css:svg.header-icon-box-img.trycode-icon
    Sleep    10
    Click Element    ${print statement}
    Input Text    ${print statement}    ${Message}
    Click Element    css:svg.qqv_modal_icon