Feature: Create Task

Scenario: Successful createtask
Given a user visits tasks page
When he types a task on textbox and press enter
Then he should see his task listed below

Scenario: Created task goes to appropriate tag
Given a user visits tasks page
When he types a task on textbox under personal tab and press enter
Then he should see his task listed under personal tab

Scenario: Created task goes to appropriate tag
Given a user visits tasks page
When he types a task on textbox under work tab and press enter
Then he should see his task listed under work tab

Scenario: Created task goes to appropriate tag
Given a user visits tasks page
When he types a task on textbox under study tab and press enter
Then he should see his task listed under study tab


