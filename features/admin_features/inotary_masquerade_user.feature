@masquerade_user

Feature: Masquerade user account
As a Admin
I should be able to masquerade user account
So that i can use features behalf of him

Background:
Given I enter email address in to search box
When I click on search button 
Then I should see the user searched for

@smoke_masquerade

Scenario: Masquerade user account

Given I will click on Masquerade button by selecting some user
Then I should be redirected to user landing screen
Given I click on Create New Entry button
Then I should be redirected to create new journal entry screen
When I fill in application mandatory fields with valid data
And I click on Save All 
Then I should be redirected back to journal list screen
Given I will click on Stop Masquerade button from Username Dropdown
Then I should be redirected back to admin panel

