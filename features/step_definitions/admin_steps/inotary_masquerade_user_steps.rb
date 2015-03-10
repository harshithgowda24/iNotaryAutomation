Given(/^I will click on Masquerade button by selecting some user$/) do
on @site, :admin_page do |masquerade|
masquerade.masquerade_button
end
end
	
Then(/^I should be redirected to user landing screen$/) do
	on @site, :login_page do |masquerade|
masquerade.verify_list_page
end
end

Given(/^I click on Create New Entry button$/) do
  on @site, :admin_page do |create|
puts create.verify_create_entry_button
end
end

Then(/^I should be redirected to create new journal entry screen$/) do
 on @site, :admin_page do |create|
create.verify_create_journal_page
end
end


When(/^I fill in application mandatory fields with valid data$/) do
  on @site, :admin_page do |create|
create.enter_client_details
end
end


Then(/^I click on Save All$/) do
  on @site, :admin_page do |create|
puts create.verify_save_all_button
end
end

Then(/^I should be redirected back to journal list screen$/) do
  on @site, :login_page do |create|
create.verify_list_page
end
end

Given(/^I will click on Stop Masquerade button from Username Dropdown$/) do
	on @site, :admin_navigate_page do |masquerade|
masquerade.verify_username
end
	on @site, :admin_page do |masquerade|
		
masquerade.stop_masquerade_button
end
end

Then(/^I should be redirected back to admin panel$/) do
	on @site, :admin_page do |masquerade|
masquerade.verify_admin_page
end
end


