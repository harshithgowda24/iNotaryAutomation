Given (/^I click on Username Dropdown$/) do
	@site = "iNotary".downcase
visit @site, :my_account_page
  on @site, :my_account_page do |edit_details|
edit_details.verify_username
end
end

And(/^I select My Account option from Dropdown$/) do
on @site, :my_account_page do |edit_details|
edit_details.verify_my_account
end
end

Then(/^I should navigate to My Account screen$/) do
on @site, :my_account_page do |edit_details|
puts edit_details.verify_my_account_page
end
end

Given(/^I click on Edit icon$/) do
on @site, :my_account_page do |edit_details|
edit_details.verify_edit_icon
end
end

Then(/^I should see edit details screen$/) do
on @site, :my_account_page do |edit_details|
edit_details.verify_edit_details_page
end
end

Given(/^I update few field values$/) do 
on @site, :my_account_page do |edit_details|
edit_details.update_few_fields 
end
end

Then(/^I should see error message$/) do
on @site, :my_account_page do |edit_details|
puts edit_details.verify_error_message
end
end

Given(/^I enter valid current password$/) do 
on @site, :my_account_page do |edit_details|
edit_details.enter_current_password
end
end

And(/^I click on save$/) do
on @site, :my_account_page do |edit_details|
edit_details.verify_save_button
end
end

Then(/^I should see updated last name in my account screen$/) do
on @site, :my_account_page do |edit_details|
edit_details.verify_updated_name	
end
end

#Logout

Given(/^I select Logout$/) do
on @site, :my_account_page do |edit_details|
edit_details.user_logout	
end
end

