@create
Feature: Create Journal Entry
As a Free User
I should be able to see create journal entry screen
So that i can create a entry for a client

@create_3_journals
Scenario: create journal

Given I click on Create New Entry
Then I should be in create new journal screen
When I fill in mandatory fields with valid information
And I click on Save All button
Then I should see journal entry in journal list screen