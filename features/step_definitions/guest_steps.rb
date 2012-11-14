Given /^a user visits the home page$/ do
  visit '/admins/sign_in'
  fill_in "Email",    with: "admin@admin.com"
  fill_in "Password", with: "password"
  click_button("Sign in")
  visit new_venue_path
  click_button("Create Venue")
  click_link("Sign out")
  visit root_path
end

And /^he should see a sign in link$/ do
  page.should have_content('Sign in')
end

And /^he clicks Venues link$/ do
  click_link("Venues")
end

Then /^he should see a list of venues$/ do
  page.should have_content('A list of venues')
end

When /^he clicks show link$/ do
  click_link("Show")
end

Then /^he should see a list of venues$/ do
  page.should have_content('A list of venues')
end
