@search

Feature: search
As a Admin
I should be able to see Admin panel
So that I can search for a user
 
@smoke_search
Scenario: search for a user

Given I enter email address in to search box
When I click on search button 
Then I should see the user searched for