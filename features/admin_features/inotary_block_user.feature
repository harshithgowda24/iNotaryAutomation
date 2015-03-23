@block_unblock_user

Feature: Block user
As a Admin
I should be able to see Admin panel
So that I can block or unlock users

@smoke_block
Scenario: Block user account

Given I enter email address in to search box
When I click on search button 
Then I should see the user searched for
Given I will click on Block button by selecting some user
Then I should see User blocked successfully flash message


