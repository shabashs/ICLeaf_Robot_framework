*** Settings ***
Library    SeleniumLibrary
Library    Keyboard
Resource    resources/BuyCourse_keywords.robot
Resource    resources/Dashbaoard_Keywords.robot
Resource    resources/E_Resources_keywords.robot
Resource    resources/Exams_keywords.robot
Resource    resources/Login_keywords.robot
Resource    resources/MyAssiginment_Keywords.robot
Resource    resources/MyCourse_keywords.robot
Resource    resources/MyProfile_Keywords.robot


*** Test Cases ***
ICleaf
    [Setup]    Browser Login_page
    #Run Keyword And Continue On Failure     Dashboard
    #Run Keyword And Continue On Failure     My Profile
    #Run Keyword And Continue On Failure     Buy course
    #Run Keyword And Continue On Failure     My Course
    #Run Keyword And Continue On Failure     My Assignment
    #Run Keyword And Continue On Failure     E-Resource
    Run Keyword And Continue On Failure     Exams
    [Teardown]    Close Browser





