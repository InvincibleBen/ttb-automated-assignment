# 4 Design test coverage and create automated test scripts. Project manager assigns you to test mobile application. You can download source code from https://github.com/avjinder/Minimal-Todo
# Please prepare test cases and create automation test scripts to cover the features.

*** Settings ***
Library  AppiumLibrary  timeout=10
Suite Setup  launch application
Suite Teardown  Close All Applications

*** Variables ***
${skip_update_ok}  id=android:id/button1
${btn_add_todo}  id=com.avjindersinghsekhon.minimaltodo:id/addToDoItemFAB
${txt_todo_name}  id=com.avjindersinghsekhon.minimaltodo:id/userToDoEditText
${btn_save_todo}  id=com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton
${todo_list}  id=com.avjindersinghsekhon.minimaltodo:id/toDoListItemTextview
${reminder_switch}  id=com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat
${reminder_date}  id=com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText
${reminder_time}  id=com.avjindersinghsekhon.minimaltodo:id/newTodoTimeEditText
${reminder_day}  //android.view.View
${reminder_date_ok}  id=com.avjindersinghsekhon.minimaltodo:id/ok


*** Keywords ***
launch application
    Open Application  remote_url=http://127.0.0.1:4723  platformName=Android  automationName=uiautomator2  deviceName=emulator-5554  app=/Users/thapakorn/Documents/repo/ttb-automated-assignment/apk/app-release.apk  noReset=false
    Click Element  ${skip_update_ok}

*** Test Cases ***
create todo without reminder
    Click Element  ${btn_add_todo}
    Wait Until Element Is Visible  ${txt_todo_name}
    Input Text  ${txt_todo_name}  Todo01
    Click Element  ${btn_save_todo}
    Wait Until Page Contains Element  ${todo_list}
    Element Should Be Visible  //android.widget.TextView[@text="Todo01"]

create todo with reminder
    Click Element  ${btn_add_todo}
    Wait Until Element Is Visible  ${txt_todo_name}
    Input Text  ${txt_todo_name}  Todo02
    Click Element  ${reminder_switch}
    Click Element  ${reminder_date}

    Sleep  1
    ${count}  Get Length  ${reminder_day}
    FOR  ${i}  IN RANGE  ${count}
        ${selected}  Get Element Attribute  //android.view.View[${i+1}]  selected
        ${content-desc}  Get Element Attribute  //android.view.View[${i+1}]  content-desc
        IF  '${selected}' == 'true'
            ${content-desc}  Get Element Attribute  //android.view.View[${i+2}]  content-desc
            Click Element  //android.view.View[${i+2}]
            Exit For Loop
        END
    END
    
    Click Element  ${reminder_date_ok}
    Click Element  ${btn_save_todo}
    Wait Until Page Contains Element  ${todo_list}
    Element Should Be Visible  //android.widget.TextView[@text="Todo02"]
