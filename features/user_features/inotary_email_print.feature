@email_print_journal

Feature: Share journal entry
As a User
I should be able to redirect to email or print journal screen
So that I can send jounral form


@email_print
Scenario: email or print journal entry

Given I click on share icon
Then I should see email print journal screen
Given I redact some of the fields
And I click on preview button
And I click on Email button in preview screen
And I enter email addresses
And I click on submit button
Then I should see flash message for journal entry sent