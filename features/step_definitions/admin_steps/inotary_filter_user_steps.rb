#Filter users by role

Given(/^I select owner$/) do
@site = "iNotary".downcase
visit @site, :admin_page
on @site, :admin_page do |filter|
filter.verify_filter_owner
end
end

When(/^I click on filter button$/) do
on @site, :admin_page do |filter|
filter.verify_filter_button
end
end

Then(/^I should see the result$/) do
on @site, :admin_page do |filter|
filter.verify_admin_page
end
end

Given(/^I select Admin$/) do
on @site, :admin_page do |filter|
filter.verify_filter_admin
end
end

Given(/^I select Manager$/) do
on @site, :admin_page do |filter|
filter.verify_filter_manager
end
end

Given(/^I select Viewer$/) do
on @site, :admin_page do |filter|
filter.verify_filter_viewer
end
end

Given(/^I select Author$/) do
on @site, :admin_page do |filter|
filter.verify_filter_author
end
end

Given(/^I select User$/) do
on @site, :admin_page do |filter|
filter.verify_filter_user
end
end

Then(/^I click on Reset button$/) do
on @site, :admin_page do |filter|
filter.verify_reset_button
end
end

Then(/^I should see Default User list$/) do
on @site, :admin_page do |filter|
filter.verify_admin_page
end
end

#Filter users by subscription

Given(/^I select Free$/) do
@site = "iNotary".downcase
visit @site, :admin_page
on @site, :admin_page do |filter|
filter.verify_filter_free
end
end


Given(/^I select Pro$/) do
on @site, :admin_page do |filter|
filter.verify_filter_pro
end
end

Given(/^I select Business$/) do
on @site, :admin_page do |filter|
filter.verify_filter_business
end
end

Given(/^I select Free Pro Subscription$/) do
on @site, :admin_page do |filter|
filter.verify_filter_fps
end
end

Given(/^I select Free Business Subscription$/) do
on @site, :admin_page do |filter|
filter.verify_filter_fbs
end
end