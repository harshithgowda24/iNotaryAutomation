When(/^I select Preferences option from Dropdown$/) do
on @site, :preferences_page do |add_favorite|
add_favorite.preferences_tab
end
end

Then(/^I should navigate to Preferences screen$/) do
on @site, :preferences_page do |add_favorite|
add_favorite.preferences_screen
end
end


Given(/^I click on edit favorites tab$/) do
  on @site, :preferences_page do |add_favorite|
add_favorite.edit_favorites
end
end

Given(/^I add a new favorite client$/) do
   on @site, :preferences_page do |add_favorite|
add_favorite.add_favorite_info
end
end

When(/^I click save$/) do
   on @site, :preferences_page do |add_favorite|
add_favorite.save_button
end
end

Then(/^I should see Favorite created successfully$/) do
   on @site, :preferences_page do |add_favorite|
add_favorite.fav_pop_up
end
end


Given(/^I click on edit favorites documents tab$/) do
  on @site, :preferences_page do |add_favorite|
add_favorite.edit_favorite_documents
end
end

Given(/^I add a new favorite document$/) do
   on @site, :preferences_page do |add_favorite|
add_favorite.add_favorite_doc_info
end
end


When(/^I click save to save favorite$/) do
   on @site, :preferences_page do |add_favorite|
add_favorite.save_doc_info_button
end
end

Then(/^I should see Favorite document created successfully$/) do
   on @site, :preferences_page do |add_favorite|
add_favorite.fav_doc_pop_up
end
end