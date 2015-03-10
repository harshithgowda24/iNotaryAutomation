Given(/^I click on Create New Entry$/) do
@site = "iNotary".downcase
visit @site, :create_page
on @site, :create_page do |create|
create.create_entry_button
end
end

Then(/^I should be in create new journal screen$/) do
  on @site, :create_page do |create|
create.create_journal_page
end
end

When(/^I fill in mandatory fields with valid information$/) do
on @site, :create_page do |create|
create.enter_client_info
end
end

When(/^I click on Save All button$/) do
on @site, :create_page do |create|
puts create.save_all
end
end

Then(/^I should see journal entry in journal list screen$/) do
  on @site, :create_page do |create|
puts create.verify_list_page
end
end
