@edit_journal

Feature: Edit journal entry
As a User
I should be able to redirect to edit jounral screen
So that I can edit few fields

@search_entry
Scenario: Search for a journal entry

Given I enter client firstname into search box
And I click on search icon
Then I should see journal entry searched for

@edit_entry
Scenario: edit journal entry

Given I click on edit icon
Then I should see edit journal screen
When I modify some fields data
And I should be able to save the changes





