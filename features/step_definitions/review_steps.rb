Given /^that the user is logged in$/ do
  visit '/admins/sign_in'
  fill_in "Email",    with: "admin@admin.com"
  fill_in "Password", with: "password"
  click_button("Sign in")
  visit new_venue_path
  click_button("Create Venue")
  click_link("Sign out")
  visit '/users/sign_in'
  click_link("Sign up")
  fill_in "Name",    with: "test"
  fill_in "Email",    with: "test@test.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button("Sign up")
end

Then /^he should see Signed in as test$/ do
  page.should have_content('Signed in as test')
end

When /^he visits the venue number 1$/ do
  visit '/venues/1'
end

Then /^he should see the option of adding a new review$/ do
  page.should have_content('Add a new Review')
end

When /^he clicks to add a new review$/ do
  click_button("Add a new Review")
end

Then /^he should be on the add a new review page$/ do
  page.should have_content('New review')
end
