Given /^a user is on the home page$/ do
  visit '/admins/sign_in'
  fill_in "Email",    with: "admin@admin.com"
  fill_in "Password", with: "password"
  click_button("Sign in")
  visit new_venue_path
  click_button("Create Venue")
  visit root_path
end

And /^he sees the search box$/ do
 page.should have_content('search')
end

When /^he searches for bars called Abbot$/ do
  fill_in "Name",    with: "Abbot"
  click_button("Search")
end

Then /^he should see the result as Abbot$/ do
  page.should have_content('ABBOT')
end