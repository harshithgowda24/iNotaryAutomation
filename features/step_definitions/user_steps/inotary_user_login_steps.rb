Given(/^I login as a common user$/) do
on @site, :login_page do |login|
@commonuser = Common_user.get_user("common_user")
login.enter_user_data(@commonuser)
end
end


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