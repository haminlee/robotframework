*** Settings ***
Library  SeleniumLibrary
Variables    ../WF_PageObject/PageObjects.py

*** Variables ***
${url}    https://www.wellsfargo.com/
${browser}    chrome

*** Keywords ***
Navigate to "see my loan options" button
    open browser    ${url}    ${browser}
    maximize browser window
    sleep    2
    mouse over    ${Personal_Loan_Button}
    #element should be visible    ${Personal_Loan_Button}
    sleep    3
########################################################
Click on "see my loan options" button
    wait until page contains element    ${See_My_Loan_App_Button}
    click element    ${See_My_Loan_App_Button}
    element should be visible    ${Getting_Started}

##################################################################
Getting Started Page
    page should contain    Getting Started
    page should contain    Are you a Wells Fargo customer?

    #radio button
    click element    ${Yes}

    click element    ${No}

    page should contain    No problem. You can manually enter your personal information.
    click element    ${Continue_button}
    wait until page contains    Rate Check Details
##################################################################################################
Rate Check Details Page
    input text    ${Loan_amount}    70,000
    sleep    2
    select from list by label  ${Loan_purpose}    Medical/Nursing Care
    sleep    2
    click element    ${Loan_continue_button}

#######################################################################################################
Rate Check Details Page Field and Labels
    page should contain    Rate Check Details
    sleep    2
    page should contain    Now, tell us a few details about yourself
    sleep    2
    page should contain    All fields are required, unless shown as optional.
    sleep    2

    page should contain textfield    ${First_Name}
    input text    ${First_Name}    Prathmesh


    page should contain textfield    ${Middle_Name}
    input text    ${Middle_Name}    Mohan


    page should contain textfield    ${Last_Name}
    input text    ${last_name}    Naik


    page should contain    Suffix
    page should contain    Optional
    select from list by label    ${Suffix}    Sr.
    sleep    2

    page should contain textfield    ${CA_xpath}
    input text    ${CA_xpath}    ${Current_Address}
    sleep    2
    press keys    ${CA_xpath}    RETURN
    sleep    2
    page should contain    Confirm Current Address (No P.O. Box or business address)
    input text    ${Edit_Address_AddLine1}    Mr.xyz 123412AQ
    sleep    2
    click element    ${Edit_Address_Save}
    sleep    2
    press keys   ${CA_xpath}    TAB

    page should contain    Current address is same as mailing address

    #toggle set to yes
    click element    ${Toggle_Yes}
    sleep    2
    page should contain textfield    ${Phone_Number}
    page should contain element    ${Phone_Type}
    sleep    2

    #toggle set to No
    click element    ${Toggle_No}
    sleep    2

    #mail address code
    page should contain textfield    ${MA_xpath}
    input text  ${MA_xpath}    ${Mail_Address}
    sleep    2
    press keys    ${MA_xpath}    RETURN
    sleep    2
    page should contain    Confirm Mailing Address
    click element    ${MA_editaddress_save}
    sleep    2
    press keys   ${MA_xpath}    TAB
    sleep    2
    input text    ${Email_Add}    prathmeshnk@nttdata.com

    page should contain textfield    ${phone_number}
    page should contain element    ${phone_type}

Wells Fargo back to Home page
    click element    ${Logo_Homepage}


    ${title_Page}=    get title
    log to console    ${title_Page}
    title should be    Wells Fargo Bank, N.A. | Dashboard

    wait until page contains    Let’s finish up your application
    page should contain    We’ve saved all your info so you can pick back up where you left off.

    page should contain    Tasks
    page should contain    Rate Check Details
    page should contain    Results
    page should contain    Additional Personal Information
    page should contain    Show 5 more tasks

    click element  ${show_more}
    page should contain    Employment
    page should contain    Other Income
    page should contain    Automatic Payments
    page should contain    Additional Questions
    page should contain    Confirm Loan Details

    page should contain    Show fewer
    click element    ${show_fewer}
    page should contain    Rate Check Details
    page should contain    Results
    page should contain    Additional Personal Information
    page should contain    Show 5 more tasks

    page should contain    Contact us
    page should contain    Wells Fargo Bank, N.A.
    page should contain element    ${Phone_icon}
    page should contain    (877) 457-7618
    page should contain link    tel:8774577618

    page should contain    Finish application
    click element    ${Finish_App}
    sleep    2
    page should contain    Rate Check Details
    sleep    2
    page should contain    Now, tell us a few details about yourself
    close browser