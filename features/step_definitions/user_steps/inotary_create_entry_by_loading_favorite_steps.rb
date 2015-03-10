When(/^I load the existing favorite$/) do
on @site, :create_page do |create|
puts create.load_favorite_client
end
end

And(/^I load the existing document$/) do
on @site, :create_page do |create|
puts create.load_favorite_document
end
end

Then(/^I add another client by loading favorite$/) do
on @site, :create_page do |create|
puts create.add_another_client
puts create.load_favorite_client_2
end
end