Given /^the admin is on the home page$/ do
  visit root_path
end

Then /^he should see the admin sign in link$/ do
  page.should have_content('Sign in as administrator')
end

When /^he clicks the admin link$/ do
  click_link("Sign in as administrator")
end

Then /^he should be on the admin sign in page$/ do
  page.should have_content('Sign in')
end

When /^he signs in as admin$/ do
  fill_in "Email",    with: "admin@admin.com"
  fill_in "Password", with: "password"
  click_button("Sign in")
end

Then /^he should be logged in$/ do
  page.should have_content('Signed in as admin@admin.com')
end

Given /^the admin clicks the update database link$/ do
  visit '/admins/sign_in'
  fill_in "Email",    with: "admin@admin.com"
  fill_in "Password", with: "password"
  click_button("Sign in")
  click_link("Update the venues database")
end

Then /^he should be on the create venues page$/ do
  page.should have_content('Store venues into database')
end

When /^he clicks to create venues$/ do
  click_button("Create Venue")
end 

Then /^the venues should be updated$/ do
  page.should have_content('Venues were successfully updated')
end
  
  
