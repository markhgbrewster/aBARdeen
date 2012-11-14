Given /^a guest visits the home page$/ do
  visit root_path
end

And /^he should see a sign in link$/ do
  page.should have_content('Sign in')
end

Given /^a guest clicks Venues link$/ do
  visit '/admins/sign_in'
  fill_in "Email",    with: "admin@admin.com"
  fill_in "Password", with: "password"
  click_button("Sign in")
  visit new_venue_path
  click_button("Create Venue")
  click_link("Sign out")
  visit root_path
  click_link("Venues")
end

Then /^he should see a list of venues$/ do
  page.should have_content('A list of venues')
end

When /^he clicks show link$/ do
  click_link("Show")
end

And /^he should see venue address$/ do
  page.should have_content('Address')
end

Then /^he should not be able to submit a review$/ do
  page.should have_content('Please sign in to add a review')
end