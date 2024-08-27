*** Variables ***
${url}    http://139.59.64.128:8080/icleaf/#/login
${Name}    Bala
${password}    12345

*** Keywords ***
Browser Login_page
    Open Browser    ${url}    chrome
    Maximize Browser window
    input text    id:username    ${Name}
    input text    id:password    ${password}
    click button    xpath://button[@type="submit"]
    title should be  Icleaf

Close Browser
    [Teardown]
    close all browsers



