@login

Feature: Landing page
As a Admin
I want to see the landing page
So that I can login to the application

@smoke_login
Scenario: Click on customer login button for the first time

  Given I am on Home page
  When I click on Customer Login button
  Then Login page for the user should be displayed
  Given I login as a admin
  When I click on Sign In button 
  Then List view page for the user should be displayed