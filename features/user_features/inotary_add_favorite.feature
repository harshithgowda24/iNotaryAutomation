@favorite

Feature: Favorite
As a User
I should be able to add a favorite
So that i can load it while creating favorite


@add_favorite
Scenario: Add a new favorite

Given I click on Username Dropdown
When I select Preferences option from Dropdown
Then I should navigate to Preferences screen

Given I click on edit favorites tab
And I add a new favorite client
When I click save
Then I should see Favorite created successfully

Given I click on edit favorites documents tab
And I add a new favorite document
When I click save to save favorite
Then I should see Favorite document created successfully



