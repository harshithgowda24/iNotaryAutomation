Given(/^I hit Create New Entry$/) do
@site = "iNotary".downcase
visit @site, :create_page
on @site, :create_page do |payment|
payment.create_entry_button
puts payment.five_free
end
end


Given(/^I click on Upgrade button$/) do
on @site, :create_page do |payment|
payment.upgrade_button
end
end

Given(/^I click on buynow button in pricing plans screen$/) do
  on @site, :create_page do |payment|
puts payment.buy_now
end
end

Given(/^I enter valid shipping details$/) do
  on @site, :create_page do |payment|
payment.shipping_info
end
end

Given(/^I click on Review Order button$/) do
  on @site, :create_page do |payment|
payment.review_button
end
end

Given(/^I click on Pay now button$/) do
  on @site, :create_page do |payment|
payment.pay_now_button
end
end

Then(/^I should see thank you page$/) do
 on @site, :create_page do |payment|
puts payment.thank_you
end
end
