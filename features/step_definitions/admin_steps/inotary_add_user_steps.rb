Given(/^I click on Add User button$/) do
@site = "iNotary".downcase
visit @site, :admin_page
 on @site, :admin_page do |add|
add.verify_add_user_button
end
end

Then(/^I should see Add User screen$/) do
 on @site, :admin_page do |add|
add.verify_admin_page
end
end

Then(/^I enter user firstname (.*)$/) do |firstname|
 on @site, :admin_page do |add|
add.add_firstname firstname
end
end

Then(/^I enter user lastname (.*)$/) do |lastname|
  on @site, :admin_page do |add|
add.add_lastname lastname
end
end


Then(/^I enter user email (.*)$/) do |email|
  on @site, :admin_page do |add|
add.add_email email
end
end

Then(/^I enter user password (.*)$/) do |password|
  on @site, :admin_page do |add|
add.add_password password
end
end

Then(/^I enter password to confirm (.*)$/) do |confirm|
 on @site, :admin_page do |add|
add.add_confirm confirm
end
end


Then(/^I select state from state field$/) do
on @site, :admin_page do |add|
add.add_state
end
end


When(/^I hit Add User button$/) do
on @site, :admin_page do |add|
add.add_user_button
end
end

Then(/^I should see user created succesfully$/) do
on @site, :admin_page do |add|
puts add.flash_message_after_create	
end
end	

#Negative add user 


And(/^I should see all the fields highlighted with error messages$/) do
on @site, :admin_page do |add|
puts add.verify_error_messages
end
end

Then(/^I still should be in add user screen$/) do
	on @site, :admin_page do |add|
puts add.email_id
add.verify_error_messages	
end
end
