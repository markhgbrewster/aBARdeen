Given /^a user visits the home page$/ do
  visit root_path
end

Then /^he should see a welcome message$/ do
  assert page.has_content?('New search')
end

