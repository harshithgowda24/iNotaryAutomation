When(/^I click on Solutions tab$/) do
  on @site, :signup_page do |pro|
pro.solutions_tab
end
end

Then(/^solutions page for the user should be displayed$/) do
   on @site, :signup_page do |pro|
pro.solutions_page
end
end

Given(/^I click on buy now button of pro user$/) do
   on @site, :signup_page do |pro|
pro.buy_now_button
end
end

Then(/^I should see sign up page$/) do
   on @site, :signup_page do |pro|
puts pro.sign_up_page_for_pro
end
end

Given(/^I Enter all valid Details in to signup form$/) do
   on @site, :signup_page do |pro|
pro.enter_pro_user_data
end
end

Given(/^I click on Continue button$/) do
  on @site, :signup_page do |pro|
pro.continue_button
end
end

Then(/^Shipping and Billing page should be displayed$/) do
   on @site, :signup_page do |pro|
pro.shipping_and_billing_page
end
end

Then(/^I should signed up successfully$/) do
   on @site, :signup_page do |pro|
puts pro.flash_message_after_signed_up_successfully
end
end




# Given(/^I login as a common user$/) do
# on @site, :login_page do |login|
# @commonuser = Common_user.get_user("common_user")
# login.enter_user_data(@commonuser)
# end
# end


