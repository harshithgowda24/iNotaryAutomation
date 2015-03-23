@create_journal_entry

Feature: Create Journal Entry
As a Business User
I should be able to create journal entry by loading a favorite
So that i can just load the data in to journal form

@create_journal_by_loading_favorite
Scenario: create journal

Given I click on Create New Entry
Then I should be in create new journal screen
When I fill in mandatory fields with valid information
And I add new client by clicking on add another client link 
And I click on Save All button
Then I should see journal entry in journal list screen

