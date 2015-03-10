Given(/^I will click on Block button by selecting some user$/) do 
on @site, :admin_page do |block|
puts block.block_button
end
end

Then(/^I should see User blocked successfully flash message$/) do 
on @site, :admin_page do |block|
block.verify_admin_page
end
end
