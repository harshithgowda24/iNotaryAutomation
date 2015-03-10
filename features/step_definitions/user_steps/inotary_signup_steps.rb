When(/^I click on Create Account button$/) do
  on @site, :signup_page do |home|
home.click_create_account
end
end

Then(/^Signup page for the user should be displayed$/) do
 on @site, :signup_page do |home|
home.wait_for_signup_page
end
end

Given(/^I Enter all valid Details$/) do
  on @site, :signup_page do |home|
home.enter_user_data
end
end

When(/^I click on Join For Free button$/) do
  on @site, :signup_page do |home|
home.click_join_button
end
end

Then(/^I should see alert pop up$/) do
	on @site, :signup_page do |home|
puts home.alert_pop_up
end
end
  
And(/^I click on cancel should be in Signup screen$/) do
	on @site, :signup_page do |home|
home.wait_for_signup_page
end
end

Then(/^confirmation message should be displayed$/) do
  on @site, :signup_page do |home|
puts home.confirm_email
end
end

#Invalid Signup

Given(/^I Enter all invalid Details$/) do
  on @site, :signup_page do |home|
home.enter_invalid_user_data
end
end


Then(/^I still should be in signup screen$/) do
	on @site, :signup_page do |home|
     home.verify_error_messages
puts home.existing_email_address
end
end