Given /^a user is on the home page$/ do
  visit root_path
end

And /^he sees the search box$/ do
  page.should have_content('Search')
end

When /^he searches for bars called Wine$/ do
  fill_in "Bar Name", with: "Wine"
  click_button "Search"
end

Then /^he should see the bars named Wine$/ do
  page.should have_content('Wine')
end