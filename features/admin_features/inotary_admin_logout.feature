@admin_logout

Feature: Logout
As a Admin
I should be able to logout from the application
So that I can login as other users


@smoke_logout
Scenario: logout feature for user 

Given I click on Username Dropdown
When I select Logout option from Dropdown
Then I should be logged out from the application


