@view_journal
Feature: View journal entry
As a User
I should be able to redirect to view screen
So that I can see the history and versions of my journal entry


@history
Scenario: History of journal entry

Given I click on view icon
Then I should see view journal screen
Given I click on History button
Then I should see history screen
And I click on Email button
And I enter email addresses
And I click on submit button
Then I should see flash message

@version
Scenario: Genarate versions

Given I click on view icon
Then I should see view journal screen
Given I click on version button
Then I should see all the version with the changes