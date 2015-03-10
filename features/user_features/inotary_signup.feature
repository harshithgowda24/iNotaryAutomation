@signup

Feature: Sign Up
   As a New user
   I want to register
   So that I can use iNotary application


  Background: 
  Given I am on Home page
  When I click on Create Account button
  Then Signup page for the user should be displayed


 @negative_signup
  Scenario: invalid signup

  Given I click on Join For Free button
  Given I Enter all invalid Details
  When I click on Join For Free button
  Then I still should be in signup screen 

@smoke_signup
 Scenario: Sign Up

  Given I Enter all valid Details
  When I click on Join For Free button
  Then I should see alert pop up
  
  And I click on cancel should be in Signup screen
  When I click on Join For Free button
  Then confirmation message should be displayed


  



