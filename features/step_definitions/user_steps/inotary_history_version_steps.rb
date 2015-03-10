#view

Given(/^I click on view icon$/) do
	@site = "iNotary".downcase
visit @site, :action_page
  on @site, :action_page do |view|
view.view_icon
end
end

Then(/^I should see view journal screen$/) do
    on @site, :action_page do |view|
puts view.view_journal_entry
end
end

Given(/^I click on History button$/) do
    on @site, :action_page do |email_history|
puts email_history.history
end
end

Then(/^I should see history screen$/) do
end

Then(/^I click on Email button$/) do
  on @site, :action_page do |email_history|
email_history.email_button
end
end

Then(/^I enter email addresses$/) do
   on @site, :action_page do |email_history|
email_history.email_journal_history
end
end

Then(/^I click on submit button$/) do
   on @site, :action_page do |email_history|
email_history.submit_button
end
end

Then(/^I should see flash message$/) do
  on @site, :action_page do |email_history|
puts email_history.verify_flash_msg
end
end

#version

Given(/^I click on version button$/) do
    on @site, :action_page do |email_history|
puts email_history.version
end
end

Then(/^I should see all the version with the changes$/) do
  on @site, :action_page do |edit|
edit.doc_version
end
end

