@pro_signup

Feature: Sign Up
   As a New user
   I want to register
   So that I can use iNotary application

 @smoke_pro_signup
 Scenario: Pro user Sign Up

  Given I am on Home page
  When I click on Solutions tab
  Then solutions page for the user should be displayed

  Given I click on buy now button of pro user
  Then I should see sign up page
  Given I Enter all valid Details in to signup form
  And I click on Continue button
  Then Shipping and Billing page should be displayed

  Given I enter valid shipping details
  And I click on Review Order button
  And I click on Pay now button
  Then I should signed up successfully
  





































# @user_login

# Feature: Landing page
# As a user
# I want to see the landing page
# So that I can login to the application

# Background:
# Given I am on Home page
# When I click on Customer Login button
# Then Login page for the user should be displayed

  
# @negative_user_login
# Scenario: user login with negative case

# Given I click on Sign In button
# Then I should see please specify email and password
# Given I login as a non existing user to inotary
# And I click on Sign In button
# Then I should see Invalid email or password

# @smoke_user_login
# Scenario: user login

# Given I login as a common user
# When I click on Sign In button 
# Then List view page for the user should be displayed



