Given(/^I am on Home page$/) do
 @site = "iNotary".downcase
visit @site, :signup_page
on @site, :signup_page do |home|
home.wait_for_landing_page
end
end

When(/^I click on Customer Login button$/) do
on @site, :login_page do |home|
home.click_customer_login
end
end

Then(/^Login page for the user should be displayed$/) do
on @site, :login_page do |home|
home.wait_for_login_page
end
end

Given(/^I login as a admin$/) do
on @site, :login_page do |login|
@admin = Admin_user.get_user("admin_user")
login.enter_admin_data(@admin)
end
end

When(/^I click on Sign In button$/) do
on @site, :login_page do |login|
login.click_sign_in
end
end

Then(/^List view page for the user should be displayed$/) do
on @site, :login_page do |login|
puts login.verify_list_page
end
end

