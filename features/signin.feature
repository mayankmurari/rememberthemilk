Feature: Signing in

Scenario: Unsuccessful signin
Given a user visits signin page
When they submitt invalid signin information
Then they should see a error message

Scenario: Successful signin
Given a user visits signin page
And the user has an account
And the user submits valid signin information
Then they should see tasks page
