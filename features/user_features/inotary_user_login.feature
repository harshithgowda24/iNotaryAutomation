@user_login

Feature: Landing page
As a user
I want to see the landing page
So that I can login to the application

Background:
Given I am on Home page
When I click on Customer Login button
Then Login page for the user should be displayed

  
@negative_user_login
Scenario: user login with negative case

Given I click on Sign In button
Then I should see please specify email and password
Given I login as a non existing user to inotary
And I click on Sign In button
Then I should see Invalid email or password

@smoke_user_login
Scenario: user login

Given I login as a common user
When I click on Sign In button 
Then List view page for the user should be displayed



