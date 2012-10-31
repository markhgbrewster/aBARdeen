Given /^a user visits the signin page$/ do
  visit root_path
end

When /^he submits invalid signin information$/ do
  click_button "Log in"
end

Then /^he should see an error message$/ do
  page.should have_content('Invalid')
end