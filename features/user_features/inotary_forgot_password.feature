@forgot_password

Feature: Forgot password
As a user
I want to see the landing page
So that I reset my password using forgot password link


  
@reset_password
Scenario: Reset password

Given I am on Home page
When I click on Customer Login button
Then Login page for the user should be displayed

Given I click on Forgot password link
And I click on Reset password button by entering email address 
Then I should see flash message displayed