@admin_add_coupon

Feature: Add coupon details
As a Admin
I should be able to see manage coupon screen
So that I can Add/edit coupon details


Background: 
Given I click on coupon button
Then I should see Manage Coupons screen


@smoke_add_coupon
Scenario: Add new coupon

Given I click on Add New coupon button
Then I should see Add Coupon screen
Then I enter coupon code
Then I enter percentage
When I click on Create Coupon
Then I should see newly added coupon in manage coupon screen

@edit_coupon
Scenario: Edit coupon percentage

Given I click on edit icon of existing coupon
When I modify percentage
Then I should see updated coupon percentage


@negative_coupon
Scenario: Add coupon negative

Given I click on Add New coupon button
Then I should see Add Coupon screen
When I click on Create Coupon
Then I should see both fields with error messages
Then I enter coupon code
Then I enter percentage
When I click on Create Coupon
Then I should see coupon already taken

@delete_coupon
Scenario: delete coupon

Given I click on delete icon of existing coupon
Then I should not see the coupon in the list

