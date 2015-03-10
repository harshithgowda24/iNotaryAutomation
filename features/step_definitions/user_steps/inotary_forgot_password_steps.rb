Given(/^I click on Forgot password link$/) do
  on @site, :signup_page do |home|
home.forgot_password_link
end
end

Given(/^I click on Reset password button by entering email address$/) do
  on @site, :signup_page do |home|
home.enter_valid_email_id
home.reset_password_button
end
end

Then(/^I should see flash message displayed$/) do
  on @site, :signup_page do |home|
puts home.flash_message_after_email_sent
end
end