*** Settings ***
Library    SeleniumLibrary
Resource    ../WF_Resources/Resources.robot

#*** Variables ***
#${JIRA_PROJECT}     https://nttdata.atlassian.net/jira/software/projects/MASF/boards/596
#${JIRA_PROJECT_ID}  596
#${JIRA_ISSUE_TYPE}  10100
#${JIRA_ISSUE_KEY}   TEST

*** Test Cases ***
T1    Navigate to "see my loan options" button
T2    Click on "see my loan options" button
T3    Getting started page
T4    Rate check details page
T5    Rate Check Details Page Field and Labels
T6    Wells Fargo back to Home page




