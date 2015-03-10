Given(/^I click on coupon button$/) do
@site = "iNotary".downcase
visit @site, :admin_page
on @site, :admin_page do |add_coupon|
add_coupon.verify_coupon_button
end
end
	
Then(/^I should see Manage Coupons screen$/) do
on @site, :admin_page do |add_coupon|
add_coupon.verify_manage_coupons_page
end
end

Given(/^I click on Add New coupon button$/) do
 on @site, :admin_page do |add_coupon|
add_coupon.add_new_coupon
end
end

Then(/^I should see Add Coupon screen$/) do
on @site, :admin_page do |add_coupon|
add_coupon.verify_add_coupon_page
end
end

Then(/^I enter coupon code$/) do 
on @site, :admin_page do |add_coupon|
add_coupon.add_coupon_code
end
end

Then(/^I enter percentage$/) do 
on @site, :admin_page do |add_coupon|
add_coupon.add_percentage 
end
end

When(/^I click on Create Coupon$/) do
on @site, :admin_page do |add_coupon|
add_coupon.verify_create_coupon
end
end

Then(/^I should see newly added coupon in manage coupon screen$/) do
on @site, :admin_page do |add_coupon|
puts add_coupon.check_for_coupon_created
end
end

#Edit 

Given(/^I click on edit icon of existing coupon$/) do
on @site, :admin_page do |add_coupon|
add_coupon.edit_coupon_icon
end
end	

When(/^I modify percentage$/) do
on @site, :admin_page do |add_coupon|
add_coupon.edit_coupon_percentage
end
end

Then(/^I should see updated coupon percentage$/) do
	on @site, :admin_page do |add_coupon|
puts add_coupon.verify_updated_coupon_percentage
end
end

#delete

Given(/^I click on delete icon of existing coupon$/) do
on @site, :admin_page do |add_coupon|
 add_coupon.delete_icon
end
end	

Then(/^I should not see the coupon in the list$/) do
	on @site, :admin_page do |add_coupon|
puts add_coupon.verify_coupon_is_not_present
end
end

#negative

Then(/^I should see both fields with error messages$/) do
	on @site, :admin_page do |add_coupon|
puts add_coupon.coupon_list
end
end

Then(/^I should see coupon already taken$/) do
	on @site, :admin_page do |add_coupon|
puts add_coupon.existing_coupon
end
end

