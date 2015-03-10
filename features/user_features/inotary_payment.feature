@payment

Feature: Payment
As a User
I should be able to upgrade to Business
So that I can use all the features


@payment_business
Scenario: Upgrade to business 

Given I hit Create New Entry
And I click on Upgrade button 
And I click on buynow button in pricing plans screen
Given I enter valid shipping details
And I click on Review Order button
And I click on Pay now button
Then I should see thank you page
