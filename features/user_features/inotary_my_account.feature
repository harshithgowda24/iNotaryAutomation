@my_account

Feature: My Account
As a User
I should be able to see my account page
So that I manage my account details
 

@smoke_edit_account_details
Scenario: My Account page

Given I click on Username Dropdown
And I select My Account option from Dropdown
Then I should navigate to My Account screen

Given I click on Edit icon 
Then I should see edit details screen
Given I update few field values
And I click on save
Then I should see error message

Given I enter valid current password 
And I click on save
Then I should see updated last name in my account screen




