@user_logout

Feature: Logout
As a User
I should be able to logout from the application
So that I can login as other users


@smoke_user_logout
Scenario: logout feature for user 

Given I click on Username Dropdown
And I select Logout 
Then I should be logged out from the application