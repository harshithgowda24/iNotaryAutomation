#Search for a user

Given(/^I enter email address in to search box$/) do
@site = "iNotary".downcase
visit @site, :admin_page
on @site, :admin_page do |search|
search.enter_user_email
end
end

When(/^I click on search button$/) do
on @site, :admin_page do |search|
search.click_search_icon
end
end

Then(/^I should see the user searched for$/) do
on @site, :admin_page do |search|
puts search.display_user
end
end