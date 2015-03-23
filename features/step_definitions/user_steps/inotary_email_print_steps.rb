Given(/^I click on share icon$/) do
 @site = "iNotary".downcase
visit @site, :action_page
  on @site, :action_page do |share|
share.share_email_icon
end
end

Then(/^I should see email print journal screen$/) do
  on @site, :action_page do |share|
share.email_print_journal_entry
end
end

Given(/^I redact some of the fields$/) do
  on @site, :action_page do |share|
share.redact_fields
end
end

Given(/^I click on preview button$/) do
  on @site, :action_page do |share|
share.preview_button
end
end

And(/^I click on Email button in preview screen$/) do
	on @site, :action_page do |share|
share.email_button_in_preview_screen
end
end

Then(/^I should see flash message for journal entry sent$/) do
  on @site, :action_page do |email_journal|
puts email_journal.flash_msg_after_journal_entry_sent
end
end