Given(/^I enter client firstname into search box$/) do
  @site = "iNotary".downcase
visit @site, :action_page
on @site, :action_page do |search|
search.search_box
end
end

Given(/^I click on search icon$/) do
  on @site, :action_page do |search|
search.search_icon
end
end

Then(/^I should see journal entry searched for$/) do
  on @site, :action_page do |search|
puts search.search_result
end
end

#Edit

Given(/^I click on edit icon$/) do
  @site = "iNotary".downcase
visit @site, :action_page
on @site, :action_page do |edit|
edit.edit_icon
end
end

Then(/^I should see edit journal screen$/) do
  on @site, :action_page do |edit|
edit.edit_journal_entry
end
end

When(/^I modify some fields data$/) do
 on @site, :action_page do |edit|
edit.modify_field_data
end
end

When(/^I should be able to save the changes$/) do
  on @site, :action_page do |edit|
edit.save_button
end
end