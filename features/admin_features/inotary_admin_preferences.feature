@admin_pref

Feature: Preferences
As a Admin
I should be able to see admin preferences screen
So that i can change state default preferences

Background:
Given I click on Username Dropdown
When I select Adminstrative Preferences option from Dropdown
Then I should navigate to Admin Preferences screen

@smoke_preferences
Scenario: Update preferences

Given I select some state from the dropdown
And I enable disable block some fields
When I click on Save button
Then I should see the fields that got updated

@smoke_add_act
Scenario: Add act
Given I navigate to Notarial Act screen
And I add a new notarial act
Then I should be able to see the act in the list

@negative_add_act
Scenario: empty act

Given I navigate to Notarial Act screen
And I try to create empty notarial act


@delete_act
Scenario: delete act

Given I navigate to Notarial Act screen
And I click on delete button of existing Act
Then I should not see that act in the list


