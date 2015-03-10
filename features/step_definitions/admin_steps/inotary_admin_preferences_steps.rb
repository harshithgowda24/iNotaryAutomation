When(/^I select Adminstrative Preferences option from Dropdown$/) do
on @site, :preferences_page do |set|
set.admin_preferences
end
end

Then(/^I should navigate to Admin Preferences screen$/) do
 on @site, :preferences_page do |set|
set.verify_admin_preferences
end
end

Given(/^I select some state from the dropdown$/) do
  on @site, :preferences_page do |set|
set.select_user_state
end
end

Given(/^I enable disable block some fields$/) do
  on @site, :preferences_page do |set|
set.enable_disable_block
end
end

When(/^I click on Save button$/) do
  on @site, :preferences_page do |set|
set.save_button_preference_page
end
end

Then(/^I should see the fields that got updated$/) do
  on @site, :preferences_page do |set|
set.verify_admin_preferences
end
end

Given(/^I navigate to Notarial Act screen$/) do
 on @site, :preferences_page do |set|
set.verify_notarial_act
end
end

And(/^I add a new notarial act$/) do
 on @site, :preferences_page do |set|
set.verify_add_new_notarial_act_button
end
end

Then(/^I should be able to see the act in the list$/) do
	on @site, :preferences_page do |set|
puts set.verify_notarail_act_list
end
end

#negative

And(/^I try to create empty notarial act$/) do
 on @site, :preferences_page do |set|
set.empty_notarial_act
end
end

#Delete

Given(/^I click on delete button of existing Act$/) do
on @site, :preferences_page do |set|
set.delete_button
end
end

Then(/^I should not see that act in the list$/) do
	on @site, :preferences_page do |set|
puts set.verify_act_is_not_present
end
end


#Log out

When(/^I select Logout option from Dropdown$/) do
	on @site, :preferences_page do |set|
set.verify_logout
end
end

Then (/^I should be logged out from the application$/) do
	on @site, :signup_page do |set|
set.wait_for_landing_page
end
end


# And(/^I add a notarial act with the same name$/) do
#  on @site, :preferences_page do |set|
# set.verify_add_new_notarial_act_button
# end
# end

# Then(/^I should see message notarial act has already been taken$/) do
# 	on @site, :preferences_page do |set|
# puts set.verify_notarial_act_error
# end
# end
