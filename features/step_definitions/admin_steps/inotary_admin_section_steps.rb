Given(/^I select Adminstrative Tools option from Dropdown$/) do
 on @site, :admin_navigate_page do |open|
open.verfiy_admin_tools
end
end

Then(/^I should navigate to Admin screen$/) do
  on @site, :admin_navigate_page do |open|
open.verify_admin_page
end
end



