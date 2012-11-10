Given /^a user is on the home page$/ do
  visit new_venue_path
  click_button("Create Venue")
  visit root_path
end

And /^he sees the search box$/ do
 assert page.has_content?('search')
end

When /^he searches for bars called Abbot$/ do
  fill_in('Name', :with => 'ABBOT')
  click_button("Create Search")
end

Then /^he should see the result as Abbot$/ do
  assert page.has_content?('ABBOT')
end