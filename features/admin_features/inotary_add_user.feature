@add_new_user

Feature: Add user details
As a Admin
I should be able to see Add user screen
So that I can Add a new user
 

@smoke_add_user
Scenario Outline: Add new user with valid data

Given I click on Add User button
Then I should see Add User screen
Then I enter user firstname <firstname> 
Then I enter user lastname <lastname>
Then I enter user email <email>
Then I enter user password <password>
Then I enter password to confirm <confirm>
Then I select state from state field
When I hit Add User button 
Then I should see user created succesfully 

Examples:
|firstname|lastname|email                         |password |confirm  |
|john     |dr      |john19@yopmail.com            |Qwinix123|Qwinix123|


@negative_add_user

Scenario Outline: Add new user with repeated data

Given I click on Add User button
Then I should see Add User screen
When I hit Add User button 
And I should see all the fields highlighted with error messages
Then I enter user firstname <firstname>
Then I enter user lastname <lastname>
Then I enter user email <email>
Then I enter user password <password>
Then I enter password to confirm <confirm>
Then I select state from state field
When I hit Add User button 
Then I still should be in add user screen

Examples:
|firstname|lastname|email                         |password |confirm  |
|john     |dr      |john19@yopmail.com            |Qwinix123|Qwinix123|
