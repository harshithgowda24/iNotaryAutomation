@filter_user

Feature: Filter user
As a Admin
I should be able to filter users by role
So that i can diffrentiate easily

@smoke_filter
Scenario: Filter user by role

Given I select owner
When I click on filter button
Then I should see the result

Given I select Admin
When I click on filter button
Then I should see the result

Given I select Manager
When I click on filter button
Then I should see the result

Given I select Viewer
When I click on filter button
Then I should see the result

Given I select Author
When I click on filter button
Then I should see the result

Given I select User
When I click on filter button
Then I should see the result

And I click on Reset button
Then I should see Default User list

@smoke_filter_user_subscription
Scenario: Filter user by subscription

Given I select Free
When I click on filter button
Then I should see the result

Given I select Pro
When I click on filter button
Then I should see the result

Given I select Business
When I click on filter button
Then I should see the result

Given I select Free Pro Subscription
When I click on filter button
Then I should see the result

Given I select Free Business Subscription
When I click on filter button
Then I should see the result

And I click on Reset button
Then I should see Default User list
