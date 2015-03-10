#Edit user details

Given(/^I click on Edit in admin section$/) do
on @site, :admin_page do |edit_user_details|
edit_user_details.verify_edit_icon
end
end

Then(/^I should see edit user details screen$/) do
 on @site, :admin_page do |edit_user_details|
edit_user_details.verify_edit_user_details_page
end
end

Then(/^I select pro option from add subscription Dropdown$/) do
  on @site, :admin_page do |edit_user_details|
puts edit_user_details.verify_add_subscription_dropdown
end
end

Then(/^I select start date$/) do
  on @site, :admin_page do |edit_user_details|
edit_user_details.verify_start_date
end
end

Then(/^I select end date$/) do
  on @site, :admin_page do |edit_user_details|
edit_user_details.verify_end_date
end
end

When(/^I click on Update$/) do
  on @site, :admin_page do |edit_user_details|
edit_user_details.verify_update_button
end
end

Then(/^I should see user updated successfully$/) do
 on @site, :admin_page do |edit_user_details|
puts edit_user_details.flash_message_after_update
end
end


#Negative

Given(/^I clear value from all the fields$/) do
	on @site, :admin_page do |edit_user_details|
edit_user_details.clear_data
end
end

Then(/^I should see errors$/) do
		 on @site, :admin_page do |edit_user_details|
puts edit_user_details.verify_errors
end
end

And(/^I click on close button$/) do
on @site, :admin_page do |edit_user_details|
edit_user_details.click_close
end
end

Then(/^I should exit from the pop up$/) do
on @site, :admin_page do |edit_user_details|
edit_user_details.verify_admin_page
end
end

#Change user password

Then(/^I click on change user password button$/) do
on @site, :admin_page do |change_password|
change_password.verify_change_user_password_button
end
end

Then(/^I should see change password screen$/) do
  on @site, :admin_page do |change_password|
change_password.verify_change_password_screen
end
end

When(/^I enter password that are same$/) do
  on @site, :admin_page do |change_password|
change_password.verify_same_password
end
end

Then(/^I should see user password updated successfully$/) do
 on @site, :admin_page do |edit_user_details|
puts edit_user_details.flash_message_after_password_update
end
end

#Negative 

When(/^I enter password that does not match$/) do
  on @site, :admin_page do |change_password|
change_password.verify_missmatch_password
end
end

When(/^I click on change password button$/) do
  on @site, :admin_page do |change_password|
change_password.verify_change_password_button
end
end

Then(/^I should see error messages in change password screen$/) do
on @site, :admin_page do |change_password|
puts change_password.verify_change_password_errors
end
end

















