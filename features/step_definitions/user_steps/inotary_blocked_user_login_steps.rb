Then(/^I should see please specify email and password$/) do
on @site, :login_page do |login|
puts login.blank_fields
end
end

Then(/^I login as a non existing user to inotary$/) do
on @site, :login_page do |login|
@invaliduser = Invalid_user.get_user("invalid_user")
login.enter_user_data(@invaliduser)
end
end

Then(/^I should see Invalid email or password$/) do
on @site, :login_page do |login|
puts login.invalid_data
end
end

Given(/^I login as a blocked user$/) do
  on @site, :login_page do |home|
home.blocked_user_credentials
end
end

Then(/^I should see flash message displayed for blocked account$/) do
 on @site, :login_page do |home|
puts home.flash_message_for_blocked_user
end
end