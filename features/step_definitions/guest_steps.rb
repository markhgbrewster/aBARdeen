Given /^a user visits the home page$/ do
  visit root_path
end

Then /^he should see a welcome message$/ do
  page.should have_content('Welcome')
end

