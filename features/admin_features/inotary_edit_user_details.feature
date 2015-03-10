@edit_user_details

Feature: Edit user details
As a user
I should be able to see Edit Details screen
So that I can edit their details
 
Background:
Given I enter email address in to search box
When I click on search button 
Then I should see the user searched for


@smoke_edit
Scenario: Edit user details 

Given I click on Edit in admin section
Then I should see edit user details screen
And I select pro option from add subscription Dropdown
And I select start date
And I select end date
When I click on Update 
Then I should see user updated successfully


@negative_edit
Scenario: Edit user details 

Given I click on Edit in admin section
Then I should see edit user details screen
Given I clear value from all the fields
When I click on Update
Then I should see errors
And I click on close button
Then I should exit from the pop up


@smoke_change
Scenario: Change user password

Given I click on Edit in admin section
Then I should see edit user details screen
And I click on change user password button
Then I should see change password screen
When I enter password that are same
And I click on change password button
Then I should see user password updated successfully


@negative_change
Scenario: Change user password

Given I click on Edit in admin section
Then I should see edit user details screen
And I click on change user password button
Then I should see change password screen
When I enter password that does not match
And I click on change password button
Then I should see error messages in change password screen
And I click on close button
Then I should exit from the pop up