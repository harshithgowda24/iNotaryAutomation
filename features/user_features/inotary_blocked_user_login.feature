@login

Feature: Blocked user login
As a user
I want to see the landing page
So that I can login to the application

@negative_user_login
Scenario: user login with negative case

Given I am on Home page
When I click on Customer Login button
Then Login page for the user should be displayed
Given I click on Sign In button
Then I should see please specify email and password
Given I login as a non existing user to inotary
And I click on Sign In button
Then I should see Invalid email or password


@user_login
Scenario: blocked account


Given I am on Home page
When I click on Customer Login button
Then Login page for the user should be displayed
Given I login as a blocked user
When I click on Sign In button 
Then I should see flash message displayed for blocked account