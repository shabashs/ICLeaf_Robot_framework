*** Variables ***
${my_profile}    //*[name()='svg'][@class="account-mnu-icon"]
${Account setting}   //text[text()='Account Settings']
${I want to edit the profile}    //label[contains(text(), 'I want to edit my profile')]/preceding-sibling::input[@type='checkbox']
${FIRST_NAME_XPATH}   //label[contains(text(),'First Name')]/following-sibling::div//input
${LAST_NAME_XPATH}   (//input[@class="profile-input"])[2]
${EMAIL_XPATH}   (//input[@class="profile-input"])[3]
${CONTACT_XPATH}  //input[@class="profile-input no_spinners"]
${updated button}   //button[text()='Update Profile']
${okay}    //button[text()='Okay']
${I allow you to process my data for any promotions}  //label[contains(text(), 'I allow you to process my data for any promotions')]/preceding-sibling::input[@type='checkbox']
${name data}    Mayan
${laste data}   Kannan
${Email data}   sample@email.com
${mobile number}    0123456789

*** Keywords ***
My profile
    Set Selenium Implicit Wait    2 seconds
    Click Element    ${my_profile}
    sleep   1
    Click Element    ${Account setting}
    Sleep   2
    #Select Checkbox    ${I allow you to process my data for any promotions}
    Click Element    ${I want to edit the profile}
    Sleep   1
    #Clear Field   ${FIRST_NAME_XPATH}   ${name data}
    Sleep   1
    Clear Field   ${LAST_NAME_XPATH}    ${laste data}
    Sleep   1
    Clear Field   ${EMAIL_XPATH}    ${Email data}
    Sleep    1
    Clear Field   ${CONTACT_XPATH}    ${mobile number}
    sleep   3
    Click Element   ${updated button}
    Click Element   ${okay}
Clear Field
    [Arguments]    ${locator}       ${value}
    Press Keys   ${locator}   CTRL+a   BACKSPACE
    Input Text     ${locator}     ${value}
